int screenWidth = 2000;
int screenHeight = 1000;
int waitLength = 0;

BubbleSort bubble;
SelectionSort selection;
InsertionSort insertion;
MergeSort merge;

void settings() {
  size(screenWidth, screenHeight);
}

void setup() {
  frameRate(144);
  surface.setResizable(true);
  bubble = new BubbleSort(arrayLength,screenWidth,screenHeight);
  selection = new SelectionSort(arrayLength,screenWidth,screenHeight);
  insertion = new InsertionSort(arrayLength,screenWidth,screenHeight);
  merge = new MergeSort(arrayLength,screenWidth,screenHeight);
  insertion.printArray();
  background(255);
}

void draw() {
  insertionSort();
}


public void wait(int ms)
{
  try
  {
    Thread.sleep(ms);
  }
  catch(InterruptedException ex)
  {
    Thread.currentThread().interrupt();
  }
}

// ------------------------------------------------------------------------
//  Sort Algorithms
// ------------------------------------------------------------------------

int arrayLength = 100;
// Global variables for pseudo for loop
// int i = 1;
// int j = 0;

// public void mergeSort(){
  
//   if(!merge.isSorted()) {

    
//   } else {
//     background(255);
//     merge.draw();
//     merge.printArray();
//     println("Array Sorted!");
//     noLoop();
//   }
// }

int i = 1;
int j = 0;

public void insertionSort(){
  
  if(!insertion.isSorted()) {

    wait(0);

    if(i < arrayLength){

      // println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      // insertion.printArray();

      if(insertion.isRangeSorted(i)|| i == 1 || j <= -1){
        insertion.setKey(i);
        j = i - 1;
      }

      if(j >= 0 && insertion.getArrayElement(j) > insertion.getKey()){
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

      if(insertion.isRangeSorted(i)){
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
}

// int i = 0;
// int j = 0;

public void selectionSort(){
  
  if(!selection.isSorted()) {
    
    wait(50);
    if(i<arrayLength){
      if(j == 0){
        selection.setMinIndex(i);
        j = i + 1;
      }
      if(j<arrayLength){
        selection.findMinIndex(j);
        background(255);
        selection.draw();
        selection.drawSelectedBar();
        selection.drawSelectedBar(j);
        j++;
      } else if(j == arrayLength){
        background(255);
        selection.draw();
        selection.move(i);
        println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
        j = 0;
        i++;
      }
    } else if(i == arrayLength - 1){
      println("borked");
    }

  } else {
    background(255);
    selection.draw();
    selection.printArray();
    println("Array Sorted!");
    noLoop();
  }
}

// int i = 0;
// int j = 0;

public void bubbleSort(){
  
  if(!bubble.isSorted()) {

    if(i < arrayLength - 1){
      wait(waitLength);
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
}