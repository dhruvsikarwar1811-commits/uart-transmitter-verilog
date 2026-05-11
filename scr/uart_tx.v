module uart_tx(
    input clk, rst, start,
    input [7:0] data,
    output reg tx,
    output reg done
);
    parameter IDLE=0, START=1, DATA=2, STOP=3;
    reg [1:0] state;
    reg [2:0] bit_cnt;

    always @(posedge clk or posedge rst) begin
        if(rst) begin
            state <= IDLE; tx <= 1; done <= 0;
        end
        else case(state)
            IDLE: begin
                tx <= 1; done <= 0;
                if(start) state <= START;
            end
            START: begin
                tx <= 0; state <= DATA; bit_cnt <= 0;
            end
            DATA: begin
                tx <= data[bit_cnt];
                if(bit_cnt == 7) state <= STOP;
                else bit_cnt <= bit_cnt + 1;
            end
            STOP: begin
                tx <= 1; done <= 1; state <= IDLE;
            end
        endcase
    end
endmodule
