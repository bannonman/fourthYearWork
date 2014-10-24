/*
 *Corey Bannon 
 *C11342611
 *DT228/4
 *Advanced Security 1 
 */

import java.util.Scanner;

//prime number method.
public class primeNumGen
{
	//prime number generator
	public void primeGen(){
		int num; 
	      
		Scanner limit = new Scanner(System.in); 
		System.out.println("Please enter a limit number: "); 
		num = limit.nextInt();     
	
		for(int i=1; i <= num; i++)
		{         
			boolean Prime = true;
	
			//check to see if the number is prime
			for(int j=2; j < 10; j++)
			{   
				if(i % j == 0)
				{
					Prime = false;
					break;
				}
	          
			}
			//if the number is prime then print it out
			if(Prime)
			{
				System.out.println("Prime: "+ i);
			}
		}      
	}
	//retuns a large prime number
	public int longPrime(int num)
	{
		int i = 0;
		for(i=num;;i++ )
		{         
			boolean Prime = true;
	
			//check to see if the number is prime
			for(int j=2; j < 10; j++)
			{   
				if(i % j == 0)
				{
					Prime = false;
					break;
				}
			}
			//if the number is prime then print it out
			if(Prime)
			{
				
				if(Prime = true && i !=num){
					System.out.println("Prime: "+ i);
					return i;
					
				}
			}
		}
		    
	}
	
	//returns the next prime number based on the number entered
	public void nextPrime()
	{
		int num; 
	      
		Scanner limit = new Scanner(System.in); 
		System.out.println("Please enter a prime number to get the next one: "); 
		num = limit.nextInt();     
	
		for(int i=num;;i++ )
		{         
			boolean Prime = true;
	
			//check to see if the number is prime
			for(int j=2; j < 10; j++)
			{   
				if(i % j == 0)
				{
					Prime = false;
					break;
				}
			}
			//if the number is prime then print it out and break from the program.
			if(Prime)
			{
				System.out.println("Prime: "+ i);
				if(Prime = true && i !=num){
					break;
				}
			}
		}
	}
	//this method checks to see if a number is prime, 
	//it also returns true or false
	public boolean primeCheck(Long n){
		//checks whether an int is prime or not.
		
		    //check if n is a multiple of 2
		    if (n%2==0) return false;
		    //if not, then just check the odds
		    for(int i=3;i*i<=n;i+=2) 
                    {
		        if(n%i==0)
		            return false;
		    }
		    System.out.print("Prime");
		    return true;
		
	}
}
