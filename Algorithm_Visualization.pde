
// ----------------------------------------------------------------------------------------------------------------
//  ****************** Global Variables ******************
// ----------------------------------------------------------------------------------------------------------------

// Window Size
// public int screenWidth = 2000;
// public int screenHeight = 1000;

// Window Size Laptop
public int screenWidth = 900;
public int screenHeight = 600;

// Sort settings
public int arrayLength = 50;
public int waitLengthMilliseconds  = 100;

// Sort Methods
public BubbleSort bubble;
public SelectionSort selection;
public InsertionSort insertion;
public MergeSort merge;

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Setup && Draw ******************
// ----------------------------------------------------------------------------------------------------------------

public void settings() {
  size(screenWidth, screenHeight);
  // Fix for linux laptop
  System.setProperty("jogl.disable.openglcore", "false");
}

public void setup() {
  frameRate(144);

  surface.setTitle("Algorithm Visualization");
  surface.setResizable(true);

  bubble = new BubbleSort(arrayLength,screenWidth,screenHeight);
  selection = new SelectionSort(arrayLength,screenWidth,screenHeight);
  insertion = new InsertionSort(arrayLength,screenWidth,screenHeight);
  merge = new MergeSort(arrayLength,screenWidth,screenHeight);

  bubble.printArray();

  background(255);
}

public void draw() {
  bubbleSort();
}


public void wait(int ms) {
  try {
    Thread.sleep(ms);
  } catch(InterruptedException ex) {
    Thread.currentThread().interrupt();
  }
}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Sort Algorithms ******************
// ----------------------------------------------------------------------------------------------------------------

// Bubble Sort ---------------------------------------

public int i = 0;
public int j = 0;

public void bubbleSort() {
  
  if(!bubble.isSorted()) {

    if(i < arrayLength - 1) {
      wait(waitLengthMilliseconds);
      background(255);
      bubble.draw();
      bubble.drawSelectedBar(i);
      bubble.sort(i);
      i++;
    }
    if(i == arrayLength - 1)
      i = 0;
  } else {
    background(255);
    bubble.draw();
    bubble.printArray();
    println("Array Sorted!");
    noLoop();
  }
}// bubbleSort

// Selection Sort ---------------------------------------

// public int i = 0;
// public int j = 0;

public void selectionSort() {
  
  if(!selection.isSorted()) {
    
    wait(waitLengthMilliseconds);
    if(i<arrayLength) {
      if(j == 0) {
        selection.setMinIndex(i);
        j = i + 1;
      }
      if(j<arrayLength) {
        selection.findMinIndex(j);
        background(255);
        selection.draw();
        selection.drawSelectedBar();
        selection.drawSelectedBar(j);
        j++;
      } else if(j == arrayLength) {
        background(255);
        selection.draw();
        selection.move(i);
        println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        j = 0;
        i++;
      }
    } else if(i == arrayLength - 1) {
      println("borked");
    }

  } else {
    background(255);
    selection.draw();
    selection.printArray();
    println("Array Sorted!");
    noLoop();
  }
}// selectionSort

// Insertion Sort ---------------------------------------

// public int i = 1;
// public int j = 0;

public void insertionSort() {
  
  if(!insertion.isSorted()) {

    wait(waitLengthMilliseconds);

    if(i < arrayLength) {

      // println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      // insertion.printArray();

      if(insertion.isRangeSorted(i)|| i == 1 || j <= -1) {
        insertion.setKey(i);
        j = i - 1;
      }

      if(j >= 0 && insertion.getArrayElement(j) > insertion.getKey()) {
        insertion.setArrayElement(j);

        background(255);
        insertion.draw();
        insertion.drawKeyBar(j);
        insertion.drawSelectedBar(i);
        height -= 1;
        j -= 1;
      }
      

      // println("");
      // println("I:" + i);
      // println("J:" + j);
      // println("Key:" + insertion.getKey());
      // println("");


      insertion.setArrayElementToKey(j);

      if(insertion.isRangeSorted(i)) {
        i++;
      }
    }
      
    //insertion.sort();
  } else {
    background(255);
    insertion.draw();
    insertion.printArray();
    println("Array Sorted!");
    noLoop();
  }
}// insertionSort

// Merge Sort ---------------------------------------

// Global variables for pseudo for loop
// public int i = 1;
// public int j = 0;

// public void mergeSort() {
  
//   if(!merge.isSorted()) {

    
//   } else {
//     background(255);
//     merge.draw();
//     merge.printArray();
//     println("Array Sorted!");
//     noLoop();
//   }
// } // mergeSort
