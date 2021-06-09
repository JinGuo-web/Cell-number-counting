close all;
clear;
clc;


default=input('Press 1 if u want method 1, press 2 for method 2, press 3 for failed coordinates method press 4 for combined method press 5 for improved combined method:\n'); 


if(default==1)                                                                                       %method 1

First = imread('cell.png');
I=rgb2gray(First);
figure,subplot(1,2,1),imshow(I),title('origional');
I1=imadjust(I);
subplot(1,2,2),imshow(I1),title('contract enhanced');





level = graythresh(I);
BW = im2bw(I,level);
BW =1-BW;
figure,imshow(BW),title('Binarised');



BWX = regionprops(BW,'filledimage');
BW1 = BWX.FilledImage;
figure,subplot(1,2,1),imshow(BW1),title('Filled Holes');
one = strel('disk',10);
BW2 = imerode(BW1,one);
subplot(1,2,2),imshow(BW2),title('Erosion');


s= regionprops(BW2,'centroid');
centroids = cat(1,s.Centroid);
num1=size(centroids,1);
figure,imshow(I),title('star for cell');
num1
hold on;
plot(centroids(:,1),centroids(:,2),'b*')
hold off
end





if(default==2)                                                                                                %method 2

Second = imread('cell.png');
I=rgb2gray(Second);
figure,subplot(1,2,1),imshow(I),title('origional');
I1=imadjust(I);
subplot(1,2,2),imshow(I1),title('contract enhanced');


BW2 = edge(I1,'canny');
figure,imshow(BW2)

[centers,radii] = imfindcircles(BW2,[10 50],'ObjectPolarity','dark','Sensitivity',0.88);


figure,imshow(BW2)
viscircles(centers,radii,'Edgecolor','b','LineWidth',0.5);


figure,imshow(I),title('star for cell');
hold on;
plot(centers(:,1),centers(:,2),'b*')
hold off

num2 = size(centers,1);
num2


end

    




%method 3


if(default==3)                                                                     %method 3     the failed coordinates method
 
Third = imread('cell.png');
I=rgb2gray(Third);
figure,subplot(1,2,1),imshow(I),title('origional');
I1=imadjust(I);
subplot(1,2,2),imshow(I1),title('contract enhanced');
    
    
    
    
level = graythresh(I);
BW = im2bw(I,level);
BW =1-BW;

BWX = regionprops(BW,'filledimage');
BW1 = BWX.FilledImage;
one = strel('disk',10);
BW2 = imerode(BW1,one);

s= regionprops(BW2,'centroid');
centroids = cat(1,s.Centroid);


BW2 = edge(I1,'canny');

[centers,radii] = imfindcircles(BW2,[10 50],'ObjectPolarity','dark','Sensitivity',0.88);

viscircles(centers,radii,'Edgecolor','b','LineWidth',0.5);

figure,imshow(I),title('no repeated coordinates');
hold on;
plot(centroids(:,1),centroids(:,2),'b*')
hold on;
plot(centers(:,1),centers(:,2),'b*')
hold off

    A = [centers(:,1); centers(:,2)];      %coordinates A
    B = [centroids(:,1);centroids(:,2)];   %coordinates B
    C=ismember(B,A)                        %common coordinates
    
number=A(C)

    A
    B

  
end








if(default==4)                                                                                %method 1+2

%method2
    Fourth = imread('cell.png');

%code for cut picture

A=[1,2,3;4,5,6];B=[1,2;3,4];

m=max(size(Fourth,1),size(B,1));%Determine the maximum number of rows
m
n=max(size(Fourth,2),size(B,2));%Determine the maximum number of columns
n

for j=1:755;k=1:1199;           
    
P_train(j,k)=Fourth(j,k);
 
end

% figure
% imshow(P_train)


for h=100:655;g=100:1099;           
    
P(h,g)=Fourth(h,g);
 
end

zero1=zeros(655,100);
P1=[P zero1];

zero2=zeros(100,1199);
P2=[P1;zero2];

% figure
% imshow(P2)

P3=P_train-P2;

% figure
% imshow(P3)

    
    
    
    
    
    
%inside picture
%method 2
I=P2;
I1=imadjust(I);

BW2 = edge(I1,'canny');
figure,imshow(BW2)

[centers,radii] = imfindcircles(BW2,[10 50],'ObjectPolarity','dark','Sensitivity',0.88);

figure,imshow(BW2)
viscircles(centers,radii,'Edgecolor','b','LineWidth',0.5);



num2 = size(centers,1);
num2
figure,imshow(I),title(sprintf('Final,Number of RBC is %d',num2));
hold on;
plot(centers(:,1),centers(:,2),'b*')
hold off
    
    
    
    
    
    
    

%outside picture
%method1

I=P3;
I1=imadjust(I);


level = graythresh(I);
BW = im2bw(I,level);
BW =1-BW;
figure,imshow(BW),title('Binarised');



BWX = regionprops(BW,'filledimage');
BW1 = BWX.FilledImage;
figure,subplot(1,2,1),imshow(BW1),title('Fill Holes');
one = strel('disk',5);
BW2 = imerode(BW1,one);
subplot(1,2,2),imshow(BW2),title('Erosion');


s= regionprops(BW2,'centroid');
centroids = cat(1,s.Centroid);
num1=size(centroids,1);
figure,imshow(I),title(sprintf('Final,Number of RBC is %d',num1));
num1=num1-1;
num1
hold on;
plot(centroids(:,1),centroids(:,2),'b*')
hold off
    

num_total=num1+num2;
num_total

end













if(default==5)                                                                          % improved method 1+2
    
    %method2
    Fifth = imread('cell.png');
% imshow(IOri)

A=[1,2,3;4,5,6];B=[1,2;3,4];

m=max(size(Fifth,1),size(B,1));%Determine the maximum number of rows
m
n=max(size(Fifth,2),size(B,2));%Determine the maximum number of columns
n

for j=1:755;k=1:1199;           
    
P_train(j,k)=Fifth(j,k);
 
end

% figure
% imshow(P_train)


for h=100:655;g=100:1099;           
    
P(h,g)=Fifth(h,g);
 
end

zero1=zeros(655,100);
P1=[P zero1];

zero2=zeros(100,1199);
P2=[P1;zero2];
% 
% figure
% imshow(P2)

P3=P_train-P2;

% figure
% imshow(P3)
    
    
    
    
    
%outside picture
%method1

I=P3;
I1=imadjust(I);


level = graythresh(I);
BW = im2bw(I,level);
BW =1-BW;
figure,imshow(BW),title('Binarised');



BWX = regionprops(BW,'filledimage');
BW1 = BWX.FilledImage;
figure,subplot(1,2,1),imshow(BW1),title('Filled Holes');
one = strel('disk',5);
BW2 = imerode(BW1,one);
subplot(1,2,2),imshow(BW2),title('Erosion');


s= regionprops(BW2,'centroid');
centroids = cat(1,s.Centroid);
num1=size(centroids,1);
figure,imshow(I),title(sprintf('Final,Number of RBC is %d',num1));
num1=num1-1;
num1

hold on;
plot(centroids(:,1),centroids(:,2),'b*')
hold off
    
    
    
    
    
    
    
    



%inside picture
%method 2


Fifth = imread('cell.png');
I=rgb2gray(Fifth);
figure,subplot(1,2,1),imshow(I),title('origional');
I1=imadjust(I);
subplot(1,2,2),imshow(I1),title('contract enhanced');


BW2 = edge(I1,'canny');
figure,imshow(BW2)

[centers,radii] = imfindcircles(BW2,[10 50],'ObjectPolarity','dark','Sensitivity',0.88);




figure,imshow(BW2),title('123');
viscircles(centers,radii,'Edgecolor','b','LineWidth',0.5);

figure,imshow(I)
hold on;
plot(centers(:,1),centers(:,2),'b*')
hold off
    


F=getframe(gcf);    %keeped current all changed into image
imwrite(F.cdata,'Saved.png') %save image




xx = imread('Saved.png');





G=[1,2;3,4];

x=max(size(xx,1),size(G,1));%Determine the maximum number of rows
x
y=max(size(xx,2),size(G,2));%Determine the maximum number of columns
y

for j=1:755;k=1:1199;           
    
P_train(j,k)=xx(j,k);
 
end

% figure
% imshow(P_train)


for h=100:655;g=100:1099;           
    
P(h,g)=xx(h,g);
 
end

zero1=zeros(655,100);
P1=[P zero1];

zero2=zeros(100,1199);
P4=[P1;zero2];

figure
imshow(P4)






BW3 = edge(P4,'canny');
% figure,imshow(BW3)

[centers,radii] = imfindcircles(BW3,[10 50],'ObjectPolarity','dark','Sensitivity',0.9);



% figure,imshow(BW3),title('456');
% viscircles(centers,radii,'Edgecolor','b','LineWidth',0.2);








num2 = size(centers,1);
num2

num_total=num1+num2;
num_total


    
end












