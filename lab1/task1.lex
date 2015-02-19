%{
	int currLine = 1; 
	int currPos = 1;
%}

DIGIT		[0-9]

%%

"-"			{printf("MINUS\n"); currPos += yyleng;}
"+"			{printf("PLUS\n"); currPos += yyleng;}
"*"			{printf("MULTIPLY\n"); currPos += yyleng;}
"="			{printf("EQUAL\n"); currPos += yyleng;}

{DIGIT}+	{printf("DIGIT: %s\n", yytext); currPos += yyleng;}

"\n"		{currLine++; currPos = 1;}

.			{printf("Error at line %d, column %d: unrecognized symbol \"%s\"\n", currLine, currPos, yytext); exit(0);}

%%

int main(int argc, char ** argv)
{
	yylex();
}