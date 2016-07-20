# hw5
MATLAB Programming NCTU Spring 2016 Assignment#5 due 2016/6/9
This assignment extends the previous Labs 10 and 11.
Here you will make some modifications to Lab 11 to
create an image viewer, one similar to Paint without the
editing capability.
 The axes is now for image display. Use function
image to put a RGB image into the axes. You need
to use axes to set it as the current axes before
calling image.
 Set the Unit property of the figure and the axes to
Pixels so that you know the correct size of the
axes.
 You do not need the edit box and the popup menu in
the labs. Instead, use one of MATLAB's supplied dialog box for opening files to select an image file. Read
the documentation and figure out how to do this.
 Set an upper bound of the zooming factor (such as 8 or 16), so that you will not run out of memory.
 Wherever the view changes (due to a new image file loaded or any change to the zooming factor or
positions of the slider bars), you need to create a viewing image with the same size as the axes (in pixels)
and then use image to put this viewing image in the axes.
 When an image is first loaded, set the zooming factor to one, meaning that one image pixel is
shown in one screen pixel. Do not resize the image to fit the axes.
 If the input image (under the current zooming factor) is larger than the axes size in any dimension,
enable the corresponding slider.
 If the input image (under the current zooming factor) is smaller than or equal to the axes size in any
dimension, disable the corresponding slider. Any part of the viewing image not occupied by
contents from the input image should be filled with white color.
 When the zooming factor is n, a pixel in the input image is converted to a nxn square in the viewing
image. You should already know how to do this from Assignment #3. (You're only required to handle
cases with n≥1.)
Submission: Submit both your code (.m file) and the GUIDE layout file (.fig file) through e3. Name your file
P5_#######.m, and P5_#######.fig, where the ####### represents your student ID. There will
be two weeks for each assignment plus a three-day grace period, during which there will be a 10%/day
deduction for your grade.
A "copy detection" will be applied to your submissions, and those found to have copied assignments will
receive zero points for the assignment.
