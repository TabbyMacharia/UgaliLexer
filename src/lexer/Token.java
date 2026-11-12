
package lexer;

public class Token {

    private String type;
    private Object value;
    private int line;
    private int column;

    public Token(String type, Object value, int line, int column) {
        this.type = type;
        this.value = value;
        this.line = line;
        this.column = column;
    }

    public String getType() {
        return type;
    }

    public Object getValue() {
        return value;
    }

    public int getLine() {
        return line;
    }

    public int getColumn() {
        return column;
    }

    @Override
    public String toString() {
        if (value != null) {
            return type + "(" + value + ")";
        }
        return type;
    }
}
