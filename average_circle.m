function [ im_new, avg_new ] = average_circle( image, center_pos, radius )
%Calculate the average value of the pixel values that lie inside 
%a circle with radius=radius and center position=center_pos

im=double(image);
%%center already provides the inputs in reverse order!
pos_x=center_pos(1);
pos_y=center_pos(2);
count=0;
sum=0;

im_new=image;
for i=pos_x-radius: pos_x+radius
    for j=pos_y-radius: pos_y+radius
        if abs(sqrt((i-pos_x)^2 + (j-pos_y)^2))<radius
            im(i,j);
            sum=sum+im(i,j);
            count=count+1;
            pixel_list(count)=im(i,j);
            %im_new(i,j)=255;
        end
    end
end

avg_new=sum/count;
disp(avg_new)
%avg;
%avg=uint8(avg);
%im_new=uint8(im_new);         
total=0;  
posn=0;

% for i=1:length(pixel_list)
%     if abs(pixel_list(i)-avg_new)<=30
%         posn=posn+1;
%         b(posn)=pixel_list(i);
%         total=total+b(posn);
%     end
% end
sum=0;count=0;
for i=pos_x-radius: pos_x+radius
    for j=pos_y-radius: pos_y+radius
        if abs(sqrt((i-pos_x)^2 + (j-pos_y)^2))<radius && abs(im(i,j)-avg_new)<10
            im(i,j);
            sum=sum+im(i,j);
            count=count+1;
            pixel_list_new(count)=im(i,j);
            im_new(i,j)=255;
        end
    end
end

disp(min(pixel_list))
disp(max(pixel_list))
avg_new=sum/count;        
    
