import java.util.*;
// ----------------------------------------------------------------------------------------------------------------
//  ****************** Global Variables ******************
// ----------------------------------------------------------------------------------------------------------------

// Window Size Desktop
public int screenWidth = 2560;
public int screenHeight = 1440;

// Window Size Laptop
// public int screenWidth = 950;
// public int screenHeight = 600;

// Sort settings
public boolean bubbleSort = false;
public boolean selectionSort = false;
public boolean insertionSort = true;
public boolean mergeSort = false;
public int[] array;
public int arrayLength = 50;
public int waitLengthMilliseconds  = 30;

// Sort Methods
public BubbleSort bubble;
public SelectionSort selection;
public InsertionSort insertion;
// public MergeSort merge;

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Setup && Draw ******************
// ----------------------------------------------------------------------------------------------------------------

public void settings() {
	//size(screenWidth, screenHeight);
	fullScreen();

	// Fix for linux laptop
	System.setProperty("jogl.disable.openglcore", "false");
}// settings

public void setup() {
	// Sets framerate
	frameRate(144);

	// Set title of window and make it resizavble
	surface.setTitle("Algorithm Visualization");
	surface.setResizable(true);

	// Initializes Array
	initializeArray();

	// Initializes Sorts
	bubble = new BubbleSort(array, screenWidth, screenHeight);
	selection = new SelectionSort(array, screenWidth, screenHeight);
	insertion = new InsertionSort(array, screenWidth, screenHeight);
	//merge = new MergeSort(array, screenWidth, screenHeight);

	// Sets background color to white
	background(255);

	// Pauses the sketch to make the paused boolean correct
	// and pause the sketch at the end of setup

	// Has to be the last line in setup as per docs
	noLoop();
}// setup

public void draw() {
	sort();
	drawFramerate();
	drawDelay();
	drawSortingAlgorithm();
}// draw

public void sort() {
	
	wait(waitLengthMilliseconds);
	
	if (bubbleSort == true) {
        bubble.show();
	} else if (selectionSort == true) {
        selection.show();
	} else if (insertionSort == true) {
		insertion.show();
	} else if (mergeSort == true) {
		// mergeSort();
	} else {
		println("broken");
	}
}// sort

public void wait(int ms) {
	try {
		Thread.sleep(ms);
	} catch(InterruptedException ex) {
		Thread.currentThread().interrupt();
	}
}// wait


// Code to pause the sketch to make recording it easier
boolean paused = true;

public void keyPressed() {

	if ( key == 'p' ){

		paused = !paused;

		if (paused)
			noLoop();
		else 
			loop();

	}
}

public void drawFramerate() {
	fill(10);
	textSize(32);
	text("Frame rate: " + int(frameRate), 10, 60);
}// drawFramerate

public void drawDelay() {
	fill(10);
	textSize(32);
	text("Wait length between draws: " + waitLengthMilliseconds + "ms", 300, 60);
}// drawDelay

public void drawSortingAlgorithm() {
	fill(10);
	textSize(32);
	text("Insertion Sort", 1000, 60);
}// drawSortingAlgorithm
// ----------------------------------------------------------------------------------------------------------------
//  ****************** Create and Shuffle Array ******************
// ----------------------------------------------------------------------------------------------------------------

public void initializeArray() {
	// Set array of numbers from 1 - arrayLength
	setArray();

	// Shuffle array
	shuffleArray(array);

	// Print array
	printArray();
}// initializeArray

public void setArray() {
	this.array = new int[arrayLength];
		for (int i = 0;i < array.length;i++)
			this.array[i] = i + 1;
}// setArray

// https://www.journaldev.com/32661/shuffle-array-java
public void shuffleArray(int[] array) {
	Random rand = new Random();

	for (int i = 0; i < array.length; i++) {
		int randomIndexToSwap = rand.nextInt(array.length);
		int temp = array[randomIndexToSwap];
		array[randomIndexToSwap] = array[i];
		array[i] = temp;
	}
}// shuffleArray

public void printArray() {
	println(Arrays.toString(array));
}// printArray