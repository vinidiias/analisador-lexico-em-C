#ifndef TABELA_H
#define TABELA_H

#include<stdio.h>
#include<stdlib.h>

#define TAM 51
typedef struct no{
    char nome[TAM];
    char token[TAM];
    int line;
    char tipo_erro[TAM];
    struct no* prox;
}Tabela;

Tabela* tab;

Tabela* cria_tabela_vazia();


Tabela* insert_tabela(Tabela* tab, char* nome, char* token, char* tipo_erro, int l);

void analise_lexica(Tabela* tab);

void free_list(Tabela* tab);

#endif // TABELA_H