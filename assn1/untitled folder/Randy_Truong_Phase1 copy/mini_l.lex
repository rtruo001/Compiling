/*	Name: Randy Truong
 *	Lab: 021
 *	TA: Zachary Benavides
 */


%{
	int curr_line = 1;
	int curr_col = 1;
%}


Identifier		[a-zA-Z]
Number			[0-9]


%%

"program"		{printf("PROGRAM\n"); curr_col += yyleng;}
"beginprogram"	{printf("BEGIN_PROGRAM\n"); curr_col += yyleng;}
"endprogram"	{printf("END_PROGRAM"); curr_col += yyleng;}
"integer"		{printf("INTEGER\n"); curr_col += yyleng;}
"array"			{printf("ARRAY\n"); curr_col += yyleng;}
"of"			{printf("OF\n"); curr_col += yyleng;}
"if"			{printf("IF\n"); curr_col += yyleng;}
"then"			{printf("THEN\n"); curr_col += yyleng;}
"endif"			{printf("ENDIF\n"); curr_col += yyleng;}
"else"			{printf("ELSE\n"); curr_col += yyleng;}
"elseif"		{printf("ELSEIF\n"); curr_col += yyleng;}
"while"			{printf("WHILE\n"); curr_col += yyleng;}
"do"			{printf("DO\n"); curr_col += yyleng;}
"beginloop"		{printf("BEGINLOOP\n"); curr_col += yyleng;}
"endloop"		{printf("ENDLOOP\n"); curr_col += yyleng;}
"break"			{printf("BREAK\n"); curr_col += yyleng;}
"continue"		{printf("CONTINUE\n"); curr_col += yyleng;}
"exit"			{printf("EXIT\n"); curr_col += yyleng;}
"read"			{printf("READ\n"); curr_col += yyleng;}
"write"			{printf("WRITE\n"); curr_col += yyleng;}
"and"			{printf("AND\n"); curr_col += yyleng;}
"or"			{printf("OR\n"); curr_col += yyleng;}
"not"			{printf("NOT\n"); curr_col += yyleng;}
"true"			{printf("TRUE\n"); curr_col += yyleng;}
"false"			{printf("FALSE\n"); curr_col += yyleng;}


"-"				{printf("SUB\n"); curr_col += yyleng;}
"+"				{printf("ADD\n"); curr_col += yyleng;}
"*"				{printf("MULT\n"); curr_col += yyleng;}
"/"				{printf("DIV\n"); curr_col += yyleng;}
"%"				{printf("MOD\n"); curr_col += yyleng;}


"=="			{printf("EQ\n"); curr_col += yyleng;}
"<>"			{printf("NEQ\n"); curr_col += yyleng;}
"<"				{printf("LT\n"); curr_col += yyleng;}
">"				{printf("GT\n"); curr_col += yyleng;}
"<="			{printf("LTE\n"); curr_col += yyleng;}
">="			{printf("GTE\n"); curr_col += yyleng;}


{Number}+																			{printf("NUMBER %s\n", yytext); curr_col += yyleng;}

{Identifier}+({Identifier}|{Number}|("_"+({Identifier}|{Number})))*					{printf("IDENT %s\n", yytext); curr_col += yyleng;}


(("_")|({Number}))+({Identifier}+|{Number}|"_")*			{printf("Error at line %d, column %d: identifier \"%s\" must begin with a letter\n", curr_line, curr_col, yytext); exit(0);}

{Identifier}+({Identifier}|{Number}|"_")*("_")+				{printf("Error at line %d, column %d: identifier \"%s\" cannot end with an underscore\n", curr_line, curr_col, yytext); exit(0);}


";"				{printf("SEMICOLON\n"); curr_col += yyleng;}
":"				{printf("COLON\n"); curr_col += yyleng;}
","				{printf("COMMA\n"); curr_col += yyleng;}
"?"				{printf("QUESTION\n"); curr_col += yyleng;}
"["				{printf("L_BRACKET\n"); curr_col += yyleng;}
"]"				{printf("R_BRACKET\n"); curr_col += yyleng;}
"("				{printf("L_PAREN\n"); curr_col += yyleng;}
")"				{printf("R_PAREN\n"); curr_col += yyleng;}
":="			{printf("ASSIGN\n"); curr_col += yyleng;}


("##")(.)*("\n")	{/* A comment does nothing */ ++curr_line;}
" "					{++curr_col;}
"\n"				{++curr_line; curr_col = 1;}
[ \t]+				{/* ignore spaces */ curr_col += yyleng;}


.            		{printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", curr_line, curr_col, yytext); exit(0);}

%%

int main(int argc, char ** argv)
{
	yylex();
}