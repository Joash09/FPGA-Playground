#include<stdio.h>

int main() {

	float a;
	float b; 

	printf("Enter first floating point number:\t");
	scanf(" %f", &a);
	printf("Hex representation:\t%x\n", a);
	printf("Enter second floating point number:\t");
	scanf(" %f", &b);
	printf("Hex representation:\t%x\n", b);


	float mult = a*b;
	float add = a+b;

	printf("Expected Hex represenation when multiplied:\t%x\n", mult);
	printf("Expected Hex represenation when added:\t%x\n", add);

	return 0;
}

float ieee745_mult(float a, float b) {

	// Unpack 
	// Exponential is represented by signed 8 bits 
	signed char exponential_a = (a>>23) & 0xFF;
	signed char exponential_b = (b>>23) & 0xFF;

	// Mantissa is represented by 23 bits; closest equivalent datatype in C is int (32 bits)
	unsigned int mantissa_a = a & 0x7FFFFF;
	unsigned int mantissa_b = b & 0x7FFFFF;

	// Check if Infinity or zero
	if (exponential_a == 0x00 || exponential_b == 0x00 ) {
		return 0;
	}else if (exponential_a == 0xFF || exponential_b == 0xFF) {
		float f;
		*(int*)&f = 0x7f800000;
		return f;
	}

	// Multiply mantissa Store in data type at least (23+23) bits wide
	unsigned long long mult_mantissa = mantissa_a * mantissa_b;

	// Truncate least significant bits back to 23 
	unsigned int truncated_mantissa = (mult_mantissa>>41) & 0x7FFFFF;

	// Add exponents together and subtract bias (127 for 32 bit floating point)
	signed char exponent_add = exponential_a + exponential_b - 127;

	// Normalize
	// Check for overflow/underflow
	// Pack and return

}

float ieee_745_add(float a, float b){

}
