#include <stdio.h>
#include <stdlib.h>

int pos;

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

int main(){
     system("color f0");
     menu("Test xd");
     addop("Manuela");
     addop("Mamada");
     addop("Singada");
     //getch();
     return 0;
     }
