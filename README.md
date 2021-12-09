# Assembly-language-To-create-a-text-box-where-users-can-define-the-border-text-and-content-text-by-th
目的:製作出使用者可自行定義邊框文字及內容文字的文字方塊。

原理:
1.	不需要按enter，所以使用了ah,01h去接收輸入字元，然後接收的是ASCII碼，所以要再做減30h的處理。
2.	輸入二進制碼的部分，使用了迴圈加左移指令去接收，再傳入Data存放。
3.	整理列印的部分，我都是寫在副程式來減少程式碼的行數，而3x3中間字則則是需要指標的移動來完成。
4.	整體構造分為:接收段(小於或大於3x3)、印刷段(小於或大於3x3)、指標移動

Purpose: To create a text box where users can define the border text and content text by themselves.
principle:
1. There is no need to press enter, so ah, 01h is used to receive the input characters, and then the ASCII code is received, so the processing of subtracting 30h is required.
2. The part of the input binary code is received by the loop plus left shift command, and then transferred to Data for storage.
3. The part of sorting and printing is written in subprograms to reduce the number of lines of code, while the 3x3 middle word requires the movement of the pointer to complete.
4. The overall structure is divided into: receiving section (less than or greater than 3x3), printing section (less than or greater than 3x3), indicator movement


![image](https://user-images.githubusercontent.com/57763355/145403395-6e14d9af-8aba-4c21-bc31-3fe647fe1dc2.png)
