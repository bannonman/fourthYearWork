import java.util.Scanner;

public class middleSquare 
{
	public int middleSquareMethod(int seed)// Middle-Square Method
	{
		int total; 
		
	    total = seed * seed;
	  
	    int size = String.valueOf(seed).length();
	    int totSize = String.valueOf(total).length();
	   
	    StringBuilder  middle = new StringBuilder();
	    
	    String nums;
	    nums = Long.toString(total);
	    
	    int k;
	    int i;
	   
	    if(totSize % 2 == 0)
	    {
	    	k = totSize / 2;
	    }else{
	    	k = (totSize -1) /2;
	    }
	    
	    for(i = k -1 ; i < totSize ;)
	    {
	    	if(i == k + size-1)
	    		break;
	    	middle.append(nums.charAt(i));
	    	System.out.print(nums.charAt(i));
	    	return nums.charAt(i);
	    }
	   
	   nums = middle.toString();
	   seed = Integer.parseInt(nums);
	   return seed = 0;
	}
}