%线径检测
clc,clear,close all;
I =imread('67.JPG');
I =im2gray(I);
filt_gra =medfilt2(I);
filt_gra =im2double(filt_gra);
bil_gra =im2bw(filt_gra,graythresh(filt_gra));
[h,s] =size(bil_gra);
cen_line_h =zeros(1,h);
cen_line_s =zeros(1,s);
J =bil_gra;
J(1,1) =1;
J(h,1) =1;
figure(1);
imshow(J,[]);
sum =0;
for i=1:h
    for j=2:s-1
          if J(i,j)==0 && J(i,j-1)==1
              a1 =i;
              b1 =j;%起始头坐标
          end
          if J(i,j)==0 && J(i,j+1)==1
              a2 =i;
              b2 =j;%结尾坐标
          end
    end
    a =(a1+a2)/2.0;
    b =(b1+b2)/2.0;
    cen_line_h(i) =a;
    cen_line_s(i) =b;
    c =b2-b1;
    sum =sum+c;
end
sum =sum/h;
fprintf("检测所得线径长度为%f",sum);
figure(2);
imshow(J,[]);
hold on
plot(cen_line_s,cen_line_h,'r');          