/*
 *Corey Bannon 
 *C11342611
 *DT228/4
 *Advanced Security 1 
 */

import java.util.Scanner;

public class xor_Shift 
{
	public static long randomLong(long x) 
	{
	//Shifts x and returns the new x
  	  x ^= (x << 23);
  	  x ^= (x >> 17);
  	  x ^= (x << 26);
  	  
  	  return x;
  	}
}