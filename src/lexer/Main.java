package lexer;

import java.io.StringReader;

public class Main {

    public static void main(String[] args) throws Exception {

        String input = """
                // Ugali preparation program
                
                prepare ingredients;
                boil 4 cups water;
                add 2 cups flour;
                stir;
                add 1 cups flour;
                stir;
                press ugali;
                turn ugali;
                cook 8 minutes;
                check consistency;
                shape ugali;
                serve ugali;
        """;

        UgaliLexer lexer = new UgaliLexer(new StringReader(input));

        Token token;

        while ((token = lexer.yylex()) != null) {
            System.out.println(token);
        }
    }
}