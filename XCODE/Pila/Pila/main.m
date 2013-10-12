//
//  main.m
//  Pila
//
//  Created by Mauricio Salustio on 01/10/13.
//  Copyright (c) 2013 Mauricio Salustio. All rights reserved.
//

#import <Foundation/Foundation.h>//Remover 

int pos;
struct _test {
    int dato;
    struct _test *siguiente;
    struct _test *anterior;
};

struct _test *primero, *ultimo;

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

    
    /* el campo siguiente va a ser NULL por ser el último elemento
     de la lista */
    nuevo->siguiente = NULL;
    nuevo->anterior = NULL;
    
    /* ahora metemos el nuevo elemento en la lista. lo situamos
     al final de la lista */
    /* comprobamos si la lista está vacía. si primero==NULL es que no
     hay ningún elemento en la lista. también vale ultimo==NULL */
    if (primero==NULL) {
        printf( "Primer elemento\n");
        primero = nuevo;
        ultimo = nuevo;
    }
    else {
        /* el que hasta ahora era el último tiene que apuntar al nuevo */
        ultimo->siguiente = nuevo;
        /* hacemos que el nuevo sea ahora el último */
        nuevo->anterior=ultimo;
        ultimo = nuevo;
    }
}
//extraer elementos en la pila
void pila_extraer(){
    struct _test *auxiliar; /* lo usamos para recorrer la lista */
    auxiliar = ultimo;
    ultimo=auxiliar->anterior;
    free(auxiliar);
}

void pila_tope(){
    if (ultimo!=NULL) {
        printf("\nTope de Pila: %d\n\n",ultimo->dato);
    }else{
        printf("\nNo hay elementos!\n\n");
    }
}

int main(int argc, const char * argv[])//borra las cabezeras
{

    @autoreleasepool {//borrar esta linea
        int opt=0;
        do{
            pos=0;
            menu("Pila");
            addop("Inicializar");
            addop("Agregar");
            addop("Extraer");
            addop("Ver Tope");
            addop("Destruir");
            addop("Salir");
            printf("\nOpcion: ");
            scanf("%d",&opt);
            switch(opt){
                case 1:
                    pila_ini();
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
                case 6:
                    opt=0;
                    break;
                        }
            }while(opt!=0);
        
    }//borrar esta linea
    return 0;
}

