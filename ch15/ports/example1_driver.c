
// The midware

#include <stdio.h>
#include <stdlib.h>
typedef unsigned char byte;

int read_cmd(byte *buff);
int write_cmd(byte *buff, int len);
int sum(int x,int y);
int twice(int x);

int main(){
	int fn, arg1, arg2, result;
	byte buff[100];
	//fprintf(stderr, "driver has been launched\n");
	while(read_cmd(buff)>0){
		//fprintf(stderr,"Site 100\n");
		fn = buff[0];
		if(1==fn){
			arg1 = buff[1];
			arg2 = buff[2];
			result = sum(arg1, arg2);
		} else if(2==fn){
			arg1 = buff[1];
			result = twice(arg1);
		} else {
			fprintf(stderr, "Failed to recognized cmd\n");
			exit(EXIT_FAILURE);
		}
		buff[0] = result;
		write_cmd(buff,1);
	}
}

