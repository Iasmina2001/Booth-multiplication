module booth_tb;
    reg [7:0] X, Y;
    reg clk, start;
    wire [15:0] produs;
    
    booth inmultitor
    (
        .X(X),
        .Y(Y),
        .clk(clk),
        .start(start),
        .produs(produs)
    );
    
    initial begin
        clk = 0;
        repeat (2 * ((160 * 10) / 10)) #10 clk = ~clk;
    end
    
    integer i;
    
    initial begin
        Y = 6;
        $display("Tabla inmultirii cu %d", Y);
        for (i = 0; i <= 10; i = i + 1) begin
          X = i;
          start = 1;
          #100 start = 0;
          #160 $display("%d * %d = %d", Y, X, produs);
        end
    end
    
endmodule