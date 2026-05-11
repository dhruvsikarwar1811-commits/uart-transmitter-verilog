module tb_uart_tx;
    reg clk, rst, start;
    reg [7:0] data;
    wire tx, done;

    uart_tx uut(.clk(clk),.rst(rst),.start(start),
                .data(data),.tx(tx),.done(done));

    always #5 clk = ~clk;

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb_uart_tx);
        clk=0; rst=1; start=0; data=8'b0;
        #10 rst=0;
        #10 data=8'b10110001; start=1;
        #10 start=0;
        #200;
        #10 data=8'b11001010; start=1;
        #10 start=0;
        #200;
        $finish;
    end
endmodule
