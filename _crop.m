i0=input('img=','s');
i1=imcrop(imread(i0));
i2=rgb2gray(i1);
i3=imresize(i2,[120 100]);
imshow(i3);

