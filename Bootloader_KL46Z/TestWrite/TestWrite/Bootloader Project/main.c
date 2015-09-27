#include "string.h"
#include "MKL46Z4.h"
#include <stdio.h>
#include <stdint.h>
#include "Parse_srec.h"

char write_data[46]  = "S3151FFFE0006841002065E1FF1F7BE1FF1F7DE1FF1FC9";
char *data;

void sram_write(char* addr, char* data_buf, uint32_t len)
{
	uint32_t i =0;
  for(i = 0; i < len; i++)
  {
    addr[i] = data_buf[i];
  }
}

int main(void)
{ 
  // set RAM base address here
	char *sram_base_addr =  (char *)0x1FFFE000;
	ConvertAndParse(write_data,46);
	
	data =  Get_Data();
	
  sram_write(sram_base_addr,  data,  16);
	while(1){ 
	}
}

