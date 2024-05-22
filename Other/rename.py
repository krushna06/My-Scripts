import os
import requests
from zipfile import ZipFile

# Function to download image from URL and save with given filename
def download_image(url, filename):
    response = requests.get(url)
    if response.status_code == 200:
        with open(filename, 'wb') as f:
            f.write(response.content)
        print(f"Downloaded: {filename}")
    else:
        print(f"Failed to download: {filename}")

# Prompt user for image URLs and filenames
image_data = input("Enter image URLs and filenames (format: imageurl,imagename): ")
image_pairs = [pair.strip() for pair in image_data.split(',')]

# Create a directory to store downloaded images
if not os.path.exists('downloaded_images'):
    os.makedirs('downloaded_images')

# Iterate over each image URL and download
for pair in image_pairs:
    url, filename = pair.split(',')
    download_image(url, os.path.join('downloaded_images', filename))

# Create a zip file to store the downloaded images
with ZipFile('downloaded_images.zip', 'w') as zipf:
    # Iterate over downloaded images and add them to the zip file
    for root, dirs, files in os.walk('downloaded_images'):
        for file in files:
            filepath = os.path.join(root, file)
            zipf.write(filepath, arcname=file)

print("All images have been downloaded and compressed into downloaded_images.zip")
