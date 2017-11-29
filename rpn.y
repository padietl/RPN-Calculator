%{
    #include <stdio.h>
    #include <math.h>
    int yylex(void);
    void yyerror(const char *);
%}

%define api.value.type {double}
%token NUM

%%
