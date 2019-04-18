function click_and_plot
axis([0 100 0 100]);
hold on;
while 1
   [x,y,button] = ginput(1);
   switch button
      case 1 % left mouse
         plot(x,y,'o');
      case {'q','Q'} % on keyboard
         break;
   end
end
   