For this project, it comes up with 3 main methods to count the number of red blood cells in an image.  The first method is called Erosion method.  In this method, we first changed the color image to grayscale image, then we enhanced the contrast, fill-holes, and eliminate the black dots in the image.  We then applied the erosion and count the white region, and the number of cells were counted, which was 110 cells.  

The problem of this method is that it cannot count the overlapping cells and some cells were counted twice.  The second method is called Imfindcircle.  With this method, we enhanced the contrast first, then applied the function imfindcircle to count the number of cells, which gave 158 cells.  The problem with this method is that it can only count the cells that has perfectly circles.  It cannot count the cells at the edge.

The third method is called coordinate comparison, which is the combination of methods 1 and 2.  This method compares the center coordinate of the cells.  However, it is a failed attempt since there were no difference.  This method gave the result of 268 cells, which is incorrect.

The fourth method is called the region cut method.  It is another combination of method 1 and 2 with the result of 131 cells.  We separated the 2 regions, with the edge and the center region, since method 1 can count the cells at the edge and method 2 can count cells in the center of the image.  However, this fourth method cannot count the cells on the edge.

Method 5 is called two-region method.  We also divided the image into 2 regions, just like in method 4.  We then applied method 1 for the edge and method 2 for the whole pic, and cut the center picture then applied method 2 to count the cells at the center.  The result is there were 178 cells. 

It combines the advantages of methods 1 and 2 very well and it also avoided their lack of statistical process.
