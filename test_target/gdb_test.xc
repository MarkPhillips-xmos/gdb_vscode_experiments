#include <platform.h>
#include <stdio.h>


void tile0() {
  printf("On tile0\n");
}

void tile1() {
  printf("On tile1\n");
}


int main() {
  par {
    on tile[0]: {
      while (1) {
        tile0();

      }
    }


    on tile[1]: {
      while (1) {
        tile1();
      }
    }
  }	
}
