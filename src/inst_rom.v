`include "defines.v"

module inst_rom(

	input wire						ce,
	input wire[`InstAddrBus]		addr,
	output reg[`InstBus]			inst

);

	//����һ�����飬��СʱInstMemNum��Ԫ�ؿ����InstBus
	reg[`InstBus]	inst_mem[0:`InstMemNum-1];
	
	//ʳ���ļ�inst_rom.data��ʼ��ָ��洢��
	initial $readmemh ("D:/vivado_project/OpenMIPS/inst_rom.data", inst_mem);
	
	//����λ�ź���Чʱ����������ĵ�ַ������ָ��洢��ROM�ж�Ӧ��Ԫ��
	always @ (*) begin
		if(ce == `ChipDisable) begin
			inst <= `ZeroWord;
		end else begin 
			inst <= inst_mem[addr[`InstMemNumLog2+1:2]];
		end
	end
	
endmodule