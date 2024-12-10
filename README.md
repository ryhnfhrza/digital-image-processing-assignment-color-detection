<h1 align="center">Color Detection</h1>


<br><br>
<p align="center">
  <img src="https://github.com/ryhnfhrza/assets/blob/main/Screenshot%20(1348).png" width="1200"/>
</p>
<br>




## Overview

This project aims to detect specific colors (red, yellow, green, blue, brown, gray, pink, purple, orange) in RGB images and perform image restoration based on the color detection. This process involves several steps, including image conversion, color component extraction, specific color detection, and morphological operations.

## Process steps
 **1. RGB Image Reading** <br>
   The RGB image is read from the specified file and displayed in the form of the original image.
   
   ---
**2. Conversion to HSV Format** <br>
The RGB image is converted to HSV (Hue, Saturation, Value) format, which is easier for specific color detection. The conversion result is displayed as an HSV image.
Specific Color Detection

 ---
**3. Specific Color Detection** <br>
Color detection is performed with the `Color Detection` function, which detects specific colors such asred, yellow, green, blue, brown, gray, pink, purple, orange in the image based on the HSV model.

 ---
**4. Morphological Operations** <br>
After color detection, morphological operations are performed to improve the resulting binary image. The `OperationMorphology` function is used to clean and repair the image.
Morphological Operations

---
**5. Image Restoration** <br>
An image that has been processed (based on detection of a particular color) is restored back into an RGB image form, with other color components set to zero (black) other than the detected color.
The `Image Restoration` function is used to restore the image to its original form after color detection.
Displaying Results

---
**6. Displaying Results** <br>
The results of each process step are displayed on a separate image window. Each detected color (red, yellow, green, blue, brown, gray, pink, purple, orange) will be displayed as a separate image.

## Function Explanation
- **Color Detection(HSV, 'color')**: A function to detect a specific color in an HSV image. The 'color' parameter can be 'red', 'yellow', 'green', 'blue', 'brown', 'gray', 'pink', 'purple' or 'orange'.

- **OperationMorphology(bwColor)**: A function that performs morphological operations on the color-detected binary image to improve and enhance the detection results.

- **Image Restoration(Img)**: A function to reconstitute the RGB image after detection and morphology operation.

## How to use
- clone repository
```
git clone https://github.com/ryhnfhrza/digital-image-processing-assignment-color-detection
```
- open folder src and find GUI1.m files
- run the GUI1.m
