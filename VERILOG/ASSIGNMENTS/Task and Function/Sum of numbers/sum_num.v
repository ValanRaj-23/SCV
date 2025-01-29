module sum_func(input [3:0]A, B,
		output [5:0]sum);

assign sum = sum1(A, B); 

function [5:0]sum1;
input [3:0]A, B;
sum1 = A + B;
endfunction

endmodule
