clear all,close all,clc
I=imread('S:\Work\MATLAB\ML\snaps\26200.png');
[row column dimension]=size(I);
imshow(I);
R=I(:,:,1);
G=I(:,:,2);
B=I(:,:,3);

I4 = zeros([row,column]);
I4=im2double(I4);
        
   I4=(((R>95 & G>40 & B>20) & ((R>G)) & (R>B)) & ((abs(R-G))>=15));


outp = imerode(I4 ,strel('square', 2)); 
outp1 = imfill(outp, 'holes');

[L, n] = bwlabel(I4); 
face_region = regionprops(L, 'Area');
face_area = [face_region.Area];
face_idx = find(face_area > (.35)*max(face_area));
face_shown = ismember(L, face_idx);

s = regionprops(face_shown,'centroid');
centroids = cat(1, s.Centroid);

hold on
plot(centroids(:,1),centroids(:,2),  'r<','LineWidth',2,...
    'MarkerSize',10,...
    'MarkerEdgeColor','r',...
    'MarkerFaceColor',[0.5,0.5,0.5]);
hold off
