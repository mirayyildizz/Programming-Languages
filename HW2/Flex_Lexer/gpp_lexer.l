%option noyywrap
%{
	#include<stdio.h>
	#include<stdlib.h>
	#include<string.h>
	FILE *yyin;
	FILE *yyout;
	int counter = 0;
%}


%%
list   	{
			fprintf(yyout, "%s", "KW_LIST\n");
       	}
	
and    	{
			fprintf(yyout, "%s", "KW_AND\n");
		}

or     	{
			fprintf(yyout, "%s", "KW_OR\n");
       	}

not    	{
			fprintf(yyout, "%s", "KW_NOT\n");
		}

equal  	{
			fprintf(yyout, "%s", "KW_EQUAL\n");
		}

less 	{
			fprintf(yyout, "%s", "KW_LESS\n");
		}

nil 	{	
			fprintf(yyout, "%s", "KW_NIL\n");
		}

append 	{ 
			fprintf(yyout, "%s", "KW_APPEND\n");
		}

concat 	{
			fprintf(yyout, "%s", "KW_CONCAT\n");
		}

set 	{
			fprintf(yyout, "%s", "KW_SET\n");
		}

for 	{
			fprintf(yyout, "%s", "KW_FOR\n");
		}

if  	{
			fprintf(yyout, "%s", "KW_IF\n");
		}

exit 	{
			fprintf(yyout, "%s", "KW_EXIT\n");
		}

load 	{
			fprintf(yyout, "%s", "KW_LOAD\n");
		}

disp 	{
			fprintf(yyout, "%s", "KW_DISP\n");
		}

true 	{
			fprintf(yyout, "%s", "KW_TRUE\n");
		}

false 	{
	
			fprintf(yyout, "%s", "KW_FALSE\n");
		}

"(" 	{
			 fprintf(yyout, "%s", "OP_OP\n");
		}

")" 	{
			fprintf(yyout, "%s", "OP_CP\n");
		}

[0]|[1-9][0-9]* { fprintf(yyout, "%s", "VALUE\n");}


"+" 	{
			
		 	fprintf(yyout, "%s", "OP_PLUS\n");
		}

"-" 	{
			 
			fprintf(yyout, "%s", "OP_MINUS\n");
		}
		
","     {
			fprintf(yyout, "%s", "OP_COMMA\n");
		}

"/" 	{
			
			fprintf(yyout, "%s", "OP_DIV\n");
		}

"*"     {
			fprintf(yyout, "%s", "OP_MULT\n");;
		}

deffun 	{
			fprintf(yyout, "%s", "KW_DEFFUN\n");
		}

[a-zA-Z][a-zA-Z0-9]* 	{
			
			fprintf(yyout, "%s", "IDENTIFIER\n");
		}

[;][;].* 	{
			fprintf(yyout, "%s", "COMMENT\n");
		}

"*""*" 	{

			fprintf(yyout, "%s", "OP_DBLMULT\n");
		}

["] 	{
			
			if(counter == 0) {
				fprintf(yyout, "%s", "OP_OC\n");
				counter++; 
			} else if(counter == 1){
				fprintf(yyout, "%s", "OP_CC\n");
				counter--;
			}
			

		}


[\n][\n]    {
			exit(1);
		}

[ \t]   ;
[ \n]   ;
.       {
			fprintf(yyout, "%s", "SYNTAX_ERROR\n");
			
		}


%%

int main(int argc, char *argv[])
{
	
	if(argc == 1){
		yyout = fopen("parsed_cpp.txt", "a");
		yylex();
		fclose(yyout);	
		
	}
	
	else{
		
		yyin = fopen(argv[1], "r");
		yyout = fopen("parsed_cpp.txt", "a");
		yylex();
		

		
	}
	fclose(yyin);
	fclose(yyout);	
		
	return 0;
}
