//
//  main.m
//  Pilas y Colas
//
//  Created by Mauricio Salustio on 09/10/13.
//  Copyright (c) 2013 Mauricio Salustio. All rights reserved.
//

#import <Foundation/Foundation.h> //borrar esta linea (dejar solo osx)

int pos;
struct _test {
    int dato;
    struct _test *siguiente;
    struct _test *anterior;
};

struct _test *primero, *ultimo, *first, *last;

// Cuenta Caracteres en un String
int cont(char text[]){
    int i = 0 ;
    while(text[i]!='\0'){
        i++;
    }
    return i;
}

//Inicializa Menu
void menu(char title[15]){
    pos=0;
    int i, e=40, c,z;
    for(i = 0 ; i < e ; i++){
        printf("#");
        if(e == i+1){
            printf("\n#");
            
        }
    }
    e-=2;
    c = cont(title)/2;
    z = ((e)/2)-c;
    for(i = 0 ; i < e ; i++){
        printf(" ");
        if(i==z){
            printf("%s",&title[0]);
            i+=cont(title);
        }
        if(e == i+1){
            printf("#\n");
        }
    }
    for(i = 0 ; i < e+2 ; i++){
        printf("#");
    }
    printf("\n");
}

//Agrega Opciones al Menu
void addop(char opt[15]){
    if(pos==0){
        printf("\n");
        pos=1;
        printf("%d) %s\n",pos,&opt[0]);
        pos++;
    }else{
        printf("%d) %s\n",pos, &opt[0]);
        pos++;
    }
}

//
// Funciones Pila
//

//Inicializar Pila
void pila_ini(){
    struct _test *nuevo;
	nuevo = (struct _test *) malloc (sizeof(struct _test));
    if (nuevo==NULL) printf( "No hay memoria disponible!\n");
    printf("\nNuevo Nodo Inicia:\n");
    nuevo->dato=0;//Valor Inicial de la Pila
    printf("Dato: %d\n",nuevo->dato);
    if (primero==NULL) {
        nuevo->siguiente = NULL;
        primero = nuevo;
        ultimo = nuevo;
        printf("\nPila Creado! Con Valor Inicial");
    }else{
        nuevo->siguiente = primero;
        primero = nuevo;
        printf("\nYa el nodo Existia! Insertado por el inicio con valor inicial");
    }
}
// Agrega elemento a la Pila
void pila_agregar() {
    struct _test *nuevo;
    
    /* reservamos memoria para el nuevo elemento */
    nuevo = (struct _test *) malloc (sizeof(struct _test));
    if (nuevo==NULL) printf( "No hay memoria disponible!\n");
    
    
    printf("\nNuevo Elemento:\n");
    printf("Dato: ");
    scanf("%d",&nuevo->dato);
    
    
    /* el campo siguiente va a ser NULL por ser el &uacute;ltimo elemento
     de la lista */
    nuevo->siguiente = NULL;
    nuevo->anterior = NULL;
    
    /* ahora metemos el nuevo elemento en la lista. lo situamos
     al final de la lista */
    /* comprobamos si la lista est&aacute; vac&iacute;a. si primero==NULL es que no
     hay ning&uacute;n elemento en la lista. tambi&eacute;n vale ultimo==NULL */
    if (primero==NULL) {
        printf( "Primer elemento\n");
        primero = nuevo;
        ultimo = nuevo;
    }
    else {
        /* el que hasta ahora era el &uacute;ltimo tiene que apuntar al nuevo */
        ultimo->siguiente = nuevo;
        /* hacemos que el nuevo sea ahora el &uacute;ltimo */
        nuevo->anterior=ultimo;
        ultimo = nuevo;
    }
}
//extraer elementos en la pila
void pila_extraer(){
	if(ultimo!=NULL){
        struct _test *auxiliar; /* lo usamos para recorrer la lista */
        auxiliar = ultimo;
        printf("\nExtraido: %d\n",ultimo->dato);
        printf("Direccion: %p\n",ultimo);
        ultimo=auxiliar->anterior;
        ultimo->siguiente=NULL;
        free(auxiliar);
    }else{
        printf("\nNo hay elementos!\n\n");
    }
}

void pila_extraer_(){
    struct _test *auxiliar; /* lo usamos para recorrer la lista */
    auxiliar = ultimo;
    if (auxiliar->anterior!=NULL) {
        ultimo=auxiliar->anterior;
        ultimo->siguiente=NULL;
    }else{
        primero=NULL;
        ultimo=NULL;
    }
    free(auxiliar);
}

void pila_tope(){
    if (ultimo!=NULL) {
        printf("\nTope de Pila: %d\n",ultimo->dato);
        printf("Direccion: %p\n",ultimo);
    }else{
        printf("\nNo hay elementos!\n\n");
    }
}

void pila_ver(){
	struct _test *auxiliar; /* lo usamos para recorrer la lista */
	auxiliar=primero;
    if(ultimo!=NULL){
		do{
            printf("\nElemento: %d\n",auxiliar->dato);
            printf("Direccion: %p\n",auxiliar);
            printf("Direccion Siguiente: %p\n",auxiliar->siguiente);
            auxiliar=auxiliar->siguiente;
            /*if(auxiliar->siguiente==NULL){
                printf("\nElemento: %d\n",auxiliar->dato);
                printf("Direccion: %p\n",auxiliar);
                printf("Direccion Siguiente: %p\n",auxiliar->siguiente);
            }*/
        }while(auxiliar!=NULL);
        
        
    }else{
        printf("\nNo hay elementos!\n\n");
    }
}

void pila_destruir(){
	if(ultimo!=NULL){
        struct _test *auxiliar; /* lo usamos para recorrer la lista */
        struct _test *aux; /* lo usamos para recorrer la lista */
        auxiliar=primero;
        while(auxiliar->siguiente!=NULL){
            aux=auxiliar;
            auxiliar=auxiliar->siguiente;
            printf("\nElemento Destruido: %d\n",aux->dato);
            free(aux);
            if(auxiliar->siguiente==NULL){
                printf("\nElemento Destruido: %d\n",auxiliar->dato);
                free(auxiliar);
                break;
            }
        }
        primero=NULL;
        ultimo=NULL;
    }else{
        printf("\nNo hay elementos!\n\n");
    }
}

int pila_contar(){
    struct _test *auxiliar; /* lo usamos para recorrer la lista */
	auxiliar=primero;
    int i=0;
    if(ultimo!=NULL){
		do{
            i++;
            auxiliar=auxiliar->siguiente;
        }while(auxiliar!=NULL);
    }
    return i;
}

void menu_pila(){
    int opt=0;
    do{
        pos=0;
        menu("Pila");
        addop("Inicializar");
        addop("Agregar");
        addop("Extraer");
        addop("Ver Tope");
        addop("Ver Pila");
        addop("Destruir");
        addop("Subir");
        printf("\nOpcion: ");
        scanf("%d",&opt);
        switch(opt){
            case 1:
                pila_agregar();
                break;
            case 2:
                pila_agregar();
                break;
            case 3:
                pila_extraer();
                break;
            case 4:
                pila_tope();
                break;
            case 5:
                pila_ver();
                break;
            case 6:
                pila_destruir();
                break;
            case 7:
                opt=0;
                break;
        }
    }while(opt!=0);
}

//
// Funciones Cola
//

// Agrega elemento a la Cola
void cola_agregar() {
    struct _test *nuevo;
    
    /* reservamos memoria para el nuevo elemento */
    nuevo = (struct _test *) malloc (sizeof(struct _test));
    if (nuevo==NULL) printf( "No hay memoria disponible!\n");
    
    
    printf("\nNuevo Elemento:\n");
    printf("Dato: ");
    scanf("%d",&nuevo->dato);
    
    
    /* el campo siguiente va a ser NULL por ser el &uacute;ltimo elemento
     de la lista */
    nuevo->siguiente = NULL;
    nuevo->anterior = NULL;
    
    /* ahora metemos el nuevo elemento en la lista. lo situamos
     al final de la lista */
    /* comprobamos si la lista est&aacute; vac&iacute;a. si primero==NULL es que no
     hay ning&uacute;n elemento en la lista. tambi&eacute;n vale ultimo==NULL */
    if (first==NULL) {
        printf( "Primer elemento\n");
        first = nuevo;
        last = nuevo;
    }
    else {
        /* el que hasta ahora era el &uacute;ltimo tiene que apuntar al nuevo */
        last->siguiente = nuevo;
        /* hacemos que el nuevo sea ahora el &uacute;ltimo */
        nuevo->anterior=last;
        last = nuevo;
    }
}

void cola_extraer(){
    if(first!=NULL){
        struct _test *auxiliar; /* lo usamos para recorrer la lista */
        auxiliar = first;
        if (auxiliar->siguiente!=NULL) {
            first=auxiliar->siguiente;
            first->anterior=NULL;
        }else{
            first=NULL;
            last=NULL;
        }
         free(auxiliar);
    }
}

void cola_proc(){
    int i, var, x;
    if(ultimo!=NULL){
        i=pila_contar();
        if(first!=NULL){
            do{
            printf("\nElementos en la Pila: %d\n",i);
            printf("Extraer: ");
            scanf("%d",&var);
            }while (var>i);
            for(x=0;x<var;x++){
                pila_extraer_();
            }
            cola_extraer();
            i=pila_contar();
            printf("Elementos Restantes en la Pila: %d\n\n",i);
        }else{
            printf("\nNo hay Elementos en la cola!\n");
        }
    }else{
        printf("\nNo hay Elementos en la Pila\n");
    }
}

void menu_cola(){
    int opt=0;
    do{
        pos=0;
        menu("Cola");
        addop("Agregar");
        addop("Procesar");
        addop("#Extraer");
        addop("#Ver Tope");
        addop("#Ver Pila");
        addop("#Destruir");
        addop("Subir");
        printf("\nOpcion: ");
        scanf("%d",&opt);
        switch(opt){
            case 1:
                cola_agregar();
                break;
            case 2:
                cola_proc();
                break;
            case 3:
                pila_extraer();
                break;
            case 4:
                pila_tope();
                break;
            case 5:
                pila_ver();
                break;
            case 6:
                pila_destruir();
                break;
            case 7:
                opt=0;
                break;
        }
    }while(opt!=0);
}

int main(int argc, const char * argv[])
{

    @autoreleasepool {//borrar esta linea (dejar solo osx)
        int opt=0;
        do{
            pos=0;
            menu("Pilas y Colas");
            addop("Pila");
            addop("Cola");
            addop("Salir");
            printf("\nOpcion: ");
            scanf("%d",&opt);
            switch(opt){
                case 1:
                    menu_pila();
                    break;
                case 2:
                    menu_cola();
                    break;
                case 3:
                    opt=0;
                    break;
            }
        }while(opt!=0);
        printf("\nPrograma Finalizado!");
    }//borrar esta linea (dejar solo osx)
    return 0;
}

