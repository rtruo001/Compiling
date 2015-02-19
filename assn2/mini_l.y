/*	Name: Randy Truong
 *	Lab: 021
 *	TA: Zachary Benavides
 */

/* Mini Lex Language */
/* mini_l.y */

%{
	#include <iostream>
    #include <stdlib.h>
    #include <stdio.h> 

	using namespace std;

    int yyerror(const char *msg);
    int yylex(void);
 	extern int currLine;
 	extern int currCol;
 	FILE * yyin;
%}

%left PROGRAM
%left BEGIN_PROGRAM
%left END_PROGRAM
%left INTEGER
%left ARRAY
%left OF
%left IF
%left THEN
%left ENDIF
%left ELSE
%left ELSEIF
%left WHILE
%left DO
%left BEGINLOOP
%left ENDLOOP
%left BREAK
%left CONTINUE
%left EXIT
%left READ
%left WRITE
%left AND
%left OR
%left NOT
%left TRUE
%left FALSE

%left SUB
%left ADD
%left MULT
%left DIV
%left MOD

%left EQ
%left NEQ
%left LT
%left GT
%left LTE
%left GTE

%left SEMICOLON
%left COLON
%left COMMA
%left QUESTION
%left L_BRACKET
%left R_BRACKET
%left L_PAREN
%left R_PAREN
%left ASSIGN

%%
input:		|


%%

void yyerror(const char* msg){
	
}

