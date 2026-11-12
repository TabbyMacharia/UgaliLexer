# Ugali Preparation Language (UPL) — Lexical Analyzer

A lexical analyzer for the **Ugali Preparation Language (UPL)**, implemented using **JFlex** and **Java** as part of a Compiler Construction laboratory exercise.

## Overview

This project demonstrates the implementation of a lexical analyzer (scanner) for a simple domain-specific language designed to describe the preparation of Ugali.

The scanner reads UPL source code and groups character sequences into meaningful tokens such as reserved words, identifiers, integer literals, and punctuation symbols. It also detects illegal characters and supports both single-line and multiline comments.

## Technologies Used

- **Java 27** — Programming language.
- **JFlex 1.9.1** — Lexical analyzer generator.
- **IntelliJ IDEA** — Development environment.

## Language Features

The lexer recognises the following token categories:

### 1. Reserved Words

The language includes keywords related to Ugali preparation, such as:

`prepare`, `ingredients`, `boil`, `water`, `add`, `flour`, `stir`, `press`, `turn`, `cook`, `check`, `consistency`, `shape`, `serve`, `ugali`, `cups`, and `minutes`.

### 2. Other Tokens

| Token Category | Example |
|---|---|
| Integer literals | `4`, `8`, `10` |
| Identifiers | `temperature`, `cooking_time` |
| Semicolon | `;` |

### 3. Comments

The lexer supports:

- Single-line comments beginning with `//`.
- Multiline comments enclosed by `/*` and `*/`.

Comments and whitespace are ignored during token generation.

### 4. Token Attributes

Each generated token stores:

- Token type
- Token value, where applicable
- Line number
- Column number

For example, the integer literal `4` is represented as `NUMBER(4)`.

### 5. Lexical Error Detection

The scanner detects illegal characters that do not match any defined token pattern. It reports the error location using the line and column numbers and continues scanning where possible.

It also detects unterminated multiline comments.

## Sample UPL Program

```text
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
```

## Project Structure

```text
UgaliLexer/
│
├── src/
│   └── lexer/
│       ├── UgaliLexer.flex
│       ├── UgaliLexer.java
│       ├── Main.java
│       └── Token.java
│
└── README.md
```

- **UgaliLexer.flex** — JFlex lexical specification containing token patterns and scanner actions.
- **UgaliLexer.java** — Generated Java scanner.
- **Main.java** — Test program used to provide input and display generated tokens.
- **Token.java** — Token class containing token attributes.

## Running the Project

### Prerequisites

Ensure that Java and JFlex are installed and available in your terminal.

### Step 1: Generate the Scanner

From the project root directory, run:

```powershell
jflex -d src/lexer src/lexer/UgaliLexer.flex
```

This generates or updates `UgaliLexer.java`.

### Step 2: Compile the Java Files

```powershell
javac -d out src/lexer/*.java
```

### Step 3: Run the Scanner

```powershell
java -cp out lexer.Main
```

The program displays the tokens recognised from the supplied UPL input.

## Laboratory Exercises Covered

The implementation and analysis address the following areas:

1. Lexical specification for UPL.
2. Regular expressions for token categories.
3. JFlex scanner implementation.
4. Token attributes and values.
5. Recognition of reserved words and identifiers.
6. Testing the scanner with a sample UPL program.
7. Detection and reporting of lexical errors.
8. Multiline comment handling using JFlex lexical states.
9. Relationship between lexical analysis and syntax analysis using CUP.
10. Analysis of lexical and syntax errors arising from number words used as quantities.

## Important Note

This project implements the **lexical analysis stage** of the UPL language. The CUP parser relationship is discussed as part of the laboratory analysis; a complete CUP parser is not included in this implementation.

## Author

Compiler Construction Laboratory Project

