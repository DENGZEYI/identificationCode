result='0000';
s='text.jpg';
temp=zeros(20,14);
max=[0 0 0];
value=[100 100 100];
value_arry=zeros(20,14);
picture=imread(s);
picture=im2bw(picture);
%����߽����ص�
for j=1:70
    picture(1,j)=1;
    picture(20,j)=1;
end
for j=1:20
    picture(j,1)=1;
    picture(j,70)=1;
end
%�и���ַ�
for j=1:4
    max=[0 0 0];
    value=[100 100 100];
    temp=picture(:,(j-1)*15+6:(j-1)*15+19);%��ǰ��ʶ���ַ�
    s=['.\singleCharacter\',num2str(j),'.','jpg'];
    imwrite(temp,s);
    
    %��д��ĸ�ж�
    path='G:\�����\matlabʵ��\����ҵ\library\captial';
    for k=1:26
        s=[path,'\',char(k+64),'.jpg'];
        img=imread(s);
        img=im2bw(img);%���ļ�
        %figure,imshow(img);
        value_arry=temp.*img;
        value_img=sum(img (:));
        value_temp=abs(sum(value_arry (:))-value_img);
        if (value_temp<=value(1))
            value(1)=value_temp;
            max(1)=k;
        end
    end
    
    %Сд��ĸ�ж�
    path='G:\�����\matlabʵ��\����ҵ\library\letter';
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

    %�����ж�
    path='G:\�����\matlabʵ��\����ҵ\library\number';
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
