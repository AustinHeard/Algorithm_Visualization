import java.io.*; 
import java.util.*; 

public class SelectionSort {

	// Fields
	private int[] array;
	private final int MARGIN = 10;
	private float barHeight;
	private float barWidth;
	private float barX;
	private int screenHeight;
	private int minIndex;

	public SelectionSort (int[] array, int screenWidth, int screenHeight) {
		setArray(array);
		setBarWidth(array.length,screenWidth);
		setScreenHeight(screenHeight);
	}// SelectionSort

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

	private void setMinIndex(int i) {
		this.minIndex = i;
	}// setMinIndex

	private void setBarHeight(int i) {
		this.barHeight = array[i] * (int) barWidth/2;
	}// setBarHeight

	private void setBarX(int i) {
		this.barX = i*barWidth + i*MARGIN + MARGIN;
	}// setBarX

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Getters ******************
// ----------------------------------------------------------------------------------------------------------------

	public float getBarHeight() {
		return barHeight;
	}// getBarHeight

	public void printArray(int[] array) {
		println(Arrays.toString(array));
	}// printArray

	public boolean isSorted() {
		for (int i = 0; i < array.length - 1; i++)
			if (array[i] > array[i + 1])
				return false;
		return true;
	}// isSorted

	public float getBarX() {
		return this.barX;
	}// getBarX

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Show & Sort ******************
// ----------------------------------------------------------------------------------------------------------------

	public int i = 0;
	public int j = 0;

	public void show() {
	
		if(!isSorted()) {
			if(i<array.length) {
				if(j == 0) {
					setMinIndex(i);
					j = i + 1;
				}
				if(j<array.length) {
					findMinIndex(j);
					j++;
				}
				if(j == array.length) {
					move(i);
					j = 0;
					i++;
				}
			} else if(i == array.length - 1)
				println("borked");

			background(255);
			draw();
		} else {
			background(255);
			drawSorted();
			printArray(array);
			println("Array Sorted!");
			noLoop();
		}
	}// show

	public void findMinIndex(int j) {
		if(array[j] < array[minIndex])
			this.minIndex = j;
	}// findMinIndex

	public void move(int i) {
		int temp = array[minIndex]; 
		array[minIndex] = array[i]; 
		array[i] = temp; 
	}// move

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Draw ******************
// ----------------------------------------------------------------------------------------------------------------

	public void draw() {
		drawBars();
		drawKeyBar(minIndex);
		drawSelectedBar(j);
		drawBarNumbers();
	}// draw

	private void drawSorted() {
		background(255);
		drawBarNumbers();
		drawBars();
	}// drawSorted
	
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

	public void drawKeyBar(int i) {
		fill(255,0,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		setBarHeight(i);
		setBarX(i);
		rect(getBarX(), screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight());
	}// drawKeyBar

	public void drawSelectedBar(int j) {
		fill(0,255,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		setBarHeight(j);
		setBarX(j);
		rect(getBarX(), screenHeight, j*barWidth+j*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight());
	}// drawSelectedBar

	private void drawBarNumbers() {
		fill(40);
		textSize(10);
		for (int i = 0; i < array.length; i++) {
			setBarHeight(i);
			text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight() - 20);
		}
	}// drawBarNumbers

}// SelectionSort
