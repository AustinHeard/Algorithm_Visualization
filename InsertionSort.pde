import java.util.Random;

public class InsertionSort {

    // Fields
    private int[] array;
    private float barWidth;
    private int barHeight;
    private int screenHeight;
    private final int MARGIN = 10;
    private int key;


    public InsertionSort(int[] array, int screenWidth, int screenHeight) {
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

    public void setKey(int i) {
    	this.key = array[i];
    }

    public void setArrayElement(int j) {
    	this.array[j + 1] = getArrayElement(j);
    }

    public void setArrayElementToKey(int j) {
    	this.array[j + 1] = getKey();
    }

    // private void setBarHeight(int i) {
    // 		this.barHeight;
    // }

// ----------------------------------------------------------------------------------------------------------------
//  ****************** Getters ******************
// ----------------------------------------------------------------------------------------------------------------

	public int getBarHeight(int i) {
		return array[i] * (int) barWidth/2;
	}

	public int getKey() {
		return key;
	}

	public int getArrayElement(int j) {
		return array[j];
	}

// ----------------------------------------------------------------------------------------------------------------
//  ****************** ???????????? ******************
// ----------------------------------------------------------------------------------------------------------------

	public boolean isSorted() {
		for (int i = 0; i < array.length - 1; i++) {
			if (array[i] > array[i + 1])
				return false;
		}
		return true;
	}

	public void printArray() {
		println(Arrays.toString(array));
	}

	public boolean isRangeSorted(int i) {
		int count = 1;
		for (int j = 1; j < i; j++) {
			if (array[j] >= array[j - 1])
				count++;
		}
		if(count == i) {
			return true;
		} else {
			return false;
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

	public void drawKeyBar(int i) {
		fill(0,255,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(j));
	}

	public void drawSelectedBar(int i) {
		fill(255,0,0);
		stroke(0);
		strokeWeight(2);
		rectMode(CORNERS);
		rect(i*barWidth+i*MARGIN + MARGIN, screenHeight, i*barWidth+i*MARGIN + MARGIN+barWidth, screenHeight - getBarHeight(i));
	}

}// InsertionSort