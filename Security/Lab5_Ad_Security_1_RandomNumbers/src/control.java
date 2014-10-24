/*
 *Corey Bannon 
 *C11342611
 *DT228/4
 *Advanced Security 1 
 */
import java.math.BigInteger;
import java.util.Scanner;


public class control {
		//main class that calls the various functions and class.
		public static void main(String [ ] args){
			primeNumGen png = new primeNumGen();
			middleSquare msm = new middleSquare();
			xor_Shift xor = new xor_Shift();
			
			System.out.println("Enter [Middle] to generate a random number using the middle square method.");
			System.out.println("Enter [Xor] to generate a random number using the XOR SHIFT algorithm.");
			System.out.println("Enter [MiddleXor] to generate a random number using the middle square method and Xor comined.");
			System.out.println("Enter [GenPrime] to generate a 10 large prime numbers.");
			System.out.println("Enter [NextPrime] to get the next prime number.");
			System.out.println("Enter [KeyCheck] to check if a public key is prime.");
			System.out.print("Enter Command:");
			
			//reads in users actions
			Scanner action = new Scanner(System.in); 
			String todo = action.nextLine();
			
			//calls the middle square method function to get a random number
			if("Middle".equals(todo))
			{
				Scanner input = new Scanner( System.in );
				System.out.println("Enter a seed greater than 212:");  
				//user enters in the seed
				int num = input.nextInt();
				int seed = num;
				//for loop, to make the method print out 10 new random numbers
				for(int i = 0 ; i < 10 ; i ++)
				{
					seed = msm.middleSquareMethod(seed); 
					System.out.println(seed);
				}
			}
			//calls the Xor shift method.
			if("Xor".equals(todo))
			{
				Scanner input = new Scanner( System.in );
				System.out.println("Enter a seed greater than 212:");  
				
				int num = input.nextInt();
				int seed = num;
				//for loop, to make the method print out 10 new random numbers
				for(int i = 0 ; i < 10 ; i ++)
				{	//returns the random number and assigns it to the seed for the next number
					seed = (int) xor.randomLong(seed);
					
					System.out.print(seed);
					System.out.println(" : " + i);
				}
				
			}
			//this method calls both the middle square method 
			//and the xor shift to intertwine the two PRGN methods.
			if("MiddleXor".equals(todo))
			{
				Scanner input = new Scanner( System.in );
				System.out.println("Enter a seed greater than 212:");  
					
				long num = input.nextLong();
				long seed = num;
				
				seed = msm.middleSquareMethod((int)seed);
				seed = xor.randomLong(seed);
				
				System.out.print(seed);
			}
			//Prime Generator method
			if("GenPrime".equals(todo))
			{
				Scanner input = new Scanner( System.in );
				System.out.println("Enter a seed like 15485863 to generate 10 large prime numbers:");  
				
				int num = input.nextInt();
				int seed = num;
				int i = 0; 
				
				do{	
					seed = png.longPrime(seed);
					i = i + 1;
				}while(i != 10);
			}
			//calls the next prime method to return the next 
			//prime number of the one entered in by the user.
			if("NextPrime".equals(todo))
			{
				png.nextPrime();
			}
			//this method checks to see if my public key is prime of not
			if("KeyCheck".equals(todo))
			{	//converting the hex number to int
				int value = new BigInteger("319DA2FF", 16).intValue();
			
				if(png.primeCheck((long)value) == false)
				{
					System.out.println(value + " is not Prime!");
				}else{
					System.out.println(value + " is Prime!");
				}
			}
	}
}