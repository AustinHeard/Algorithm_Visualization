public class MergeSort {

  // Fields
  private int[] array;
  private float barWidth;
  private int screenHeight;
  private final int MARGIN = 10;

  public MergeSort (int length, int screenWidth, int screenHeight) {
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

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Getters ******************
// ----------------------------------------------------------------------------------------------------------------

  private int getBarHeight(int i) {
    return array[i] * (int) barWidth/2;
  }

  public void printArray() {
    println(Arrays.toString(array));
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
}// MergeSort
