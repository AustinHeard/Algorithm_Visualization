import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.Random; 
import java.util.Random; 
import java.io.*; 
import java.util.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Algorithm_Visualization extends PApplet {

int screenWidth = 2000;
int screenHeight = 1000;
int waitLength = 0;

BubbleSort bubble;
SelectionSort selection;
InsertionSort insertion;
MergeSort merge;

public void settings() {
  size(screenWidth, screenHeight);
}

public void setup() {
  frameRate(144);
  surface.setResizable(true);
  bubble = new BubbleSort(arrayLength,screenWidth,screenHeight);
  selection = new SelectionSort(arrayLength,screenWidth,screenHeight);
  insertion = new InsertionSort(arrayLength,screenWidth,screenHeight);
  merge = new MergeSort(arrayLength,screenWidth,screenHeight);
  insertion.printArray();
  background(255);
}

public void draw() {
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


class BubbleSort {

  // Fields
  private int[] array;
  private float barWidth;
  private int screenHeight;
  private final int MARGIN = 10;


  public BubbleSort(int length, int screenWidth, int screenHeight) {
    setArray(length);
    setBarWidth(length,screenWidth);
    setScreenHeight(screenHeight);
  }

  private void setArray(int length) {
    Random rand = new Random();

    array = new int[length];

    for (int i = 0; i < array.length; i++) {
      array[i] = rand.nextInt(length) + 1;
    }
  }

  public void printArray(){
    println(Arrays.toString(array));
  }

  private void setBarWidth(int length, int screenWidth){
    barWidth = (float) (screenWidth - (MARGIN*length) - MARGIN) / (length) ;
  }

  private void setScreenHeight(int screenHeight){
    this.screenHeight = screenHeight;
  }

  private int getBarHeight(int i){
    return array[i] * (int) barWidth/2;
  }

  public boolean isSorted() {
    for (int i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1])
        return false;
    }
    return true;
  }

  public void sort(int i){

    if (array[i] > array[i+1]) {
      int temp = array[i];
      array[i] = array[i+1];
      array[i+1] = temp;
    }

  }

  public void draw(){

    // Sets color and stroke of bars
    fill(0,0,255);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);

    // Draws bars
    for (int i = 0; i < array.length; i++){
      rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
    }

    // Sets color and size of numbers
    fill(40);
    textSize(17);

    // Draws Numbers
    for (int i = 0; i < array.length; i++){
      text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight(i) - 20);
    }
    
  }

  public void drawSelectedBar(int i){
    fill(255,0,0);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
  }
}// BubbleSort


class InsertionSort {

  // Fields
  private int[] array;
  private float barWidth;
  private int screenHeight;
  private final int MARGIN = 10;


  public InsertionSort(int length, int screenWidth, int screenHeight) {
    setArray(length);
    setBarWidth(length,screenWidth);
    setScreenHeight(screenHeight);
  }

  private void setArray(int length) {
    Random rand = new Random();

    array = new int[length];

    for (int i = 0; i < array.length; i++) {
      array[i] = rand.nextInt(length) + 1;
    }
  }

  public void printArray(){
    println(Arrays.toString(array));
  }

  private void setBarWidth(int length, int screenWidth){
    barWidth = (float) (screenWidth - (MARGIN*length) - MARGIN) / (length) ;
  }

  private void setScreenHeight(int screenHeight){
    this.screenHeight = screenHeight;
  }

  private int getBarHeight(int i){
    return array[i] * (int) barWidth/2;
  }

  public boolean isSorted() {
    for (int i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1])
        return false;
    }
    return true;
  }

  public boolean isRangeSorted(int i) {
    int count = 1;
    for (int j = 1; j < i; j++) {
      if (array[j] >= array[j - 1])
        count++;
    }
    if(count == i){
      return true;
    } else {
      return false;
    }
  }

  public void draw(){

    // Sets color and stroke of bars
    fill(0,0,255);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);

    // Draws bars
    for (int i = 0; i < array.length; i++){
      rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
    }

    // Sets color and size of numbers
    fill(40);
    textSize(17);

    // Draws Numbers
    for (int i = 0; i < array.length; i++){
      text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight(i) - 20);
    }
    
  }

  public void drawKeyBar(int i){
    fill(0,255,0);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(j));
  }

  public void drawSelectedBar(int i){
    fill(255,0,0);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
  }

int key;

  public void setKey(int i){
    this.key = array[i];
  }

  public void setArrayElement(int j){
    this.array[j + 1] = getArrayElement(j);
  }
  public void setArrayElementToKey(int j){
    this.array[j + 1] = getKey();
  }

  public int getKey(){
    return key;
  }

  public int getArrayElement(int j){
    return array[j];
  }






}// InsertionSort
class MergeSort {

  // Fields
  private int[] array;
  private float barWidth;
  private int screenHeight;
  private final int MARGIN = 10;

  public MergeSort  (int length, int screenWidth, int screenHeight) {
    setArray(length);
    setBarWidth(length,screenWidth);
    setScreenHeight(screenHeight);
  }

  private void setArray(int length) {
    Random rand = new Random();

    array = new int[length];

    for (int i = 0; i < array.length; i++) {
      array[i] = rand.nextInt(length) + 1;
    }
  }

  public void printArray(){
    println(Arrays.toString(array));
  }

  private void setBarWidth(int length, int screenWidth){
    barWidth = (float) (screenWidth - (MARGIN*length) - MARGIN) / (length) ;
  }

  private void setScreenHeight(int screenHeight){
    this.screenHeight = screenHeight;
  }

  private int getBarHeight(int i){
    return array[i] * (int) barWidth/2;
  }
  
  public void draw(){

    // Sets color and stroke of bars
    fill(0,0,255);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);

    // Draws bars
    for (int i = 0; i < array.length; i++){
      rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
    }

    // Sets color and size of numbers
    fill(40);
    textSize(17);

    // Draws Numbers
    for (int i = 0; i < array.length; i++){
      text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight(i) - 20);
    }
    
  }
}// MergeSort
 
 

class SelectionSort {

  // Fields
  private int[] array;
  private float barWidth;
  private int screenHeight;
  private final int MARGIN = 10;

  public SelectionSort (int length, int screenWidth, int screenHeight) {
    setArray(length);
    setBarWidth(length,screenWidth);
    setScreenHeight(screenHeight);
  }

  private void setArray(int length) {
    Random rand = new Random();

    array = new int[length];

    for (int i = 0; i < array.length; i++) {
      array[i] = rand.nextInt(length) + 1;
    }
  }

  public void printArray(){
    println(Arrays.toString(array));
  }

  private void setBarWidth(int length, int screenWidth){
    barWidth = (float) (screenWidth - (MARGIN*length) - MARGIN) / (length) ;
  }

  private void setScreenHeight(int screenHeight){
    this.screenHeight = screenHeight;
  }

  private int getBarHeight(int i){
    return array[i] * (int) barWidth/2;
  }

  public boolean isSorted() {
    for (int i = 0; i < array.length - 1; i++) {
      if (array[i] > array[i + 1])
        return false;
    }
    return true;
  }

  public void draw(){

    // Sets color and stroke of bars
    fill(0,0,255);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);

    // Draws bars
    for (int i = 0; i < array.length; i++){
      rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
    }

    // Sets color and size of numbers
    fill(40);
    textSize(17);

    // Draws Numbers
    for (int i = 0; i < array.length; i++){
      text(String.valueOf(array[i]), i*barWidth+i*MARGIN + barWidth/2, screenHeight - getBarHeight(i) - 20);
    }
    
  }

  public void sort(){

    for (int i = 0; i < arrayLength-1; i++){ 
      setMinIndex(i);
      println("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~");
      for (int j = i+1; j < arrayLength; j++) 
        findMinIndex(j); 
  
      move(i);
    }
  }

  private int minIndex;

  public void setMinIndex(int i){
    this.minIndex = i;
  }

  public void findMinIndex(int j){
    if(array[j] < array[minIndex]){
      this.minIndex = j;
    }
    
    println("Min: " + array[minIndex]);
    println("MinIndex: " + this.minIndex);
  }

  public void move(int i){
    int temp = array[minIndex]; 
    array[minIndex] = array[i]; 
    array[i] = temp; 
  }

  
  public void drawSelectedBar(){
    fill(255,0,0);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(minIndex*barWidth+minIndex*MARGIN + MARGIN, screenHeight, minIndex*barWidth+minIndex*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(minIndex));
  }

  public void drawSelectedBar(int j){
    fill(0,255,0);
    stroke(0);
    strokeWeight(2);
    rectMode(CORNERS);
    rect(j*barWidth+j*MARGIN + MARGIN, screenHeight, j*barWidth+j*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(j));
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Algorithm_Visualization" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
