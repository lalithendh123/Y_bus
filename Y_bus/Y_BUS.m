clc;
line_data;
% Initialize Y-bus matrix
Ybus = zeros(n, n);

% Construct Y-bus matrix
for k = 1:m
    from_bus = branch_data(k, 1);
    to_bus = branch_data(k, 2);
    y = branch_data(k, 3);  % branch admittance
    y0 = branch_data(k, 4); % line charging admittance

    % Check for self-admittance (when from_bus == to_bus)
    if from_bus == to_bus
        % Add the self-admittance to the diagonal
        Ybus(from_bus,from_bus) = Ybus(from_bus, from_bus) + y;
    else
        % Add branch admittance to the diagonal and off-diagonal elements
        Ybus(from_bus, from_bus) = Ybus(from_bus, from_bus) + y; % diagonal (from bus)
        Ybus(to_bus, to_bus) = Ybus(to_bus, to_bus) + y;         % diagonal (to bus)
        Ybus(from_bus, to_bus) = Ybus(from_bus, to_bus) - y;     % off-diagonal
        Ybus(to_bus, from_bus) = Ybus(to_bus, from_bus) - y;     % off-diagonal

        % Add line charging admittance (y0) only to diagonal elements
        Ybus(from_bus, from_bus) = Ybus(from_bus, from_bus) + y0 / 2;
        Ybus(to_bus, to_bus) = Ybus(to_bus, to_bus) + y0 / 2;
    end
end

%Populate Y-bus with transformer data
for i = 1:size(transformer_data, 1)
    from_bus = transformer_data(i, 1);
    to_bus = transformer_data(i, 2);
    yt = transformer_data(i, 3);
    tap = transformer_data(i, 4);
    
     %Adjust admittances for transformer
    Ybus(from_bus, from_bus) = Ybus(from_bus, from_bus) + yt;
   Ybus(to_bus, to_bus) = Ybus(to_bus, to_bus) + yt/(tap^2);
    Ybus(from_bus, to_bus) = Ybus(from_bus, to_bus) - yt/tap;
   Ybus(to_bus, from_bus) = Ybus(to_bus, from_bus) - yt/tap;
end
% Display Y-bus matrix
disp('Ybus Matrix:');
disp(Ybus);
