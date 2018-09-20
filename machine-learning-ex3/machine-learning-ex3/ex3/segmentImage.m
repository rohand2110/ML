function [BW,maskedImage] = segmentImage(RGB,location)

 height = 65;
 width = 15;
 scaling_factor = 3;
 h = height/scaling_factor;
 w = width/scaling_factor;
% Convert RGB image into L*a*b* color space.
X = rgb2lab(RGB);

% Create empty mask.
BW = false(size(X,1),size(X,2));


% Draw Rectangle


xPos = [location(1)-h location(1) location(1) location(1)-h];
yPos = [location(2) location(2) location(2)+w location(2)+w];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;

% Draw Rectangle
xPos = [location(1)-w location(1) location(1) location(1)-w];
yPos = [location(2) location(2) location(2)+h location(2)+h];
m = size(BW, 1);
n = size(BW, 2);
addedRegion = poly2mask(xPos, yPos, m, n);
BW = BW | addedRegion;

% Create masked image.
maskedImage = RGB;
maskedImage(repmat(~BW,[1 1 3])) = 0;
end

