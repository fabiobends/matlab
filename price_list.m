function items = price_list
items = [];
stopping = false;
fprintf('Enter items and prices (empty item ends list)\n');
count = 0;
while ~stopping
   name = input('Item name: ','s');
   if isempty(name)
      break;
   end
   price = input(['Price of ',name,': ']);
   if isempty(price)
      break;
   end
   count = count + 1;
   items{count,1} = name;
   items{count,2} = price;
end