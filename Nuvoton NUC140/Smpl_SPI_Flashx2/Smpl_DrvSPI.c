/*---------------------------------------------------------------------------------------------------------*/
/*                                                                                                         */
/* Copyright (c) Nuvoton Technology Corp. All rights reserved.                                             */
/*                                                                                                         */
/*---------------------------------------------------------------------------------------------------------*/

#include <stdio.h>
#include "NUC1xx.h"
#include "Driver\DrvSYS.h"
#include "Driver\DrvSPI.h"
#include "Driver\DrvUART.h"
#include "Driver\DrvGPIO.h"
#include "String.h"

#define TEST_NUMBER 1 /* page numbers */
//void SPI0_Callback(uint32_t u32UserData);
//volatile uint32_t SPI0_INT_Flag;
uint32_t u32ByteCount, u32FlashAddress, u32PageNumber;
uint8_t DataBuffer0[64];
uint8_t DataBuffer1[64];
int dem = 0;
int r1;
void SpiFlashx2_ReadMidDid(void);
void SpiFlashx2_ChipErase(void);
uint32_t SpiFlash2_ReadStatusReg1(void);
uint32_t SpiFlash2_ReadStatusReg2(void);
void SpiFlashx2_WaitReady(void);
void SpiFlashx2_PageProgram(uint8_t *, uint32_t, uint32_t);
void SpiFlashx2_ReadData(uint8_t *, uint8_t *, uint32_t, uint32_t);

void Initial_pannel(void);
void clr_all_pannal(void);
void print_lcd(unsigned char, char *);

void SysTimerDelay(uint32_t);

void delay(void)
{
	int j;
   	for(j=0; j<1000; j++);
}

uint8_t scan_key(void)
{
	uint8_t act[4]={0x3b, 0x3d, 0x3e};    
	uint8_t i,temp,pin;

	for(i=0;i<3;i++)
	{
    	temp=act[i];
	   	for(pin=0;pin<6;pin++)
	    {
	  		if((temp&0x01)==0x01)
        		DrvGPIO_SetBit(E_GPA,pin);
			else
				DrvGPIO_ClrBit(E_GPA,pin);		  
			temp=temp>>1; 	  
	    }							    
	    delay();
		if(DrvGPIO_GetBit(E_GPA,3)==0) 
			return (i+1);
	}

	for(i=0;i<3;i++)
	{
       	temp=act[i];
	   	for(pin=0;pin<6;pin++)
	    {
	  		if((temp&0x01)==0x01)
        		DrvGPIO_SetBit(E_GPA,pin);
			else
				DrvGPIO_ClrBit(E_GPA,pin);		  
			temp=temp>>1; 	  
	    }							    
	    delay();
		if(DrvGPIO_GetBit(E_GPA,4)==0) 
			return (i+4);
	}

	for(i=0;i<3;i++)
	{
       	temp=act[i];
	   	for(pin=0;pin<6;pin++)
	    {
	  		if((temp&0x01)==0x01)
        		DrvGPIO_SetBit(E_GPA,pin);
			else
				DrvGPIO_ClrBit(E_GPA,pin);		  
			temp=temp>>1; 	  
	    }							    
	    delay();
		if(DrvGPIO_GetBit(E_GPA,5)==0) 
			return (i+7);
	}

 	return 0;
}


volatile uint8_t i=0;
volatile uint8_t i_1=0;
volatile uint8_t i_2=0;
volatile uint8_t i_3=0;
volatile uint8_t j,k,l,m;
char temp1[15];
char temp2[15];
char temp3[15];
char temp4[15];
char AllText[64];
char AllTextDes[64];


void insert_text(char texts){
      dem = 1;
			if(i<16){
				temp1[i] = texts;
				print_lcd(0,temp1);//in dong 1
				i++;
			}else if(16 <= i && i < 32){						
					temp2[i_1] = texts;
					print_lcd(1,temp2);//in dong 2
					i_1++;
					i++;
				}else if(32 <= i && i < 48){
					temp3[i_2] = texts;
					print_lcd(2, temp3);//in dong 3
					i_2++;
					i++;
				}else if(48 <= i && i<64){
					temp4[i_3] = texts;
					print_lcd(3, temp4);//in dong 4
					i_3++;
					i++;
				}else{
					
					//dich dong 1
					for(r1=0; r1 < 15; r1++){
						temp1[r1] = temp1[r1+1];						
					}
					temp1[15] = temp2[0];
					print_lcd(0, temp1);
					
					
					//dich dong 2
					for(r1=0; r1 < 15; r1++){
						temp2[r1] = temp2[r1+1];					
					}
					temp2[15] = temp3[0];
					print_lcd(1,temp2);
					
					
					//dich dong 3
					for(r1=0; r1 < 15; r1++){
						temp3[r1] = temp3[r1+1];						
					}
					temp3[15] = temp4[0];
					print_lcd(2, temp3);
					
					
					//dich dong 4 dong thoi chen ky tu moi vao
					for(r1=0; r1 < 15; r1++){
						temp4[r1] = temp4[r1+1];
					}
					temp4[15] = texts;
					print_lcd(3, temp4);
					
				}
			
			
}
void EINT1Callback(void) 
{
 // DrvGPIO_ClrBit(E_GPB,11); // GPB11 = 0 to turn on Buzzer
	//DrvSYS_Delay(100000);	    // Delay 
	//DrvGPIO_SetBit(E_GPB,11); // GPB11 = 1 to turn off Buzzer	
	//DrvSYS_Delay(100000);	    // Delay 	
		//---
	if(dem == 1){
	//-------------
	/* read MID & DID */
	SpiFlashx2_ReadMidDid();
	SysTimerDelay(1000000);
	
	/* Erase SPI flash */
	print_lcd(2,"Xoa Flash.....");
	print_lcd(3,"                ");
	SpiFlashx2_ChipErase();
	
	/* Wait ready */
	SpiFlashx2_WaitReady();
	
	/* Get the status of SPI flash */
	print_lcd(3,"Xong !!!  ");
	SysTimerDelay(1000000);
	
	/* source data */
	for(u32ByteCount=0; u32ByteCount<64; u32ByteCount++)
	{
		DataBuffer0[u32ByteCount] = AllText[u32ByteCount];
	}
	
	/* Program SPI flash */	
	print_lcd(2,"Dang ghi...");
	print_lcd(3,"                ");
	u32FlashAddress = 0;
	for(u32PageNumber=0; u32PageNumber<TEST_NUMBER; u32PageNumber++)
	{
		/* page program */
		SpiFlashx2_PageProgram(DataBuffer0, u32FlashAddress, 64);
		SpiFlashx2_WaitReady();
		u32FlashAddress += 0x100;
	}
	print_lcd(3,"Xong !!!");
	SysTimerDelay(1000000);	
		
	
	 //clear data buffer 
	for(u32ByteCount=0; u32ByteCount<64; u32ByteCount++)
	{
		DataBuffer0[u32ByteCount] = 0;
		DataBuffer1[u32ByteCount] = 0;
	}
		
	/* read back and compare */
	print_lcd(2,"Kiem tra flash");
	print_lcd(3,"                ");
	u32FlashAddress = 0;
	for(u32PageNumber=0; u32PageNumber<TEST_NUMBER; u32PageNumber++)
	{
		SpiFlashx2_ReadData(DataBuffer0, DataBuffer1, u32FlashAddress, 64);
		u32FlashAddress += 0x100;
			
		for(u32ByteCount=0; u32ByteCount<64; u32ByteCount++)
		{					
			
			if(DataBuffer0[u32ByteCount]!=AllText[u32ByteCount])
			{
				print_lcd(3,"F0 Verify Error!");
				while(1);
			}
			if((uint8_t) DataBuffer1[u32ByteCount]!=(uint8_t) ~DataBuffer0[u32ByteCount])
			{
				print_lcd(3,"F1 Verify Error!");
				while(1);
			}
		}
			
		 //clear data buffer 
		for(u32ByteCount=0; u32ByteCount<64; u32ByteCount++)
		{
			DataBuffer0[u32ByteCount] = 0;
			DataBuffer1[u32ByteCount] = 0;
		}
	}
	print_lcd(3,"Da ghi!!! ");	
	DrvSPI_Close(eDRVSPI_PORT2);
	
	}else{	
		
	//	int r1;
		char row1[15];
		char row2[15];
		char row3[15];
		char row4[15];
		
			u32FlashAddress = 0;
			for(u32PageNumber=0; u32PageNumber<TEST_NUMBER; u32PageNumber++)
			{
				SpiFlashx2_ReadData(DataBuffer0, DataBuffer1, u32FlashAddress, 64);
				u32FlashAddress += 0x100;
			
			for(u32ByteCount=0; u32ByteCount<64; u32ByteCount++)
			{		
				AllTextDes[u32ByteCount] = DataBuffer0[u32ByteCount] ;
			}
			
		 //clear data buffer 
		for(u32ByteCount=0; u32ByteCount<64; u32ByteCount++)
			{
				DataBuffer0[u32ByteCount] = 0;
				DataBuffer1[u32ByteCount] = 0;
			}
			}	

		for(r1 = 0; r1< 16; r1++){
			row1[r1] = AllTextDes[r1]; 
		}
		SysTimerDelay(20000000);
		print_lcd(0,row1);
		
		for(r1 = 0; r1< 16; r1++){
			row2[r1] = AllTextDes[r1+16]; 
		}	
		SysTimerDelay(20000000);
		print_lcd(1,row2);

		for(r1 = 0; r1< 16; r1++){
			row3[r1] = AllTextDes[r1+32]; 
		}
		SysTimerDelay(20000000);
		print_lcd(2,row3);
		
		for(r1 = 0; r1< 16; r1++){
			row4[r1] = AllTextDes[r1+48]; 
		}
		SysTimerDelay(20000000);
		print_lcd(3,row4);	
	
/*
		for(r1 = 0; r1< 16; r1++){
			row1[r1] = AllTextDes[r1]; 
		}
		SysTimerDelay(20000000);
		print_lcd(0,row1);
		
		for(r2 = 0; r2< 16; r2++){
			row2[r2] = AllTextDes[r2+16]; 
		}	
		SysTimerDelay(20000000);
		print_lcd(1,row2);

		for(r3 = 0; r3< 16; r3++){
			row3[r3] = AllTextDes[r3+32]; 
		}
		SysTimerDelay(20000000);
		print_lcd(2,row3);
		
		for(r4 = 0; r4< 16; r4++){
			row4[r4] = AllTextDes[r4+48]; 
		}
		SysTimerDelay(20000000);
		print_lcd(3,row4);	

		SysTimerDelay(10000000);			
		//clear alltextdes
		for(v = 0; v < 256; v++){
			AllTextDes[v] = 0; 
		}		
	}	
	*/
}	
	
}
/*
void savedata(){
			//int s = 0;

	}	
}*/

int main(void)
{
		uint8_t number;
    /* Unlock the protected registers */	
		UNLOCKREG();
	/* Enable the 12MHz oscillator oscillation */
	DrvSYS_SetOscCtrl(E_SYS_XTL12M, 1);

	/* HCLK clock source. 0: external 12MHz; 4:internal 22MHz RC oscillator */
	DrvSYS_SelectHCLKSource(0);

	LOCKREG();

	DrvSYS_SetClockDivider(E_SYS_HCLK_DIV, 0); /* HCLK clock frequency = HCLK clock source / (HCLK_N + 1) */

	Initial_pannel();
	clr_all_pannal();
		/* GPIO init for SPI2 */
	DrvGPIO_InitFunction(E_FUNC_SPI2);
	/* GPIO init for SPI2 2-bit mode */
	DrvGPIO_InitFunction(E_FUNC_SPI2_2BIT_MODE);
	/* Configure SPI2 as a master, Type1 waveform, 32-bit transaction */
	DrvSPI_Open(eDRVSPI_PORT2, eDRVSPI_MASTER, eDRVSPI_TYPE1, 32);
	/* MSB first */
	DrvSPI_SetEndian(eDRVSPI_PORT2, eDRVSPI_MSB_FIRST);
	/* Disable the automatic slave select function of SS0. */
	DrvSPI_DisableAutoSS(eDRVSPI_PORT2);
	/* Set the active level of slave select. */
	DrvSPI_SetSlaveSelectActiveLevel(eDRVSPI_PORT2, eDRVSPI_ACTIVE_LOW_FALLING);
	/* Configure SPI2 as 2 bits transfer mode */
	DrvSPI_Set2BitTransferMode(eDRVSPI_PORT2, TRUE);				  
	/* Enable the SPI2 interrupt and install the callback function. */
	//DrvSPI_EnableInt(eDRVSPI_PORT2, SPI2_Callback, 0);
	/* SPI clock rate 1MHz */
	DrvSPI_SetClockFreq(eDRVSPI_PORT2, 1000000, 0);
				
	//DrvGPIO_Open(E_GPB, 11, E_IO_OUTPUT); // initial GPIO pin GPB11 for controlling Buzzer
	
	
	//if(strlen(AllTextDes) == 0){
		
		// External Interrupt 
		DrvGPIO_Open(E_GPB, 15, E_IO_INPUT);                             // configure external interrupt pin GPB15
		DrvGPIO_EnableEINT1(E_IO_BOTH_EDGE, E_MODE_EDGE, EINT1Callback); // configure external interrupt
		
		while(1){		
		number = scan_key();
		
		switch(number){
			case 1: 	
				SysTimerDelay(20000000);	
				insert_text('A');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 2: 
				SysTimerDelay(20000000);
				insert_text('B');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 3: 
				SysTimerDelay(20000000);
				insert_text('C');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 4:
				SysTimerDelay(20000000);
				insert_text('D');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 5:
				SysTimerDelay(20000000);
				insert_text('E');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 6:
				SysTimerDelay(20000000);
				insert_text('F');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 7:
				SysTimerDelay(20000000);
				insert_text('G');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 8:
				SysTimerDelay(20000000);
				insert_text('H');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			case 9:
				SysTimerDelay(20000000);
				insert_text('I');
				//SysTimerDelay(10000000);
				//savedata();
				break;
			default:							

						for(r1 = 0; r1 < 16; r1++){
							AllText[r1] = temp1[r1];
							AllText[r1+16] = temp2[r1];
							AllText[r1+32] = temp3[r1];
							AllText[r1+48] = temp4[r1];
						}
				break;
		}
		
	}
//	}else{
		
	}
//}

/*
void SPI2_Callback(uint32_t u32UserData)
{
	SPI2_INT_Flag = 1;
}
*/

// **************************************
// For W25Q16BV, Manufacturer ID: 0xEF; Device ID: 0x14
// For W26X16, Manufacturer ID: 0xEF; Device ID: 0x14
void SpiFlashx2_ReadMidDid(void)
{
	uint32_t au32SourceData[2];
    uint32_t au32DestinationData[2]; 	

    // configure transaction length as 8 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 8);

	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0);
	
	// send Command: 0x90, Read Manufacturer/Device ID
	au32SourceData[0] = 0x90;
	au32SourceData[1] = 0x90;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 
    	
	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// configure transaction length as 24 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 24);	

	// send 24-bit '0', dummy
	au32SourceData[0] = 0x0;
	au32SourceData[1] = 0x0;
    DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 	

	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
    
	// configure transaction length as 16 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 16);	

	// receive
	au32SourceData[0] = 0x0;
	au32SourceData[1] = 0x0;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]);
	
	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0); 	

	DrvSPI_DumpRxRegister(eDRVSPI_PORT2, &au32DestinationData[0], 2);

	if ((au32DestinationData[0] & au32DestinationData[1] & 0xffff) == 0xEF14) 
		print_lcd(3,"MID & DID=0xEF14");
	else 
		print_lcd(3,"MID & DID Error!");
	
}

// **************************************
void SpiFlashx2_ChipErase(void)
{
	
	uint32_t au32SourceData[2];

	// configure transaction length as 8 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 8); 	

	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0); 	

	// send Command: 0x06, Write enable
	au32SourceData[0] = 0x06;
	au32SourceData[1] = 0x06;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 	

	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}

	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0); 

	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0);	

	// send Command: 0xC7, Chip Erase
	au32SourceData[0] = 0xc7;
	au32SourceData[1] = 0xc7;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 	

	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}

	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0); 
}

// **************************************
uint32_t SpiFlash2_ReadStatusReg1(void)
{
    uint32_t au32SourceData[2];
    uint32_t au32DestinationData[2]; 	

	// configure transaction length as 16 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 16);
		
	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0);
	
	// send Command: 0x05, Read status register 1
	au32SourceData[0] = 0x0500;
	au32SourceData[1] = 0x0500;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 
	
	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
		
	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0);

	// dump Rx register
	DrvSPI_DumpRxRegister(eDRVSPI_PORT2, &au32DestinationData[0], 2);

    return ((au32DestinationData[0] | au32DestinationData[1]) & 0xFF);

}


// **************************************
uint32_t SpiFlash2_ReadStatusReg2(void)
{
	uint32_t au32SourceData[2];
    uint32_t au32DestinationData[2]; 	
	
	// configure transaction length as 16 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 16);
	
	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0);
	
	// send Command: 0x35, Read status register 2
	au32SourceData[0] = 0x3500;
	au32SourceData[1] = 0x3500;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 
	
	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0);

    // dump Rx register
	DrvSPI_DumpRxRegister(eDRVSPI_PORT2, &au32DestinationData[0], 2);

	return ((au32DestinationData[0] | au32DestinationData[1]) & 0xFF);
}


// **************************************
void SpiFlashx2_WaitReady(void)
{
	uint32_t ReturnValue;
	
	do{
		ReturnValue = SpiFlash2_ReadStatusReg1();
		ReturnValue = ReturnValue & 1;
	}while(ReturnValue!=0); // check the BUSY bit

}

// **************************************
void SpiFlashx2_PageProgram(uint8_t *DataBuffer, uint32_t StartAddress, uint32_t ByteCount)
{
	uint32_t au32SourceData[2];
	uint32_t Counter;

    // configure transaction length as 8 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 8);
	
	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0);
	
	// send Command: 0x06, Write enable
	au32SourceData[0] = 0x06;
	au32SourceData[1] = 0x06;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 
	
	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0);
	
	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0);
	
	// send Command: 0x02, Page program
	au32SourceData[0] = 0x02;
	au32SourceData[1] = 0x02;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 
	
	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// configure transaction length as 24 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 24);	
	
	// send 24-bit start address
	au32SourceData[0] = StartAddress;
	au32SourceData[1] = StartAddress;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]);
		
	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// configure transaction length as 8 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 8); 
	
	for(Counter=0; Counter<ByteCount; Counter++)
	{
	    // send	data to program
		au32SourceData[0] = DataBuffer[Counter];
		au32SourceData[1] = ~au32SourceData[0];
	    DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]);
		
		// wait
		while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	}
	
	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0);
	
}


// **************************************
void SpiFlashx2_ReadData(uint8_t *DataBuffer0, uint8_t *DataBuffer1, uint32_t StartAddress, uint32_t ByteCount)
{
	uint32_t au32SourceData[2];
    uint32_t au32DestinationData[2]; 	
   	uint32_t Counter;

	// configure transaction length as 8 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 8);	

	// /CS: active
	DrvSPI_SetSS(eDRVSPI_PORT2, eDRVSPI_SS0);

	// send Command: 0x03, Read data
	au32SourceData[0] = 0x03;
	au32SourceData[1] = 0x03;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 	

	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// configure transaction length as 24 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 24);	

	// send 24-bit start address
	au32SourceData[0] = StartAddress;
	au32SourceData[1] = StartAddress;
	DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]); 	

	// wait
	while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
	
	// configure transaction length as 8 bits
	DrvSPI_SetBitLength(eDRVSPI_PORT2, 8); 	

	for(Counter=0; Counter<ByteCount; Counter++)
	{
		// receive
		au32SourceData[0] = 0x0;
		au32SourceData[1] = 0x0;
		DrvSPI_BurstWrite(eDRVSPI_PORT2, &au32SourceData[0]);
		
		// wait
		while (DrvSPI_IsBusy(eDRVSPI_PORT2)) {}
		
		// dump Rx register	
		DrvSPI_DumpRxRegister(eDRVSPI_PORT2, &au32DestinationData[0], 2);
		DataBuffer0[Counter] = (uint8_t) au32DestinationData[0];
		DataBuffer1[Counter] = (uint8_t) au32DestinationData[1];
		
	}
	
	// /CS: de-active
	DrvSPI_ClrSS(eDRVSPI_PORT2, eDRVSPI_SS0); 	

}

