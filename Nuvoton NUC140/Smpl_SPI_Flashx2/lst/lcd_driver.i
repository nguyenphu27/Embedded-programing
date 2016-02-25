#line 1 "..\\..\\..\\Src\\NUC1xx-LB_002\\LCD_Driver.c"
#line 1 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"
 
 
 
 
 




              




 
 
typedef enum IRQn
{
 
  NonMaskableInt_IRQn         = -14,     
  HardFault_IRQn              = -13,     
  SVCall_IRQn                 = -5,      
  PendSV_IRQn                 = -2,      
  SysTick_IRQn                = -1,      

 
  BOD_IRQn                  = 0,
  WDT_IRQn                  = 1,
  EINT0_IRQn                = 2,
  EINT1_IRQn                = 3,
  GPAB_IRQn                 = 4,
  GPCDE_IRQn                = 5,
  PWMA_IRQn                 = 6,
  PWMB_IRQn                 = 7,
  TMR0_IRQn                 = 8,
  TMR1_IRQn                 = 9,
  TMR2_IRQn                 = 10,
  TMR3_IRQn                 = 11,
  UART0_IRQn                = 12,
  UART1_IRQn                = 13,
  SPI0_IRQn                 = 14,
  SPI1_IRQn                 = 15,
  SPI2_IRQn                 = 16,
  SPI3_IRQn                 = 17,
  I2C0_IRQn                 = 18,
  I2C1_IRQn                 = 19,
  CAN0_IRQn                 = 20,
  CAN1_IRQn                 = 21,
  SD_IRQn                   = 22,
  USBD_IRQn                 = 23,
  PS2_IRQn                  = 24,
  ACMP_IRQn                 = 25,
  PDMA_IRQn                 = 26,
  I2S_IRQn                  = 27,
  PWRWU_IRQn                = 28,
  ADC_IRQn                  = 29,
  DAC_IRQn                  = 30,
  RTC_IRQn                  = 31
} IRQn_Type;






 

 





#line 1 "..\\..\\..\\..\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"
 




















 











 








 











#line 1 "C:\\Keil_v5\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"
 
 





 







 




  
 







#line 37 "C:\\Keil_v5\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"







 

     

     
typedef   signed          char int8_t;
typedef   signed short     int int16_t;
typedef   signed           int int32_t;
typedef   signed       __int64 int64_t;

     
typedef unsigned          char uint8_t;
typedef unsigned short     int uint16_t;
typedef unsigned           int uint32_t;
typedef unsigned       __int64 uint64_t;

     

     
     
typedef   signed          char int_least8_t;
typedef   signed short     int int_least16_t;
typedef   signed           int int_least32_t;
typedef   signed       __int64 int_least64_t;

     
typedef unsigned          char uint_least8_t;
typedef unsigned short     int uint_least16_t;
typedef unsigned           int uint_least32_t;
typedef unsigned       __int64 uint_least64_t;

     

     
typedef   signed           int int_fast8_t;
typedef   signed           int int_fast16_t;
typedef   signed           int int_fast32_t;
typedef   signed       __int64 int_fast64_t;

     
typedef unsigned           int uint_fast8_t;
typedef unsigned           int uint_fast16_t;
typedef unsigned           int uint_fast32_t;
typedef unsigned       __int64 uint_fast64_t;

     
typedef   signed           int intptr_t;
typedef unsigned           int uintptr_t;

     
typedef   signed       __int64 intmax_t;
typedef unsigned       __int64 uintmax_t;




     

     





     





     





     

     





     





     





     

     





     





     





     

     


     


     


     

     


     


     


     

     



     



     


     
    
 



#line 208 "C:\\Keil_v5\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"

     







     










     











#line 272 "C:\\Keil_v5\\ARM\\ARMCC\\bin\\..\\include\\stdint.h"



 



#line 56 "..\\..\\..\\..\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"

















 

#line 82 "..\\..\\..\\..\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"





 


 





 
typedef struct
{
  volatile uint32_t ISER[1];                       
       uint32_t RESERVED0[31];
  volatile uint32_t ICER[1];                       
       uint32_t RSERVED1[31];
  volatile uint32_t ISPR[1];                       
       uint32_t RESERVED2[31];
  volatile uint32_t ICPR[1];                       
       uint32_t RESERVED3[31];
       uint32_t RESERVED4[64];
  volatile uint32_t IPR[8];                        
}  NVIC_Type;
   





 
typedef struct
{
  volatile const  uint32_t CPUID;                         
  volatile uint32_t ICSR;                          
       uint32_t RESERVED0;                                      
  volatile uint32_t AIRCR;                         
  volatile uint32_t SCR;                           
  volatile uint32_t CCR;                           
       uint32_t RESERVED1;                                      
  volatile uint32_t SHP[2];                        
  volatile uint32_t SHCSR;                         
       uint32_t RESERVED2[2];                                   
  volatile uint32_t DFSR;                          
} SCB_Type;                                                

 















 



























 















 









 






 



 














   





 
typedef struct
{
  volatile uint32_t CTRL;                          
  volatile uint32_t LOAD;                          
  volatile uint32_t VAL;                           
  volatile const  uint32_t CALIB;                         
} SysTick_Type;

 












 



 



 








   





 
typedef struct
{
  volatile uint32_t DHCSR;                         
  volatile  uint32_t DCRSR;                         
  volatile uint32_t DCRDR;                         
  volatile uint32_t DEMCR;                         
} CoreDebug_Type;

 

































 






 








   


 











   




 





#line 377 "..\\..\\..\\..\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"


 


 




#line 395 "..\\..\\..\\..\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"


 
 








 
extern uint32_t __get_PSP(void);








 
extern void __set_PSP(uint32_t topOfProcStack);








 
extern uint32_t __get_MSP(void);








 
extern void __set_MSP(uint32_t topOfMainStack);








 
extern uint32_t __REV16(uint16_t value);








 
extern int32_t __REVSH(int16_t value);


#line 500 "..\\..\\..\\..\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"








 
static __inline uint32_t __get_PRIMASK(void)
{
  register uint32_t __regPriMask         __asm("primask");
  return(__regPriMask);
}







 
static __inline void __set_PRIMASK(uint32_t priMask)
{
  register uint32_t __regPriMask         __asm("primask");
  __regPriMask = (priMask);
}







 
static __inline uint32_t __get_CONTROL(void)
{
  register uint32_t __regControl         __asm("control");
  return(__regControl);
}







 
static __inline void __set_CONTROL(uint32_t control)
{
  register uint32_t __regControl         __asm("control");
  __regControl = control;
}





#line 770 "..\\..\\..\\..\\CMSIS\\CM0\\CoreSupport\\core_cm0.h"







 
 

 

 
 












 
static __inline void NVIC_EnableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_DisableIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICER[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}









 
static __inline uint32_t NVIC_GetPendingIRQ(IRQn_Type IRQn)
{
  return((uint32_t) ((((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[0] & (1 << ((uint32_t)(IRQn) & 0x1F)))?1:0));  
}








 
static __inline void NVIC_SetPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ISPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}








 
static __inline void NVIC_ClearPendingIRQ(IRQn_Type IRQn)
{
  ((NVIC_Type *) ((0xE000E000) + 0x0100))->ICPR[0] = (1 << ((uint32_t)(IRQn) & 0x1F));  
}












 
static __inline void NVIC_SetPriority(IRQn_Type IRQn, uint32_t priority)
{
  if(IRQn < 0) {
    ((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] = (((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) | 
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
  else {
    ((NVIC_Type *) ((0xE000E000) + 0x0100))->IPR[( ((uint32_t)(IRQn) >> 2) )] = (((NVIC_Type *) ((0xE000E000) + 0x0100))->IPR[( ((uint32_t)(IRQn) >> 2) )] & ~(0xFF << ( (((uint32_t)(IRQn) ) & 0x03) * 8 ))) |
        (((priority << (8 - 2)) & 0xFF) << ( (((uint32_t)(IRQn) ) & 0x03) * 8 )); }
}















 
static __inline uint32_t NVIC_GetPriority(IRQn_Type IRQn)
{

  if(IRQn < 0) {
    return((uint32_t)((((SCB_Type *) ((0xE000E000) + 0x0D00))->SHP[( ((((uint32_t)(IRQn) & 0x0F)-8) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
  else {
    return((uint32_t)((((NVIC_Type *) ((0xE000E000) + 0x0100))->IPR[( ((uint32_t)(IRQn) >> 2) )] >> ( (((uint32_t)(IRQn) ) & 0x03) * 8 ) ) >> (8 - 2)));  }  
}



 












 
static __inline uint32_t SysTick_Config(uint32_t ticks)
{ 
  if (ticks > (0xFFFFFFul << 0))  return (1);             
                                                               
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD  = (ticks & (0xFFFFFFul << 0)) - 1;       
  NVIC_SetPriority (SysTick_IRQn, (1<<2) - 1);   
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   = 0;                                           
  ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL  = (1ul << 2) | 
                   (1ul << 1)   | 
                   (1ul << 0);                     
  return (0);                                                   
}






 





 
static __inline void NVIC_SystemReset(void)
{
  ((SCB_Type *) ((0xE000E000) + 0x0D00))->AIRCR  = ((0x5FA << 16)      | 
                 (1ul << 2));
  __dsb(0);                                                                                            
  while(1);                                                                             
}

   





   



 
#line 75 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"
#line 1 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\system_NUC1xx.h"
 
 
 
 
 






 
 
 



   




 






extern uint32_t SystemCoreClock;                    
extern uint32_t CyclesPerUs;                        









 
extern void SystemInit(void);










 
extern void SystemCoreClockUpdate (void);





#line 76 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"
#line 1 "..\\..\\..\\Include\\System\\SysInfra.h"
 
 
 
 
 





 
 
 
#line 1 "..\\..\\..\\Include\\System\\ModuleID.h"
 
 
 
 
 





typedef enum
{
	 
	
	 
	MODULE_ID_DRVPROTECT		= 0,		 

	MODULE_ID_DRVADC			= 2,		 
	MODULE_ID_DRVAIC			= 4,		 
	MODULE_ID_DRVAPU			= 6,		 
	MODULE_ID_DRVAUDIOADC		= 8,		 
	MODULE_ID_DRVCACHE			= 10,		 
	MODULE_ID_DRVCAN			= 11,		 
	MODULE_ID_DRVEBI			= 12,		 
	MODULE_ID_DRVEDMA			= 13,		 
	MODULE_ID_DRVGDMA			= 14,		 
	MODULE_ID_DRVFSC			= 15,		 
	MODULE_ID_DRVGE				= 16,		 
	MODULE_ID_DRVFMC			= 17,		 
	MODULE_ID_DRVGPIO			= 18,		 
	
	MODULE_ID_DRVGPU			= 20,		 
	MODULE_ID_DRVI2C			= 22,		 
	MODULE_ID_DRVI2S			= 24,		 
	MODULE_ID_DRVI2SM			= 26,		 
	MODULE_ID_DRVMPU			= 28,		 
	MODULE_ID_DRVNAND			= 30,		 
	MODULE_ID_DRVNOR			= 32,		 
	MODULE_ID_DRVPDMA     		= 33,        
	MODULE_ID_DRVPWM			= 34,		 
	MODULE_ID_DRVPS2			= 35,		 
	MODULE_ID_DRVRTC			= 36,		 
	MODULE_ID_DRVSDCARD			= 38,		 
	MODULE_ID_DRVSIO			= 39,		 

	MODULE_ID_DRVSPI			= 40,		 
	MODULE_ID_DRVSPIMS			= 41,		 
	MODULE_ID_DRVSPIFLASH		= 42,		 
	MODULE_ID_DRVSPIM			= 43,		 
	MODULE_ID_DRVSYS			= 44,		 
	MODULE_ID_DRVSPU			= 45,		 
	MODULE_ID_DRVTIMER			= 46,		 
	MODULE_ID_DRVUART			= 48,		 
	MODULE_ID_DRVUSB			= 50,		 
	MODULE_ID_DRVUSBH			= 52,		 
	MODULE_ID_DRVVDMA			= 54,		 
	MODULE_ID_DRVVIDEOIN		= 56,		 
	MODULE_ID_DRVVPOST			= 58,		 

	MODULE_ID_DRVVRAM			= 60,		 
	MODULE_ID_DRVW55U02			= 62,		 
	MODULE_ID_DRVI2CH			= 64,		 
	MODULE_ID_DRVWDT			= 66,		 
	MODULE_ID_DRVJPEG			= 68,		 
	
	MODULE_ID_DRVZEROG			= 70,		 
	MODULE_ID_DRVSI2C			= 71,		 

	 
	MODULE_ID_AEC				= 81,		 
	MODULE_ID_BEATDET			= 82,		 
	MODULE_ID_SNDEFF			= 83,		 
	MODULE_ID_AUDIOSYN			= 84,		 
	MODULE_ID_G726ADPCM			= 85,		 
	MODULE_ID_IMAADPCM			= 86,		 
	MODULE_ID_MP3DEC			= 88,		 
	MODULE_ID_PITCHCHANGE		= 90,		 
	MODULE_ID_WAVFILEUTIL		= 92,		 
	MODULE_ID_WMADEC			= 96,		 
	MODULE_ID_WMADECDRM			= 98,		 
	MODULE_ID_AUDIOCTRL			= 100,		 
	MODULE_ID_EQ				= 106,		 
	MODULE_ID_OGGDEC			= 110,		 
	MODULE_ID_MP3ENC			= 112,		 
	MODULE_ID_UADEC				= 114,		 
	MODULE_ID_ULSPEECHDEC		= 115,		 
	MODULE_ID_USPEECHDEC		= 116,		 
	MODULE_ID_SPEECHRECOG		= 118,		 

	 
	MODULE_ID_FS				= 120,		 
	
	 
	MODULE_ID_FL				= 128,		 
	
	 
	MODULE_ID_KEYPAD			= 130,		 
	MODULE_ID_LWIP				= 132,		 
	MODULE_ID_WLANMGR			= 134,		 
	MODULE_ID_HTTPD				= 136,		 
	MODULE_ID_VIRTUALCOM		= 139,		 

	 
	MODULE_ID_GFXRESLDR			= 140,		 
	MODULE_ID_GFXLIB			= 141,		 
	MODULE_ID_IMGPROC			= 142,		 
	MODULE_ID_JPEG				= 144,		 
	MODULE_ID_PNGDEC			= 146,		 
	MODULE_ID_BARCODE2D			= 148,		 	 
	MODULE_ID_PTNRECOG			= 150,		 
	MODULE_ID_MOTIONDET			= 152,		 
	
	 
	MODULE_ID_STORIF			= 160,		 
	MODULE_ID_SDCARD			= 161,		 
	MODULE_ID_SYSNAND			= 162,		 
	MODULE_ID_SPIFLASH			= 163,		 
	MODULE_ID_WTRIF				= 164,		 
	MODULE_ID_NORFLASH			= 165,		 
	MODULE_ID_SYSNANDLITE		= 166,		 
	
	 
	MODULE_ID_INTMGR			= 180,		 
	MODULE_ID_BLKLDR			= 181,		 
	MODULE_ID_MEMMGR			= 182,		 
	MODULE_ID_EVTMGR			= 183,		 
	MODULE_ID_PROF				= 184,		 
	MODULE_ID_PROGLDR			= 186,		 
	MODULE_ID_SYSINFRA			= 188,		 
	MODULE_ID_TIMERCTRL			= 190,		 
	MODULE_ID_TIMEUTIL			= 192,		 
	MODULE_ID_CONPROGLDR		= 194,		 
	
	 
	MODULE_ID_USBCOREH			= 78,		 
	MODULE_ID_HID				= 220,		 
	MODULE_ID_MASSSTOR			= 222,		 
	MODULE_ID_MASSSTORHID		= 224,		 
	MODULE_ID_MASSSTORLITE		= 226,		 
	MODULE_ID_MTP				= 230,		 
	MODULE_ID_USBINFRA			= 232,		 
	MODULE_ID_UAC				= 234,		 
	MODULE_ID_UAVC				= 236,		 
	MODULE_ID_UVC				= 238,		 
	MODULE_ID_MASSSTORH			= 252,		 
	MODULE_ID_HIDH				= 254,		 
	MODULE_ID_VCOM				= 253,		 

	 
	MODULE_ID_MSDRMPD			= 228,		 
	
	 
	MODULE_ID_AVICODEC			= 240,		 
	MODULE_ID_MJPEG				= 242,		 
	MODULE_ID_WIVICORE			= 244,		 
	MODULE_ID_WIVI				= 246,		 	
	MODULE_ID_AVCTRL			= 248,		 
	MODULE_ID_AVIUTIL			= 250,		 
	
	 
	MODULE_ID_WTCHAN			= 168,		 
	MODULE_ID_WTCMDSERV			= 170,		 
	MODULE_ID_WTDISPLAY			= 172,		 
	MODULE_ID_WTMEDIA			= 174,		 
	MODULE_ID_WTSYS				= 176,		 
	MODULE_ID_WTTRANS			= 178,		 
	
	
} E_SYSINFRA_MODULE_ID;


#line 15 "..\\..\\..\\Include\\System\\SysInfra.h"
#line 16 "..\\..\\..\\Include\\System\\SysInfra.h"
#line 17 "..\\..\\..\\Include\\System\\SysInfra.h"






 
 
 





 
 
 
 



 



 

 

 


 






 
 
 
 
















#line 77 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"


#pragma anon_unions


 
 
 

 
typedef struct
{
    volatile uint32_t PMD0:2;
    volatile uint32_t PMD1:2;
    volatile uint32_t PMD2:2;
    volatile uint32_t PMD3:2;
    volatile uint32_t PMD4:2;
    volatile uint32_t PMD5:2;
    volatile uint32_t PMD6:2;
    volatile uint32_t PMD7:2;
    volatile uint32_t PMD8:2;
    volatile uint32_t PMD9:2;
    volatile uint32_t PMD10:2;
    volatile uint32_t PMD11:2;
    volatile uint32_t PMD12:2;
    volatile uint32_t PMD13:2;
    volatile uint32_t PMD14:2;
    volatile uint32_t PMD15:2;
} GPIO_PMD_T;

typedef volatile uint32_t GPIO_OFFD_T;

typedef volatile uint32_t GPIO_DOUT_T;

typedef volatile uint32_t GPIO_DMASK_T;

typedef volatile uint32_t GPIO_PIN_T;

typedef volatile uint32_t GPIO_DBEN_T;

typedef volatile uint32_t GPIO_IMD_T;

typedef volatile uint32_t GPIO_IEN_T;

typedef volatile uint32_t GPIO_ISRC_T;

typedef struct
{
    union {
        volatile uint32_t u32PMD;
        struct {
            volatile uint32_t PMD0:2;
            volatile uint32_t PMD1:2;
            volatile uint32_t PMD2:2;
            volatile uint32_t PMD3:2;
            volatile uint32_t PMD4:2;
            volatile uint32_t PMD5:2;
            volatile uint32_t PMD6:2;
            volatile uint32_t PMD7:2;
            volatile uint32_t PMD8:2;
            volatile uint32_t PMD9:2;
            volatile uint32_t PMD10:2;
            volatile uint32_t PMD11:2;
            volatile uint32_t PMD12:2;
            volatile uint32_t PMD13:2;
            volatile uint32_t PMD14:2;
            volatile uint32_t PMD15:2;
        } PMD;
    };

    union {
        volatile uint32_t u32OFFD;
        volatile uint32_t OFFD;
    };

    union {
        volatile uint32_t u32DOUT;
        volatile uint32_t DOUT;
    };

    union {
        volatile uint32_t u32DMASK;
        volatile uint32_t DMASK;
    };

    union {
        volatile uint32_t u32PIN;
        volatile uint32_t PIN;
    };

    union {
        volatile uint32_t u32DBEN;
        volatile uint32_t DBEN;
    };

    union {
        volatile uint32_t u32IMD;
        volatile uint32_t IMD;
    };

    union {
        volatile uint32_t u32IEN;
        volatile uint32_t IEN;
    };

    union {
        volatile uint32_t u32ISRC;
        volatile uint32_t ISRC;
    };
} GPIO_T;

typedef struct
{
    union {
        volatile uint32_t u32DBNCECON;
        struct {
            volatile uint32_t   DBCLKSEL:4;
            volatile uint32_t   DBCLKSRC:1;
            volatile uint32_t   ICLK_ON:1;
            volatile const  uint32_t   RESERVE:26;    
        } DBNCECON;
    };
} GPIO_DBNCECON_T;

 
















































 



 



 



 



 



 



 






 



 









 



 

typedef volatile uint32_t UART_DATA_T;


typedef struct
{
    volatile uint32_t  RDA_IEN:1;
    volatile uint32_t  THRE_IEN:1;
    volatile uint32_t  RLS_IEN:1;
    volatile uint32_t  MODEM_IEN:1;
    volatile uint32_t  RTO_IEN:1;     
    volatile uint32_t  BUF_ERR_IEN:1;
    volatile uint32_t  WAKE_EN:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  LIN_RX_BRK_IEN:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  TIME_OUT_EN:1;       
    volatile uint32_t  AUTO_RTS_EN:1;
    volatile uint32_t  AUTO_CTS_EN:1;
    volatile uint32_t  DMA_TX_EN:1;
    volatile uint32_t  DMA_RX_EN:1;
    volatile const  uint32_t  RESERVE2:16;    
    
} UART_IER_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  RFR:1;
    volatile uint32_t  TFR:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  RFITL:4;              
    volatile uint32_t  RX_DIS:1;
    volatile const  uint32_t  RESERVE2:7;
    volatile uint32_t  RTS_TRI_LEV:4;
    volatile const  uint32_t  RESERVE3:12;
} UART_FCR_T;

typedef struct
{
    volatile uint32_t  WLS:2;                
    volatile uint32_t  NSB:1;                
    volatile uint32_t  PBE:1;                
    volatile uint32_t  EPE:1;                
    volatile uint32_t  SPE:1;                
    volatile uint32_t  BCB:1;                
    volatile const  uint32_t  RESERVE:25;
} UART_LCR_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  RTS:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  LBME:1;
    volatile const  uint32_t  RESERVE2:4;
    volatile uint32_t  LEV_RTS:1;
    volatile const  uint32_t  RESERVE3:3;
    volatile const  uint32_t  RTS_ST:1;                
    volatile const  uint32_t  RESERVE4:18;
} UART_MCR_T;

typedef struct
{
    volatile uint32_t  DCTSF:1;
    volatile const  uint32_t  RESERVE0:3;
    volatile const  uint32_t  CTS_ST:1;                
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  LEV_CTS:1;
    volatile const  uint32_t  RESERVE2:23;
} UART_MSR_T;

typedef struct
{
    volatile uint32_t  RX_OVER_IF:1;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  RS485_ADD_DETF:1;
    volatile uint32_t  PEF:1;
    volatile uint32_t  FEF:1;
    volatile uint32_t  BIF:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile const  uint32_t  RX_POINTER:6;
    volatile const  uint32_t  RX_EMPTY:1;
    volatile const  uint32_t  RX_FULL:1;
    volatile const  uint32_t  TX_POINTER:6;
    volatile const  uint32_t  TX_EMPTY:1;
    volatile const  uint32_t  TX_FULL:1;
    volatile uint32_t  TX_OVER_IF:1;
    volatile const  uint32_t  RESERVE2:3;
    volatile const  uint32_t  TE_FLAG:1;                 
    volatile const  uint32_t  RESERVE3:3;
} UART_FSR_T;

typedef struct
{
    volatile uint32_t  RDA_IF:1;
    volatile uint32_t  THRE_IF:1;
    volatile uint32_t  RLS_IF:1;
    volatile uint32_t  MODEM_IF:1;
    volatile uint32_t  TOUT_IF:1;
    volatile uint32_t  BUF_ERR_IF:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  LIN_RX_BREAK_IF:1;

    volatile uint32_t  RDA_INT:1;
    volatile uint32_t  THRE_INT:1;
    volatile uint32_t  RLS_INT:1;
    volatile uint32_t  MODEM_INT:1;
    volatile uint32_t  TOUT_INT:1;
    volatile uint32_t  BUF_ERR_INT:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  LIN_RX_BREAK_INT:1;

    volatile const  uint32_t  RESERVE2:2;
    volatile uint32_t  HW_RLS_IF:1;
    volatile uint32_t  HW_MODEM_IF:1;
    volatile uint32_t  HW_TOUT_IF:1;
    volatile uint32_t  HW_BUF_ERR_IF:1;
    volatile uint32_t  RESERVE3:1;
    volatile uint32_t  HW_LIN_RX_BREAK_IF:1;

    volatile const  uint32_t  RESERVE4:2;
    volatile uint32_t  HW_RLS_INT:1;
    volatile uint32_t  HW_MODEM_INT:1;
    volatile uint32_t  HW_TOUT_INT:1;
    volatile uint32_t  HW_BUF_ERR_INT:1;
    volatile uint32_t  RESERVE5:1;
    volatile uint32_t  HW_LIN_RX_BREAK_INT:1;
} UART_ISR_T;

typedef struct
{
    volatile uint32_t  TOIC:7;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  DLY:8;
    volatile const  uint32_t  RESERVE1:16;

} UART_TOR_T;

typedef struct
{
    volatile uint32_t  BRD:16;
    volatile const  uint32_t  RESERVE0:8;
    volatile uint32_t  DIVIDER_X:4;
    volatile uint32_t  DIV_X_ONE:1;            
    volatile uint32_t  DIV_X_EN:1;            
    volatile const  uint32_t  RESERVE1:2;
} UART_BAUD_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  TX_SELECT:1;
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  INV_TX:1;            
    volatile uint32_t  INV_RX:1;
    volatile const  uint32_t  RESERVE2:25;
} UART_IRCR_T;

typedef struct
{
    volatile uint32_t  LIN_BKFL:4;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  LIN_RX_EN:1;
    volatile uint32_t  LIN_TX_EN:1;            
    volatile uint32_t  RS485_NMM:1;
    volatile uint32_t  RS485_AAD:1;
    volatile uint32_t  RS485_AUD:1;
    volatile const  uint32_t  RESERVE1:4;
    volatile uint32_t  RS485_ADD_EN:1;
    volatile const  uint32_t  RESERVE2:8;
    volatile uint32_t  ADDR_MATCH:8;
} UART_ALTCON_T;



typedef struct
{
    volatile uint32_t  FUN_SEL:2;
    volatile const  uint32_t  RESERVE0:30;

} UART_FUNSEL_T;


typedef struct
{
    
    union {
        volatile uint32_t u32DATA;
        volatile uint32_t DATA;
    };
    union {
        volatile uint32_t u32IER;
        struct {
            volatile uint32_t  RDA_IEN:1;
            volatile uint32_t  THRE_IEN:1;
            volatile uint32_t  RLS_IEN:1;
            volatile uint32_t  MODEM_IEN:1;
            volatile uint32_t  RTO_IEN:1;          
            volatile uint32_t  BUF_ERR_IEN:1;        
            volatile uint32_t  WAKE_EN:1;
            volatile const  uint32_t  RESERVE0:1; 
            volatile uint32_t  LIN_RX_BRK_IEN:1;
            volatile const  uint32_t  RESERVE1:2;
            volatile uint32_t  TIME_OUT_EN:1;
            volatile uint32_t  AUTO_RTS_EN:1;
            volatile uint32_t  AUTO_CTS_EN:1;
            volatile uint32_t  DMA_TX_EN:1;
            volatile uint32_t  DMA_RX_EN:1;
            volatile const  uint32_t  RESERVE2:16;
        } IER;
    };

    union {
        volatile uint32_t u32FCR;
        struct {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  RFR:1;
            volatile uint32_t  TFR:1;
            volatile uint32_t  RESERVE1:1;
            volatile uint32_t  RFITL:4;          
            volatile uint32_t  RX_DIS:1; 
            volatile const  uint32_t  RESERVE2 :7;
            volatile uint32_t  RTS_TRI_LEV:4;
            volatile const  uint32_t  RESERVE3 :4;
        } FCR;
    };

    union {
        volatile uint32_t u32LCR;
        struct {
            volatile uint32_t  WLS:2;
            volatile uint32_t  NSB:1;
            volatile uint32_t  PBE:1;
            volatile uint32_t  EPE:1;
            volatile uint32_t  SPE:1;          
            volatile uint32_t  BCB:1; 
            volatile const  uint32_t  RESERVE :25;
        } LCR;
    };

    union {
        volatile uint32_t u32MCR;
        struct {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  RTS:1;
            volatile const  uint32_t  RESERVE1:7;
            volatile uint32_t  LEV_RTS:1;
            volatile const  uint32_t  RESERVE2:3;          
            volatile uint32_t  RTS_ST:1; 
            volatile const  uint32_t  RESERVE3:18;
        } MCR;
    };


    union {
        volatile uint32_t u32MSR;
        struct {
            volatile uint32_t  DCTSF:1;
            volatile const  uint32_t  RESERVE0:3;
            volatile uint32_t  CTS_ST:1;
            volatile const  uint32_t  RESERVE1:3;
            volatile uint32_t  LEV_CTS:1;          
            volatile const  uint32_t  RESERVE2:23;
        } MSR;
    };


    union {
        volatile uint32_t u32FSR;
        struct {
            volatile uint32_t  RX_OVER_IF:1;
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  RS485_ADD_DETF:1;
            volatile uint32_t  PEF:1;
            volatile uint32_t  FEF:1;
            volatile uint32_t  BIF:1;
            volatile const  uint32_t  RESERVE1:1;
            volatile uint32_t  RX_POINTER:6;
            volatile uint32_t  RX_EMPTY:1;
            volatile uint32_t  RX_FULL:1;
            volatile uint32_t  TX_POINTER:6;
            volatile uint32_t  TX_EMPTY:1;
            volatile uint32_t  TX_FULL:1;
            volatile uint32_t  TX_OVER_IF:1;
            volatile const  uint32_t  RESERVE2:3;
            volatile uint32_t  TE_FLAG:1;
            volatile const  uint32_t  RESERVE3:3;
        } FSR;
    };

    union {
        volatile uint32_t u32ISR;
        struct {
            volatile uint32_t  RDA_IF:1;
            volatile uint32_t  THRE_IF:1;
            volatile uint32_t  RLS_IF:1;
            volatile uint32_t  MODEM_IF:1;
            volatile uint32_t  TOUT_IF:1;
            volatile uint32_t  BUF_ERR_IF:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  LIN_RX_BREAK_IF:1;
            volatile uint32_t  RDA_INT:1;
            volatile uint32_t  THRE_INT:1;
            volatile uint32_t  RLS_INT:1;
            volatile uint32_t  MODEM_INT:1;
            volatile uint32_t  TOUT_INT:1;
            volatile uint32_t  BUF_ERR_INT:1;
            volatile const  uint32_t  RESERVE1:1;
            volatile uint32_t  LIN_RX_BREAK_INT:1;
            volatile const  uint32_t  RESERVE2:2;
            volatile uint32_t  HW_RLS_IF:1;
            volatile uint32_t  HW_MODEM_IF:1;
            volatile uint32_t  HW_TOUT_IF:1;
            volatile uint32_t  HW_BUF_ERR_IF:1;
            volatile const  uint32_t  RESERVE3:1;
            volatile uint32_t  HW_LIN_RX_BREAK_IF:1;
            volatile const  uint32_t  RESERVE4:2;
            volatile uint32_t  HW_RLS_INT:1;
            volatile uint32_t  HW_MODEM_INT:1;
            volatile uint32_t  HW_TOUT_INT:1;
            volatile uint32_t  HW_BUF_ERR_INT:1;
            volatile const  uint32_t  RESERVE5:1;
            volatile uint32_t  HW_LIN_RX_BREAK_INT:1;

        } ISR;
    };

    union {
        volatile uint32_t u32TOR;
        struct {
            volatile uint32_t  TOIC:8;
            volatile uint32_t  DLY:8;
            volatile const  uint32_t  RESERVE1:16;
        } TOR;
    };

    union {
        volatile uint32_t u32BAUD;
        struct {
            volatile uint32_t  BRD:16;
            volatile const  uint32_t  RESERVE0:8;
            volatile uint32_t  DIVIDER_X:4;
            volatile uint32_t  DIV_X_ONE:1;
            volatile uint32_t  DIV_X_EN:1;
            volatile const  uint32_t  RESERVE1:2;
        } BAUD;
    };

    union {
        volatile uint32_t u32IRCR;
        struct {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  TX_SELECT:1;
            volatile const  uint32_t  RESERVE1:3;
            volatile uint32_t  INV_TX:1;
            volatile uint32_t  INV_RX:1;
            volatile const  uint32_t  RESERVE2:25;
        } IRCR;
    };

    union {
        volatile uint32_t u32ALTCON;
        struct {
            volatile uint32_t  LIN_BKFL:4;
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  LIN_RX_EN:1;
            volatile uint32_t  LIN_TX_EN:1;
            volatile uint32_t  RS485_NMM:1;
            volatile uint32_t  RS485_AAD:1;
            volatile uint32_t  RS485_AUD:1;
            volatile const  uint32_t  RESERVE1:4;
            volatile uint32_t  RS485_ADD_EN :1;
            volatile const  uint32_t  RESERVE2 :8;
            volatile uint32_t  ADDR_MATCH :8;
        } ALTCON;
    };


    union {
        volatile uint32_t u32FUNSEL;
        struct {
            volatile uint32_t  FUN_SEL:2;
            volatile const  uint32_t  RESERVE0:30;
        } FUNSEL;
    };
} UART_T;




 



 



 







































 















 


















 










 










 







































 









































































 






 












 









 
























 




 
typedef struct
{
    volatile uint32_t  PRESCALE:8;
    volatile const  uint32_t  RESERVE0:8;
    volatile uint32_t  TDR_EN:1;
    volatile const  uint32_t  RESERVE1:7;
    volatile uint32_t  CTB:1;          
    volatile uint32_t  CACT:1;        
    volatile uint32_t  CRST:1;
    volatile uint32_t  MODE:2;
    volatile uint32_t  IE:1;
    volatile uint32_t  CEN:1;
    volatile uint32_t  DBGACK_TMR:1;
} TIMER_TCSR_T;

typedef volatile uint32_t TIMER_TCMPR_T;

typedef struct
{
    volatile uint32_t  TIF:1;
    volatile const  uint32_t  RESERVE:31;
} TIMER_TISR_T;

typedef volatile uint32_t TIMER_TDR_T;

typedef volatile uint32_t TIMER_TCAP_T;

typedef struct
{
    volatile uint32_t  TX_PHASE:1;
    volatile uint32_t  TEX_EDGE:2;
    volatile uint32_t  TEXEN:1;
    volatile uint32_t  RSTCAPSEL:1;
    volatile uint32_t  TEXIEN:1;
    volatile uint32_t  TEXDB:1;
    volatile uint32_t  TCDB:1;
    volatile const  uint32_t  RESERVE:24;
} TIMER_TEXCON_T;

typedef struct
{
    volatile uint32_t  TEXIF:1;
    volatile const  uint32_t  RESERVE:31;
} TIMER_TEXISR;

typedef struct
{
    union {
        volatile uint32_t u32TCSR;
        struct {
            volatile uint32_t  PRESCALE:8;
            volatile const  uint32_t  RESERVE0:8;
            volatile uint32_t  TDR_EN:1;
            volatile const  uint32_t  RESERVE1:7;
            volatile uint32_t  CTB:1;          
            volatile uint32_t  CACT:1;        
            volatile uint32_t  CRST:1;
            volatile uint32_t  MODE:2;
            volatile uint32_t  IE:1;
            volatile uint32_t  CEN:1;
            volatile uint32_t  DBGACK_TMR:1;
        } TCSR;
    };

    union {
        volatile uint32_t u32TCMPR;
        volatile uint32_t TCMPR;
    };

    union {
        volatile uint32_t u32TISR;
        struct {
            volatile uint32_t  TIF:1;
            volatile const  uint32_t  RESERVE:31;
        } TISR;
    };

    union {
        volatile uint32_t u32TDR;
        volatile uint32_t TDR;
    };

    union {
        volatile uint32_t u32TCAP;
        volatile uint32_t TCAP;
    };

    union {
        volatile uint32_t u32TEXCON;
        struct {
            volatile uint32_t  TX_PHASE:1;
            volatile uint32_t  TEX_EDGE:2;
            volatile uint32_t  TEXEN:1;
            volatile uint32_t  RSTCAPSEL:1;
            volatile uint32_t  TEXIEN:1;
            volatile uint32_t  TEXDB:1;
            volatile uint32_t  TCDB:1;
            volatile const  uint32_t  RESERVE:24;
        } TEXCON;
    };

    union {
        volatile uint32_t u32TEXISR;
        struct {
            volatile uint32_t  TEXIF:1;
            volatile const  uint32_t  RESERVE:31;
        } TEXISR;
    };
} TIMER_T;

 



























 



 



 



 



 





















 




 
typedef struct
{
    volatile uint32_t  WTR:1;
    volatile uint32_t  WTRE:1;
    volatile uint32_t  WTRF:1;
    volatile uint32_t  WTIF:1;
    volatile uint32_t  WTWKE:1;
    volatile uint32_t  WTWKF:1;
    volatile uint32_t  WTIE:1;
    volatile uint32_t  WTE:1;
    volatile uint32_t  WTIS:3;
    volatile const  uint32_t  RESERVE1:20;
    volatile uint32_t  DBGACK_WDT:1;
} WDT_WTCR_T;

typedef struct
{
    union {
        volatile uint32_t u32WTCR;
        struct {
            volatile uint32_t  WTR:1;
            volatile uint32_t  WTRE:1;
            volatile uint32_t  WTRF:1;
            volatile uint32_t  WTIF:1;
            volatile uint32_t  WTWKE:1;
            volatile uint32_t  WTWKF:1;
            volatile uint32_t  WTIE:1;
            volatile uint32_t  WTE:1;
            volatile uint32_t  WTIS:3;
            volatile const  uint32_t  RESERVE1:20;
            volatile uint32_t  DBGACK_WDT:1;
        } WTCR;
    };
} WDT_T;

 































 
typedef struct
{
    volatile uint32_t  GO_BUSY:1;
    volatile uint32_t  RX_NEG:1;
    volatile uint32_t  TX_NEG:1;
    volatile uint32_t  TX_BIT_LEN:5;
    volatile uint32_t  TX_NUM:2;
    volatile uint32_t  LSB:1;
    volatile uint32_t  CLKP:1;
    volatile uint32_t  SP_CYCLE:4;
    volatile uint32_t  IF:1;
    volatile uint32_t  IE:1;
    volatile uint32_t  SLAVE:1;
    volatile uint32_t  REORDER:2;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  TWOB:1;
    volatile uint32_t  VARCLK_EN:1;
    volatile const  uint32_t  RESERVE1:8;
} SPI_CNTRL_T;

typedef struct
{
    volatile uint32_t  DIVIDER:16;
    volatile uint32_t  DIVIDER2:16;
} SPI_DIVIDER_T;

typedef struct
{
    volatile uint32_t  SSR:2;
    volatile uint32_t  SS_LVL:1;
    volatile uint32_t  AUTOSS:1;
    volatile uint32_t  SS_LTRIG:1;
    volatile const  uint32_t  LTRIG_FLAG:1;
    volatile const  uint32_t  RESERVE:26;
} SPI_SSR_T;


typedef volatile const  uint32_t   SPI_RX_T;
typedef volatile  uint32_t   SPI_TX_T;
typedef volatile uint32_t   SPI_VARCLK_T;

typedef struct
{
    volatile uint32_t  TX_DMA_GO:1;
    volatile uint32_t  RX_DMA_GO:1;
    volatile const  uint32_t  RESERVE:30;
} SPI_DMA_T;

typedef struct
{
    volatile uint32_t  DIV_ONE:1;
    volatile const  uint32_t  RESERVE0:7;
    volatile uint32_t  NOSLVSEL:1;
    volatile uint32_t  SLV_ABORT:1;
    volatile uint32_t  SSTA_INTEN:1;
    volatile uint32_t  SLV_START_INTSTS:1;
    volatile const  uint32_t  RESERVE1:20;
} SPI_CNTRL2_T;

typedef struct
{
    union {
        volatile uint32_t u32CNTRL;
        struct {
            volatile uint32_t  GO_BUSY:1;
            volatile uint32_t  RX_NEG:1;
            volatile uint32_t  TX_NEG:1;
            volatile uint32_t  TX_BIT_LEN:5;
            volatile uint32_t  TX_NUM:2;
            volatile uint32_t  LSB:1;
            volatile uint32_t  CLKP:1;
            volatile uint32_t  SP_CYCLE:4;
            volatile uint32_t  IF:1;
            volatile uint32_t  IE:1;
            volatile uint32_t  SLAVE:1;
            volatile uint32_t  REORDER:2;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  TWOB:1;
            volatile uint32_t  VARCLK_EN:1;
            volatile const  uint32_t  RESERVE1:8;
        } CNTRL;
    };

    union {
        volatile uint32_t u32DIVIDER;
        struct {
            volatile uint32_t  DIVIDER:16;
            volatile uint32_t  DIVIDER2:16;
        } DIVIDER;
    };

    union {
        volatile uint32_t u32SSR;
        struct {
            volatile uint32_t  SSR:2;
            volatile uint32_t  SS_LVL:1;
            volatile uint32_t  AUTOSS:1;
            volatile uint32_t  SS_LTRIG:1;
            volatile const  uint32_t  LTRIG_FLAG:1;
            volatile const  uint32_t  RESERVE:26;
        } SSR;
    };

    volatile const uint32_t RESERVE0;

    union {
        volatile const uint32_t u32RX[2];
        volatile const uint32_t RX[2];
    };

    volatile const uint32_t RESERVE1;
    volatile const uint32_t RESERVE2;

    union {
        volatile uint32_t u32TX[2];
        volatile uint32_t TX[2];
    };

    volatile const uint32_t RESERVE3;
    volatile const uint32_t RESERVE4;
    volatile const uint32_t RESERVE5;

    union {
        volatile uint32_t u32VARCLK;
        volatile uint32_t VARCLK;
    };

    union {
        volatile uint32_t u32DMA;
        struct {
            volatile uint32_t  TX_DMA_GO:1;
            volatile uint32_t  RX_DMA_GO:1;
            volatile const  uint32_t  RESERVE:30;
        } DMA;
    };

    union {
        volatile uint32_t u32CNTRL2;
        struct {
            volatile uint32_t  DIV_ONE:1;
            volatile const  uint32_t  RESERVE0:7;
            volatile uint32_t  NOSLVSEL:1;
            volatile uint32_t  SLV_ABORT:1;
            volatile uint32_t  SSTA_INTEN:1;
            volatile uint32_t  SLV_START_INTSTS:1;
            volatile const  uint32_t  RESERVE1:20;
        } CNTRL2;
    };

} SPI_T;


 











































 






 















 






 
















 
typedef struct
{
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  AA:1;
    volatile uint32_t  SI:1;
    volatile uint32_t  STO:1;
    volatile uint32_t  STA:1;
    volatile uint32_t  ENS1:1;
    volatile uint32_t  EI:1;
    volatile const  uint32_t  RESERVE1:24;
} I2C_I2CON_T;

typedef struct
{
    volatile uint32_t  GC:1;
    volatile uint32_t  I2CADDR:7;
    volatile const  uint32_t  RESERVE:24;
} I2C_I2CADDR_T;

typedef volatile uint32_t I2C_I2CDAT_T;

typedef volatile const  uint32_t I2C_I2CSTATUS_T;

typedef volatile uint32_t I2C_I2CLK_T;

typedef struct
{
    volatile uint32_t  TIF:1;
    volatile uint32_t  DIV4:1;
    volatile uint32_t  ENTI:1;
    volatile const  uint32_t  RESERVE:29;
} I2C_I2CTOC_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  I2CADM:7;
    volatile const  uint32_t  RESERVE1:24;
} I2C_I2CADM_T;

typedef struct
{
    union 
    {
        volatile uint32_t u32I2CON;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  AA:1;
            volatile uint32_t  SI:1;
            volatile uint32_t  STO:1;
            volatile uint32_t  STA:1;
            volatile uint32_t  ENS1:1;
            volatile uint32_t  EI:1;
            volatile const  uint32_t  RESERVE1:24;
        } I2CON;
    };

    union 
    {
        volatile uint32_t u32I2CADDR0;
        
        struct 
        {
            volatile uint32_t  GC:1;
            volatile uint32_t  I2CADDR:7;
            volatile const  uint32_t  RESERVE:24;
        } I2CADDR0;
    };

    union 
    {
        volatile uint32_t u32I2CDAT;
        volatile uint32_t I2CDAT;
    };

    union 
    {
        volatile const uint32_t u32I2CSTATUS;
        volatile const uint32_t I2CSTATUS;
    };
    
    union 
    {
        volatile uint32_t u32I2CLK;
        volatile uint32_t I2CLK;
    };

    union 
    {
        volatile uint32_t u32I2CTOC;
        
        struct 
        {
            volatile uint32_t  TIF:1;
            volatile uint32_t  DIV4:1;
            volatile uint32_t  ENTI:1;
            volatile const  uint32_t  RESERVE:29;
        } I2CTOC;
    };

    union 
    {
        volatile uint32_t u32I2CADDR1;
        
        struct 
        {
            volatile uint32_t  GC:1;
            volatile uint32_t  I2CADDR:7;
            volatile const  uint32_t  RESERVE:24;
        } I2CADDR1;
    };
    
    union 
    {
        volatile uint32_t u32I2CADDR2;
        
        struct 
        {
            volatile uint32_t  GC:1;
            volatile uint32_t  I2CADDR:7;
            volatile const  uint32_t  RESERVE:24;
        } I2CADDR2;
    };    
    
    union 
    {
        volatile uint32_t u32I2CADDR3;
        
        struct 
        {
            volatile uint32_t  GC:1;
            volatile uint32_t  I2CADDR:7;
            volatile const  uint32_t  RESERVE:24;
        } I2CADDR3;
    }; 
    
    union 
    {
        volatile uint32_t u32I2CADM0;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  I2CADM:7;
            volatile const  uint32_t  RESERVE1:24;
        } I2CADM0;
    };     
    
    union 
    {
        volatile uint32_t u32I2CADM1;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  I2CADM:7;
            volatile const  uint32_t  RESERVE1:24;
        } I2CADM1;
    };

    union 
    {
        volatile uint32_t u32I2CADM2;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  I2CADM:7;
            volatile const  uint32_t  RESERVE1:24;
        } I2CADM2;
    };
       
    union 
    {
        volatile uint32_t u32I2CADM3;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  I2CADM:7;
            volatile const  uint32_t  RESERVE1:24;
        } I2CADM3;
    };       
} I2C_T;

 


















 






 



 



 



 









 




 
typedef volatile uint32_t RTC_INIR_T;

typedef struct
{
    volatile uint32_t  AER:16;
    volatile const  uint32_t  ENF:1;
    volatile const  uint32_t  RESERVE1:15;
} RTC_AER_T;

typedef struct
{
    volatile uint32_t  FRACTION:6;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  INTEGER:4;
    volatile const  uint32_t  RESERVE1:20;
} RTC_FCR_T;

typedef struct
{
    volatile uint32_t  SEC1:4;
    volatile uint32_t  SEC10:3;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  MIN1:4;
    volatile uint32_t  MIN10:3;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  HR1:4;
    volatile uint32_t  HR10:2;
    volatile const  uint32_t  RESERVE2:10;
} RTC_TLR_T;

typedef struct
{
    volatile uint32_t  DAY1:4;
    volatile uint32_t  DAY10:2;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  MON1:4;
    volatile uint32_t  MON10:1;
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  YEAR1:4;
    volatile uint32_t  YEAR10:4;
    volatile const  uint32_t  RESERVE2:8;
} RTC_CLR_T;

typedef struct
{
    volatile uint32_t  HR24_HR12:1;
    volatile const  uint32_t  RESERVE:31;
} RTC_TSSR_T;

typedef struct
{
    volatile uint32_t  DWR:3;
    volatile const  uint32_t  RESERVE:29;
} RTC_DWR_T;

typedef RTC_TLR_T   RTC_TAR_T;

typedef RTC_CLR_T   RTC_CAR_T;

typedef struct
{
    volatile uint32_t  LIR:1;
    volatile const  uint32_t  RESERVE:31;
} RTC_LIR_T;

typedef struct
{
    volatile uint32_t  AIER:1;
    volatile uint32_t  TIER:1;
    volatile const  uint32_t  RESERVE:30;
} RTC_RIER_T;

typedef struct
{
    volatile uint32_t  AIF:1;
    volatile uint32_t  TIF:1;
    volatile const  uint32_t  RESERVE:30;
} RTC_RIIR_T;

typedef struct
{
    volatile uint32_t  TTR:3;
    volatile uint32_t  TWKE:1;
    volatile const  uint32_t  RESERVE:28;
} RTC_TTR_T;

typedef struct
{
    union {
        volatile uint32_t u32INIR;
        volatile uint32_t INIR;
    };

    union {
        volatile uint32_t u32AER;
        struct {
            volatile uint32_t  AER:16;
            volatile const  uint32_t  ENF:1;
            volatile const  uint32_t  RESERVE1:15;
        } AER;
    };

    union {
        volatile uint32_t u32FCR;
        struct {
            volatile uint32_t  FRACTION:6;
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  INTEGER:4;
            volatile const  uint32_t  RESERVE1:20;
        } FCR;
    };

    union {
        volatile uint32_t u32TLR;
        struct {
            volatile uint32_t  SEC1:4;
            volatile uint32_t  SEC10:3;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  MIN1:4;
            volatile uint32_t  MIN10:3;
            volatile const  uint32_t  RESERVE1:1;
            volatile uint32_t  HR1:4;
            volatile uint32_t  HR10:2;
            volatile const  uint32_t  RESERVE2:10;
        } TLR;
    };

    union {
        volatile uint32_t u32CLR;
        struct {
            volatile uint32_t  DAY1:4;
            volatile uint32_t  DAY10:2;
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  MON1:4;
            volatile uint32_t  MON10:1;
            volatile const  uint32_t  RESERVE1:3;
            volatile uint32_t  YEAR1:4;
            volatile uint32_t  YEAR10:4;
            volatile const  uint32_t  RESERVE2:8;
        } CLR;
    };

    union {
        volatile uint32_t u32TSSR;
        struct {
            volatile uint32_t  HR24_HR12:1;
            volatile const  uint32_t  RESERVE:31;
        } TSSR;
    };

    union {
        volatile uint32_t u32DWR;
        struct {
            volatile uint32_t  DWR:3;
            volatile const  uint32_t  RESERVE:29;
        } DWR;
    };

    union {
        volatile uint32_t u32TAR;
        struct {
            volatile uint32_t  SEC1:4;
            volatile uint32_t  SEC10:3;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  MIN1:4;
            volatile uint32_t  MIN10:3;
            volatile const  uint32_t  RESERVE1:1;
            volatile uint32_t  HR1:4;
            volatile uint32_t  HR10:2;
            volatile const  uint32_t  RESERVE2:10;
        } TAR;
    };

    union {
        volatile uint32_t u32CAR;
        struct {
            volatile uint32_t  DAY1:4;
            volatile uint32_t  DAY10:2;
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  MON1:4;
            volatile uint32_t  MON10:1;
            volatile const  uint32_t  RESERVE1:3;
            volatile uint32_t  YEAR1:4;
            volatile uint32_t  YEAR10:4;
            volatile const  uint32_t  RESERVE2:8;
        } CAR;
    };

    union {
        volatile uint32_t u32LIR;
        struct {
            volatile uint32_t  LIR:1;
            volatile const  uint32_t  RESERVE:31;
        } LIR;
    };

    union {
        volatile uint32_t u32RIER;
        struct {
            volatile uint32_t  AIER:1;
            volatile uint32_t  TIER:1;
            volatile const  uint32_t  RESERVE:30;
        } RIER;
    };

    union {
        volatile uint32_t u32RIIR;
        struct {
            volatile uint32_t  AIF:1;
            volatile uint32_t  TIF:1;
            volatile const  uint32_t  RESERVE:30;
        } RIIR;
    };

    union {
        volatile uint32_t u32TTR;
        struct {
            volatile uint32_t  TTR:3;
            volatile uint32_t  TWKE:1;
            volatile const  uint32_t  RESERVE:28;
        } TTR;
    };
} RTC_T;

 






 






 






 


















 


















 



 



 


















 


















 



 






 






 







 
typedef struct
{
    volatile const  uint32_t  RSLT:16;
    volatile const  uint32_t  OVERRUN:1;
    volatile const  uint32_t  VALID:1;
    volatile const  uint32_t  RESERVE1:14;
} ADC_ADDR_T;

typedef struct
{
    volatile uint32_t  ADEN:1;
    volatile uint32_t  ADIE:1;
    volatile uint32_t  ADMD:2;
    volatile uint32_t  TRGS:2;
    volatile uint32_t  TRGCOND:2;
    volatile uint32_t  TRGEN:1;
    volatile uint32_t  PTEN:1;
    volatile uint32_t  DIFFEN:1;
    volatile uint32_t  ADST:1;
    volatile const  uint32_t  RESERVE0:19;
    volatile uint32_t  DMOF:1;
} ADC_ADCR_T;

typedef struct
{
    volatile uint32_t  CHEN:8;
    volatile uint32_t  PRESEL:2;
    volatile const  uint32_t  RESERVE:22;
} ADC_ADCHER_T;

typedef struct
{
    volatile uint32_t  CMPEN:1;
    volatile uint32_t  CMPIE:1;
    volatile uint32_t  CMPCOND:1;
    volatile uint32_t  CMPCH:3;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  CMPMATCNT:4;
    volatile const  uint32_t  RESERVE1:4;
    volatile uint32_t  CMPD:12;
    volatile const  uint32_t  RESERVE2:4;
} ADC_ADCMPR_T;

typedef struct
{
    volatile uint32_t  ADF:1;
    volatile uint32_t  CMPF0:1;
    volatile uint32_t  CMPF1:1;
    volatile const  uint32_t  BUSY:1;
    volatile const  uint32_t  CHANNEL:3;
    volatile const  uint32_t  RESERVE0:1;
    volatile const  uint32_t  VALID:8;
    volatile const  uint32_t  OVERRUN:8;
    volatile const  uint32_t  RESERVE1:8;
} ADC_ADSR_T;

typedef struct
{
    volatile uint32_t  CALEN:1;
    volatile const  uint32_t  CALDONE:1;
    volatile const  uint32_t  RESERVE:30;
} ADC_ADCALR_T;

typedef struct
{
    volatile uint32_t  AD_PDMA:12;
    volatile const  uint32_t  RESERVE:20;
} ADC_ADPDMA_T;

typedef struct
{
    union {
        volatile const uint32_t u32ADDR[8];
        struct {
            volatile const  uint32_t  RSLT:16;
            volatile const  uint32_t  OVERRUN:1;
            volatile const  uint32_t  VALID:1;
            volatile const  uint32_t  RESERVE1:14;
        } ADDR[8];
    };
    
    union {
        volatile uint32_t u32ADCR;
        struct {
            volatile uint32_t  ADEN:1;
            volatile uint32_t  ADIE:1;
            volatile uint32_t  ADMD:2;
            volatile uint32_t  TRGS:2;
            volatile uint32_t  TRGCOND:2;
            volatile uint32_t  TRGEN:1;
            volatile uint32_t  PTEN:1;
            volatile uint32_t  DIFFEN:1;
            volatile uint32_t  ADST:1;
            volatile const  uint32_t  RESERVE0:19;
            volatile uint32_t  DMOF:1;
        } ADCR;
    };
    
    union {
        volatile uint32_t u32ADCHER;
        struct {
            volatile uint32_t  CHEN:8;
            volatile uint32_t  PRESEL:2;
            volatile const  uint32_t  RESERVE:22;
        } ADCHER;
    };
    
    union {
        volatile uint32_t u32ADCMPR[2];
        struct {
            volatile uint32_t  CMPEN:1;
            volatile uint32_t  CMPIE:1;
            volatile uint32_t  CMPCOND:1;
            volatile uint32_t  CMPCH:3;
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  CMPMATCNT:4;
            volatile const  uint32_t  RESERVE1:4;
            volatile uint32_t  CMPD:12;
            volatile const  uint32_t  RESERVE2:4;
        } ADCMPR[2];
    };
    
    union {
        volatile uint32_t u32ADSR;
        struct {
            volatile uint32_t  ADF:1;
            volatile uint32_t  CMPF0:1;
            volatile uint32_t  CMPF1:1;
            volatile const  uint32_t  BUSY:1;
            volatile const  uint32_t  CHANNEL:3;
            volatile const  uint32_t  RESERVE0:1;
            volatile const  uint32_t  VALID:8;
            volatile const  uint32_t  OVERRUN:8;
            volatile const  uint32_t  RESERVE1:8;
        } ADSR;
    };
    
    union {
        volatile uint32_t u32ADCALR;
        struct {
            volatile uint32_t  CALEN:1;
            volatile const  uint32_t  CALDONE:1;
            volatile const  uint32_t  RESERVE:30;
        } ADCALR;
    };
    
    volatile const uint32_t RESERVE0;
    volatile const uint32_t RESERVE1;
    
    union {
        volatile uint32_t u32ADPDMA;
        struct {
            volatile uint32_t  AD_PDMA:12;
            volatile const  uint32_t  RESERVE:20;
        } ADPDMA;
    };
} ADC_T;

 









 






























 






 


















 





















 






 




 
typedef struct
{
    volatile uint32_t  CMPEN:1;
    volatile uint32_t  CMPIE:1;
    volatile uint32_t  CMP_HYSEN:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CMPCN:1;
    volatile const  uint32_t  RESERVE1:27;
} ACMP_CMPCR_T;

typedef struct
{
    volatile uint32_t  CMPF0:1;
    volatile uint32_t  CMPF1:1;
    volatile const  uint32_t  CO0:1;
    volatile const  uint32_t  CO1:1;
    volatile const  uint32_t  RESERVE:28;
} ACMP_CMPSR_T;

typedef struct
{
    union {
        volatile uint32_t u32CMPCR[2];
        struct {
            volatile uint32_t  CMPEN:1;
            volatile uint32_t  CMPIE:1;
            volatile uint32_t  CMP_HYSEN:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  CMPCN:1;
            volatile const  uint32_t  RESERVE1:27;
        } CMPCR[2];
    };
    
    union {
        volatile uint32_t u32CMPSR;
        struct {
            volatile uint32_t  CMPF0:1;
            volatile uint32_t  CMPF1:1;
            volatile const  uint32_t  CO0:1;
            volatile const  uint32_t  CO1:1;
            volatile const  uint32_t  RESERVE:28;
        } CMPSR;
    };
} ACMP_T;


 












 













 
typedef struct
{
    volatile uint32_t  XTL12M_EN:1;
    volatile uint32_t  XTL32K_EN:1;
    volatile uint32_t  OSC22M_EN:1;
    volatile uint32_t  OSC10K_EN:1;
    volatile uint32_t  PD_WU_DLY:1;
    volatile uint32_t  PD_WU_INT_EN:1;
    volatile uint32_t  PD_WU_STS:1;
    volatile uint32_t  PWR_DOWN_EN:1;
    volatile uint32_t  PD_WAIT_CPU:1;
    volatile const  uint32_t  RESERVE:23;
} SYSCLK_PWRCON_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  PDMA_EN:1;
    volatile uint32_t  ISP_EN:1;
    volatile uint32_t  EBI_EN:1;
    volatile const  uint32_t  RESERVE1:28;
} SYSCLK_AHBCLK_T;

typedef struct
{
    volatile uint32_t  WDT_EN:1;
    volatile uint32_t  RTC_EN:1;
    volatile uint32_t  TMR0_EN:1;
    volatile uint32_t  TMR1_EN:1;
    volatile uint32_t  TMR2_EN:1;
    volatile uint32_t  TMR3_EN:1;
    volatile uint32_t  FDIV_EN:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  I2C0_EN:1;
    volatile uint32_t  I2C1_EN:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  SPI0_EN:1;
    volatile uint32_t  SPI1_EN:1;
    volatile uint32_t  SPI2_EN:1;
    volatile uint32_t  SPI3_EN:1;
    volatile uint32_t  UART0_EN:1;
    volatile uint32_t  UART1_EN:1;
    volatile uint32_t  UART2_EN:1;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  PWM01_EN:1;
    volatile uint32_t  PWM23_EN:1;
    volatile uint32_t  PWM45_EN:1;
    volatile uint32_t  PWM67_EN:1;
    volatile uint32_t  CAN0_EN:1;
    volatile const  uint32_t  RESERVE3:2;
    volatile uint32_t  USBD_EN:1;
    volatile uint32_t  ADC_EN:1;
    volatile uint32_t  I2S_EN:1;
    volatile uint32_t  ACMP_EN:1;
    volatile uint32_t  PS2_EN:1;
} SYSCLK_APBCLK_T;

typedef struct
{
    volatile const  uint32_t  XTL12M_STB:1;
    volatile const  uint32_t  XTL32K_STB:1;
    volatile const  uint32_t  PLL_STB:1;
    volatile const  uint32_t  OSC10K_STB:1;
    volatile const  uint32_t  OSC22M_STB:1;
    volatile const  uint32_t  RESERVE0:2;
    volatile uint32_t  CLK_SW_FAIL:1;
    volatile const  uint32_t  RESERVE1:24;
} SYSCLK_CLKSTATUS_T;

typedef struct
{
    volatile uint32_t  HCLK_S:3;
    volatile uint32_t  STCLK_S:3;
    volatile const  uint32_t  RESERVE:26;
} SYSCLK_CLKSEL0_T;


typedef struct
{
    volatile uint32_t  WDT_S:2;
    volatile uint32_t  ADC_S:2;
    volatile const  uint32_t  RESERVE1:4;
    volatile uint32_t  TMR0_S:3;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  TMR1_S:3;
    volatile const  uint32_t  RESERVE3:1;
    volatile uint32_t  TMR2_S:3;
    volatile const  uint32_t  RESERVE4:1;
    volatile uint32_t  TMR3_S:3;
    volatile const  uint32_t  RESERVE5:1;
    volatile uint32_t  UART_S:2;
    volatile const  uint32_t  RESERVE6:2;
    volatile uint32_t  PWM01_S:2;
    volatile uint32_t  PWM23_S:2;
} SYSCLK_CLKSEL1_T;

typedef struct
{
    volatile uint32_t  I2S_S:2;
    volatile uint32_t  FRQDIV_S:2;
    volatile uint32_t  PWM45_S:2;
    volatile uint32_t  PWM67_S:2;
    volatile const  uint32_t  RESERVE:24;
} SYSCLK_CLKSEL2_T;

typedef struct
{
    volatile uint32_t  HCLK_N:4;
    volatile uint32_t  USB_N:4;
    volatile uint32_t  UART_N:4;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  ADC_N:8;
    volatile const  uint32_t  RESERVE1:8;
} SYSCLK_CLKDIV_T;

typedef struct
{
    volatile uint32_t  FB_DV:9;
    volatile uint32_t  IN_DV:5;
    volatile uint32_t  OUT_DV:2;
    volatile uint32_t  PD:1;
    volatile uint32_t  BP:1;
    volatile uint32_t  OE:1;
    volatile uint32_t  PLL_SRC:1;
    volatile const  uint32_t  RESERVE:12;
} SYSCLK_PLLCON_T;


typedef struct
{    
    volatile uint32_t  FSEL:4;
    volatile uint32_t  FDIV_EN:1;
    volatile const  uint32_t  RESERVE:27;
} SYSCLK_FRQDIV_T;

typedef struct
{
    union 
    {
        volatile uint32_t u32PWRCON;
        
        struct 
        {
            volatile uint32_t  XTL12M_EN:1;
            volatile uint32_t  XTL32K_EN:1;
            volatile uint32_t  OSC22M_EN:1;
            volatile uint32_t  OSC10K_EN:1;
            volatile uint32_t  PD_WU_DLY:1;
            volatile uint32_t  PD_WU_INT_EN:1;
            volatile uint32_t  PD_WU_STS:1;
            volatile uint32_t  PWR_DOWN_EN:1;
            volatile uint32_t  PD_WAIT_CPU:1;
            volatile const  uint32_t  RESERVE:23;
        } PWRCON;
    };    
    
    union 
    {
        volatile uint32_t u32AHBCLK;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  PDMA_EN:1;
            volatile uint32_t  ISP_EN:1;
            volatile uint32_t  EBI_EN:1;
            volatile const  uint32_t  RESERVE1:28;
        } AHBCLK;
    };    

    union 
    {
        volatile uint32_t u32APBCLK;
        
        struct 
        {
            volatile uint32_t  WDT_EN:1;
            volatile uint32_t  RTC_EN:1;
            volatile uint32_t  TMR0_EN:1;
            volatile uint32_t  TMR1_EN:1;
            volatile uint32_t  TMR2_EN:1;
            volatile uint32_t  TMR3_EN:1;
            volatile uint32_t  FDIV_EN:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  I2C0_EN:1;
            volatile uint32_t  I2C1_EN:1;
            volatile const  uint32_t  RESERVE1:2;
            volatile uint32_t  SPI0_EN:1;
            volatile uint32_t  SPI1_EN:1;
            volatile uint32_t  SPI2_EN:1;
            volatile uint32_t  SPI3_EN:1;
            volatile uint32_t  UART0_EN:1;
            volatile uint32_t  UART1_EN:1;
            volatile uint32_t  UART2_EN:1;
            volatile const  uint32_t  RESERVE2:1;
            volatile uint32_t  PWM01_EN:1;
            volatile uint32_t  PWM23_EN:1;
            volatile uint32_t  PWM45_EN:1;
            volatile uint32_t  PWM67_EN:1;
            volatile uint32_t  CAN0_EN:1;
            volatile const  uint32_t  RESERVE3:2;
            volatile uint32_t  USBD_EN:1;
            volatile uint32_t  ADC_EN:1;
            volatile uint32_t  I2S_EN:1;
            volatile uint32_t  ACMP_EN:1;
            volatile uint32_t  PS2_EN:1;
        } APBCLK;
    };          

    union 
    {
        volatile uint32_t u32CLKSTATUS;
        
        struct 
        {
            volatile const  uint32_t  XTL12M_STB:1;
            volatile const  uint32_t  XTL32K_STB:1;
            volatile const  uint32_t  PLL_STB:1;
            volatile const  uint32_t  OSC10K_STB:1;
            volatile const  uint32_t  OSC22M_STB:1;
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  CLK_SW_FAIL:1;
            volatile const  uint32_t  RESERVE1:24;
        } CLKSTATUS;
    };  

    union 
    {
        volatile uint32_t u32CLKSEL0;
        
        struct 
        {
            volatile uint32_t  HCLK_S:3;
            volatile uint32_t  STCLK_S:3;
            volatile const  uint32_t  RESERVE:26;
        } CLKSEL0;
    };  

    union 
    {
        volatile uint32_t u32CLKSEL1;
        
        struct 
        {
            volatile uint32_t  WDT_S:2;
            volatile uint32_t  ADC_S:2;
            volatile const  uint32_t  RESERVE1:4;
            volatile uint32_t  TMR0_S:3;
            volatile const  uint32_t  RESERVE2:1;
            volatile uint32_t  TMR1_S:3;
            volatile const  uint32_t  RESERVE3:1;
            volatile uint32_t  TMR2_S:3;
            volatile const  uint32_t  RESERVE4:1;
            volatile uint32_t  TMR3_S:3;
            volatile const  uint32_t  RESERVE5:1;
            volatile uint32_t  UART_S:2;
            volatile const  uint32_t  RESERVE6:2;
            volatile uint32_t  PWM01_S:2;
            volatile uint32_t  PWM23_S:2;
        } CLKSEL1;
    };  

    union 
    {
        volatile uint32_t u32CLKDIV;
        
        struct 
        {
            volatile uint32_t  HCLK_N:4;
            volatile uint32_t  USB_N:4;
            volatile uint32_t  UART_N:4;
            volatile const  uint32_t  RESERVE0:4;
            volatile uint32_t  ADC_N:8;
            volatile const  uint32_t  RESERVE1:8;
        } CLKDIV;
    };  

    union 
    {
        volatile uint32_t u32CLKSEL2;
        
        struct 
        {
            volatile uint32_t  I2S_S:2;
            volatile uint32_t  FRQDIV_S:2;
            volatile uint32_t  PWM45_S:2;
            volatile uint32_t  PWM67_S:2;
            volatile const  uint32_t  RESERVE:24;
        } CLKSEL2;
    };  
    
    union 
    {
        volatile uint32_t u32PLLCON;
        
        struct 
        {
            volatile uint32_t  FB_DV:9;
            volatile uint32_t  IN_DV:5;
            volatile uint32_t  OUT_DV:2;
            volatile uint32_t  PD:1;
            volatile uint32_t  BP:1;
            volatile uint32_t  OE:1;
            volatile uint32_t  PLL_SRC:1;
            volatile const  uint32_t  RESERVE:12;
        } PLLCON;
    };  
    
    union 
    {
        volatile uint32_t u32FRQDIV;
        
        struct 
        {
            volatile uint32_t  FSEL:4;
            volatile uint32_t  FDIV_EN:1;
            volatile const  uint32_t  RESERVE:27;
        } FRQDIV;
    };      
} SYSCLK_T;

 



























 










 




































































                                                









 


















 






 



























 












 












 





















 






 
typedef volatile const uint32_t GCR_PDID_T;  

typedef struct
{
    volatile uint32_t  RSTS_POR:1;
    volatile uint32_t  RSTS_RESET:1;
    volatile uint32_t  RSTS_WDT:1;
    volatile uint32_t  RSTS_LVR:1;
    volatile uint32_t  RSTS_BOD:1;
    volatile uint32_t  RSTS_SYS:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  RSTS_CPU:1;    
    volatile const  uint32_t  RESERVE1:24;
} GCR_RSTSRC_T;


typedef struct
{
    volatile uint32_t  CHIP_RST:1;
    volatile uint32_t  CPU_RST:1;
    volatile uint32_t  PDMA_RST:1;
    volatile uint32_t  EBI_RST:1;
    volatile const  uint32_t  RESERVE:28;
} GCR_IPRSTC1_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  GPIO_RST:1;
    volatile uint32_t  TMR0_RST:1;
    volatile uint32_t  TMR1_RST:1;
    volatile uint32_t  TMR2_RST:1;
    volatile uint32_t  TMR3_RST:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  I2C0_RST:1;
    volatile uint32_t  I2C1_RST:1;
    volatile const  uint32_t  RESERVE2:2;
    volatile uint32_t  SPI0_RST:1;
    volatile uint32_t  SPI1_RST:1;
    volatile uint32_t  SPI2_RST:1;
    volatile uint32_t  SPI3_RST:1;
    volatile uint32_t  UART0_RST:1;
    volatile uint32_t  UART1_RST:1;
    volatile uint32_t  UART2_RST:1;
    volatile const  uint32_t  RESERVE3:1;
    volatile uint32_t  PWM03_RST:1;
    volatile uint32_t  PWM47_RST:1;
    volatile uint32_t  ACMP_RST:1;
    volatile uint32_t  PS2_RST:1;
    volatile uint32_t  CAN0_RST:1;
    volatile const  uint32_t  RESERVE4:2;
    volatile uint32_t  USBD_RST:1;
    volatile uint32_t  ADC_RST:1;
    volatile uint32_t  I2S_RST:1;
    volatile const  uint32_t  RESERVE5:2;
} GCR_IPRSTC2_T;

typedef struct
{
    volatile uint32_t  HPE:1;
    volatile const  uint32_t  RESERVE:31;
} GCR_CPR_T;


typedef struct
{
    volatile uint32_t  BOD_EN:1;
    volatile uint32_t  BOD_VL:2;
    volatile uint32_t  BOD_RSTEN:1;
    volatile uint32_t  BOD_INTF:1;
    volatile uint32_t  BOD_LPM:1;
    volatile uint32_t  BOD_OUT:1;
    volatile uint32_t  LVR_EN:1;
    volatile const  uint32_t  RESERVE1:24;
} GCR_BODCR_T;

typedef struct
{
    volatile uint32_t  VTEMP_EN:1;
    volatile const  uint32_t  RESERVE:31;
} GCR_TEMPCR_T;

typedef volatile uint32_t GCR_PORCR_T;  

typedef struct
{
    volatile uint32_t ADC0:1;
    volatile uint32_t ADC1_AD12:1;
    volatile uint32_t ADC2_AD11:1;
    volatile uint32_t ADC3_AD10:1;
    volatile uint32_t ADC4_AD9:1;
    volatile uint32_t ADC5_AD8:1;
    volatile uint32_t ADC6_AD7:1;
    volatile uint32_t ADC7_SS21_AD6:1;
    volatile uint32_t I2C0_SDA:1;
    volatile uint32_t I2C0_SCL:1;
    volatile uint32_t I2C1_SDA_nWR:1;
    volatile uint32_t I2C1_SCL_nRD:1;
    volatile uint32_t PWM0_AD13:1;
    volatile uint32_t PWM1_AD14:1;
    volatile uint32_t PWM2_AD15:1;
    volatile uint32_t PWM3_I2SMCLK:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPAMFP_T;

typedef struct
{
    volatile uint32_t UART0_RX:1;
    volatile uint32_t UART0_TX:1;
    volatile uint32_t UART0_nRTS_nWRL:1;
    volatile uint32_t UART0_nCTS_nWRH:1;
    volatile uint32_t UART1_RX:1;
    volatile uint32_t UART1_TX:1;
    volatile uint32_t UART1_nRTS_ALE:1;
    volatile uint32_t UART1_nCTS_nCS:1;
    volatile uint32_t TM0:1;
    volatile uint32_t TM1_SS11:1;                              
    volatile uint32_t TM2_SS01:1;
    volatile uint32_t TM3_PWM4:1;                     
    volatile uint32_t CPO0_CLKO_AD0:1;
    volatile uint32_t CPO1_AD1:1;
    volatile uint32_t INT0_SS31:1;
    volatile uint32_t INT1:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPBMFP_T;

typedef struct
{
    volatile uint32_t SPI0_SS0_I2SLRCLK:1;
    volatile uint32_t SPI0_CLK_I2SBCLK:1;
    volatile uint32_t SPI0_MISO0_I2SDI:1;
    volatile uint32_t SPI0_MOSI0_I2SDO:1;
    volatile uint32_t SPI0_MISO1:1;
    volatile uint32_t SPI0_MOSI1:1;
    volatile uint32_t CPP0_AD4:1;
    volatile uint32_t CPN0_AD5:1;
    volatile uint32_t SPI1_SS0_MCLK:1;
    volatile uint32_t SPI1_CLK:1;
    volatile uint32_t SPI1_MISO0:1;
    volatile uint32_t SPI1_MOSI0:1;
    volatile uint32_t SPI1_MISO1:1;
    volatile uint32_t SPI1_MOSI1:1;
    volatile uint32_t CPP1_AD2:1;
    volatile uint32_t CPN1_AD3:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPCMFP_T;

typedef struct
{
    volatile uint32_t SPI2_SS0:1;
    volatile uint32_t SPI2_CLK_SPI0_SS1:1;
    volatile uint32_t SPI2_MISO0_SPI0_MISO1:1;
    volatile uint32_t SPI2_MOSI0_SPI0_MOSI1:1;
    volatile uint32_t SPI2_MISO1:1;
    volatile uint32_t SPI2_MOSI1:1;
    volatile uint32_t CAN0_RX:1;
    volatile uint32_t CAN0_TX:1;
    volatile uint32_t SPI3_SS0:1;
    volatile uint32_t SPI3_CLK:1;
    volatile uint32_t SPI3_MISO0:1;
    volatile uint32_t SPI3_MOSI0:1;
    volatile uint32_t SPI3_MISO1:1;
    volatile uint32_t SPI3_MOSI1:1;
    volatile uint32_t UART2_RX:1;
    volatile uint32_t UART2_TX:1;
    volatile uint32_t SCHMITT:16;    
} GCR_GPDMFP_T;


typedef struct
{
    volatile uint32_t  PWM6:1;
    volatile uint32_t  PWM7:1;
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  PWM5:1;
    volatile const  uint32_t  RESERVE2:10;
    volatile uint32_t  SCHMITT:16;
} GCR_GPEMFP_T;

typedef struct
{
    volatile uint32_t  PB10_S01:1;       
    volatile uint32_t  PB9_S11:1;        
    volatile uint32_t  PA7_S21:1;        
    volatile uint32_t  PB14_S31:1;       
    volatile uint32_t  PB11_PWM4:1;      
    volatile uint32_t  PC0_I2SLRCLK:1;   
    volatile uint32_t  PC1_I2SBCLK:1;    
    volatile uint32_t  PC2_I2SDI:1;      
    volatile uint32_t  PC3_I2SDO:1;      
    volatile uint32_t  PA15_I2SMCLK:1;   
    volatile uint32_t  PB12_CLKO:1;      
    volatile uint32_t  EBI_EN:1;            
    volatile uint32_t  EBI_MCLK_EN:1;    
    volatile uint32_t  EBI_WRL_EN:1;     
    volatile uint32_t  EBI_WRH_EN:1;     
    volatile const  uint32_t  RESERVE0:1;  
    volatile uint32_t  EBI_HB_EN:8;     
    volatile uint32_t  PB15_T0EX:1;
    volatile uint32_t  PE5_T1EX:1;
    volatile uint32_t  PB2_T2EX:1;
    volatile uint32_t  PB3_T3EX:1;
    volatile const  uint32_t  RESERVE1:4;
} GCR_ALTMFP_T;

typedef volatile uint32_t GCR_REGWRPROT_T;

typedef struct
{
    union 
    {
        volatile const uint32_t u32PDID;
        volatile const uint32_t PDID;
    };

    union 
    {
        volatile uint32_t u32RSTSRC;
        
        struct 
        {
            volatile uint32_t  RSTS_POR:1;
            volatile uint32_t  RSTS_RESET:1;
            volatile uint32_t  RSTS_WDT:1;
            volatile uint32_t  RSTS_LVR:1;
            volatile uint32_t  RSTS_BOD:1;
            volatile uint32_t  RSTS_SYS:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  RSTS_CPU:1;    
            volatile const  uint32_t  RESERVE1:24;
        } RSTSRC;
    };

    union 
    {
        volatile uint32_t u32IPRSTC1;
        
        struct 
        {
            volatile uint32_t  CHIP_RST:1;
            volatile uint32_t  CPU_RST:1;
            volatile uint32_t  PDMA_RST:1;
            volatile uint32_t  EBI_RST:1;
            volatile const  uint32_t  RESERVE:28;
        } IPRSTC1;
    };    
    
    union 
    {
        volatile uint32_t u32IPRSTC2;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  GPIO_RST:1;
            volatile uint32_t  TMR0_RST:1;
            volatile uint32_t  TMR1_RST:1;
            volatile uint32_t  TMR2_RST:1;
            volatile uint32_t  TMR3_RST:1;
            volatile const  uint32_t  RESERVE1:2;
            volatile uint32_t  I2C0_RST:1;
            volatile uint32_t  I2C1_RST:1;
            volatile const  uint32_t  RESERVE2:2;
            volatile uint32_t  SPI0_RST:1;
            volatile uint32_t  SPI1_RST:1;
            volatile uint32_t  SPI2_RST:1;
            volatile uint32_t  SPI3_RST:1;
            volatile uint32_t  UART0_RST:1;
            volatile uint32_t  UART1_RST:1;
            volatile uint32_t  UART2_RST:1;
            volatile const  uint32_t  RESERVE3:1;
            volatile uint32_t  PWM03_RST:1;
            volatile uint32_t  PWM47_RST:1;
            volatile uint32_t  ACMP_RST:1;
            volatile uint32_t  PS2_RST:1;
            volatile uint32_t  CAN0_RST:1;
            volatile const  uint32_t  RESERVE4:2;
            volatile uint32_t  USBD_RST:1;
            volatile uint32_t  ADC_RST:1;
            volatile uint32_t  I2S_RST:1;
            volatile const  uint32_t  RESERVE5:2;
        } IPRSTC2;
    };    

    union 
    {
        volatile uint32_t u32CPR;
        
        struct 
        {
            volatile uint32_t  HPE:1;
            volatile const  uint32_t  RESERVE:31;
        } CPR;
    };    

    uint32_t RESERVE0;
    
    union 
    {
        volatile uint32_t u32BODCR;
        
        struct 
        {
            volatile uint32_t  BOD_EN:1;
            volatile uint32_t  BOD_VL:2;
            volatile uint32_t  BOD_RSTEN:1;
            volatile uint32_t  BOD_INTF:1;
            volatile uint32_t  BOD_LPM:1;
            volatile uint32_t  BOD_OUT:1;
            volatile uint32_t  LVR_EN:1;
            volatile const  uint32_t  RESERVE1:24;
        } BODCR;
    };

    union 
    {
        volatile uint32_t u32TEMPCR;
        
        struct 
        {
            volatile uint32_t  VTEMP_EN:1;
            volatile const  uint32_t  RESERVE:31;
        } TEMPCR;
    };   
    
    uint32_t RESERVE1;
    
    union 
    {
        volatile uint32_t u32PORCR;
        volatile uint32_t PORCR;
    };   

    uint32_t RESERVE2[2];

    union 
    {
        volatile uint32_t u32GPAMFP;
        
        struct 
        {
            volatile uint32_t ADC0:1;
            volatile uint32_t ADC1_AD12:1;
            volatile uint32_t ADC2_AD11:1;
            volatile uint32_t ADC3_AD10:1;
            volatile uint32_t ADC4_AD9:1;
            volatile uint32_t ADC5_AD8:1;
            volatile uint32_t ADC6_AD7:1;
            volatile uint32_t ADC7_SS21_AD6:1;
            volatile uint32_t I2C0_SDA:1;
            volatile uint32_t I2C0_SCL:1;
            volatile uint32_t I2C1_SDA_nWR:1;
            volatile uint32_t I2C1_SCL_nRD:1;
            volatile uint32_t PWM0_AD13:1;
            volatile uint32_t PWM1_AD14:1;
            volatile uint32_t PWM2_AD15:1;
            volatile uint32_t PWM3_I2SMCLK:1;
            volatile uint32_t SCHMITT:16;   
        } GPAMFP;
    };   
    
    union 
    {
        volatile uint32_t u32GPBMFP;
        
        struct 
        {
            volatile uint32_t UART0_RX:1;
            volatile uint32_t UART0_TX:1;
            volatile uint32_t UART0_nRTS_nWRL:1;
            volatile uint32_t UART0_nCTS_nWRH:1;
            volatile uint32_t UART1_RX:1;
            volatile uint32_t UART1_TX:1;
            volatile uint32_t UART1_nRTS_ALE:1;
            volatile uint32_t UART1_nCTS_nCS:1;
            volatile uint32_t TM0:1;
            volatile uint32_t TM1_SS11:1;                              
            volatile uint32_t TM2_SS01:1;
            volatile uint32_t TM3_PWM4:1;                     
            volatile uint32_t CPO0_CLKO_AD0:1;
            volatile uint32_t CPO1_AD1:1;
            volatile uint32_t INT0_SS31:1;
            volatile uint32_t INT1:1;
            volatile uint32_t SCHMITT:16;    
        } GPBMFP;
    };   
    
    union 
    {
        volatile uint32_t u32GPCMFP;
        
        struct 
        {
            volatile uint32_t SPI0_SS0_I2SLRCLK:1;
            volatile uint32_t SPI0_CLK_I2SBCLK:1;
            volatile uint32_t SPI0_MISO0_I2SDI:1;
            volatile uint32_t SPI0_MOSI0_I2SDO:1;
            volatile uint32_t SPI0_MISO1:1;
            volatile uint32_t SPI0_MOSI1:1;
            volatile uint32_t CPP0_AD4:1;
            volatile uint32_t CPN0_AD5:1;
            volatile uint32_t SPI1_SS0_MCLK:1;
            volatile uint32_t SPI1_CLK:1;
            volatile uint32_t SPI1_MISO0:1;
            volatile uint32_t SPI1_MOSI0:1;
            volatile uint32_t SPI1_MISO1:1;
            volatile uint32_t SPI1_MOSI1:1;
            volatile uint32_t CPP1_AD2:1;
            volatile uint32_t CPN1_AD3:1;
            volatile uint32_t SCHMITT:16; 
        } GPCMFP;
    };   
    
    union 
    {
        volatile uint32_t u32GPDMFP;
        
        struct 
        {
            volatile uint32_t SPI2_SS0:1;
            volatile uint32_t SPI2_CLK_SPI0_SS1:1;
            volatile uint32_t SPI2_MISO0_SPI0_MISO1:1;
            volatile uint32_t SPI2_MOSI0_SPI0_MOSI1:1;
            volatile uint32_t SPI2_MISO1:1;
            volatile uint32_t SPI2_MOSI1:1;
            volatile uint32_t CAN0_RX:1;
            volatile uint32_t CAN0_TX:1;
            volatile uint32_t SPI3_SS0:1;
            volatile uint32_t SPI3_CLK:1;
            volatile uint32_t SPI3_MISO0:1;
            volatile uint32_t SPI3_MOSI0:1;
            volatile uint32_t SPI3_MISO1:1;
            volatile uint32_t SPI3_MOSI1:1;
            volatile uint32_t UART2_RX:1;
            volatile uint32_t UART2_TX:1;
            volatile uint32_t SCHMITT:16;
        } GPDMFP;
    };   
    
    union 
    {
        volatile uint32_t u32GPEMFP;
        
        struct 
        {
            volatile uint32_t  PWM6:1;
            volatile uint32_t  PWM7:1;
            volatile const  uint32_t  RESERVE1:3;
            volatile uint32_t  PWM5:1;
            volatile const  uint32_t  RESERVE2:10;
            volatile uint32_t  SCHMITT:16;
        } GPEMFP;
    };                   
    
    uint32_t RESERVE3[3];
     
    union 
    {
        volatile uint32_t u32ALTMFP;
        
        struct 
        {
            volatile uint32_t  PB10_S01:1;       
            volatile uint32_t  PB9_S11:1;        
            volatile uint32_t  PA7_S21:1;        
            volatile uint32_t  PB14_S31:1;       
            volatile uint32_t  PB11_PWM4:1;      
            volatile uint32_t  PC0_I2SLRCLK:1;   
            volatile uint32_t  PC1_I2SBCLK:1;    
            volatile uint32_t  PC2_I2SDI:1;      
            volatile uint32_t  PC3_I2SDO:1;      
            volatile uint32_t  PA15_I2SMCLK:1;   
            volatile uint32_t  PB12_CLKO:1;      
            volatile uint32_t  EBI_EN:1;            
            volatile uint32_t  EBI_MCLK_EN:1;    
            volatile uint32_t  EBI_WRL_EN:1;     
            volatile uint32_t  EBI_WRH_EN:1;     
            volatile const  uint32_t  RESERVE0:1;  
            volatile uint32_t  EBI_HB_EN:8;     
            volatile uint32_t  PB15_T0EX:1;
            volatile uint32_t  PE5_T1EX:1;
            volatile uint32_t  PB2_T2EX:1;
            volatile uint32_t  PB3_T3EX:1;
            volatile const  uint32_t  RESERVE1:4;  
        } ALTMFP;
    };   
    
    uint32_t RESERVE4[43];
    
    union 
    {
        volatile uint32_t u32REGWRPROT;
        volatile uint32_t REGWRPROT;
    };  
} GCR_T;

 





















 












 


































































 



 





















 



 



 







 






 






 






 












 




























































 




typedef struct
{
    volatile uint32_t  INTSRC:4;
    volatile const  uint32_t  RESERVE:28;
} GCR_IRQSRC_T;

typedef struct
{
    volatile uint32_t  NMISEL:5;
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  NMI_EN:1;
    volatile const  uint32_t  RESERVE1:23;
} GCR_NMISEL_T;


typedef volatile uint32_t GCR_MCUIRQ_T;

typedef struct
{
    union 
    {
        volatile const uint32_t u32IRQSRC[32];
        volatile const uint32_t IRQSRC[32];
    };

    union 
    {
        volatile uint32_t u32NMISEL;
        
        struct 
        {
            volatile uint32_t  NMISEL:5;
            volatile const  uint32_t  RESERVE0:3;
            volatile uint32_t  NMI_EN:1;
            volatile const  uint32_t  RESERVE1:23;
        } NMISEL;
    };

    union 
    {
        volatile uint32_t u32MCUIRQ;
        volatile uint32_t MCUIRQ;
    };
} GCR_INT_T;

 



 






 
typedef struct
{
    volatile uint32_t  ISPEN:1;
    volatile uint32_t  BS:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  APUEN:1;
    volatile uint32_t  CFGUEN:1;
    volatile uint32_t  LDUEN:1;
    volatile uint32_t  ISPFF:1;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  PT:3;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  ET:3;
    volatile const  uint32_t  RESERVE3:17;

} FMC_ISPCON_T;

typedef volatile uint32_t FMC_ISPADR_T;
typedef volatile uint32_t FMC_ISPDAT_T;

typedef struct
{
    volatile uint32_t  FCTRL:4;
    volatile uint32_t  FCEN:1;
    volatile uint32_t  FOEN:1;
    volatile const  uint32_t  RESERVE:26;
} FMC_ISPCMD_T;

typedef struct
{
    volatile uint32_t  ISPGO:1;
    volatile const  uint32_t  RESERVE:31;
} FMC_ISPTRG_T;

typedef volatile const uint32_t FMC_DFBADR_T;

typedef struct
{
    volatile uint32_t  FPSEN:1;
    volatile uint32_t  FATS:3;
    volatile uint32_t  LFOM:1;
    volatile const  uint32_t  RESERVE:27;
} FMC_FATCON_T;

typedef struct
{
    union 
    {
        volatile uint32_t u32ISPCON;
        
        struct 
        {
            volatile uint32_t  ISPEN:1;
            volatile uint32_t  BS:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  APUEN:1;
            volatile uint32_t  CFGUEN:1;
            volatile uint32_t  LDUEN:1;
            volatile uint32_t  ISPFF:1;
            volatile const  uint32_t  RESERVE1:1;
            volatile uint32_t  PT:3;
            volatile const  uint32_t  RESERVE2:1;
            volatile uint32_t  ET:3;
            volatile const  uint32_t  RESERVE3:17;
        } ISPCON;
    };

    union 
    {
        volatile uint32_t u32ISPADR;
        volatile uint32_t ISPADR;
    };

    union 
    {
        volatile uint32_t u32ISPDAT;
        volatile uint32_t ISPDAT;
    };
    
    union 
    {
        volatile uint32_t u32ISPCMD;
        
        struct 
        {
            volatile uint32_t  FCTRL:4;
            volatile uint32_t  FCEN:1;
            volatile uint32_t  FOEN:1;
            volatile const  uint32_t  RESERVE:26;
        } ISPCMD;
    };

    union 
    {
        volatile uint32_t u32ISPTRG;
        
        struct 
        {
            volatile uint32_t  ISPGO:1;
            volatile const  uint32_t  RESERVE:31;
        } ISPTRG;
    };
    
    union 
    {
        volatile const uint32_t u32DFBADR;
        volatile const uint32_t DFBADR;
    };

    union 
    {
        volatile uint32_t u32FATCON;
        
        struct 
        {
            volatile uint32_t  FPSEN:1;
            volatile uint32_t  FATS:3;
            volatile uint32_t  LFOM:1;
            volatile const  uint32_t  RESERVE:27;
        } FATCON;
    };
} FMC_T;

 
























 



 



 









 



 



 









 
typedef struct
{
    volatile uint32_t  PS2EN:1;
    volatile uint32_t  TXINTEN:1;
    volatile uint32_t  RXINTEN:1;
    volatile uint32_t  TXFIFO_DEPTH:4;
    volatile uint32_t  ACK:1;
    volatile uint32_t  CLRFIFO:1;
    volatile uint32_t  OVERRIDE:1;
    volatile uint32_t  FPS2CLK:1;
    volatile uint32_t  FPS2DAT:1;
    volatile const  uint32_t  RESERVE:20;
} PS2_CON_T;

typedef volatile uint32_t PS2_DATA_T;

typedef struct
{
    volatile uint32_t  PS2CLK:1;
    volatile uint32_t  PS2DATA:1;
    volatile uint32_t  FRAMERR:1;
    volatile uint32_t  RXPARTY:1;
    volatile uint32_t  RXBUSY:1;
    volatile uint32_t  TXBUSY:1;
    volatile uint32_t  RXOVF:1;
    volatile uint32_t  TXEMPTY:1;
    volatile uint32_t  BYTEIDX:4;
    volatile const  uint32_t  RESERVE:20;
} PS2_STATUS_T;

typedef struct
{
    volatile uint32_t  RXINT:1;
    volatile uint32_t  TXINT:1;
    volatile const  uint32_t  RESERVE:30;
} PS2_INTID_T;

typedef struct
{
    union
    {
        volatile uint32_t u32PS2CON;

        struct
        {
            volatile uint32_t  PS2EN:1;
            volatile uint32_t  TXINTEN:1;
            volatile uint32_t  RXINTEN:1;
            volatile uint32_t  TXFIFO_DEPTH:4;
            volatile uint32_t  ACK:1;
            volatile uint32_t  CLRFIFO:1;
            volatile uint32_t  OVERRIDE:1;
            volatile uint32_t  FPS2CLK:1;
            volatile uint32_t  FPS2DAT:1;
            volatile const  uint32_t  RESERVE:20;      
        } PS2CON;
    };

    union
    {
        volatile uint32_t u32TXDATA[4];
        volatile uint32_t TXDATA[4];        
    };

    union
    {
        volatile const uint32_t u32RXDATA;
        volatile const uint32_t RXDATA;
    };

    union
    {
        volatile uint32_t u32STATUS;

        struct
        {
            volatile uint32_t  PS2CLK:1;
            volatile uint32_t  PS2DATA:1;
            volatile uint32_t  FRAMERR:1;
            volatile uint32_t  RXPARTY:1;
            volatile uint32_t  RXBUSY:1;
            volatile uint32_t  TXBUSY:1;
            volatile uint32_t  RXOVF:1;
            volatile uint32_t  TXEMPTY:1;
            volatile uint32_t  BYTEIDX:4;
            volatile const  uint32_t  RESERVE:20;            
        } STATUS;
    };

    union
    {
        volatile uint32_t u32INTID;

        struct
        {
            volatile uint32_t  RXINT:1;
            volatile uint32_t  TXINT:1;
            volatile const  uint32_t  RESERVE:30;
        } INTID;          
    };
} PS2_T;

 



























 



 






























 


                     



 

 

 
typedef struct
{
    union 
    {
        volatile uint32_t u32CREQ;

        struct {
            volatile uint32_t  MSG_NUM:6;
            volatile const  uint32_t  RESERVE0:9;
            volatile uint32_t  BUSY:1;	  
            volatile const  uint32_t  RESERVE1:16;
        } CREQ;
    };
 
 
    union {
        volatile uint32_t  	u32CMASK;
        		
        struct {
            volatile uint32_t  DAT_B:1;
            volatile uint32_t  DAT_A:1;
            volatile uint32_t  TXRQST_NEWDAT:1;
            volatile uint32_t  CLRINTPND:1;
            volatile uint32_t  CONTROL:1;
            volatile uint32_t  ARB:1;
            volatile uint32_t  MASK:1;
            volatile uint32_t  WRRD:1;
            volatile const  uint32_t  RESERVE0:24;
        } CMASK;
    };
 
    
    union {
        volatile uint32_t  	u32MASK1;
        		
        struct {
            volatile uint32_t  MASK15_0:16;
            volatile const  uint32_t  RESERVE0:16;
        } MASK1;
    };


    union {
        volatile uint32_t  	u32MASK2;
        		
        struct {
            volatile uint32_t  MASK28_16:13;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  MDIR:1;
            volatile uint32_t  MXTD:1;
            volatile const  uint32_t  RESERVE1:16;
        } MASK2;
    };
    
    union {
        volatile uint32_t  	u32ARB1;

        struct {
            volatile uint32_t  ID15_0:16;
            volatile const  uint32_t  RESERVE0:16;
        } ARB1;
    };    
 

    union {
        volatile uint32_t  	u32ARB2;	

        struct {
            volatile uint32_t  ID28_16:13;
            volatile uint32_t  DIR:1;
            volatile uint32_t  XTD:1;
            volatile uint32_t  MSGVAL:1;
            volatile const  uint32_t  RESERVE0:16;
        } ARB2;
    };    

    
    union {
        volatile uint32_t  	u32MCON;			

        struct {
            volatile uint32_t  DLC:4;
            volatile const  uint32_t  RESERVE0:3;
            volatile uint32_t  EOB:1;
            volatile uint32_t  TXRQST:1;
            volatile uint32_t  RMTEN:1;
            volatile uint32_t  RXIE:1;
            volatile uint32_t  TXIE:1;
            volatile uint32_t  UMASK:1;
            volatile uint32_t  INTPND:1;
            volatile uint32_t  MSGLST:1;
            volatile uint32_t  NEWDAT:1;
            volatile const  uint32_t  RESERVE1:16;
         } MCON;
    };    

    union {
        volatile uint32_t	u32DAT_A1;			

        struct {
            volatile uint32_t  DATA0:8;
            volatile uint32_t  DATA1:8;
            volatile const  uint32_t  RESERVE0:16;
        } DAT_A1;
    };     
    
    union {
        volatile uint32_t 	u32DAT_A2;		

        struct {
            volatile uint32_t  DATA2:8;
            volatile uint32_t  DATA3:8;
            volatile const  uint32_t  RESERVE0:16;
        } DAT_A2;
    };     
    
    union {
        volatile uint32_t 	u32DAT_B1;

        struct {
            volatile uint32_t  DATA4:8;
            volatile uint32_t  DATA5:8;
            volatile const  uint32_t  RESERVE0:16;
        } DAT_B1;
    };     

    union {
        volatile uint32_t	u32DAT_B2;		

        struct {
            volatile uint32_t  DATA6:8;
            volatile uint32_t  DATA7:8;
            volatile const  uint32_t  RESERVE0:16;
        } DAT_B2;
    };     


  volatile const uint32_t RESERVE0[13];        
                                    
} CAN_MsgObj_T;


typedef struct
{
    union {
        volatile uint32_t   u32CON;		 	
        
        struct {
            volatile uint32_t  INIT:1;
            volatile uint32_t  IE:1;
            volatile uint32_t  SIE:1;
            volatile uint32_t  EIE:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  DAR:1;	  
            volatile uint32_t  CCE:1;
            volatile uint32_t  TEST:1;
            volatile const  uint32_t  RESERVE1:24;
        } CON;
    };

    union {
        volatile uint32_t   u32STATUS;	

        struct {
            volatile uint32_t  LEC:3;
            volatile uint32_t  TXOK:1;
            volatile uint32_t  RXOK:1;
            volatile uint32_t  EPASS:1;
            volatile uint32_t  EWARN:1;	  
            volatile uint32_t  BOFF:1;
            volatile const  uint32_t  RESERVE0:24;
        } STATUS;
    };

    union {
        volatile uint32_t   u32ERR;     		
        
        struct {
            volatile uint32_t  TEC:8;
            volatile uint32_t  REC:7;
            volatile uint32_t  RP:1;
            volatile const  uint32_t  RESERVE0:16;
        } ERR;
    };  	

    union {
	    volatile uint32_t   u32BTIME;
        
        struct {
            volatile uint32_t  BRP:6;
            volatile uint32_t  SJW:2;
            volatile uint32_t  TSEG1:4;
            volatile uint32_t  TSEG2:3;
            volatile const  uint32_t  RESERVE0:17;
        } BTIME;
    };
	
    union {
        volatile uint32_t   u32IIDR;
        
        struct {
            volatile uint32_t  INTID:16;
            volatile const  uint32_t  RESERVE0:16;
        } IIDR;
    };

   union {
        volatile uint32_t   u32TEST;
                 
        struct {
            volatile const  uint32_t  RESERVE0:2;
            volatile uint32_t  BASIC:1;
            volatile uint32_t  SILENT:1;
            volatile uint32_t  LBACK:1;
            volatile uint32_t  TX:2;
            volatile uint32_t  RX:1;	  
            volatile const  uint32_t  RESERVE1:24;
        } TEST;
   };
    
   union {
        volatile uint32_t   u32BRPE;
        
        struct {
            volatile uint32_t  BPRE:4;
            volatile const  uint32_t  RESERVE0:28;
        } BRPE;
   };
    volatile const uint32_t   	RESERVE0[1];     
	
    CAN_MsgObj_T    sMsgObj[2];             
                              
	volatile const uint32_t   	RESERVE1[8];

   union {
        volatile uint32_t   u32TXREQ1;
        
        struct {
            volatile uint32_t  TXRQST16_1:16;
            volatile const  uint32_t  RESERVE0:16;
        } TXREQ1;
   };


   union {
        volatile uint32_t   u32TXREQ2;
        
        struct {
            volatile uint32_t  TXRQST32_17:16;
            volatile const  uint32_t  RESERVE0:16;
        } TXREQ2;
   };

    volatile const uint32_t   	RESERVE2[6];        

   union {
        volatile uint32_t   u32NDAT1;

        struct {
            volatile uint32_t  NEWDAT16_1:16;
            volatile const  uint32_t  RESERVE0:16;
        } NDAT1;
   };

   union {
        volatile uint32_t   u32NDAT2;

        struct {
            volatile uint32_t  NEWDAT32_17:16;
            volatile const  uint32_t  RESERVE0:16;
        } NDAT2;
   };

    volatile const uint32_t   	RESERVE3[6];

   union {
        volatile uint32_t   u32IPND1;

        struct {
            volatile uint32_t  IPND16_1:16;
            volatile const  uint32_t  RESERVE0:16;
        } IPND1;
   };

   union {
        volatile uint32_t   u32IPND2;

        struct {
            volatile uint32_t  IPND32_17:16;
            volatile const  uint32_t  RESERVE0:16;
        } IPND2;
   };

    volatile const uint32_t   	RESERVE4[6];

   union {
        volatile uint32_t   u32MVLD1;

        struct {
            volatile uint32_t  MSGVAL16_1:16;
            volatile const  uint32_t  RESERVE0:16;
        } MVLD1;
   };

   union {
        volatile uint32_t   u32MVLD2;

        struct {
            volatile uint32_t  MSGVAL32_17:16;
            volatile const  uint32_t  RESERVE0:16;
        } MVLD2;
   };
    
    union {
        volatile uint32_t   u32WU_EN;            
        struct {
            volatile uint32_t  WAKUP_EN:1;
            volatile const  uint32_t  RESERVE0:31;
        } WU_EN;
    }; 

    union {
        volatile uint32_t   u32WU_STATUS;
        struct {
            volatile uint32_t  WAKUP_STS:1;
            volatile const  uint32_t  RESERVE0:31;
        } WU_STATUS;
    }; 

    
} CAN_T;


 





















 


















 









 












 



 








             









 



 






 














  









 



 









 



 












 






























 






 






 






 






 



 



 



 



 



 



 



 



 



 


                                  
 
typedef struct
{
    volatile uint32_t  BUS_IE:1;
    volatile uint32_t  USB_IE:1;
    volatile uint32_t  FLDET_IE:1;
    volatile uint32_t  WAKEUP_IE:1;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  WAKEUP_EN:1;
    volatile const  uint32_t  RESERVE1:6;
    volatile uint32_t  INNAK_EN:1;
    volatile const  uint32_t  RESERVE2:16;
} USBD_INTEN_T;

typedef struct
{
    volatile uint32_t  BUS_STS:1;
    volatile uint32_t  USB_STS:1;
    volatile uint32_t  FLDET_STS:1;
    volatile uint32_t  WAKEUP_STS:1;
    volatile const  uint32_t  RESERVE0:12;
    volatile uint32_t  EPEVT:6;
    volatile const  uint32_t  RESERVE1:9;
    volatile uint32_t  SETUP:1;
} USBD_INTSTS_T;

typedef struct
{
    volatile uint32_t  FADDR:7;
    volatile const  uint32_t  RESERVE:25;
} USBD_FADDR_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:7;
    volatile const  uint32_t  OVERRUN:1;
    volatile const  uint32_t  EPSTS0:3;
    volatile const  uint32_t  EPSTS1:3;
    volatile const  uint32_t  EPSTS2:3;
    volatile const  uint32_t  EPSTS3:3;
    volatile const  uint32_t  EPSTS4:3;
    volatile const  uint32_t  EPSTS5:3;
    volatile const  uint32_t  RESERVE1:6;
} USBD_EPSTS_T;



typedef struct
{
    volatile const  uint32_t  USBRST:1;
    volatile const  uint32_t  SUSPEND:1;
    volatile const  uint32_t  RESUME:1;
    volatile const  uint32_t  TIMEOUT:1;
    volatile uint32_t  PHY_EN:1;
    volatile uint32_t  RWAKEUP:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  USB_EN:1;
    volatile uint32_t  DPPU_EN:1;
    volatile uint32_t  PWRDN:1;
    volatile const  uint32_t  RESERVE1:22;
} USBD_ATTR_T;



typedef struct
{
    volatile uint32_t  FLDET:1;
    volatile const  uint32_t  RESERVE:31;
} USBD_FLDET_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  STBUFSEG:6;
    volatile const  uint32_t  RESERVE:23;
} USBD_STBUFSEG_T;

typedef struct
{
    volatile uint32_t  MXPLD:9;
    volatile const  uint32_t  RESERVE:23;
} USBD_MXPLD_T;

typedef struct
{
    volatile uint32_t  EP_NUM:4;
    volatile uint32_t  ISOCH:1;
    volatile uint32_t  STATE:2;
    volatile uint32_t  DSQ_SYNC:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CSTALL:1;
    volatile const  uint32_t  RESERVE1:22;
} USBD_CFG_T;

typedef struct
{
    volatile uint32_t  CLRRDY:1;
    volatile uint32_t  SSTALL:1;
    volatile const  uint32_t  RESERVE:30;
} USBD_CFGP_T;

typedef struct
{
    volatile uint32_t  DRVSE0:1;
    volatile const  uint32_t  RESERVE:31;
} USBD_DRVSE0_T;

typedef struct
{
    union {
        volatile uint32_t u32BUFSEG;
        struct {
            volatile const  uint32_t  RESERVE0:3;
            volatile uint32_t  BUFSEG:6;
            volatile const  uint32_t  RESERVE:23;
        } BUFSEG;
    };
    
    union {
        volatile uint32_t u32MXPLD;
        struct {
            volatile uint32_t  MXPLD:9;
            volatile const  uint32_t  RESERVE:23;
        } MXPLD;
    };
    
    union {
        volatile uint32_t u32CFG;
        struct {
            volatile uint32_t  EP_NUM:4;
            volatile uint32_t  ISOCH:1;
            volatile uint32_t  STATE:2;
            volatile uint32_t  DSQ_SYNC:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  CSTALL:1;
            volatile const  uint32_t  RESERVE1:22;
        } CFG;
    };
    
    union {
        volatile uint32_t u32CFGP;
        struct {
            volatile uint32_t  CLRRDY:1;
            volatile uint32_t  SSTALL:1;
            volatile const  uint32_t  RESERVE:30;
        } CFGP;
    };
    
} USBD_EP_T;


typedef struct
{
    union {
        volatile uint32_t u32INTEN;
        struct {
            volatile uint32_t  BUS_IE:1;
            volatile uint32_t  USB_IE:1;
            volatile uint32_t  FLDET_IE:1;
            volatile uint32_t  WAKEUP_IE:1;
            volatile const  uint32_t  RESERVE0:4;
            volatile uint32_t  WAKEUP_EN:1;
            volatile const  uint32_t  RESERVE1:6;
            volatile uint32_t  INNAK_EN:1;
            volatile const  uint32_t  RESERVE2:16;
        } INTEN;
    };
    
    union {
        volatile uint32_t u32INTSTS;
        struct {
            volatile uint32_t  BUS_STS:1;
            volatile uint32_t  USB_STS:1;
            volatile uint32_t  FLDET_STS:1;
            volatile uint32_t  WAKEUP_STS:1;
            volatile const  uint32_t  RESERVE0:12;
            volatile uint32_t  EPEVT:6;
            volatile const  uint32_t  RESERVE1:9;
            volatile uint32_t  SETUP:1;
        } INTSTS;
    };
    
    union {
        volatile uint32_t u32FADDR;
        struct {
            volatile uint32_t  FADDR:7;
            volatile const  uint32_t  RESERVE:25;
        } FADDR;
    };
    
    union {
        volatile uint32_t u32EPSTS;
        struct {
            volatile const  uint32_t  RESERVE0:7;
            volatile const  uint32_t  OVERRUN:1;
            volatile const  uint32_t  EPSTS0:3;
            volatile const  uint32_t  EPSTS1:3;
            volatile const  uint32_t  EPSTS2:3;
            volatile const  uint32_t  EPSTS3:3;
            volatile const  uint32_t  EPSTS4:3;
            volatile const  uint32_t  EPSTS5:3;
            volatile const  uint32_t  RESERVE1:6;
        } EPSTS;
    };
    
    union {
        volatile uint32_t u32ATTR;
        struct {
            volatile const  uint32_t  USBRST:1;
            volatile const  uint32_t  SUSPEND:1;
            volatile const  uint32_t  RESUME:1;
            volatile const  uint32_t  TIMEOUT:1;
            volatile uint32_t  PHY_EN:1;
            volatile uint32_t  RWAKEUP:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  USB_EN:1;
            volatile uint32_t  DPPU_EN:1;
            volatile uint32_t  PWRDN:1;
            volatile const  uint32_t  RESERVE1:22;
        } ATTR;
    };
    
    union {
        volatile uint32_t u32FLDET;
        struct {
            volatile const  uint32_t  FLDET:1;
            volatile const  uint32_t  RESERVE:31;
        } FLDET;
    };
    
    union {
        volatile uint32_t u32STBUFSEG;
        struct {
            volatile const  uint32_t  RESERVE0:3;
            volatile uint32_t  STBUFSEG:6;
            volatile const  uint32_t  RESERVE:23;
        } STBUFSEG;
    };
    
    volatile const uint32_t RESERVE0;
    
    USBD_EP_T EP[6];
    
    volatile const uint32_t RESERVE1[4];
    
    union {
        volatile uint32_t u32DRVSE0;
        struct {
            volatile uint32_t  DRVSE0:1;
            volatile const  uint32_t  RESERVE:31;
        } DRVSE0;
    };
    
     volatile const uint32_t RESERVE2[4];
    
} USBD_T;

 


















 


















 



 





















 



























 



 



 



 



 















 






 




 
typedef struct
{
    volatile uint32_t  PDMACEN:1;
    volatile uint32_t  SW_RST:1;
    volatile uint32_t  MODE_SEL:2;
    volatile uint32_t  SAD_SEL:2;
    volatile uint32_t  DAD_SEL:2;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  WAR_BCR_SEL:4;
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  APB_TWS:2;
    volatile const  uint32_t  RESERVE2:2;
    volatile uint32_t  TRIG_EN:1;
    volatile const  uint32_t  RESERVE3:8;
} PDMA_CSR_T;

typedef volatile uint32_t PDMA_SAR_T;
typedef volatile uint32_t PDMA_DAR_T;

typedef volatile uint32_t PDMA_BCR_T;

typedef volatile const uint32_t PDMA_CSAR_T;
typedef volatile const uint32_t PDMA_CDAR_T;

typedef struct
{
    volatile const uint32_t  CBCR:16;
    volatile const  uint32_t  RESERVE:16;
} PDMA_CBCR_T;

typedef struct
{
    volatile uint32_t  TABORT_IE:1;
    volatile uint32_t  BLKD_IE:1;
    volatile const  uint32_t  RESERVE:30;
} PDMA_IER_T;

typedef struct
{
    volatile uint32_t  TABORT_IF:1;
    volatile uint32_t  BLKD_IF:1;
    volatile const  uint32_t  RESERVE:30;
} PDMA_ISR_T;

typedef volatile const uint32_t PDMA_SBUF_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:8;
    volatile uint32_t  CLK0_EN:1;
    volatile uint32_t  CLK1_EN:1;
    volatile uint32_t  CLK2_EN:1;
    volatile uint32_t  CLK3_EN:1;
    volatile uint32_t  CLK4_EN:1;
    volatile uint32_t  CLK5_EN:1;
    volatile uint32_t  CLK6_EN:1;
    volatile uint32_t  CLK7_EN:1;
    volatile uint32_t  CLK8_EN:1;
    volatile const  uint32_t  RESERVE1:15;
} PDMA_GCRCSR_T;


typedef struct
{
    volatile uint32_t  SPI0_RXSEL:4;
    volatile uint32_t  SPI0_TXSEL:4;
    volatile uint32_t  SPI1_RXSEL:4;
    volatile uint32_t  SPI1_TXSEL:4;
    volatile uint32_t  SPI2_RXSEL:4;
    volatile uint32_t  SPI2_TXSEL:4;
    volatile uint32_t  SPI3_RXSEL:4;
    volatile uint32_t  SPI3_TXSEL:4;
} PDMA_PDSSR0_T;


typedef struct
{
    volatile uint32_t  UART0_RXSEL:4;
    volatile uint32_t  UART0_TXSEL:4;
    volatile uint32_t  UART1_RXSEL:4;
    volatile uint32_t  UART1_TXSEL:4;
    volatile uint32_t  RESERVE0:8;
    volatile uint32_t  ADC_RXSEL:4;
    volatile uint32_t  RESERVE1:4;
} PDMA_PDSSR1_T;
                                                        

typedef struct
{
    volatile const uint32_t  INTR0:1;
    volatile const uint32_t  INTR1:1;
    volatile const uint32_t  INTR2:1;
    volatile const uint32_t  INTR3:1;
    volatile const uint32_t  INTR4:1;
    volatile const uint32_t  INTR5:1;
    volatile const uint32_t  INTR6:1;
    volatile const uint32_t  INTR7:1;
    volatile const uint32_t  INTR8:1;
    volatile const uint32_t  RESERVE:22;
    volatile const uint32_t  INTR:1;
} PDMA_GCRISR_T;


typedef struct
{
    volatile uint32_t  I2S_RXSEL:4;
    volatile uint32_t  I2S_TXSEL:4;
    volatile const  uint32_t  RESERVE:24;
} PDMA_PDSSR2_T;

typedef struct
{
    union 
    {
        volatile uint32_t u32CSR;
        
        struct 
        {
            volatile uint32_t  PDMACEN:1;
            volatile uint32_t  SW_RST:1;
            volatile uint32_t  MODE_SEL:2;
            volatile uint32_t  SAD_SEL:2;
            volatile uint32_t  DAD_SEL:2;
            volatile const  uint32_t  RESERVE0:11;
            volatile uint32_t  APB_TWS:2;
            volatile const  uint32_t  RESERVE1:2;
            volatile uint32_t  TRIG_EN:1;
            volatile const  uint32_t  RESERVE2:8;
        } CSR;
    };

    union 
    {
        volatile uint32_t u32SAR;
        volatile uint32_t SAR;
    };

    union 
    {
        volatile uint32_t u32DAR;
        volatile uint32_t DAR;
    };

    union 
    {
        volatile uint32_t u32BCR;
        
        struct 
        {
            volatile uint32_t  BCR:16;
            volatile const  uint32_t  RESERVE0:16;
        } BCR;
    };

    union 
    {
        volatile const uint32_t u32POINT;
        
        struct 
        {
            volatile const  uint32_t  POINT:4;
            volatile const  uint32_t  RESERVE0:28;
        } POINT;
    };

    union 
    {
        volatile const uint32_t u32CSAR;
        volatile const uint32_t CSAR;
    };

    union 
    {
        volatile const uint32_t u32CDAR;
        volatile const uint32_t CDAR;
    };

    union 
    {
        volatile const uint32_t u32CBCR;
        
        struct 
        {
            volatile const uint32_t  CBCR:16;
            volatile const  uint32_t  RESERVE0:16;
        } CBCR;
    };

    union 
    {
        volatile uint32_t u32IER;
        
        struct 
        {
            volatile uint32_t  TABORT_IE:1;
            volatile uint32_t  BLKD_IE:1;
            volatile const  uint32_t  RESERVE:30;
        } IER;
    };

    union 
    {
        volatile uint32_t u32ISR;
        
        struct 
        {
            volatile uint32_t  TABORT_IF:1;
            volatile uint32_t  BLKD_IF:1;
            volatile const  uint32_t  RESERVE:30;
        } ISR;
    };

    volatile const uint32_t RESERVE[22];

    union 
    {
        volatile const uint32_t u32SBUF;
        volatile const uint32_t SBUF;
    };
} PDMA_T;

typedef struct
{
    union 
    {
        volatile uint32_t u32GCRCSR;
        
        struct 
        {
            volatile const  uint32_t  RESERVE0:8;
            volatile uint32_t  CLK0_EN:1;
            volatile uint32_t  CLK1_EN:1;
            volatile uint32_t  CLK2_EN:1;
            volatile uint32_t  CLK3_EN:1;
            volatile uint32_t  CLK4_EN:1;
            volatile uint32_t  CLK5_EN:1;
            volatile uint32_t  CLK6_EN:1;
            volatile uint32_t  CLK7_EN:1;
            volatile uint32_t  CLK8_EN:1;
            volatile const  uint32_t  RESERVE1:15;
        } GCRCSR;
    };

    union 
    {
        volatile uint32_t u32PDSSR0;
        
        struct 
        {
            volatile uint32_t  SPI0_RXSEL:4;
            volatile uint32_t  SPI0_TXSEL:4;
            volatile uint32_t  SPI1_RXSEL:4;
            volatile uint32_t  SPI1_TXSEL:4;
            volatile uint32_t  SPI2_RXSEL:4;
            volatile uint32_t  SPI2_TXSEL:4;
            volatile uint32_t  SPI3_RXSEL:4;
            volatile uint32_t  SPI3_TXSEL:4;
        } PDSSR0;
    };

    union 
    {
        volatile uint32_t u32PDSSR1;
        
        struct 
        {
            volatile uint32_t  UART0_RXSEL:4;
            volatile uint32_t  UART0_TXSEL:4;
            volatile uint32_t  UART1_RXSEL:4;
            volatile uint32_t  UART1_TXSEL:4;
            volatile uint32_t  RESERVE0:8;
            volatile uint32_t  ADC_RXSEL:4;
            volatile uint32_t  RESERVE1:4;
        } PDSSR1;
    };

    union 
    {
        volatile uint32_t u32GCRISR;
        
        struct 
        {
            volatile const uint32_t  INTR0:1;
            volatile const uint32_t  INTR1:1;
            volatile const uint32_t  INTR2:1;
            volatile const uint32_t  INTR3:1;
            volatile const uint32_t  INTR4:1;
            volatile const uint32_t  INTR5:1;
            volatile const uint32_t  INTR6:1;
            volatile const uint32_t  INTR7:1;
            volatile const uint32_t  INTR8:1;
            volatile const uint32_t  RESERVE:22;
            volatile const uint32_t  INTR:1;
        } GCRISR;
    };

    union 
    {
        volatile uint32_t u32PDSSR2;
        
        struct 
        {
            volatile uint32_t  I2S_RXSEL:4;
            volatile uint32_t  I2S_TXSEL:4;
            volatile const  uint32_t  RESERVE:24;
        } PDSSR2;
    };
} PDMA_GCR_T;

 





















 



 



 




 






 






 



























 
























 















 






























 






 
typedef struct
{
    volatile uint32_t  CP01:8;
    volatile uint32_t  CP23:8;
    volatile uint32_t  DZI01:8;
    volatile uint32_t  DZI23:8;
} PWM_PPR_T;

typedef struct
{
    volatile uint32_t  CSR0:3;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CSR1:3;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  CSR2:3;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CSR3:3;
    volatile const  uint32_t  RESERVE3:17;
} PWM_CSR_T;

typedef struct
{
    volatile uint32_t  CH0EN:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CH0INV:1;
    volatile uint32_t  CH0MOD:1;
    volatile uint32_t  DZEN01:1;
    volatile uint32_t  DZEN23:1;
    volatile const  uint32_t  RESERVE1:2;
    volatile uint32_t  CH1EN:1;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CH1INV:1;
    volatile uint32_t  CH1MOD:1;
    volatile const  uint32_t  RESERVE3:4;
    volatile uint32_t  CH2EN:1;
    volatile const  uint32_t  RESERVE4:1;
    volatile uint32_t  CH2INV:1;
    volatile uint32_t  CH2MOD:1;
    volatile const  uint32_t  RESERVE5:4;
    volatile uint32_t  CH3EN:1;
    volatile const  uint32_t  RESERVE6:1;
    volatile uint32_t  CH3INV:1;
    volatile uint32_t  CH3MOD:1;
    volatile const  uint32_t  RESERVE7:4;   
} PWM_PCR_T;

typedef volatile uint32_t PWM_CNR_T;

typedef volatile uint32_t PWM_CMR_T;

typedef volatile const  uint32_t PWM_PDR_T;

typedef struct
{
    volatile uint32_t  BCn:1;
    volatile const  uint32_t  RESERVE:31;
} PWM_PBCR_T;

typedef struct
{
    volatile uint32_t  PWMIE0:1;
    volatile uint32_t  PWMIE1:1;
    volatile uint32_t  PWMIE2:1;
    volatile uint32_t  PWMIE3:1;
    volatile const  uint32_t  RESERVE:28;
} PWM_PIER_T;

typedef struct
{
    volatile uint32_t  PWMIF0:1;
    volatile uint32_t  PWMIF1:1;
    volatile uint32_t  PWMIF2:1;
    volatile uint32_t  PWMIF3:1;
    volatile const  uint32_t  RESERVE:28;
} PWM_PIIR_T;

typedef struct
{
    volatile uint32_t  INV0:1;
    volatile uint32_t  CRL_IE0:1;
    volatile uint32_t  CFL_IE0:1;
    volatile uint32_t  CAPCH0EN:1;
    volatile uint32_t  CAPIF0:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CRLRI0:1;
    volatile uint32_t  CFLRI0:1;
    volatile const  uint32_t  RESERVE1:8;
    volatile uint32_t  INV1:1;
    volatile uint32_t  CRL_IE1:1;
    volatile uint32_t  CFL_IE1:1;
    volatile uint32_t  CAPCH1EN:1;
    volatile uint32_t  CAPIF1:1;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CRLRI1:1;
    volatile uint32_t  CFLRI1:1;
    volatile const  uint32_t  RESERVE3:8;
} PWM_CCR0_T;

typedef struct
{
    volatile uint32_t  INV2:1;
    volatile uint32_t  CRL_IE2:1;
    volatile uint32_t  CFL_IE2:1;
    volatile uint32_t  CAPCH2EN:1;
    volatile uint32_t  CAPIF2:1;
    volatile const  uint32_t  RESERVE0:1;
    volatile uint32_t  CRLRI2:1;
    volatile uint32_t  CFLRI2:1;
    volatile const  uint32_t  RESERVE1:8;
    volatile uint32_t  INV3:1;
    volatile uint32_t  CRL_IE3:1;
    volatile uint32_t  CFL_IE3:1;
    volatile uint32_t  CAPCH3EN:1;
    volatile uint32_t  CAPIF3:1;
    volatile const  uint32_t  RESERVE2:1;
    volatile uint32_t  CRLRI3:1;
    volatile uint32_t  CFLRI3:1;
    volatile const  uint32_t  RESERVE3:8;
} PWM_CCR2_T;

typedef volatile uint32_t PWM_CRLR_T;

typedef volatile uint32_t PWM_CFLR_T;

typedef volatile uint32_t PWM_CAPENR_T;

typedef struct
{
    volatile uint32_t  PWM0:1;
    volatile uint32_t  PWM1:1;
    volatile uint32_t  PWM2:1;
    volatile uint32_t  PWM3:1;
    volatile const  uint32_t  RESERVE:28;
} PWM_POE_T;

typedef struct
{
    union 
    {
        volatile uint32_t u32PPR;
        
        struct 
        {
            volatile uint32_t  CP01:8;
            volatile uint32_t  CP23:8;
            volatile uint32_t  DZI01:8;
            volatile uint32_t  DZI23:8;
        } PPR;
    };
    
    union 
    {
        volatile uint32_t u32CSR;
        
        struct 
        {
            volatile uint32_t  CSR0:3;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  CSR1:3;
            volatile const  uint32_t  RESERVE1:1;
            volatile uint32_t  CSR2:3;
            volatile const  uint32_t  RESERVE2:1;
            volatile uint32_t  CSR3:3;
            volatile const  uint32_t  RESERVE3:17;
        } CSR;
    };

    union 
    {
        volatile uint32_t u32PCR;
        
        struct 
        {
            volatile uint32_t  CH0EN:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  CH0INV:1;
            volatile uint32_t  CH0MOD:1;
            volatile uint32_t  DZEN01:1;
            volatile uint32_t  DZEN23:1;
            volatile const  uint32_t  RESERVE1:2;
            volatile uint32_t  CH1EN:1;
            volatile const  uint32_t  RESERVE2:1;
            volatile uint32_t  CH1INV:1;
            volatile uint32_t  CH1MOD:1;
            volatile const  uint32_t  RESERVE3:4;
            volatile uint32_t  CH2EN:1;
            volatile const  uint32_t  RESERVE4:1;
            volatile uint32_t  CH2INV:1;
            volatile uint32_t  CH2MOD:1;
            volatile const  uint32_t  RESERVE5:4;
            volatile uint32_t  CH3EN:1;
            volatile const  uint32_t  RESERVE6:1;
            volatile uint32_t  CH3INV:1;
            volatile uint32_t  CH3MOD:1;
            volatile const  uint32_t  RESERVE7:4;   
        } PCR;
    };

    union 
    {
        volatile uint32_t u32CNR0;
        volatile uint32_t CNR0;
    };

    union 
    {
        volatile uint32_t u32CMR0;
        volatile uint32_t CMR0;
    };

    union 
    {
        volatile const  uint32_t u32PDR0;
        volatile const  uint32_t PDR0;
    };
    
    union 
    {
        volatile uint32_t u32CNR1;
        volatile uint32_t CNR1;
    };

    union 
    {
        volatile uint32_t u32CMR1;
        volatile uint32_t CMR1;
    };

    union 
    {
        volatile const  uint32_t u32PDR1;
        volatile const  uint32_t PDR1;
    };

    union 
    {
        volatile uint32_t u32CNR2;
        volatile uint32_t CNR2;
    };

    union 
    {
        volatile uint32_t u32CMR2;
        volatile uint32_t CMR2;
    };

    union 
    {
        volatile const  uint32_t u32PDR2;
        volatile const  uint32_t PDR2;
    };

    union 
    {
        volatile uint32_t u32CNR3;
        volatile uint32_t CNR3;
    };

    union 
    {
        volatile uint32_t u32CMR3;
        volatile uint32_t CMR3;
    };

    union 
    {
        volatile const  uint32_t u32PDR3;
        volatile const  uint32_t PDR3;
    };

    union 
    {
        volatile uint32_t u32PBCR;
        
        struct 
        {
            volatile uint32_t  BCn:1;
            volatile const  uint32_t  RESERVE:31;
        } PBCR;
    };

    union 
    {
        volatile uint32_t u32PIER;
        
        struct 
        {
            volatile uint32_t  PWMIE0:1;
            volatile uint32_t  PWMIE1:1;
            volatile uint32_t  PWMIE2:1;
            volatile uint32_t  PWMIE3:1;
            volatile const  uint32_t  RESERVE:28;
        } PIER;
    };
    
    union 
    {
        volatile uint32_t u32PIIR;
        
        struct 
        {
            volatile uint32_t  PWMIF0:1;
            volatile uint32_t  PWMIF1:1;
            volatile uint32_t  PWMIF2:1;
            volatile uint32_t  PWMIF3:1;
            volatile const  uint32_t  RESERVE:28;
        } PIIR;
    };    
    
    uint32_t    RESERVE1[2];

    union 
    {
        volatile uint32_t u32CCR0;
        
        struct 
        {
            volatile uint32_t  INV0:1;
            volatile uint32_t  CRL_IE0:1;
            volatile uint32_t  CFL_IE0:1;
            volatile uint32_t  CAPCH0EN:1;
            volatile uint32_t  CAPIF0:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  CRLRI0:1;
            volatile uint32_t  CFLRI0:1;
            volatile const  uint32_t  RESERVE1:8;
            volatile uint32_t  INV1:1;
            volatile uint32_t  CRL_IE1:1;
            volatile uint32_t  CFL_IE1:1;
            volatile uint32_t  CAPCH1EN:1;
            volatile uint32_t  CAPIF1:1;
            volatile const  uint32_t  RESERVE2:1;
            volatile uint32_t  CRLRI1:1;
            volatile uint32_t  CFLRI1:1;
            volatile const  uint32_t  RESERVE3:8;
        } CCR0;
    };
    
    union 
    {
        volatile uint32_t u32CCR2;
        
        struct 
        {
            volatile uint32_t  INV2:1;
            volatile uint32_t  CRL_IE2:1;
            volatile uint32_t  CFL_IE2:1;
            volatile uint32_t  CAPCH2EN:1;
            volatile uint32_t  CAPIF2:1;
            volatile const  uint32_t  RESERVE0:1;
            volatile uint32_t  CRLRI2:1;
            volatile uint32_t  CFLRI2:1;
            volatile const  uint32_t  RESERVE1:8;
            volatile uint32_t  INV3:1;
            volatile uint32_t  CRL_IE3:1;
            volatile uint32_t  CFL_IE3:1;
            volatile uint32_t  CAPCH3EN:1;
            volatile uint32_t  CAPIF3:1;
            volatile const  uint32_t  RESERVE2:1;
            volatile uint32_t  CRLRI3:1;
            volatile uint32_t  CFLRI3:1;
            volatile const  uint32_t  RESERVE3:8;
        } CCR2;
    };    

    union 
    {
        volatile uint32_t u32CRLR0;
        volatile uint32_t CRLR0;
    };

    union 
    {
        volatile uint32_t u32CFLR0;
        volatile uint32_t CFLR0;
    };

    union 
    {
        volatile uint32_t u32CRLR1;
        volatile uint32_t CRLR1;
    };

    union 
    {
        volatile uint32_t u32CFLR1;
        volatile uint32_t CFLR1;
    };

    union 
    {
        volatile uint32_t u32CRLR2;
        volatile uint32_t CRLR2;
    };

    union 
    {
        volatile uint32_t u32CFLR2;
        volatile uint32_t CFLR2;
    };
    
    union 
    {
        volatile uint32_t u32CRLR3;
        volatile uint32_t CRLR3;
    };

    union 
    {
        volatile uint32_t u32CFLR3;
        volatile uint32_t CFLR3;
    };    

    union 
    {
        volatile uint32_t u32CAPENR;
        volatile uint32_t CAPENR;
    };

    union 
    {
        volatile uint32_t u32POE;
        
        struct 
        {
            volatile uint32_t  PWM0:1;
            volatile uint32_t  PWM1:1;
            volatile uint32_t  PWM2:1;
            volatile uint32_t  PWM3:1;
            volatile const  uint32_t  RESERVE:28;
        } POE;
    }; 
} PWM_T;

 












 












 










































 



 



 



 



 












 












 










































 










































 



 



 



 












 

typedef struct
{
    volatile uint32_t  I2SEN:1;
    volatile uint32_t  TXEN:1;
    volatile uint32_t  RXEN:1;
    volatile uint32_t  MUTE:1;
    volatile uint32_t  WORDWIDTH:2;
    volatile uint32_t  MONO:1;
    volatile uint32_t  FORMAT:1;
    volatile uint32_t  SLAVE:1;
    volatile uint32_t  TXTH:3;
    volatile uint32_t  RXTH:3;
    volatile uint32_t  MCLKEN:1;
    volatile uint32_t  RCHZCEN:1;
    volatile uint32_t  LCHZCEN:1;
    volatile uint32_t  CLR_TXFIFO:1;
    volatile uint32_t  CLR_RXFIFO:1;
    volatile uint32_t  TXDMA:1;
    volatile uint32_t  RXDMA:1; 
    volatile const  uint32_t  RESERVE:10;
} I2S_I2SCON_T;

typedef struct
{
    volatile uint32_t  MCLK_DIV:3;
    volatile const  uint32_t  RESERVE0:5;
    volatile uint32_t  BCLK_DIV:8;
    volatile const  uint32_t  RESERVE1:16;
} I2S_I2SCLKDIV_T;

typedef struct
{
    volatile uint32_t  RXUDFIE:1;
    volatile uint32_t  RXOVFIE:1;
    volatile uint32_t  RXTHIE:1;
    volatile const  uint32_t  RESERVE0:5;
    volatile uint32_t  TXUDFIE:1;
    volatile uint32_t  TXOVFIE:1;
    volatile uint32_t  TXTHIE:1;
    volatile uint32_t  RZCIE:1;
    volatile uint32_t  LZCIE:1;
    volatile const  uint32_t  RESERVE1:19;
} I2S_I2SIE_T;

typedef struct
{
    volatile const  uint32_t  I2SINT:1;
    volatile const  uint32_t  I2SRXINT:1;
    volatile const  uint32_t  I2STXINT:1;
    volatile const  uint32_t  RIGHT:1;
    volatile const  uint32_t  RESERVE0:4;
    volatile uint32_t  RXUDF:1;
    volatile uint32_t  RXOVF:1;
    volatile const  uint32_t  RXTHF:1;
    volatile const  uint32_t  RXFULL:1;
    volatile const  uint32_t  RXEMPTY:1;
    volatile const  uint32_t  RESERVE1:3;
    volatile uint32_t  TXUDF:1;
    volatile uint32_t  TXOVF:1;
    volatile const  uint32_t  TXTHF:1;
    volatile const  uint32_t  TXFULL:1;
    volatile const  uint32_t  TXEMPTY:1;
    volatile const  uint32_t  TXBUSY:1;
    volatile const  uint32_t  RZCF:1;
    volatile const  uint32_t  LZCF:1;  
    volatile const  uint32_t  RX_LEVEL:4;
    volatile const  uint32_t  TX_LEVEL:4;
} I2S_I2SSTATUS_T;

typedef volatile uint32_t I2S_I2STXFIFO_T;

typedef volatile const uint32_t I2S_I2SRXFIFO_T;

typedef struct
{
    union 
    {
        volatile uint32_t u32I2SCON;
        
        struct 
        {
            volatile uint32_t  I2SEN:1;
            volatile uint32_t  TXEN:1;
            volatile uint32_t  RXEN:1;
            volatile uint32_t  MUTE:1;
            volatile uint32_t  WORDWIDTH:2;
            volatile uint32_t  MONO:1;
            volatile uint32_t  FORMAT:1;
            volatile uint32_t  SLAVE:1;
            volatile uint32_t  TXTH:3;
            volatile uint32_t  RXTH:3;
            volatile uint32_t  MCLKEN:1;
            volatile uint32_t  RCHZCEN:1;
            volatile uint32_t  LCHZCEN:1;
            volatile uint32_t  CLR_TXFIFO:1;
            volatile uint32_t  CLR_RXFIFO:1;
            volatile uint32_t  TXDMA:1;
            volatile uint32_t  RXDMA:1; 
            volatile const  uint32_t  RESERVE:10;
        } I2SCON;
    };

    union 
    {
        volatile uint32_t u32I2SCLKDIV;
        
        struct 
        {
            volatile uint32_t  MCLK_DIV:3;
            volatile const  uint32_t  RESERVE0:5;
            volatile uint32_t  BCLK_DIV:8;
            volatile const  uint32_t  RESERVE1:16;
        } I2SCLKDIV;
    };

    union 
    {
        volatile uint32_t u32I2SIE;
        
        struct 
        {
            volatile uint32_t  RXUDFIE:1;
            volatile uint32_t  RXOVFIE:1;
            volatile uint32_t  RXTHIE:1;
            volatile const  uint32_t  RESERVE0:5;
            volatile uint32_t  TXUDFIE:1;
            volatile uint32_t  TXOVFIE:1;
            volatile uint32_t  TXTHIE:1;
            volatile uint32_t  RZCIE:1;
            volatile uint32_t  LZCIE:1;
            volatile const  uint32_t  RESERVE1:19;
        } I2SIE;
    };

    union 
    {
        volatile const uint32_t u32I2SSTATUS;
        struct 
        {
            volatile const  uint32_t  I2SINT:1;
            volatile const  uint32_t  I2SRXINT:1;
            volatile const  uint32_t  I2STXINT:1;
            volatile const  uint32_t  RIGHT:1;
            volatile const  uint32_t  RESERVE0:4;
            volatile uint32_t  RXUDF:1;
            volatile uint32_t  RXOVF:1;
            volatile const  uint32_t  RXTHF:1;
            volatile const  uint32_t  RXFULL:1;
            volatile const  uint32_t  RXEMPTY:1;
            volatile const  uint32_t  RESERVE1:3;
            volatile uint32_t  TXUDF:1;
            volatile uint32_t  TXOVF:1;
            volatile const  uint32_t  TXTHF:1;
            volatile const  uint32_t  TXFULL:1;
            volatile const  uint32_t  TXEMPTY:1;
            volatile const  uint32_t  TXBUSY:1;
            volatile const  uint32_t  RZCF:1;
            volatile const  uint32_t  LZCF:1;  
            volatile const  uint32_t  RX_LEVEL:4;
            volatile const  uint32_t  TX_LEVEL:4;
        } I2SSTATUS;
    };
    
    union 
    {
        volatile uint32_t u32I2STXFIFO;
        volatile uint32_t I2STXFIFO;
    };

    union 
    {
        volatile const uint32_t u32I2SRXFIFO;
        volatile const uint32_t I2SRXFIFO;
    };
} I2S_T;


 



















































 






 








                                        








                                        







 


























































 
typedef struct
{
    volatile uint32_t  ExtEN:1;
    volatile uint32_t  ExtBW16:1;
    volatile const  uint32_t  RESERVE0:6;
    volatile uint32_t  MCLKDIV:3;
    volatile const  uint32_t  RESERVE1:5;
    volatile uint32_t  ExttALE:3;
    volatile const  uint32_t  RESERVE2:13;
} EBI_EBICON_T;

typedef struct
{
    volatile const  uint32_t  RESERVE0:3;
    volatile uint32_t  ExttACC:5;
    volatile uint32_t  ExttAHD:3;
    volatile const  uint32_t  RESERVE1:1;
    volatile uint32_t  ExtIW2X:4;
    volatile const  uint32_t  RESERVE2:8;
    volatile uint32_t  ExtIR2R:4;
    volatile const  uint32_t  RESERVE3:4;
} EBI_EXTIME_T;

typedef struct
{
    union {
        volatile uint32_t u32EBICON;
        struct {
            volatile uint32_t  ExtEN:1;
            volatile uint32_t  ExtBW16:1;
            volatile const  uint32_t  RESERVE0:6;
            volatile uint32_t  MCLKDIV:3;
            volatile const  uint32_t  RESERVE1:5;
            volatile uint32_t  ExttALE:3;
            volatile const  uint32_t  RESERVE2:13;
        } EBICON;
    };

    union {
        volatile uint32_t u32EXTIME;
        struct {
            volatile const  uint32_t  RESERVE0:3;
            volatile uint32_t  ExttACC:5;
            volatile uint32_t  ExttAHD:3;
            volatile const  uint32_t  RESERVE1:1;
            volatile uint32_t  ExtIW2X:4;
            volatile const  uint32_t  RESERVE2:8;
            volatile uint32_t  ExtIR2R:4;
            volatile const  uint32_t  RESERVE3:4;
        } EXTIME;
    };
} EBI_T;

 












 













 
 
 
 






 


#line 6629 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"











































#line 6685 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"








 
 
 
#line 6703 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"










































#line 6756 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"













typedef volatile unsigned char  vu8;
typedef volatile unsigned long  vu32;
typedef volatile unsigned short vu16;




#line 6782 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"

#line 6789 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"













 
#line 6835 "..\\..\\..\\..\\CMSIS\\CM0\\DeviceSupport\\Nuvoton\\NUC1xx\\NUC1xx.h"


                                                                                                 
#line 2 "..\\..\\..\\Src\\NUC1xx-LB_002\\LCD_Driver.c"
#line 1 "..\\..\\..\\Include\\Driver\\DrvSYS.h"
 
 
 
 
 



#line 10 "..\\..\\..\\Include\\Driver\\DrvSYS.h"


 
 
 













#line 35 "..\\..\\..\\Include\\Driver\\DrvSYS.h"

 
 
 
typedef enum 
{
    E_SYS_EXTERNAL_12M = 0,
    E_SYS_INTERNAL_22M = 1, 
}E_SYS_PLL_CLKSRC;


 
 
 
typedef enum 
{
    E_SYS_GPIO_RST  = 1,
    E_SYS_TMR0_RST  = 2,
    E_SYS_TMR1_RST  = 3,
    E_SYS_TMR2_RST  = 4,
    E_SYS_TMR3_RST  = 5,
    E_SYS_I2C0_RST  = 8,
    E_SYS_I2C1_RST  = 9,
    E_SYS_SPI0_RST  = 12,
    E_SYS_SPI1_RST  = 13,
    E_SYS_SPI2_RST  = 14,
    E_SYS_SPI3_RST  = 15,
    E_SYS_UART0_RST = 16,
    E_SYS_UART1_RST = 17,
    E_SYS_UART2_RST = 18,
    E_SYS_PWM03_RST = 20,
    E_SYS_PWM47_RST = 21,
    E_SYS_ACMP_RST  = 22,
    E_SYS_PS2_RST   = 23,
    E_SYS_CAN0_RST  = 24,
    E_SYS_USBD_RST  = 27,
    E_SYS_ADC_RST   = 28,
    E_SYS_I2S_RST   = 29,
    E_SYS_PDMA_RST  = 32,
    E_SYS_EBI_RST   = 33
}E_SYS_IP_RST;

 
 
 

typedef enum 
{
    E_SYS_WDT_CLK   = 0,
    E_SYS_RTC_CLK   = 1,
    E_SYS_TMR0_CLK  = 2,
    E_SYS_TMR1_CLK  = 3,
    E_SYS_TMR2_CLK  = 4,
    E_SYS_TMR3_CLK  = 5,
    E_SYS_FDIV_CLK  = 6,
    E_SYS_I2C0_CLK  = 8,
    E_SYS_I2C1_CLK  = 9,
    E_SYS_SPI0_CLK  = 12,
    E_SYS_SPI1_CLK  = 13,
    E_SYS_SPI2_CLK  = 14,
    E_SYS_SPI3_CLK  = 15,
    E_SYS_UART0_CLK = 16,
    E_SYS_UART1_CLK = 17,
    E_SYS_UART2_CLK = 18,
    E_SYS_PWM01_CLK = 20,
    E_SYS_PWM23_CLK = 21,
    E_SYS_PWM45_CLK = 22,
    E_SYS_PWM67_CLK = 23,
    E_SYS_CAN0_CLK  = 24,
    E_SYS_USBD_CLK  = 27,
    E_SYS_ADC_CLK   = 28,
    E_SYS_I2S_CLK   = 29,
    E_SYS_ACMP_CLK  = 30,
    E_SYS_PS2_CLK   = 31,
    E_SYS_PDMA_CLK  = 33,
    E_SYS_ISP_CLK   = 34,
    E_SYS_EBI_CLK   = 35
}E_SYS_IP_CLK;


 
 
 
typedef enum 
{
    E_SYS_ADC_DIV,
    E_SYS_UART_DIV,
    E_SYS_USB_DIV,
    E_SYS_HCLK_DIV

}E_SYS_IP_DIV;


 
 
 
typedef enum 
{
    E_SYS_WDT_CLKSRC,
    E_SYS_ADC_CLKSRC,
    E_SYS_TMR0_CLKSRC,
    E_SYS_TMR1_CLKSRC,
    E_SYS_TMR2_CLKSRC,
    E_SYS_TMR3_CLKSRC,
    E_SYS_UART_CLKSRC,
    E_SYS_PWM01_CLKSRC,
    E_SYS_PWM23_CLKSRC,
    E_SYS_I2S_CLKSRC,
    E_SYS_FRQDIV_CLKSRC,
    E_SYS_PWM45_CLKSRC,
    E_SYS_PWM67_CLKSRC

}E_SYS_IP_CLKSRC;


 
 
 
typedef enum 
{
    E_SYS_XTL12M,
    E_SYS_XTL32K,
    E_SYS_OSC22M,
    E_SYS_OSC10K,
    E_SYS_PLL,
}E_SYS_CHIP_CLKSRC;


 
 
 
typedef enum 
{
    E_SYS_IMMEDIATE, 
    E_SYS_WAIT_FOR_CPU
}E_SYS_PD_TYPE;


typedef void (*BOD_CALLBACK)(void);
typedef void (*PWRWU_CALLBACK)(void);

 
 
 
void     DrvSYS_ClearClockSwitchStatus(void);
uint32_t DrvSYS_ClearResetSource(uint32_t u32Src);

void     DrvSYS_Delay(uint32_t us);
void     DrvSYS_DisableBODLowPowerMode(void);
void     DrvSYS_DisableHighPerformanceMode(void);
void     DrvSYS_DisableLowVoltReset(void);
void     DrvSYS_DisablePOR(void);
void     DrvSYS_DisableTemperatureSensor(void);

void     DrvSYS_EnableBODLowPowerMode(void);
void     DrvSYS_EnableHighPerformanceMode(void);
void     DrvSYS_EnableLowVoltReset(void);
void     DrvSYS_EnablePOR(void);
void     DrvSYS_EnableTemperatureSensor(void);
void     DrvSYS_EnterPowerDown(E_SYS_PD_TYPE ePDType);

uint32_t DrvSYS_GetBODState(void);
int32_t  DrvSYS_GetChipClockSourceStatus(E_SYS_CHIP_CLKSRC eClkSrc);
uint32_t DrvSYS_GetClockSwitchStatus(void);
uint32_t DrvSYS_GetExtClockFreq(void);
uint32_t DrvSYS_GetHCLKFreq(void);
uint32_t DrvSYS_GetPLLClockFreq(void);
uint32_t DrvSYS_GetPLLContent(E_SYS_PLL_CLKSRC ePllSrc, uint32_t u32PllClk);
uint32_t DrvSYS_GetResetSource(void);
uint32_t DrvSYS_GetVersion(void);

int32_t  DrvSYS_IsProtectedRegLocked(void);

int32_t  DrvSYS_LockProtectedReg(void);

int32_t  DrvSYS_Open(uint32_t u32Hclk);

uint32_t DrvSYS_ReadProductID(void);
void     DrvSYS_ResetChip(void);
void     DrvSYS_ResetCPU(void);
void     DrvSYS_ResetIP(E_SYS_IP_RST eIpRst);

void     DrvSYS_SelectBODVolt(uint8_t u8Volt);
int32_t  DrvSYS_SelectHCLKSource(uint8_t u8ClkSrcSel);
int32_t  DrvSYS_SelectIPClockSource(E_SYS_IP_CLKSRC eIpClkSrc, uint8_t u8ClkSrcSel);
void     DrvSYS_SelectPLLSource(E_SYS_PLL_CLKSRC ePllSrc);
int32_t  DrvSYS_SelectSysTickSource(uint8_t u8ClkSrcSel);
void     DrvSYS_SetBODFunction(int32_t i32Enable, int32_t i32Mode, BOD_CALLBACK bodcallbackFn);
int32_t  DrvSYS_SetClockDivider(E_SYS_IP_DIV eIpDiv , int32_t i32value);
int32_t  DrvSYS_SetFreqDividerOutput(int32_t i32Flag, uint8_t u8Divider);
void     DrvSYS_SetIPClock(E_SYS_IP_CLK eIpClk, int32_t i32Enable);
int32_t  DrvSYS_SetOscCtrl(E_SYS_CHIP_CLKSRC eClkSrc, int32_t i32Enable);
void     DrvSYS_SetPLLContent(uint32_t u32PllContent);
void     DrvSYS_SetPLLMode(int32_t i32Flag);
void     DrvSYS_SetPowerDownWakeUpInt(int32_t i32Enable, PWRWU_CALLBACK pdwucallbackFn, int32_t i32enWUDelay);

int32_t  DrvSYS_UnlockProtectedReg(void);



#line 3 "..\\..\\..\\Src\\NUC1xx-LB_002\\LCD_Driver.c"
#line 1 "..\\..\\..\\Include\\Driver\\DrvSPI.h"
 
 
 
 
 



#line 10 "..\\..\\..\\Include\\Driver\\DrvSPI.h"
#line 11 "..\\..\\..\\Include\\Driver\\DrvSPI.h"

 
 
 






 
 
 





 






 
 
 
typedef enum {
    eDRVSPI_PORT0=0,
    eDRVSPI_PORT1=1,
    eDRVSPI_PORT2=2,
    eDRVSPI_PORT3=3
} E_DRVSPI_PORT;

typedef enum {
    eDRVSPI_MASTER,
    eDRVSPI_SLAVE
} E_DRVSPI_MODE;

typedef enum {
    eDRVSPI_TYPE0,
    eDRVSPI_TYPE1,
    eDRVSPI_TYPE2,
    eDRVSPI_TYPE3,
    eDRVSPI_TYPE4,
    eDRVSPI_TYPE5,
    eDRVSPI_TYPE6,
    eDRVSPI_TYPE7
} E_DRVSPI_TRANS_TYPE;

typedef enum {
    eDRVSPI_LSB_FIRST,
    eDRVSPI_MSB_FIRST
} E_DRVSPI_ENDIAN;

typedef enum {
    eDRVSPI_BYTE_REORDER_SUSPEND_DISABLE=0,
    eDRVSPI_BYTE_REORDER_SUSPEND=1,
    eDRVSPI_BYTE_REORDER=2,
    eDRVSPI_BYTE_SUSPEND=3
} E_DRVSPI_BYTE_REORDER;

typedef enum {
    eDRVSPI_EDGE_TRIGGER,
    eDRVSPI_LEVEL_TRIGGER
} E_DRVSPI_SSLTRIG;

typedef enum {
    eDRVSPI_ACTIVE_LOW_FALLING,
    eDRVSPI_ACTIVE_HIGH_RISING
} E_DRVSPI_SS_ACT_TYPE;

typedef enum {
    eDRVSPI_NONE,
    eDRVSPI_SS0,
    eDRVSPI_SS1,
    eDRVSPI_SS0_SS1
} E_DRVSPI_SLAVE_SEL;

typedef enum {
    eDRVSPI_TX_DMA,
    eDRVSPI_RX_DMA
} E_DRVSPI_DMA_MODE;

typedef void (*PFN_DRVSPI_CALLBACK)(uint32_t userData);

 
 
 
int32_t DrvSPI_Open(E_DRVSPI_PORT eSpiPort, E_DRVSPI_MODE eMode, E_DRVSPI_TRANS_TYPE eType, int32_t i32BitLength);
void DrvSPI_Close(E_DRVSPI_PORT eSpiPort);
void DrvSPI_Set2BitTransferMode(E_DRVSPI_PORT eSpiPort, uint8_t bEnable);
void DrvSPI_SetEndian(E_DRVSPI_PORT eSpiPort, E_DRVSPI_ENDIAN eEndian);
int32_t DrvSPI_SetBitLength(E_DRVSPI_PORT eSpiPort, int32_t i32BitLength);
int32_t DrvSPI_SetByteReorder(E_DRVSPI_PORT eSpiPort, E_DRVSPI_BYTE_REORDER eOption);
int32_t DrvSPI_SetSuspendCycle(E_DRVSPI_PORT eSpiPort, int32_t i32Interval);
void DrvSPI_SetTriggerMode(E_DRVSPI_PORT eSpiPort, E_DRVSPI_SSLTRIG eSSTriggerMode);
void DrvSPI_SetSlaveSelectActiveLevel(E_DRVSPI_PORT eSpiPort, E_DRVSPI_SS_ACT_TYPE eSSActType);
uint8_t DrvSPI_GetLevelTriggerStatus(E_DRVSPI_PORT eSpiPort);
void DrvSPI_EnableAutoSS(E_DRVSPI_PORT eSpiPort, E_DRVSPI_SLAVE_SEL eSlaveSel);
void DrvSPI_DisableAutoSS(E_DRVSPI_PORT eSpiPort);
void DrvSPI_SetSS(E_DRVSPI_PORT eSpiPort, E_DRVSPI_SLAVE_SEL eSlaveSel);
void DrvSPI_ClrSS(E_DRVSPI_PORT eSpiPort, E_DRVSPI_SLAVE_SEL eSlaveSel);
uint8_t DrvSPI_IsBusy(E_DRVSPI_PORT eSpiPort);
int32_t DrvSPI_BurstTransfer(E_DRVSPI_PORT eSpiPort, int32_t i32BurstCnt, int32_t i32Interval);
uint32_t DrvSPI_SetClockFreq(E_DRVSPI_PORT eSpiPort, uint32_t u32Clock1, uint32_t u32Clock2);
uint32_t DrvSPI_GetClock1Freq(E_DRVSPI_PORT eSpiPort);
uint32_t DrvSPI_GetClock2Freq(E_DRVSPI_PORT eSpiPort);
void DrvSPI_SetVariableClockFunction(E_DRVSPI_PORT eSpiPort, uint8_t bEnable, uint32_t u32Pattern);
void DrvSPI_EnableInt(E_DRVSPI_PORT eSpiPort, PFN_DRVSPI_CALLBACK pfnCallback, uint32_t u32UserData);
void DrvSPI_DisableInt(E_DRVSPI_PORT eSpiPort);
uint32_t DrvSPI_GetIntFlag(E_DRVSPI_PORT eSpiPort);
void DrvSPI_ClrIntFlag(E_DRVSPI_PORT eSpiPort);
uint8_t DrvSPI_SingleRead(E_DRVSPI_PORT eSpiPort, uint32_t *pu32Data);
uint8_t DrvSPI_SingleWrite(E_DRVSPI_PORT eSpiPort, uint32_t *pu32Data);
uint8_t DrvSPI_BurstRead(E_DRVSPI_PORT eSpiPort, uint32_t *pu32Buf);
uint8_t DrvSPI_BurstWrite(E_DRVSPI_PORT eSpiPort, uint32_t *pu32Buf);
uint32_t DrvSPI_DumpRxRegister(E_DRVSPI_PORT eSpiPort, uint32_t *pu32Buf, uint32_t u32DataCount);
uint32_t DrvSPI_SetTxRegister(E_DRVSPI_PORT eSpiPort, uint32_t *pu32Buf, uint32_t u32DataCount);
void DrvSPI_SetGo(E_DRVSPI_PORT eSpiPort);
void DrvSPI_ClrGo(E_DRVSPI_PORT eSpiPort);
void DrvSPI_SetPDMA(E_DRVSPI_PORT eSpiPort, E_DRVSPI_DMA_MODE eDmaMode, uint8_t bEnable);
void DrvSPI_EnableDivOne(E_DRVSPI_PORT eSpiPort);
void DrvSPI_DisableDivOne(E_DRVSPI_PORT eSpiPort);
void DrvSPI_Enable3Wire(E_DRVSPI_PORT eSpiPort);
void DrvSPI_Disable3Wire(E_DRVSPI_PORT eSpiPort);
void DrvSPI_3WireAbort(E_DRVSPI_PORT eSpiPort);
void DrvSPI_Enable3WireStartInt(E_DRVSPI_PORT eSpiPort, PFN_DRVSPI_CALLBACK pfnCallback, uint32_t u32UserData);
void DrvSPI_DisableInt(E_DRVSPI_PORT eSpiPort);
uint32_t DrvSPI_Get3WireStartIntFlag(E_DRVSPI_PORT eSpiPort);
void DrvSPI_Clr3WireStartIntFlag(E_DRVSPI_PORT eSpiPort);
uint32_t DrvSPI_GetVersion(void);

#line 4 "..\\..\\..\\Src\\NUC1xx-LB_002\\LCD_Driver.c"
#line 1 "..\\..\\..\\Include\\Driver\\DrvGPIO.h"
 
 
 
 
 



#line 10 "..\\..\\..\\Include\\Driver\\DrvGPIO.h"

 
 
 




 
 
 

							   
 
 
 




typedef void (*GPIO_GPAB_CALLBACK)(uint32_t u32GPAStatus, uint32_t u32GPBStatus);
typedef void (*GPIO_GPCDE_CALLBACK)(uint32_t u32GPCStatus, uint32_t u32GPDStatus, uint32_t u32GPEStatus);
typedef void (*GPIO_EINT0_CALLBACK)(void);
typedef void (*GPIO_EINT1_CALLBACK)(void);

 
#line 117 "..\\..\\..\\Include\\Driver\\DrvGPIO.h"

typedef enum 
{
	E_GPA = 0,
	E_GPB = 1, 
	E_GPC = 2, 
	E_GPD = 3, 
	E_GPE = 4
} E_DRVGPIO_PORT;

typedef enum 
{
    E_IO_INPUT = 0,
    E_IO_OUTPUT,
    E_IO_OPENDRAIN,
    E_IO_QUASI
} E_DRVGPIO_IO;

typedef enum 
{
    E_IO_RISING = 0,
    E_IO_FALLING,
    E_IO_BOTH_EDGE
} E_DRVGPIO_INT_TYPE;

typedef enum
{
    E_MODE_EDGE = 0,
    E_MODE_LEVEL
} E_DRVGPIO_INT_MODE;

typedef enum
{
    E_DBCLKSRC_HCLK = 0, 
    E_DBCLKSRC_10K = 1
} E_DRVGPIO_DBCLKSRC;	   

typedef enum
{
	E_FUNC_GPIO,    E_FUNC_CLKO,    E_FUNC_I2C0,    E_FUNC_I2C1,    E_FUNC_I2S,     E_FUNC_CAN0,	
    E_FUNC_ACMP0,   E_FUNC_ACMP1,   
    E_FUNC_SPI0,    E_FUNC_SPI0_SS1,    E_FUNC_SPI0_2BIT_MODE,
    E_FUNC_SPI1,    E_FUNC_SPI1_SS1,    E_FUNC_SPI1_2BIT_MODE,
    E_FUNC_SPI2,    E_FUNC_SPI2_SS1,    E_FUNC_SPI2_2BIT_MODE,
    E_FUNC_SPI3,    E_FUNC_SPI3_SS1,    E_FUNC_SPI3_2BIT_MODE,      
    E_FUNC_SPI0_QFN36PIN,   E_FUNC_SPI0_SS1_QFN36PIN,   E_FUNC_SPI0_2BIT_MODE_QFN36PIN,
    E_FUNC_ADC0,    E_FUNC_ADC1,    E_FUNC_ADC2,    E_FUNC_ADC3,    E_FUNC_ADC4,    E_FUNC_ADC5,
    E_FUNC_ADC6,    E_FUNC_ADC7,    E_FUNC_EXTINT0, E_FUNC_EXTINT1, E_FUNC_TMR0,    E_FUNC_TMR1,      
    E_FUNC_TMR2,    E_FUNC_TMR3,    E_FUNC_T0EX,    E_FUNC_T1EX,    E_FUNC_T2EX,    E_FUNC_T3EX,
    E_FUNC_UART0,   E_FUNC_UART0_RX_TX, E_FUNC_UART0_RTS_CTS,
    E_FUNC_UART1,   E_FUNC_UART1_RX_TX, E_FUNC_UART1_RTS_CTS,       E_FUNC_UART2,
    E_FUNC_PWM01,   E_FUNC_PWM23,   E_FUNC_PWM45,   E_FUNC_PWM67,   E_FUNC_PWM0,    E_FUNC_PWM1,
    E_FUNC_PWM2,    E_FUNC_PWM3,    E_FUNC_PWM4,    E_FUNC_PWM5,    E_FUNC_PWM6,    E_FUNC_PWM7,    
    E_FUNC_EBI_8B,  E_FUNC_EBI_16B,          
} E_DRVGPIO_FUNC;
			  
 
 
 
int32_t DrvGPIO_Open(E_DRVGPIO_PORT port, int32_t i32Bit, E_DRVGPIO_IO mode);
int32_t DrvGPIO_Close(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_SetBit(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_GetBit(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_ClrBit(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_SetPortBits(E_DRVGPIO_PORT port, int32_t i32Data);
int32_t DrvGPIO_GetPortBits(E_DRVGPIO_PORT port);
int32_t DrvGPIO_GetDoutBit(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_GetPortDoutBits(E_DRVGPIO_PORT port);
int32_t DrvGPIO_SetBitMask(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_GetBitMask(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_ClrBitMask(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_SetPortMask(E_DRVGPIO_PORT port, int32_t i32MaskData);
int32_t DrvGPIO_GetPortMask(E_DRVGPIO_PORT port);
int32_t DrvGPIO_ClrPortMask(E_DRVGPIO_PORT port, int32_t i32MaskData);
int32_t DrvGPIO_EnableDigitalInputBit(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_DisableDigitalInputBit(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_EnableDebounce(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_DisableDebounce(E_DRVGPIO_PORT port, int32_t i32Bit);
int32_t DrvGPIO_SetDebounceTime(uint32_t u32CycleSelection, E_DRVGPIO_DBCLKSRC ClockSource);
int32_t DrvGPIO_GetDebounceSampleCycle(void);
int32_t DrvGPIO_EnableInt(E_DRVGPIO_PORT port, int32_t i32Bit, E_DRVGPIO_INT_TYPE TriggerType, E_DRVGPIO_INT_MODE Mode);
int32_t DrvGPIO_DisableInt(E_DRVGPIO_PORT port, int32_t i32Bit);
void DrvGPIO_SetIntCallback(GPIO_GPAB_CALLBACK pfGPABCallback, GPIO_GPCDE_CALLBACK pfGPCDECallback);
void DrvGPIO_EnableEINT0(E_DRVGPIO_INT_TYPE TriggerType, E_DRVGPIO_INT_MODE Mode, GPIO_EINT0_CALLBACK pfEINT0Callback);
void DrvGPIO_DisableEINT0(void);
void DrvGPIO_EnableEINT1(E_DRVGPIO_INT_TYPE TriggerType, E_DRVGPIO_INT_MODE Mode, GPIO_EINT1_CALLBACK pfEINT1Callback);
void DrvGPIO_DisableEINT1(void);
int32_t DrvGPIO_GetIntStatus(E_DRVGPIO_PORT port);
int32_t DrvGPIO_InitFunction(E_DRVGPIO_FUNC function);
int32_t DrvGPIO_GetVersion(void);










#line 5 "..\\..\\..\\Src\\NUC1xx-LB_002\\LCD_Driver.c"
#line 1 "..\\..\\..\\Include\\NUC1xx-LB_002\\LCD_Driver.h"


     
extern void SysTimerDelay(uint32_t us);
extern void Initial_pannel(void);
extern void Disable_Buzzer(void);

extern void Show_Word(unsigned char x, unsigned char y,unsigned char ascii_word);

extern void print_lcd(unsigned char line, char *str);


extern void clr_all_pannal(void);
#line 6 "..\\..\\..\\Src\\NUC1xx-LB_002\\LCD_Driver.c"

extern  SPI_T * SPI_PORT[4]={((SPI_T *) ((( uint32_t)0x40000000) + 0x30000)), ((SPI_T *) ((( uint32_t)0x40100000) + 0x34000)), ((SPI_T *) ((( uint32_t)0x40100000) + 0x30000)), ((SPI_T *) ((( uint32_t)0x40100000) + 0x34000))};

extern  char Ascii[];

void SysTimerDelay(uint32_t us)
{
    ((SysTick_Type *) ((0xE000E000) + 0x0010))->LOAD = us * 22;  
    ((SysTick_Type *) ((0xE000E000) + 0x0010))->VAL   =  (0x00);
    ((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL = (1 << 2) | (1<<0);

     
    while((((SysTick_Type *) ((0xE000E000) + 0x0010))->CTRL & (1 << 16)) == 0);
}

void Initial_pannel(void)
{
	
	((SYSCLK_T *) ((( uint32_t)0x50000000) + 0x00200))->APBCLK.SPI3_EN  =1;			 
	((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2.SPI3_RST   =1;			 
	((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->IPRSTC2.SPI3_RST   =0;

	 
	((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->GPDMFP.SPI3_SS0 	=1;
	((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->GPDMFP.SPI3_CLK 	=1;
	
	((GCR_T *) ((( uint32_t)0x50000000) + 0x00000))->GPDMFP.SPI3_MOSI0 	=1;

	SPI_PORT[eDRVSPI_PORT3]->CNTRL.CLKP = 1;							
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.TX_BIT_LEN = 9;						
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.TX_NEG = 1;							
	SPI_PORT[eDRVSPI_PORT3]->DIVIDER.DIVIDER=0X03;					    

	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1;									
	
	SPI_PORT[eDRVSPI_PORT3]->TX[0] =0xEB;
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );
	
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;

	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1;
	
	SPI_PORT[eDRVSPI_PORT3]->TX[0] =0x81;
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );
	SPI_PORT[eDRVSPI_PORT3]->TX[0] =0xa0;
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;

	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1;
	
	SPI_PORT[eDRVSPI_PORT3]->TX[0] =0xc0;	
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );
	
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;

	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1;
	SPI_PORT[eDRVSPI_PORT3]->TX[0] = 0XAF;
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;
}




void WriteData(unsigned char data)
{
	
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1;	   
	SPI_PORT[eDRVSPI_PORT3]->TX[0] =0x100 | data;    	
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 ); 
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;
}




void SetPACA(unsigned char PA, unsigned char CA)
{
	

	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1; 	
	SPI_PORT[eDRVSPI_PORT3]->TX[0] = 0xB0 | PA;	
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );	 
	
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;

	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1;	
	SPI_PORT[eDRVSPI_PORT3]->TX[0] =0x10 |(CA>>4)&0xF;
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );	  
 	
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;

	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=1;
	SPI_PORT[eDRVSPI_PORT3]->TX[0] =0x00 | (CA & 0xF);		
	SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY = 1;
    while ( SPI_PORT[eDRVSPI_PORT3]->CNTRL.GO_BUSY == 1 );	  
	SPI_PORT[eDRVSPI_PORT3]->SSR.SSR=0;
}

void Disable_Buzzer(void)
{
 	DrvGPIO_Open(E_GPB,11, E_IO_OUTPUT);	
	DrvGPIO_SetBit(E_GPB,11);	
}



void Show_Word(unsigned char x, unsigned char y,unsigned char ascii_word)
{
int i=0,k=0;
	unsigned char temp;	  
	  k=(ascii_word-32)*16;	  
	  
	  for(i=0;i<8;i++)
	  {
	  SetPACA((x*2),(129-(y*8)-i));
	  temp=Ascii[k+i];	 
      WriteData(temp);
	  }

      for(i=0;i<8;i++)
	  {
	  SetPACA((x*2)+1,(129-(y*8)-i));	 
      temp=Ascii[k+i+8];
	  WriteData(temp);
	  }
}




void print_lcd(unsigned char line, char *str)
{
int i=0; 
  do{   
    Show_Word(line,i,*str++); 
  	i++;
  	if(i>15)
	  break;
    }
   while(*str!='\0');
}



void clr_all_pannal(void)
{
 int i=0;
	 
	SetPACA(0x0, 0x0);

	for (i = 0; i < 132 *8; i++)
	{
		WriteData(0x00);
	}
	WriteData(0x0f);
}

