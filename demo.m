result='0000';
s='text.jpg';
temp=zeros(20,14);
max=[0 0 0];
value=[100 100 100];
value_arry=zeros(20,14);
picture=imread(s);
picture=im2bw(picture);
%处理边界像素点
for j=1:70
    picture(1,j)=1;
    picture(20,j)=1;
end
for j=1:20
    picture(j,1)=1;
    picture(j,70)=1;
end
%切割单个字符
for j=1:4
    max=[0 0 0];
    value=[100 100 100];
    temp=picture(:,(j-1)*15+6:(j-1)*15+19);%当前待识别字符
    s=['.\singleCharacter\',num2str(j),'.','jpg'];
    imwrite(temp,s);
    
    %大写字母判定
    path='G:\大二下\matlab实验\大作业\library\captial';
    for k=1:26
        s=[path,'\',char(k+64),'.jpg'];
        img=imread(s);
        img=im2bw(img);%库文件
        %figure,imshow(img);
        value_arry=temp.*img;
        value_img=sum(img (:));
        value_temp=abs(sum(value_arry (:))-value_img);
        if (value_temp<=value(1))
            value(1)=value_temp;
            max(1)=k;
        end
    end
    
    %小写字母判定
    path='G:\大二下\matlab实验\大作业\library\letter';
    for k=1:26
        s=[path,'\',char(k+96),'.jpg'];
        img=imread(s);
        img=im2bw(img);
        %figure,imshow(img);
        value_arry=temp.*img;
        value_img=sum(img (:));
        value_temp=abs(sum(value_arry (:))-value_img);
        if (value_temp<=value(2))
            value(2)=value_temp;
            max(2)=k;
        end
    end

    %数字判定
    path='G:\大二下\matlab实验\大作业\library\number';
    for k=1:10
        s=[path,'\',char(k+47),'.jpg'];
        img=imread(s);
        img=im2bw(img);
        %figure,imshow(img);
        value_arry=temp.*img;
        value_img=sum(img (:));
        value_temp=abs(sum(value_arry (:))-value_img);
        if (value_temp<=value(3))
            value(3)=value_temp;
            max(3)=k;
        end
    end
    position=1;
    for a=1:3
        if(value(a)<=value(position))
            position=a;
        end
    end
    if(position==1)
        result(j)=char(64+max(position));
    end
    if(position==2)
        result(j)=char(96+max(position));
    end
    if(position==3)
        result(j)=char(47+max(position));
    end
end
