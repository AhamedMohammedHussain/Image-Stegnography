% Read in original RGB image.
rgbImage = imread('Stego.png');

% Extract color channels of Stego Image.
redS = rgbImage(:,:,1); % Red channel
greenS = rgbImage(:,:,2); % Green channel
blueS = rgbImage(:,:,3); % Blue channel

%n = input('Enter the no of LSB bits to be subsituted- '); 
n=2;
redE = uint8(bitand(255,bitshift(redS,8-n))); %Extracted
greenE = uint8(bitand(255,bitshift(greenS,8-n))); %Extracted
blueE = uint8(bitand(255,bitshift(blueS,8-n))); %Extracted

%Combining the 3 color channels into one image
recombinedRGBHide = cat(3,redE,greenE,blueE);

%Writing the Image into png format
imwrite(recombinedRGBHide,'HideMeExtracted.png');
