import java.io.*; 
import java.util.*; 

public class SelectionSort {

	// Fields
	private int[] array;
	private final int MARGIN = 10;
	private float barWidth;
	private int screenHeight;
	private int minIndex;

	public SelectionSort (int[] array, int screenWidth, int screenHeight) {
		setArray(array);
		setBarWidth(array.length,screenWidth);
		setScreenHeight(screenHeight);
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Setters ******************
// ----------------------------------------------------------------------------------------------------------------

	private void setArray(int[] array) {
		this.array = array;
	}

	private void setBarWidth(int length, int screenWidth) {
		barWidth = (float) (screenWidth - (MARGIN*length) - MARGIN) / (length) ;
	}

	private void setScreenHeight(int screenHeight) {
		this.screenHeight = screenHeight;
	}

	public void setMinIndex(int i) {
		this.minIndex = i;
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Getters ******************
// ----------------------------------------------------------------------------------------------------------------

	private int getBarHeight(int i) {
		return array[i] * (int) barWidth/2;
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** ???????????? ******************
// ----------------------------------------------------------------------------------------------------------------

	public void printArray() {
		println(Arrays.toString(array));
	}

	public void wait(int ms) {
		try {
			Thread.sleep(ms);
		} catch(InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
	}

	public boolean isSorted() {
		for (int i = 0; i < array.length - 1; i++) {
			if (array[i] > array[i + 1])
				return false;
		}
		return true;
	}

	public int i = 0;
	public int j = 0;

	public void sort() {
	
		if(!isSorted()) {
			
			wait(waitLengthMilliseconds);
			if(i<arrayLength) {
				if(j == 0) {
					setMinIndex(i);
					j = i + 1;
				}
				if(j<arrayLength) {
					findMinIndex(j);
					background(255);
					draw();
					drawSelectedBar();
					drawSelectedBar(j);
					j++;
				} else if(j == arrayLength) {
					background(255);
					draw();
					move(i);
					j = 0;
					i++;
				}
			} else if(i == arrayLength - 1) {
				println("borked");
			}

		} else {
			background(255);
			draw();
			printArray();
			println("Array Sorted!");
			noLoop();
		}
	}// sort

	public void sortArray() {

		for (int i = 0; i < arrayLength-1; i++) { 
			setMinIndex(i);
			for (int j = i+1; j < arrayLength; j++) 
				findMinIndex(j); 
	
			move(i);
		}
	}// sortArray


	public void findMinIndex(int j) {
		if(array[j] < array[minIndex])
			this.minIndex = j;
	}

	public void move(int i) {
		int temp = array[minIndex]; 
		array[minIndex] = array[i]; 
		array[i] = temp; 
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Draw ******************
// ----------------------------------------------------------------------------------------------------------------

	public void draw() {

		// Sets color and stroke of bars
		fill(0,0,255);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);

		// Draws bars
		for (int i = 0; i < array.length; i++)
			rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));	
	}
	
	public void drawSelectedBar() {
		fill(255,0,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		rect(minIndex*barWidth+minIndex*MARGIN + MARGIN, screenHeight, minIndex*barWidth+minIndex*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(minIndex));
	}

	public void drawSelectedBar(int j) {
		fill(0,255,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		rect(j*barWidth+j*MARGIN + MARGIN, screenHeight, j*barWidth+j*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(j));
	}
}
