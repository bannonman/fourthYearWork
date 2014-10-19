package letterCounter;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;


public class letterCount {
	public static void main(String args[])throws FileNotFoundException, IOException{
		new letterCount();
	}
	
	public letterCount() throws FileNotFoundException, IOException{
		char letter[] ={'A','B','C','D','E','F','G',
						'H','I','J','K','L','M','N','O',
						'P','Q','R','S','T','U','V','W','X',
						'Y','Z'};
		int num;
		int count = 0;
		char let;
		StringBuffer sb = new StringBuffer();
		PrintWriter writer = new PrintWriter("write.txt");
		
	    for(int k = 0 ; k < letter.length ; k ++){
	    	FileInputStream fileInput = new FileInputStream("read.txt");
	    	
	    	num = 0;
	    	count = 0;
	    	int i;
	    
	    	
	    	while ((i = fileInput.read()) != -1) {
			    let = (char) i;
			    if(letter[k] == let){
			    	num = num + 1;	
			    }
			    count = num; 
	    	}
	    	
	    	sb.append(letter[k]);
    		sb.append(":");
    		sb.append(count);
    		sb.append(",");
    		
	    	System.out.print(letter[k] + ":" + count+",");
	    		
	    	fileInput.close();
	    }
	    
	    writer.println(sb);
    	
    	writer.close();
	}
}
