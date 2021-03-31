import java.util.Random;

public class InsertionSort {

	// Fields
	private int[] array;
	private int screenHeight;
	private float barHeight;
	private float barWidth;
	private float barX;
	private float keyBarHeight;
	private final int MARGIN = 10;
	private int key;


	public InsertionSort(int[] array, int screenWidth, int screenHeight) {
		setArray(array);
		setBarWidth(array.length,screenWidth);
		setScreenHeight(screenHeight);
	}// InsertionSort

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
		if (i == 50)
			i = 49;
		this.barHeight = array[i] * (int) barWidth/2;
	}// setBarHeight

	private void setKeyBarHeight(int key) {
		if (i == 50)
			i = 49;
		this.keyBarHeight = key * (int) barWidth/2;
	}// setKeyBarHeight

	private void setKey(int i) {
		this.key = array[i];
	}// setKey

	private void setArrayElement(int j) {
		this.array[j + 1] = getArrayElement(j);
	}// setArrayElement

	private void setArrayElementToKey(int j) {
		this.array[j + 1] = getKey();
	}// setArrayElementToKey

	private void setBarX(int i){
		this.barX = i*barWidth + i*MARGIN + MARGIN;
	}// setBarX

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Getters ******************
// ----------------------------------------------------------------------------------------------------------------

	public float getBarHeight() {
		return barHeight;
	}// getBarHeight

	public float getKeyBarHeight() {
		return keyBarHeight;
	}// getKeyBarHeight

	public boolean isSorted() {
		for (int i = 0; i < array.length - 1; i++)
			if (array[i] > array[i + 1])
				return false;
		return true;
	}// isSorted
	
	public void printArray() {
		println(Arrays.toString(array));
	}// printArray

	public int getKey() {
		return key;
	}// getKey

	public int getArrayElement(int j) {
		return array[j];
	}// getArrayElement

	public boolean isRangeSorted(int i) {
		int count = 1;
		for (int j = 1; j < i; j++)
			if (array[j] >= array[j - 1])
				count++;
		if(count == i)
			return true;
		else
			return false;
	}// isRangeSorted

	public float getBarX() {
		return this.barX;
	}// getBarX

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Show & Sort ******************
// ----------------------------------------------------------------------------------------------------------------

	// I and J for pseudo for loop
	private int i = 1;
	private int j = 0;

	public void show() {
		if(!isSorted()) {
			background(255);
			draw();
			if(i < arrayLength)
				sort();

		} else {
			drawSorted();
			printArray();
			println("Array Sorted!");
			noLoop();
		}
	}// show

	private void sort() {
		if(isRangeSorted(i)|| i == 1 || j <= -1) {
			setKey(i);
			j = i - 1;
		}

		if(j >= 0 && getArrayElement(j) > getKey()) {
			setArrayElement(j);
			j -= 1;
		}

		setArrayElementToKey(j);

		if(isRangeSorted(i))
			i++;
	}// sort

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Draw ******************
// ----------------------------------------------------------------------------------------------------------------

  	private void draw() {
		drawBarNumbers();
		drawBars();
		drawSelectedBar(i);
		drawKeyBar(j);
  	}// draw

	private void drawSorted() {
		background(255);
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

	private void drawKeyBar(int j) {
		j += 1;
		fill(0,255,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		setKeyBarHeight(getKey());
		setBarX(j);
		rect(getBarX(), screenHeight, j*barWidth + j*MARGIN + MARGIN + barWidth, screenHeight - getKeyBarHeight());
	}// drawKeyBar

	private void drawSelectedBar(int i) {
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

}// InsertionSort