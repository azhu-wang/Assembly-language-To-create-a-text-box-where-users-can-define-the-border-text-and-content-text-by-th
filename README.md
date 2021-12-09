# Assembly-language-To-create-a-text-box-where-users-can-define-the-border-text-and-content-text-by-th
Purpose: To create a text box where users can define the border text and content text by themselves.
principle:
1. There is no need to press enter, so ah, 01h is used to receive the input characters, and then the ASCII code is received, so the processing of subtracting 30h is required.
2. The part of the input binary code is received by the loop plus left shift command, and then transferred to Data for storage.
3. The part of sorting and printing is written in subprograms to reduce the number of lines of code, while the 3x3 middle word requires the movement of the pointer to complete.
4. The overall structure is divided into: receiving section (less than or greater than 3x3), printing section (less than or greater than 3x3), indicator movement


![image](https://user-images.githubusercontent.com/57763355/145403395-6e14d9af-8aba-4c21-bc31-3fe647fe1dc2.png)
