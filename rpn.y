%{
    #include <stdio.h>
    #include <math.h>
    int yylex(void);
    void yyerror(const char *);
%}

%define api.value.type {double}
%token NUM

%%

input:
    %empty
|   input line
;

line:
    '\n'
|   exp '\n'    { printf("%.10g\n", $1); }
;

exp:
    NUM             { $$ = $1; }
|   exp exp '+'     { $$ = $1 + $2; }
|   exp exp '-'     { $$ = $1 - $2; }
|   exp exp '*'     { $$ = $1 * $2; }
|   exp exp '/'     { $$ = $1 / $2; }
|   exp exp '^'     { $$ = pow($1, $2); }
|   exp 'n'         { $$ = -$1; }
;

%%

#include <ctype.h>

int yylex(void)
{
    int c;

    while ((c = getchar()) == ' ' || c == '\t');

    if (c == '.' || isdigit(c)) {
        ungetc(c, stdin);
        scanf("%lf", &yylval);
        return NUM;
    }   

    if (c == EOF)
        return 0;

    return c;
}

void yyerror(const char *s)
{
    fprintf(stderr, "%s\n", s);
}

int main()
{
    return yyparse();
}
