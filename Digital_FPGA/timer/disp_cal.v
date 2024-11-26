module disp_cal (
      input         i_rstn      ,
      input         i_clk       ,
      input         i_pls_1k    ,
      input         i_key_valid ,
      input         i_start     ,
      input  [ 3:0] i_bcd_data  ,
      output [31:0] o_bcd8d     ,
      output        o_fin       
  );
  wire [3:0] w_digit_1, w_digit_2, w_digit_3, w_digit_4,
             w_digit_5, w_digit_6, w_digit_7, w_digit_8;
  wire [5:0] w_sec;
  wire [5:0] w_min;
  wire [6:0] w_hour;
  

  reg r_start_d1;
  reg r_start_d2;
  reg r_start_d3;
  reg r_start;
  reg r_start_en;
  
  reg [19:0] r_cnt_sec;
  reg [26:0] r_time_sec;
  reg        r_fin;
  reg        r_fin_d;
  
  always@(posedge i_clk, negedge i_rstn) begin   
      if(!i_rstn) begin
          r_start_d1 <= 1'b1;
          r_start_d2 <= 1'b1;
          r_start_d3 <= 1'b1;
      end
      else begin
          r_start_d1 <= i_start;
          r_start_d2 <= r_start_d1;
          r_start_d3 <= r_start_d2;
      end
  end

  always@(posedge i_clk, negedge i_rstn) begin 
      if(!i_rstn) begin
          r_start_en <= 1'b0;
          r_start    <= 1'b0;
      end
      else begin
          if(r_start_d2 & (!r_start_d3) ) begin 
             r_start_en <= ~r_start_en;
             r_start    <= 1'b1;
          end
      end
  end    
  
  always@(posedge i_clk, negedge i_rstn) begin
      if(!i_rstn) begin
          r_cnt_sec <= 20'd0;
          r_time_sec <= 27'd0;
          r_fin      <= 1'b0;
      end
      else if (i_key_valid & (!r_start_en)) begin  
          if(i_bcd_data==4'd1)      r_cnt_sec <= r_cnt_sec +  600; 
          else if(i_bcd_data==4'd2) r_cnt_sec <= r_cnt_sec + 1800; 
          else if(i_bcd_data==4'd3) r_cnt_sec <= r_cnt_sec + 3600; 
          else if(i_bcd_data==4'd4) r_cnt_sec <= r_cnt_sec + 10;   
          else if(i_bcd_data==4'd5) r_cnt_sec <= r_cnt_sec + 60;   
          else if(i_bcd_data==4'd6) r_cnt_sec <= r_cnt_sec + 300;  
          r_time_sec <= 27'd0;
      end
      else if(!r_start_en) begin
          r_time_sec <= 27'd0;
          r_fin <= 1'b0;
      end
      else if (r_start_en) begin
          if(r_cnt_sec==0) begin
              r_fin <= 1'b1;
          end
          else begin
              if(r_time_sec==27'd9999999) begin 
                  r_time_sec <= 27'd0;
                  r_cnt_sec <= r_cnt_sec -1;
              end
              else begin
                  r_time_sec <= r_time_sec +1;
              end
          end
      end
  end
  
  always@(posedge i_clk, negedge i_rstn) begin
      if(!i_rstn) begin
          r_fin_d <= 1'b0;
      end
      else begin
          r_fin_d <= r_fin;
      end
  end
  
  assign w_hour = r_cnt_sec / 3600;
  assign w_min = (r_cnt_sec / 60) - (w_hour* 60);
  assign w_sec = r_cnt_sec - (w_hour* 3600) - (w_min * 60);
  
  
  assign w_digit_1 = w_sec - (w_digit_2 * 10);
  assign w_digit_2 = w_sec / 10;

  assign w_digit_3 = w_min - (w_digit_4 * 10);
  assign w_digit_4 = w_min / 10;

  assign w_digit_5 = w_hour - (w_digit_6 * 10);
  assign w_digit_6 = w_hour / 10;

  assign w_digit_7 = 4'd0;
  assign w_digit_8 = 4'd0;
  
  assign o_bcd8d = {w_digit_8, w_digit_7,
                    w_digit_6, w_digit_5,
                    w_digit_4, w_digit_3,
                    w_digit_2, w_digit_1};
  assign o_fin = r_fin & (!r_fin_d);
  
  endmodule