import java.util.Random;

public class BubbleSort {

	// Fields
	private int[] array;
	private int screenHeight;
	private float barHeight;
	private float barWidth;
	private float barX;
	private final int MARGIN = 10;


	public BubbleSort(int[] array, int screenWidth, int screenHeight) {
		setArray(array);
		setBarWidth(array.length,screenWidth);
		setScreenHeight(screenHeight);
	}// BubbleSort

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Setters ******************
// ----------------------------------------------------------------------------------------------------------------

	private void setArray(int[] array) {
		this.array = array;
	}// setArray

	private void setBarWidth(int length, int screenWidth) { 
		this.barWidth = (float) (screenWidth - (MARGIN*length) - MARGIN) / (length) ;
	}// setBarWidth

	private void setScreenHeight(int screenHeight) {
		this.screenHeight = screenHeight;
	}// setScreenHeight

	private void setBarHeight(int i) {
		this.barHeight = array[i] * (int) barWidth/2;
	}// setBarHeight

	public void setBarX(int i){
		this.barX = i*barWidth + i*MARGIN + MARGIN;
	}// setBarX

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Getters ******************
// ----------------------------------------------------------------------------------------------------------------

	public float getBarHeight() {
		return barHeight;
	}// getBarHeight

	public int[] getArray() {
		return array;
	}// getArray

	public boolean isSorted() {
		for (int i = 0; i < array.length - 1; i++)
			if (array[i] > array[i + 1])
				return false;
		return true;
	}// isSorted
	
	public void printArray() {
		println(Arrays.toString(array));
	}// printArray

	public float getBarX() {
		return this.barX;
	}// getBarX

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Show & Sort Methods ******************
// ----------------------------------------------------------------------------------------------------------------

	// I and J for pseudo for loop
	private int i = 0;
	private int j = 0;

	public void show() {

		background(255);

		if(!isSorted()) {

			if(i < arrayLength - 1) {
				draw();
				sort();
				i++;
			}

			if(i == arrayLength - 1)
				i = 0;
		
		} else {
			drawSorted();
			printArray();
			println("Array Sorted!");
			noLoop();
		}
	}// show

	private void sort() {
		if (array[i] > array[i+1]) {
			int temp = array[i];
			array[i] = array[i+1];
			array[i+1] = temp;
		}
	}// sort

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Draw ******************
// ----------------------------------------------------------------------------------------------------------------

	private void draw() {
		drawBarNumbers();
		drawBars();
		drawSelectedBar(i);	
	}// draw

	private void drawSorted() {
		drawBarNumbers();
		drawBars();
	}// draw

	private void drawBars() {
		fill(0,0,255);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		for (int i = 0; i < array.length; i++) {
			setBarHeight(i);
			setBarX(i);
			rect(getBarX(), screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight());
		}
	}// drawBars

	public void drawSelectedBar(int i) {
		fill(255,0,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		setBarHeight(i);
		setBarX(i);
		rect(getBarX(), screenHeight, i*barWidth + i*MARGIN + MARGIN + barWidth, screenHeight - getBarHeight());
	}// drawSelectedBar

	private void drawBarNumbers() {
		fill(40);
		textSize(10);
		for (int i = 0; i < array.length; i++) {
			setBarHeight(i);
			text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight() - 20);
		}
	}// drawBarNumbers

}// BubbleSort
