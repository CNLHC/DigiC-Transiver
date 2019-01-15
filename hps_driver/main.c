/*
This program demonstrate how to use hps communicate with FPGA through light AXI Bridge.
uses should program the FPGA by GHRD project before executing the program
refer to user manual chapter 7 for details about the demo
*/

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/mman.h>
#include "hwlib.h"
#include "socal/socal.h"
#include "socal/hps.h"
#include "socal/alt_gpio.h"
#include "hps_0.h"


#define HW_REGS_BASE ( ALT_STM_OFST )
#define HW_REGS_SPAN ( 0x04000000 )
#define HW_REGS_MASK ( HW_REGS_SPAN - 1 )

int main() {

	void *virtual_base;
	int fd;
	int loop_count;
	int led_direction;
	int led_mask;
	void *h2p_lw_led_addr;
	void *pTopSystemID;
	void *pReceiverSystemID;
	void *pReceiverFIFO;
	void *pTestFIFOWrite;
	void *pTestFIFORead;

	// map the address space for the LED registers into user space so we can interact with them.
	// we'll actually map in the entire CSR span of the HPS since we want to access various registers within that span

	if( ( fd = open( "/dev/mem", ( O_RDWR | O_SYNC ) ) ) == -1 ) {
		printf( "ERROR: could not open \"/dev/mem\"...\n" );
		return( 1 );
	}

	virtual_base = mmap( NULL, HW_REGS_SPAN, ( PROT_READ | PROT_WRITE ), MAP_SHARED, fd, HW_REGS_BASE );

	if( virtual_base == MAP_FAILED ) {
		printf( "ERROR: mmap() failed...\n" );
		close( fd );
		return( 1 );
	}
	
	//h2p_lw_led_addr=virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + LED_PIO_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	
	pTopSystemID= virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + SYSID_QSYS_BASE) & ( unsigned long)( HW_REGS_MASK ) );
	pReceiverSystemID = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + RECEIVERTOPQSYS_0_RECEIVERSYSID_BASE ) & ( unsigned long)( HW_REGS_MASK ) );
	pTestFIFORead =  virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +RECEIVERTOPQSYS_0_HPSTESTFIFO_OUT_BASE) & ( unsigned long)( HW_REGS_MASK ) );
	pTestFIFOWrite =  virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST +RECEIVERTOPQSYS_0_HPSTESTFIFO_IN_BASE ) & ( unsigned long)( HW_REGS_MASK ) );

	uint32_t tSysID = *((uint32_t *)pTopSystemID);
	*((uint32_t*)pTestFIFOWrite) = 0xaabbccdd;
	*((uint32_t*)pTestFIFOWrite) = 0xddccbbaa;
	*((uint32_t*)pTestFIFOWrite) = 0xac;
	printf("I/O Loop Test: 0x%x\n",*(uint32_t*)pTestFIFORead);
	printf("I/O Loop Test: 0x%x\n",*(uint32_t*)pTestFIFORead);
	printf("I/O Loop Test: 0x%x\n",*(uint32_t*)pTestFIFORead);

	printf("Top-QSys sysID: 0x%x\n",tSysID);
	if(tSysID!=SYSID_QSYS_ID){
		printf("Top-Qsys sysID Error!");
		return 1;
	}
	tSysID = *((uint32_t *)pReceiverSystemID);
	printf("Receiver-QSys sysID: 0x%x\n",tSysID);
	if(tSysID!=RECEIVERTOPQSYS_0_RECEIVERSYSID_ID){
		printf("Receiver-Qsys sysID Error!");
		return 1;
	}
	int i,j;
	pReceiverFIFO = virtual_base + ( ( unsigned long  )( ALT_LWFPGASLVS_OFST + RECEIVERTOPQSYS_0_FIFO_0_BASE+0) & ( unsigned long)( HW_REGS_MASK ) );
	for(i=0;i<RECEIVERTOPQSYS_0_FIFO_0_FIFO_DEPTH/4;i++){
		for(j=0;j<4;j++){
			int32_t data;
			data=*((uint32_t*)pReceiverFIFO);
			char tBuf[8];
			sprintf(tBuf,"%08x",data);
			int k  =0;
			for(k=0;k<8;k++){
				switch(tBuf[k]){
					case '1':tBuf[k]='4';break;
					case '2':tBuf[k]='8';break;
					case '3':tBuf[k]='c';break;
					case '4':tBuf[k]='1';break;
					case '5':tBuf[k]='5';break;
					case '6':tBuf[k]='9';break;
					case '7':tBuf[k]='d';break;
					case '8':tBuf[k]='2';break;
					case '9':tBuf[k]='6';break;
					case 'a':tBuf[k]='a';break;
					case 'b':tBuf[k]='e';break;
					case 'c':tBuf[k]='3';break;
					case 'd':tBuf[k]='7';break;
					case 'e':tBuf[k]='b';break;
					case 'f':tBuf[k]='f';break;
				}
			}
			printf("%s \t",tBuf);
		}
		printf("\n");
	}

	// toggle the LEDs a bit

	//loop_count = 0;
	//led_mask = 0x01;
	//led_direction = 0; // 0: left to right direction //*(uint32_t *)h2p_lw_led_addr = 0xAA; 
	// while( loop_count < 60 ) {
		
	// 	// control led
	// 	*(uint32_t *)h2p_lw_led_addr = ~led_mask; 

	// 	// wait 100ms
	// 	usleep( 1000*1000 );
		
	// 	// update led mask
		// 	if (led_direction == 0){
	// 		led_mask <<= 1;
	// 		if (led_mask == (0x01 << (LED_PIO_DATA_WIDTH-1)))
	// 			 led_direction = 1;
	// 	}else{
	// 		led_mask >>= 1;
	// 		if (led_mask == 0x01){ 
	// 			led_direction = 0;
	// 			loop_count++;
	// 		}
	// 	}
		
	// } // while
	


	// clean up our memory mapping and exit
	
	if( munmap( virtual_base, HW_REGS_SPAN ) != 0 ) {
		printf( "ERROR: munmap() failed...\n" );
		close( fd );
		return( 1 );
	}

	close( fd );

	return( 0 );
}
