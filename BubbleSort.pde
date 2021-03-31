import java.util.Random;

public class BubbleSort {

	// Fields
	private int[] array;
	private float barWidth;
	private int screenHeight;
	private final int MARGIN = 10;


	public BubbleSort(int[] array, int screenWidth, int screenHeight) {
		//setArray(length);
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

	private int getBarHeight(int i) {
		return array[i] * (int) barWidth/2;
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** ???????????? ******************
// ----------------------------------------------------------------------------------------------------------------

	public void printArray() {
		println(Arrays.toString(array));
	}

	public boolean isSorted() {
		for (int i = 0; i < array.length - 1; i++) {
			if (array[i] > array[i + 1])
				return false;
		}
		return true;
	}

	public void sort(int i) {

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
