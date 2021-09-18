module booth
(
    input [7:0] X, Y,
    input clk, start,
    output [15:0] produs
);
    
    reg [7:0] A, Q, M;
    reg Q_1;            // Q[-1]
    reg [3:0] count;    // count este pe 4 biti, deoarece cand acesta devine 8, inmultirea este gata
    
    wire [7:0] suma, diferenta;    // iesirile modulelor alu pt adunare, respectiv scadere
    
    // unitate aritmetico-logica pentru adunare
    alu adunare
    (
        .a(A),
        .b(M),
        .in(1'b0),
        .out(suma)
    );
    
    // unitate aritmetico-logica pentru scadere
    // iesirea modulului 'alu' returneaza diferenta obtinuta cu ajutorul complementului de 2 ( A - B = A + ~B + 1 )
    alu scadere
    (
        .a(A),
        .b(~M),
        .in(1'b1),
        .out(diferenta)
    );
    
    assign produs = {A, Q};         // produsul este rezultat din alaturarea registrelor A si Q, in pasul count=7
    
    always @(posedge clk) begin
        if (start == 1) begin
            A <= 8'b0;
            Q <= X;
            Q_1 <= 1'b0;
            M <= Y;
            count <= 4'b0;
        end
        else begin
            if (Q[0] == 1 && Q_1 == 0)
                {A, Q, Q_1} <= {diferenta[7], diferenta, Q};
            else if (Q[0] == 0 && Q_1 == 1)
                {A, Q, Q_1} <= {suma[7], suma, Q};
            else
                {A, Q, Q_1} <= {A[7], A, Q};
            count <= count + 1'b1;
        end
    end
    
endmodule