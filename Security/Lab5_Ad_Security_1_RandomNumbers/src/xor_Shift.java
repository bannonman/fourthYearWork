import java.util.Scanner;

public class xor_Shift 
{
	public static long randomLong(long x) 
	{
	//Shifts x and returns the new x
  	  x ^= (x << 7);
  	  x ^= (x >>> 17);
  	  x ^= (x << 23);
  	  
  	  return x;
  	}
}