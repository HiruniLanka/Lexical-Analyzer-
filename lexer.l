%{
#include <stdio.h>
int line_num = 1;

// Updated definition to avoid warning
int yywrap(void) {
    return 1;
}
%}

IDENTIFIER  [a-zA-Z_][a-zA-Z0-9_]*
NUMBER      [0-9]+
WHITESPACE  [ \t]+

%%

"if"        { printf("Keyword: IF\n"); }
"else"      { printf("Keyword: ELSE\n"); }
"while"     { printf("Keyword: WHILE\n"); }
"return"    { printf("Keyword: RETURN\n"); }

{IDENTIFIER}    { printf("Identifier: %s\n", yytext); }
{NUMBER}        { printf("Number: %s\n", yytext); }

"+"             { printf("Operator: PLUS\n"); }
"-"             { printf("Operator: MINUS\n"); }
"*"             { printf("Operator: MULTIPLY\n"); }
"/"             { printf("Operator: DIVIDE\n"); }
"="             { printf("Operator: ASSIGN\n"); }

"("             { printf("Punctuation: (\n"); }
")"             { printf("Punctuation: )\n"); }
"{"             { printf("Punctuation: {\n"); }
"}"             { printf("Punctuation: }\n"); }
";"             { printf("Punctuation: ;\n"); }

{WHITESPACE}    ;  // ignore spaces and tabs
\n              { line_num++; }

.               { printf("Unknown character: %s\n", yytext); }

%%

int main(void) {
    yylex();
    return 0;
}
