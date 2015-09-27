#include "UART.h"
#include "GPIO.h"
#include "Parse_srec.h"

/*Declare variable*/
char buffer[128];
char ch;
char *data_buffer;
char *address_poiter;
uint8_t count=0;
uint8_t totalchar=0;
uint8_t Bc1=0;
uint8_t Bc2=0;
uint32_t i;
uint32_t address_line;
uint32_t data_length;

/*Remap vector jump SRAM*/
__asm void JumpToRam(void){
	LDR R0, =0x1FFFE000 //Starting address of program in SRAM.
	LDR R1,[R0]  			  //Get initial MSP value
	MOV SP, R1          //Set SP value
	LDR R1, [R0, #4]    //Get initial PC value 				
	
	BX R1								//This branch to C startup code
}

/*Write SRAM function*/
void sram_write(char *addr, char *data_buf, uint32_t len)
{	
  for(i = 0; i < len; i++)
  {
    addr[i] = data_buf[i];
  }
}
/*Interrupt uart*/
void UART0_IRQHandler(void)
{				
		/* read the RX register */
		ch = UART0_GetChar();
		
		/*If received letter 'Z' will jump RAM and start application*/
		if(ch=='Z'){
		/*Put letter 'R' announce transfer complete!*/										
		UART0_PutChar('R');	
		JumpToRam();	
		}
		/*Add char buffer array*/
		buffer[count] = ch;
		count++;
		
		/*Get byte count to determine lenght of line*/
		if(count==5){							
			if('0'<= buffer[2] && buffer[3]<='9'){
	
				Bc1 = (uint8_t)((buffer[2]-'0')<<4);	
				Bc2 = (uint8_t)((buffer[3]-'0')<<0);						
			}else if('A'<=buffer[2] && buffer[3]<='F'){
				
				Bc1 = (uint8_t)((buffer[2]-'A'+10)<<4);
				Bc2 = (uint8_t)((buffer[3]-'A'+10)<<0);
			}else if('0'<=buffer[2]<='9'&&'A'<=buffer[3]<='F'){
				
				Bc1 = (uint8_t)((buffer[2]-'0')<<4);	
				Bc2 = (uint8_t)((buffer[3]-'A'+10)<<0);
			}else if('A'<=buffer[2]<='F'&&'0'<=buffer[3]<='9'){
				
				Bc1 = (uint8_t)((buffer[2]-'A'+10)<<4);
				Bc2 = (uint8_t)((buffer[3]-'0')<<0);					
			}
			/*Total lenght of line*/
			totalchar = ((Bc1+Bc2)+2)*2;
		}
		
		/*If send line complete, will convert & parse line then copy to SRAM*/
		if(count == totalchar){		
					ConvertAndParse(buffer,totalchar);
			
					/*Check sum right*/
					if(CheckSum() ==1){	
						
							if(ConvertAndParse(buffer,totalchar)==0){ //S3 line
									/*Get Address, Data, Data Length*/		
									address_line = Get_Address();
									data_length = Get_CountByte();						
									data_buffer = Get_Data();
									
									//poiter address
									address_poiter = (char *)(address_line);
									//allocated SRAM
									sram_write(address_poiter, data_buffer, (data_length-5));
								
									/*Delete variable after write ram*/
									count=0;
									totalchar = 0;
									Bc1 =0;
									Bc2 =0;		
									data_length = 0;
									address_poiter =0;
									address_line =0;
								
									/*Write RAM success, response to received next line*/		
									UART0_PutChar('R');									
													
							}else{
								/*Not line S3 check S7 line if right will response letter 'R', not copy data*/
								UART0_PutChar('R');
							}
					}else{
						/*Check sum wrong*/
						count=0;
						totalchar = 0;
						Bc1 =0;
						Bc2 =0;
						/*Resend this line, terminal resend this line max 100 time, not received announce error*/
						UART0_PutChar('W');
					}
		}		
}

/*Main function*/
int main(void)
{	
	/*Initialize uart*/
	Init_UART();
	/*Enable Interrupt, Transfer, Received data uart and set priority*/
	UART0_AsyncReceive();
	while(1){		
	}
}
