library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        a               : in     vl_logic_vector(7 downto 0);
        b               : in     vl_logic_vector(7 downto 0);
        \in\            : in     vl_logic;
        \out\           : out    vl_logic_vector(7 downto 0)
    );
end alu;
