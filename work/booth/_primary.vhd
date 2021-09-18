library verilog;
use verilog.vl_types.all;
entity booth is
    port(
        X               : in     vl_logic_vector(7 downto 0);
        Y               : in     vl_logic_vector(7 downto 0);
        clk             : in     vl_logic;
        start           : in     vl_logic;
        produs          : out    vl_logic_vector(15 downto 0)
    );
end booth;
