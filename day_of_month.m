function day_of_month(n,d,m)
% Check inputs:
if floor(n) ~= n || floor(d) ~= d || floor(m) ~= m
   fprintf('Inputs must be whole numbers\n');
   return
end
out_of_range = false;
if n < 1 || n > 5
   fprintf('1st argument must be in the range 1 to 5\n');
   out_of_range = true;
end
if d < 1 || d > 7
   fprintf('2nd argument must be in the range 1 to 7\n');
   out_of_range = true;
end   
if m < 1 || m > 12
   fprintf('3rd argument must be in the range 1 to 12\n');
   out_of_range = true;
end
if out_of_range
   return;
end
% Print ordinal number with trailing space:
switch(n)
   case 1
      fprintf('First ')
   case 2
      fprintf('Second ')
   case 3
      fprintf('Third ')
   case 4
      fprintf('Fourth ')
   case 5
      fprintf('Fifth ')
end
day_of_week(d)
fprintf(' of ');
switch(m)
   case 1
      fprintf('January'); 
   case 2
      fprintf('February');
   case 3
      fprintf('March');
   case 4
      fprintf('April');
   case 5
      fprintf('May');
   case 6
      fprintf('June');
   case 7
      fprintf('July');
   case 8
      fprintf('August');
   case 9
      fprintf('September');
   case 10
      fprintf('October');
   case 11
      fprintf('November');
   case 12
      fprintf('December');
end
fprintf('\n');

function day_of_week(n)
switch n    
   case 1
      fprintf('Sunday');
   case 2      
      fprintf('Monday');
   case 3
      fprintf('Tuesday');
   case 4
      fprintf('Wednesday');
   case 5
      fprintf('Thursday');
   case 6
      fprintf('Friday');
   case 7
      fprintf('Saturday');
end