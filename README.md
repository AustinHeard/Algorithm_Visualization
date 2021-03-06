
[![LinkedIn][linkedin-shield]][linkedin-url]

<!-- Things I Need to Fix -->
## Things I Need to Fix (TODO)

1. Implement betting OOP in the project so there are not so many lines of code repeated from one Sort method to another.

2. Convert the project to use the processing function `redraw()` to not have to deal with the crazy way of rendering that me from 10 months ago doing.

<!-- ABOUT THE PROJECT -->
## About The Project

This project was created as a way to get ready for my Data Structures and Algorithms class. The program can visualize three sorting algorithms as of now. These algorithms are Bubble, Insertion, and Selection sort.

<!-- Problems Encountered -->
### Problems Encountered

1. How Drawing Works in Processing

In processing the `draw()` function is called continuously after the `setup()` function is called once. This means that if a `for` loop is used in the `draw()` function everything is paused until the `for` loop is over. This is a problem if the goal is to show what the algorithms are doing in the `for` loops.

<!-- Solutions -->
### Solutions

1. How Drawing Works in Processing

The solution to this problem was to use if statements as pseudo for loops. While this is very easy for algorithms like bubble sort it gets much more complicated for algorithms like insertion sort.

<!-- Built With -->
### Built With

* [Java](https://www.oracle.com/java/)
* [Processing](https://processing.org/)

<!-- Demonstration -->
## Demonstration

Click image below for video:

[![YouTube Video](http://img.youtube.com/vi/Wupl9XbHalw/0.jpg)](https://www.youtube.com/watch?v=Wupl9XbHalw)

<!-- CONTACT -->
## Contact

Linkedin: [https://www.linkedin.com/in/austin-heard/](https://www.linkedin.com/in/austin-heard/)

Project Link: [https://github.com/AustinHeard/Algorithm_Visualization](https://github.com/AustinHeard/Algorithm_Visualization)

<!-- MARKDOWN LINKS & IMAGES -->
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://www.linkedin.com/in/austin-heard/
