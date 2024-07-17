%{
//1ª)Definições
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

#include "Tabela.h"
#include "interface.h"

int count = 1;

%}
%option noyywrap

IF (if)
ELSE (else)
SWITCH (switch)
CASE (case)

RETURN (return)
REMOVE (remove)
TYPEDEF (typedef)
INCLUDE (include)
DEFINE (define)

PARENTESES [()]
CHAVES [{}]
COLCHETES [[]]

FOR (for)
WHILE (while)
DO (do)

PRINTF (printf)
SCANF (scanf)
FSCANF (fscanf)
FPRINTF (fprintf)
SIZEOF (sizeof)
MALLOC (malloc)
STRLEN (strlen)
STRCMP (strcmp)
STRCPY (strcpy)

STRUCT (struct)
FLOAT (float)
INT (int)
DOUBLE (double)
CHAR (char)
VOID (void)
LONG (long)
SHORT (short)


ADD ("+")
SUB ("-")
DIV ("/")
MULT ("*")
RESTO ("%")

AND (&&)
OR ("||")
NOT ("!")

ATRIB ("=")
ATRIB_ADD ("+=")
ATRIB_SUB ("-=")
ATRIB_DIV ("/=")
ATRIB_MULT ("*=")
ATRIB_RESTO ("%=")

EQUAL ("==")
MAIOR_EQUAL (>=)
MENOR_EQUAL (<=)
DIFERENTE (!=)
MAIOR (">")
MENOR ("<")

LETRA [a-zA-Z_]

DIGITO [0-9]

NUMERO ("+"|"-")?{DIGITO}+" "*|(("+"|"-")?{DIGITO}+.{DIGITO}+" "*)

IDENTIFICADOR {LETRA}({LETRA}|{DIGITO})*

ERROVAR {DIGITO}+{LETRA}+({DIGITO}|{LETRA})*
ERROARROBA ({LETRA}|{DIGITO})*("@")({LETRA}|{DIGITO})*
ERRONUM {DIGITO}+.{LETRA}*

%%
	//2ª)Regras


"cabo"              {
                        return 0;
                    }

{NUMERO}            {
                        tab = insert_tabela(tab, yytext, "enum", "\0", count);
                    }
                    
{RETURN}		    { 
                        tab = insert_tabela(tab, yytext, "keyword_return", "\0", count);
                    }

{REMOVE}            {
                        tab = insert_tabela(tab, yytext, "keyword_remove", "\0", count); 
                    }

{TYPEDEF}           {
                        tab = insert_tabela(tab, yytext, "keyword_remove", "\0", count);
                    }

{INCLUDE}           {
                        tab = insert_tabela(tab, yytext, "keyword_include", "\0", count);
                    }

{DEFINE}            {
                        tab = insert_tabela(tab, yytext, "keyword_define", "\0",count);
                    }

{IF}                {
                        tab = insert_tabela(tab, yytext, "token_condicional_if", "\0", count);
                    }

{ELSE}              {
                        tab = insert_tabela(tab, yytext, "token_condicional_else", "\0", count);
                    }

{SWITCH}            {
                        tab = insert_tabela(tab, yytext, "token_condicional_switch", "\0", count);
                    }

{CASE}              {
                        tab = insert_tabela(tab, yytext, "token_condicional_case", "\0", count);
                    }

{FOR}               {
                        tab = insert_tabela(tab, yytext, "struct_repetition_for", "\0", count);
                    }

{WHILE}             {
                       tab = insert_tabela(tab, yytext, "struct_repetition_while", "\0", count);
                    }

{DO}                {
                        tab = insert_tabela(tab, yytext, "struct_repetition_do", "\0", count);
                    }

{PRINTF}            {
                        tab = insert_tabela(tab, yytext, "function_in", "\0", count);
                    }
{SCANF}             {
                        tab = insert_tabela(tab, yytext, "function_out", "\0", count);
                    }

{FSCANF}            {
                        tab = insert_tabela(tab, yytext, "function_in", "\0", count);
                    }

{FPRINTF}           {
                        tab = insert_tabela(tab, yytext, "function_out", "\0", count);
                    }

{SIZEOF}            {
                        tab = insert_tabela(tab, yytext, "function_sizeof", "\0", count);
                    }  

{MALLOC}            {
                        tab = insert_tabela(tab, yytext, "function_malloc", "\0", count);
                    }

{STRLEN}            {
                        tab = insert_tabela(tab, yytext, "function_strlen", "\0", count);
                    }

{STRCMP}            {
                        tab = insert_tabela(tab, yytext, "function_strcmp", "\0", count);
                    }

{STRCPY}            {
                        tab = insert_tabela(tab, yytext, "function_strcpy", "\0", count);
                    }

{STRUCT}            {
                        tab = insert_tabela(tab, yytext, "tipo_dado_struct", "\0", count);
                    }

{VOID}              {
                        tab = insert_tabela(tab, yytext, "tipo_dado_void", "\0", count);
                    }

{INT}               {
                        tab = insert_tabela(tab, yytext, "tipo_dado_int", "\0", count);
                    }

{FLOAT}             {
                        tab = insert_tabela(tab, yytext, "tipo_dado_float", "\0", count);
                    }

{DOUBLE}            {
                        tab = insert_tabela(tab, yytext, "tipo_dado_void", "\0", count);
                    }

{CHAR}              {
                        tab = insert_tabela(tab, yytext, "tipo_dado_char", "\0", count);
                    }

{LONG}              {
                        tab = insert_tabela(tab, yytext, "tipo_dado_long", "\0", count);
                    }

{SHORT}             {
                        tab = insert_tabela(tab, yytext, "tipo_dado_short", "\0", count);
                    }

{ADD}               {
                        tab = insert_tabela(tab, yytext, "operator_add", "\0", count);
                    }

{SUB}               {
                        tab = insert_tabela(tab, yytext, "operator_sub", "\0", count);
                    }

{ATRIB}             {
                        tab = insert_tabela(tab, yytext, "simb_atrib", "\0", count);
                    }

{DIV}               {
                        tab = insert_tabela(tab, yytext, "operator_div", "\0", count);
                    }

{MULT}              {
                        tab = insert_tabela(tab, yytext, "operator_mult", "\0", count);
                    }

{RESTO}             {
                        tab = insert_tabela(tab, yytext, "operator_rest", "\0", count);
                    }

{AND}               {
                        tab = insert_tabela(tab, yytext, "operator_and", "\0", count);
                    }

{OR}                {
                        tab = insert_tabela(tab, yytext, "operator_or", "\0", count);
                    }

{NOT}               {
                        tab = insert_tabela(tab, yytext, "operator_not", "\0", count);
                    }

{PARENTESES}        {
                        tab = insert_tabela(tab, yytext, "simb_parentheses", "\0", count);
                    }

{CHAVES}            {
                        tab = insert_tabela(tab, yytext, "simb_keys", "\0", count);
                    }

{COLCHETES}         {
                        tab = insert_tabela(tab, yytext, "simb_brackets", "\0", count);
                    }

{EQUAL}             {
                        tab = insert_tabela(tab, yytext, "equal_comparator", "\0", count);
                    }

{MAIOR_EQUAL}       {
                        tab = insert_tabela(tab, yytext, "maior_equal_comparator", "\0", count);
                    }

{MENOR_EQUAL}       {
                        tab = insert_tabela(tab, yytext, "menor_equal_comparator", "\0", count);
                    }

{DIFERENTE}         {
                        tab = insert_tabela(tab, yytext, "not_equal_comparator", "\0", count);
                    }

{MAIOR}             {
                        tab = insert_tabela(tab, yytext, "maior_comparator", "\0", count);
                    }

{MENOR}             {
                        tab = insert_tabela(tab, yytext, "menor_comparator", "\0", count);
                    }

{ATRIB_ADD}         {
                        tab = insert_tabela(tab, yytext, "accumulator_add", "\0", count);
                    }

{ATRIB_SUB}         {
                        tab = insert_tabela(tab, yytext, "accumulator_sub", "\0", count);
                    }

{ATRIB_DIV}         {
                        tab = insert_tabela(tab, yytext, "accumulator_div", "\0", count);
                    }

{ATRIB_MULT}        {
                        tab = insert_tabela(tab, yytext, "accumulator_rest", "\0", count);
                    }

{ERROVAR}           {
                        tab = insert_tabela(tab, yytext, "erro_var", "texto extra apos o final do numero", count);
                        printf("Lexema: %s\nToken: %s\nErro: %s\n\n", yytext, "erro_var", "texto extra apos o final do numero");
                    }

{ERROARROBA}        {
                       
                        tab = insert_tabela(tab, yytext, "erro_var", "@ nao eh reconhecido pela linguagem", count);
                        printf("Lexema: %s\nToken: %s\nErro: %s\n\n", yytext, "erro_var", "@ nao eh um caracter reconhecido");
                    }

{ERRONUM}           {
                        tab = insert_tabela(tab, yytext, "erro_num", "numero nao reconhecido pela linguagem", count);
                        printf("Lexema: %s\nToken: %s\nErro: %s\n\n", yytext, "erro_num", "numero nao reconhecido pela linguagem");
                    }

{IDENTIFICADOR}     {
                        tab = insert_tabela(tab, yytext, "id", "\0", count);
                    }
                
"\n"                {
                        count++;
                    }
%%

int main(){
    char str[51];
    pascython();
    int op;
    do{
        opcoes();
        scanf("%d%*c", &op);
        switch (op) {
            case 1:
                printf("Digite o nome do arquivo.\n");
                scanf("%[^\n]%*c", str);
                yyin = fopen(str, "r");
                if(yyin == NULL){ printf("Arquivo incorreto, digite novamente...\n"); break;}
                yyrestart(yyin);
                yylex();
                opcao_print();
                scanf("%d%*c", &op);
                if(op == 1) analise_lexica(tab);
                else if(op != 2) printf("Opcao invalida, retornando ao menu...\n");
                free_list(tab);
                count = 1;
                break;
            case 2:
                printf("\nDigite alguma linha de codigo para verificar erros:\n");
                yyrestart(stdin);
                yylex();
                count = 1;
                break;
            case 3:
                break;
            default:
                printf("Valor invalido!\n");
        }
    }while(op != 3);
	return 0;
}