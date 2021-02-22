// Testando acesso invalido a mem.
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>


void dangling(){
	int * value = (int *) malloc(sizeof(int));
 	int * value2;
 	*value = 3;
 	free(value);
    value2 = (int *) malloc(sizeof(int));
  	*value2 = 8;
  	printf("%d\n", *value);
}


int main () {
 	dangling();
}

