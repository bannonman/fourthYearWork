/*
 *Corey Bannon 
 *C11342611
 *DT228/4
 *Advanced Security 1 
 */

public class middleSquare 
{	// Middle-Square Method
	public int middleSquareMethod(int seed)
	{
		int total,totalSize, size;
		int k = 0; 
		int i = 0;
		int count = 0;
		
		total = seed * seed;
		size = String.valueOf(seed).length();
		totalSize = String.valueOf(total).length();
		
		StringBuilder  middle = new StringBuilder();
	    String nums;
	    
	    nums = Long.toString(total);
	    
	  //checks to see if the total size is even or odd
	    if(totalSize % 2 == 0)
	    {	//if even then divide the number in half
	    	k = totalSize / 2;
	    }else{//if odd then subtract one from the number to make it even then divide by 2
	    	k = (totalSize -1) / 2;
	    }
	    
	    i = (k - 1);
	    do{
	    	middle.append(nums.charAt(i));
	    	i = i + 1;
	    	
	    	count ++;
	    }while(count != size );
	    
	    return Integer.parseInt(middle.toString());
	}
}