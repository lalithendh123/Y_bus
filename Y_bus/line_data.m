
% Branch data [from_bus to_bus admittance line charging]

branch_data = [ 1        2       -j*3.8       0         % y12 
                1        3       -j*9.5       0         % y13 
                1        4       -j*2.5       0         % y14 
                1        5        0           0           %y15
                1        6        0           0         %y16 
                1        7        0           0         %y17
                2        3       -j*4       0         % y23
                2        4       -j*7       0       % y24
                2        5        0         0         % y25
                2        6       -j*5       0         %y26
                2        7       -j*8       0          %y27
                3        4       0          0          %y34
                3        5        0         0          %y35
                3        6        -j*7      0         %y36
                3        7        0         0         %y37
                4        6        0           0
                4        7        0          0
                5        6         0         0
                5        7        0          0
                6        7        -6*j       0
                1        1        -j*0.8     0
                2        2       -j*0.6         0
                3        3         -j*0.8     0
                4        4         -j*0.6          0
                5        5         0          0
                6        6         0          0
                7        7         0          0  ];
                

%        Bus Bus  Voltage Angle   ---Load---- -------Generator----- Static Mvar
%        No  code Mag.    Degree  MW    Mvar  MW  Mvar Qmin Qmax    +Qc/-Ql
busdata=[1   1    1.06    0.0     0.0   0.0    0.0  0.0   0   0       0
         2   2    1.043   0.0   21.70  12.7   40.0  0.0 -40  50       0
         3   0    1.0     0.0     2.4   1.2    0.0  0.0   0   0       0
         4   0    1.06    0.0     7.6   1.6    0.0  0.0   0   0       0
         5   2    1.01    0.0    94.2  19.0    0.0  0.0 -40  40       0
         6   0    1.0     0.0     0.0   0.0    0.0  0.0   0   0       0
         7   0    1.0     0.0    22.8  10.9    0.0  0.0   0   0       0];

% Number of buses(n)
n=size(busdata,1);
% Number of branches
m = size(branch_data, 1);
       
% Transformer data: [from_bus to_bus  reactance tap_ratio]
transformer_data = [   4        5      -j*10     0.9]; % Transformer between Bus 4 and Bus 5 with tap ratio of 0.9
