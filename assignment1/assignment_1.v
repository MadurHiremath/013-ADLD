module assignment_1_tb;
reg[3:0] x;
reg front_sensor;
reg back_sensor;
wire entry,process;

assignment asgn(x,front_sensor, back_sensor,entry);

initial begin
#20
front_sensor=0;
back_sensor=0;
x=4'b0000;
$display("\n vehicle at gate: %d", entry);

#5
front_sensor=1;
back_sensor=0;
x=4'b1110;
$display("\n vehicle at gate :%d", entry);


#15
front_sensor=1;
back_sensor=1;
x=4'b1101;
$display("\n vehicle at gate :%d", entry);

#5
front_sensor=0;
back_sensor=1;
x=4'b1111;
$display("\n vehicle at gate :%d", entry);

#5
front_sensor=1;
back_sensor=0;
x=4'b1101;
$display("\n vehicle at gate :%d", entry);

#5
front_sensor=1;
back_sensor=0;
x=4'b1110;
$display("\n vehicle at gate :%d", entry);


 
end
endmodule


module assignment (x,front_sensor,back_sensor,entry);
 
input[3:0] x;
input front_sensor;
input back_sensor; 
output reg entry;
reg process;

//parameter password=4'b1101;

always@(*)
if(front_sensor == 1'b1)
begin 
	process= #1 1'b0;
	if (x == 4'b1101)
	entry <= #1 1'b1;
	else
	entry <= #1 1'b0;
end

always@(*)
if(entry== 1'b1)
	begin
	if(back_sensor == 1'b1)     
	process <= #20 1'b1;	
	else
	process <= #20 1'b0;
	
end 

always@(*)
begin
if (process == 1'b1)
entry <= #20 1'b0;
end
endmodule


