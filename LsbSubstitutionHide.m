% Read in original RGB image.
rgbImage = imread('NatureImage.png');       %Cover Image
rgbHide = imread('Nature.png');             %Secret image

%Resizing the images
rgbImage = imresize(rgbImage, [512 512]); 
rgbHide = imresize(rgbHide, [512 512]); 

%Writing the image after resizing
imwrite(rgbImage,'ImageOriginal.png');
imwrite(rgbHide , 'HideMeOriginal.png')

% Extract color channels of Cover Image.
redChannelImage = rgbImage(:,:,1); % Red channel
greenChannelImage = rgbImage(:,:,2); % Green channel
blueChannelImage = rgbImage(:,:,3); % Blue channel

%Extract color channel of Hide Image
redChannelHide = rgbHide(:,:,1); % Red channel
greenChannelHide = rgbHide(:,:,2); % Green channel
blueChannelHide = rgbHide(:,:,3); % Blue channel


%Hiding the image in cover image
n=2;
redS = uint8(bitor(bitand(redChannelImage,bitcmp(2^n-1,'uint8')),bitshift(redChannelHide,n-8))); %Stego
greenS = uint8(bitor(bitand(greenChannelImage,bitcmp(2^n-1,'uint8')),bitshift(greenChannelHide,n-8))); %Stego
blueS = uint8(bitor(bitand(blueChannelImage,bitcmp(2^n-1,'uint8')),bitshift(blueChannelHide,n-8))); %Stego

% Recombine the individual color channels to create the original RGB image again.
recombinedRGBImage = cat(3, redS, greenS, blueS);

%Writing the Image into png format
imwrite(recombinedRGBImage, 'Stego.png');
