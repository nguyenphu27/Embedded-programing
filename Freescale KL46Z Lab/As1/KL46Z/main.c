#include  <stdio.h>
#include  "MKL46Z4.h"
extern void SystemCoreClockUpdate (void);
int main (void)
{
  /* Update system clock */
  SystemCoreClockUpdate(); 
  return 0;
}
