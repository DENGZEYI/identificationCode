global MaxPictureNum;%�������֤������
MaxPictureNum=71;
for i=1:MaxPictureNum
    s=['text',num2str(i),'.','jpg'];
    img = imread(s);
%     figure,imshow(img);
    %��ֵ������
    img = im2bw(img);%ͼ��ת��Ϊ2ֵͼ
    %����߽����ص�
    for j=1:70
        img(1,j)=1;
        img(20,j)=1;
    end
    for j=1:20
        img(j,1)=1;
        img(j,70)=1;
    end
%    img=medfilt2(img,[1 1]);%��ֵ�˲������ﲻ��Ҫʹ��
%    figure,imshow(img);
    %�����ֵ������ļ�
    s=['.\binaryzation\','text',num2str(i),'.','jpg'];
    imwrite(img,s);
    %�и���ַ�
    for j=1:4
    temp=img(:,(j-1)*15+6:(j-1)*15+19);
    s=['.\SingleCharacter\',num2str(i),'_',num2str(j),'.','jpg'];
    imwrite(temp,s);
    end
end