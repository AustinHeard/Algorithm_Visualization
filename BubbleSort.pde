import java.util.Random;

public class BubbleSort {

	// Fields
	private int[] array;
	private float barWidth;
	private int screenHeight;
	private final int MARGIN = 10;


	public BubbleSort(int[] array, int screenWidth, int screenHeight) {
		this.array = array;
		setBarWidth(array.length,screenWidth);
		setScreenHeight(screenHeight);
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Setters ******************
// ----------------------------------------------------------------------------------------------------------------

	private void setArray(int length) {
		Random rand = new Random();

		array = new int[length];

		for (int i = 0; i < array.length; i++) {
			array[i] = rand.nextInt(length) + 1;
		}
	}

	private void setBarWidth(int length, int screenWidth) { 
		barWidth = (float) (screenWidth - (MARGIN*length) - MARGIN) / (length) ;
	}

	private void setScreenHeight(int screenHeight) {
		this.screenHeight = screenHeight;
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Getters ******************
// ----------------------------------------------------------------------------------------------------------------

	public int getBarHeight(int i) {
		return array[i] * (int) barWidth/2;
	}

	public int[] getArray(){
		return array;
	}
// ----------------------------------------------------------------------------------------------------------------
//  ****************** ???????????? ******************
// ----------------------------------------------------------------------------------------------------------------

	public boolean isSorted() {
		for (int i = 0; i < array.length - 1; i++) {
			if (array[i] > array[i + 1])
				return false;
		}
		return true;
	}

	public void wait(int ms) {
		try {
			Thread.sleep(ms);
		} catch(InterruptedException ex) {
			Thread.currentThread().interrupt();
		}
	}

	public int i = 0;
	public int j = 0;

	public void sort() {

		if(!bubble.isSorted()) {

			if(i < arrayLength - 1) {
				wait(waitLengthMilliseconds);
				background(255);
				draw();
				drawSelectedBar(i);
				sortArray();
				i++;
			}

			if(i == arrayLength - 1)
				i = 0;
			} else {
				background(255);
				draw();
				printArray(getArray());
				println("Array Sorted!");
				noLoop();
			}


		// Sort Algorithm
		// if (array[i] > array[i+1]) {
		// 	int temp = array[i];
		// 	array[i] = array[i+1];
		// 	array[i+1] = temp;
		// }

	}

	private void sortArray() {
		if (array[i] > array[i+1]) {
			int temp = array[i];
			array[i] = array[i+1];
			array[i+1] = temp;
		}
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
		for (int i = 0; i < array.length; i++) {
			rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
		}


		// Draws Numbers
		
		// fill(40);
		// textSize(17);
		// for (int i = 0; i < array.length; i++) {
		//   text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight(i) - 20);
		// }
		
	}

	public void drawSelectedBar(int i) {
		fill(255,0,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
	}

}// BubbleSort
