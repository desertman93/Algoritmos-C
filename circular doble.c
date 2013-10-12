#include <stdio.h>
#include <stdlib.h>

int pos;
 struct _test {
        char dato;
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
             
void inilist(){
	struct _test *nuevo;
	nuevo = (struct _test *) malloc (sizeof(struct _test));
      if (nuevo==NULL) printf( "No hay memoria disponible!\n");
    printf("\nNuevo Nodo Inicia:\n");
    nuevo->dato='A';
    printf("Dato: %c\n",nuevo->dato); 
     if (primero==NULL) {
         nuevo->siguiente = NULL;
         primero = nuevo;
         ultimo = nuevo;
         printf("\nNodo Creado! Con Valor Inicial");
         }else{
			 nuevo->siguiente = primero;
			 primero = nuevo;
			 printf("\nYa el nodo Existia! Insertado por el inicio con valor inicial"); 
		 }
}
             
void addi(){
	struct _test *nuevo;
	nuevo = (struct _test *) malloc (sizeof(struct _test));
      if (nuevo==NULL) printf( "No hay memoria disponible!\n");

		  printf("\nNuevo Nodo:\n");
      printf("Dato: "); 
      scanf("%s",&nuevo->dato);
  
        if (primero==NULL) {
         nuevo->siguiente = NULL;
         nuevo->anterior = NULL;
         primero = nuevo;
         ultimo = nuevo;
         }else{
			 nuevo->anterior=primero->anterior;
			 nuevo->siguiente = primero;
			 primero->anterior=nuevo;
			 primero = nuevo; 
			 ultimo->siguiente=primero;
		 }
}
        
 void add() {
      struct _test *nuevo;
 
      /* reservamos memoria para el nuevo elemento */
      nuevo = (struct _test *) malloc (sizeof(struct _test));
      if (nuevo==NULL) printf( "No hay memoria disponible!\n");
 
    
		  printf("\nNuevo Nodo:\n");
      printf("Dato: "); 
      scanf("%s",&nuevo->dato);
 
 
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
           ultimo->siguiente=primero;
           primero->anterior=ultimo;
      }
 }
 
 void show() {
      struct _test *auxiliar; /* lo usamos para recorrer la lista */
      int i;
 
      i=0;
      auxiliar = primero;
      printf("\nMostrando la lista completa:\n");
      do{
		    printf("#Nodo %d\n",i+1);
		    printf("Dato: %c\n",auxiliar->dato);
		    printf("Direccion del Nodo: %p\n",auxiliar);
		    printf("Direccion de memoria Anterior: %p\n",auxiliar->anterior);
            printf("Direccion de memoria Siguiente: %p\n",auxiliar->siguiente);
            auxiliar = auxiliar->siguiente;
            i++;
      }while (auxiliar!=ultimo);
      printf("#Nodo %d\n",i+1);
		    printf("Dato: %c\n",ultimo->dato);
		    printf("Direccion del Nodo: %p\n",ultimo);
		    printf("Direccion de memoria Anterior: %p\n",ultimo->anterior);
            printf("Direccion de memoria Siguiente: %p\n",ultimo->siguiente);
      if (i==0) printf( "\nLa lista está vacía!!\n\n" );
 }
 
 void mostrar() {
      struct _test *auxiliar; /* lo usamos para recorrer la lista */
      int i;
 
      i=0;
      auxiliar = primero;
      printf("\nMostrando la lista completa:\n");
      printf("Datos: ");
      while (auxiliar!=NULL) {
		    printf(" %c",auxiliar->dato);
            auxiliar = auxiliar->siguiente;
            i++;
      }
      if (i==0){ printf( "\nLa lista está vacía!!\n\n" );
  }else{
	  printf("\n");
		  }
 }
 
 void delete(){
	 struct _test *auxiliar, *anterior; /* lo usamos para recorrer la lista */
	 anterior = (struct _test*)NULL;
     int i,x=1;
 char var;
      i=0;
      auxiliar = primero;
      printf("\nBuscar Dato:");
      scanf("%s",&var);
      while (auxiliar!=NULL) {
		    if(var==auxiliar->dato){
				if(anterior==NULL){
					primero=auxiliar->siguiente;
					free(auxiliar);
				}else{
					if(auxiliar->siguiente==NULL){
						ultimo=anterior;
						ultimo->siguiente=NULL;
						free(auxiliar);
					}else{
						anterior->siguiente=auxiliar->siguiente;
						free(auxiliar);
					}
				}
				printf("\nDireccion del Nodo: %p\n",auxiliar);
				x=2;
			}
			anterior=auxiliar;
            auxiliar = auxiliar->siguiente;
            i++;
      }
      if(x!=2)printf( "\nNo Encontrado!!\n" );
		  
	  
      if (i==0) printf( "\nLa lista está vacía!!\n" );
	 }
	 
void buscar(){
	struct _test *auxiliar; /* lo usamos para recorrer la lista */
     int i,x=1;
 char var[2];
      i=0;
      auxiliar = primero;
      printf("\nBuscar Dato: ");
      scanf("%s",&var[0]);
      while (auxiliar!=NULL) {
		    if(var[0]==auxiliar->dato){
				printf("\nDireccion del Nodo: %p\n",auxiliar);
				x=2;
			}
            auxiliar = auxiliar->siguiente;
            i++;
      }
      if(x!=2)printf( "\nNo Encontrado!!\n" );
      if (i==0) printf( "\nLa lista está vacía!!\n" );
	 }
	 
void insert(){
struct _test *auxiliar, *anterior;/* lo usamos para recorrer la lista */
     int i,x=1;
     char var;
     anterior = (struct _test*) NULL;
      i=0;
      auxiliar = primero;
      printf("\nInsertar antes de Nodo: ");
      scanf("%s",&var);
           while (auxiliar!=NULL) {
		    if(var==auxiliar->dato){
				if(anterior==NULL){
					addi();
				}else{
					if(auxiliar->siguiente==NULL){
						add();
					}else{
						 struct _test *nuevo;
						 nuevo = (struct _test *) malloc (sizeof(struct _test));
						 if (nuevo==NULL) printf( "No hay memoria disponible!\n");
						  
		  printf("\nNuevo Nodo:\n");
      printf("Dato: "); 
      scanf("%s",&nuevo->dato);
     
						 nuevo->siguiente=auxiliar;
						 nuevo->anterior=anterior;
						 anterior->siguiente=nuevo;
					}
				}
				printf("\nDireccion del Nodo: %p\n",auxiliar);
				x=2;
			}
			anterior=auxiliar;
            auxiliar = auxiliar->siguiente;
            i++;
      }
      if(x!=2)printf( "\nNo Encontrado!!\n" );
		  
	  
      if (i==0) printf( "\nLa lista está vacía!!\n" );
}


int main(){
     //system("color f0");
 
     int opt=0;
     do{
     pos=0;
     menu("Evaluacion Letras");
     addop("Agregar Nodo Por el Final");
     addop("Mostrar Nodos");
     addop("Buscar Valor");
     addop("Eliminar Nodo");
     addop("Agregar Nodo Por el Inicio");
     addop("Crear lista con valor inicial");
     addop("Insertar antes de N");
     addop("Mostrar Todo");
     addop("Salir");
     printf("\nOpcion: ");
     scanf("%d",&opt);
     switch(opt){
		 case 1:
		 add();
		 break;
		 case 2:
		 show();
		 break;
		 case 3:
		 buscar();
		 break;
		 case 4:
		 delete();
		 break;
		 case 5:
		 addi();
		 break;
		 case 6:
		 inilist();
		 break;
		 case 7:
		 insert();
		 break;
		 case 8:
		 mostrar();
		 break;
		 case 9:
		 opt=0;
		 break;
	 }
 }while(opt!=0);
     //getch();
     return 0;
     }
