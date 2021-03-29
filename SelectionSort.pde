import java.io.*; 
import java.util.*; 

public class SelectionSort {

  // Fields
  private int[] array;
  private final int MARGIN = 10;
  private float barWidth;
  private int screenHeight;
  private int minIndex;

  public SelectionSort (int length, int screenWidth, int screenHeight) {
    setArray(length);
    setBarWidth(length,screenWidth);
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

  public boolean isSorted() {
    for (int i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1])
        return false;
    }
    return true;
  }

  public void sort() {

    for (int i = 0; i < arrayLength-1; i++) { 
      setMinIndex(i);
      println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      for (int j = i+1; j < arrayLength; j++) 
        findMinIndex(j); 
  
      move(i);
    }
  }


  public void findMinIndex(int j) {
    if(array[j] < array[minIndex]) {
      this.minIndex = j;
    }
    
    println("Min: " + array[minIndex]);
    println("MinIndex: " + this.minIndex);
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
    for (int i = 0; i < array.length; i++) {
      rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
    }

    // Sets color and size of numbers
    fill(40);
    textSize(17);

    // Draws Numbers
    for (int i = 0; i < array.length; i++) {
      text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight(i) - 20);
    }
    
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
