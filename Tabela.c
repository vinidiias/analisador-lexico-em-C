#include<stdio.h>
#include<stdlib.h>
#include<string.h>

#include "Tabela.h"

Tabela* cria_tabela_vazia(){
    Tabela* tabela = (Tabela*) malloc(sizeof(Tabela));
    tabela->prox = NULL;
    return tabela;
}

Tabela* insert_tabela(Tabela* tab, char* nome, char* token, char* tipo_erro, int l){
    Tabela* no = (Tabela*)malloc(sizeof(Tabela));
    strcpy(no->nome, nome);
    strcpy(no->token, token);
    strcpy(no->tipo_erro, tipo_erro);
    no->line = l;

    if(tab == NULL){
        no->prox = NULL;
        tab = no;
    }else{
        Tabela* aux = tab;
        while(aux->prox != NULL){
            aux = aux->prox;
    }
        no->prox = NULL;
        aux->prox = no;
    }
    return tab;
}

void analise_lexica(Tabela* tab){
    if(tab != NULL){
        if(strlen(tab->tipo_erro) != 0) printf("Lexema: %s\nToken: %s\nErro: %s\nLinha: %d\n\n", tab->nome, tab->token, tab->tipo_erro, tab->line);
        else printf("Lexema: %s\nToken: %s\nLinha: %d\n\n", tab->nome, tab->token, tab->line);
        analise_lexica(tab->prox);
    }
}

void free_list(Tabela* tab){
    if(tab != NULL){
        free_list(tab->prox);
        free(tab);
    }
}