package randomNumberGenerator;

import java.util.Random;

public class numberGen {

	public numberGen(){
		int i;
		
		for(i = 0; i < 10000 ; i++)
			System.out.print("Number:" + i + " Random Number: " + rand(0 , 200) + ",\n");
	}
	
	public static int rand(int min, int max) {
	    Random rand = new Random();

	    int random = rand.nextInt((max - min) + 1) + min;

	    return random;
	}
}
