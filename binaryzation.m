global MaxPictureNum;%处理的验证码数量
MaxPictureNum=71;
for i=1:MaxPictureNum
    s=['text',num2str(i),'.','jpg'];
    img = imread(s);
%     figure,imshow(img);
    %二值化处理
    img = im2bw(img);%图像转换为2值图
    %处理边界像素点
    for j=1:70
        img(1,j)=1;
        img(20,j)=1;
    end
    for j=1:20
        img(j,1)=1;
        img(j,70)=1;
    end
%    img=medfilt2(img,[1 1]);%中值滤波，这里不需要使用
%    figure,imshow(img);
    %保存二值化后的文件
    s=['.\binaryzation\','text',num2str(i),'.','jpg'];
    imwrite(img,s);
    %切割单个字符
    for j=1:4
    temp=img(:,(j-1)*15+6:(j-1)*15+19);
    s=['.\SingleCharacter\',num2str(i),'_',num2str(j),'.','jpg'];
    imwrite(temp,s);
    end
end