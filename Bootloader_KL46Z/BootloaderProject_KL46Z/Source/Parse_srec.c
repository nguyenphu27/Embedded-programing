/*---------------------------------------------------------------
 * 	Converting & parsing data recieve in Bootloader
 * 	.srec file format type S3:
 *	Type(2 byte)-Count(2 byte)-Address(8 byte)-Data(0 to 64 byte)-Checksum(2 byte)-\r-\n
 *--------------------------------------------------------------*/
 
#include <stdio.h>
#include "UART.h"
#include "MKL46Z4.h"

static uint32_t j;
static uint32_t l;		// length
static uint32_t data_l;
static uint32_t address;
static uint32_t check_sum;
static char data[15];

/**
 * @brief         PARSE
 * @param[in]     void
 * @param[in,out] void
 * @return        int
 */
 
uint32_t ConvertAndParse(char *buff, uint32_t totalchar)
{
	
	/* check end of line */
	for (j = 0; j< totalchar; j++)
	{
		if ((buff[j] >= '0') && (buff[j] <= '9'))
		{
			buff[j] -= '0';
		}
		if ((buff[j] >= 'A') && (buff[j] <= 'F'))
		{
			buff[j] -= ('A'-10);
		}
	}
	
	/* get address */
	address = (buff[4]<<28) + (buff[5]<<24) + (buff[6]<<20) + (buff[7]<<16) +
						(buff[8]<<12) + (buff[9]<<8) + (buff[10]<<4) + (buff[11]<<0);
	
	/* length of line  = Count */
	l = (buff[2]<<4) + buff[3];
	
	/* get Check sum */
	check_sum = (buff[l*2+2]<<4) + (buff[l*2+3]<<0);

	/* if S3: get data, return 0 */
	if (buff[1] == 3)
	{
		uint32_t k;
		data_l = l - 5;
		for (k = 0; k <= data_l; k++)
		{
			data[k] = (buff[2*k+12]<<4) + buff[2*k+13];
		}
		return 0;
	}	
	
	/* if S7: return 1*/
	if(buff[1] == '7'){
		return 1;
	}
	
}

/**
 * @brief         Get_CountByte
 * @param[in]     void
 * @param[in,out] void
 * @return        int
 */
uint32_t Get_CountByte()
{
	return l;
}
/**
 * @brief         Get_Address
 * @param[in]     void
 * @param[in,out] void
 * @return        int
 */
uint32_t Get_Address()
{
	return address;
}

/**
 * @brief         Get_Data
 * @param[in]     void
 * @param[in,out] void
 * @return        char
 */
char* Get_Data()
{	
	return data;
}
/**
 * @brief         Get_CheckSum
 * @param[in]     void
 * @param[in,out] void
 * @return        int
 */
uint32_t Get_CheckSum()
{
	return check_sum;
}
/*----------------------------------------------------------------------------
	CheckSum Function
 *----------------------------------------------------------------------------*/
uint32_t CheckSum()
{
	uint32_t CountByte = Get_CountByte();
	uint32_t Address = Get_Address();
	char* data = Get_Data();
	uint32_t Check_sum = Get_CheckSum();
	uint32_t Sum;
	
	Sum = CountByte;
	Sum += ((Address & 0xFF000000)>>24) + ((Address & 0x00FF0000)>>16) + ((Address & 0x0000FF00)>>8) + (Address & 0x000000FF);
	
	while(CountByte > 5)
	{
		Sum += data[CountByte - 6];
		CountByte--;
	}
	
	Sum = ~(Sum) & 0xFF;
	
	if(Sum == Check_sum){
		return 1;
	}
	else {
		return 0;
	}
}
