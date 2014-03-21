ImagePyramidApplications
========================

Image Compression:  The first application of image pyramid demonstrated is the image
compression. The Gaussian pyramid is constructed for the given image which is then used to
convert to Laplacian pyramid. This Laplacian pyramid can be stored and also used to
compute the original image. Original image’s size is approximated by its entropy (a good
approximation for Huffman coding). image was then quantized to see if we achieve
further compression (lossy). The code for this part is in a.m

Image Stitching: Another application of image pyramid is image stitching.In this, we take
2 images and they are stitched along a vertical line specified. The 2 images are first
converted to same size and then their laplacian pyramid is computed. Each level of the
pyramid is broken into 2 parts along the given vertical line and left half of image is joined
with the right half. The New pyramid is then used to compute the new image. This
technique prevents the introduction of sharp line in the combined image. The code for this 
part is in b.m

Fast Multiresolution Image Querying: This part is an implementation of multi resolution 
image querying system based on SIGGRAPH 1995 paper on "Fast Multiresolution Image Querying".
	Preprocessing Steps: 
		1) Converting an image to size 256x256. (A power of 2). A total of 72 images.
		2) Process each image to find the coefficients.
				a. 3 2-D matrices - RGB
				b. Calculate the top 60 coefficients. (Largest magnitude).
				c. Zero out other matrices.
				d. Normalization and truncation of the coefficients
	Querying Steps:
		1) Process the query image as above and generate the matrix.
		2) Compare with each image in the data base and calculate the score.
		3) Here score denotes the difference in the values – lower is the score – higher is the matching.
		4) Use weights for different coefficients
			a) Weight = 1 for the average value C[0][0].
			b) W = 1000 for other binary values.
			c) Find the minimum score index and display the image.





