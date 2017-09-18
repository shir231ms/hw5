# hw5
MATLAB Programming NCTU Spring 2016 Assignment#5 due 2016/6/9
create an image viewer, one similar to Paint without the editing capability.
- The axes is now for image display. Use function image to put a RGB image into the axes. You need
to use axes to set it as the current axes before
calling image.
- Set the Unit property of the figure and the axes to
Pixels so that you know the correct size of the
axes.
- You do not need the edit box and the popup menu in
the labs. Instead, use one of MATLAB's supplied dialog box for opening files to select an image file. Read
the documentation and figure out how to do this.
- Set an upper bound of the zooming factor (such as 8 or 16), so that you will not run out of memory.
- Wherever the view changes (due to a new image file loaded or any change to the zooming factor or
positions of the slider bars), you need to create a viewing image with the same size as the axes (in pixels)
and then use image to put this viewing image in the axes.
- When an image is first loaded, set the zooming factor to one, meaning that one image pixel is
shown in one screen pixel. Do not resize the image to fit the axes.
- If the input image (under the current zooming factor) is larger than the axes size in any dimension,
enable the corresponding slider.
- If the input image (under the current zooming factor) is smaller than or equal to the axes size in any
dimension, disable the corresponding slider. Any part of the viewing image not occupied by
contents from the input image should be filled with white color.
- When the zooming factor is n, a pixel in the input image is converted to a nxn square in the viewing
image. You should already know how to do this from Assignment #3. (You're only required to handle
cases with n≥1.)


$Nymphia$正透過鏡子讀取記憶體上由8個01組成的二進位數字，由於透過鏡子會把資料左右順序相反過來，因此$Nymphia$直接把這些資料照鏡子看見的順序轉換成10進位後，與正確數字不一樣。你能協助$Nymphia$把錯誤的數字轉換成正確的數字嗎？

\InputFile

輸入只有一個數字N，保證$0\leq N 2^8$

\OutputFile

請輸出一個數字，最後面要換行。為正確解讀資料後得到的十進位數字

\Examples

IN
144

OUT
9
