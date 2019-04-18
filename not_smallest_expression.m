function a = not_smallest_expression(x,y,z)
vector = [x y z];
test_1 = x>=y;
test_2 = x>=z;
a = test_1 || test_2;
end