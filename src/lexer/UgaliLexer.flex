package lexer;

%%

%public
%class UgaliLexer
%unicode
%line
%column
%type Token
%xstate COMMENT

%{
    private Token token(String type) {
        return new Token(type, null, yyline + 1, yycolumn + 1);
    }

    private Token token(String type, Object value) {
        return new Token(type, value, yyline + 1, yycolumn + 1);
    }

        private boolean commentOpen = false;
        private int commentStartLine;
        private int commentStartColumn;
%}

Letter = [A-Za-z]
Digit = [0-9]
Identifier = {Letter}({Letter}|{Digit}|_)*
Integer = {Digit}+
Whitespace = [ \t\r\n]+
Comment = "//"[^\r\n]*

%%

"prepare"       { return token("PREPARE"); }
"ingredients"   { return token("INGREDIENTS"); }
"boil"          { return token("BOIL"); }
"water"         { return token("WATER"); }
"add"           { return token("ADD"); }
"flour"         { return token("FLOUR"); }
"stir"          { return token("STIR"); }
"press"         { return token("PRESS"); }
"turn"          { return token("TURN"); }
"cook"          { return token("COOK"); }
"check"         { return token("CHECK"); }
"consistency"   { return token("CONSISTENCY"); }
"shape"         { return token("SHAPE"); }
"serve"         { return token("SERVE"); }
"ugali"         { return token("UGALI"); }
"cups"          { return token("CUPS"); }
"minutes"       { return token("MINUTES"); }

{Integer} {
    int value = Integer.parseInt(yytext());
    return token("NUMBER", value);
}

{Identifier} {
    return token("IDENTIFIER", yytext());
}

";" {
    return token("SEMICOLON");
}

{Whitespace} {
    /* Ignore whitespace */
}

{Comment} {
    /* Ignore comments */
}

"/*" {
    commentOpen = true;
    commentStartLine = yyline + 1;
    commentStartColumn = yycolumn + 1;
    yybegin(COMMENT);
}

<COMMENT> "*/" {
    commentOpen = false;
    yybegin(YYINITIAL);
}

<COMMENT> [^*]+ {
    /* Ignore comment contents */
}

<COMMENT> "*" {
    /* Ignore individual asterisks */
}

<COMMENT> <<EOF>> {
    System.err.println(
        "Lexical error at line " + commentStartLine
        + ", column " + commentStartColumn
        + ": unterminated multiline comment"
    );
    return null;
}

. {
    System.err.println(
        "Lexical error at line " + (yyline + 1)
        + ", column " + (yycolumn + 1)
        + ": illegal character '" + yytext() + "'"
    );
}