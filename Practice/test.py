from PIL import Image
import pytesseract

# Open the image file
image = Image.open('cap.png')

# Use Tesseract to convert the image to text
text = pytesseract.image_to_string(image)

# Print the text
print(text)