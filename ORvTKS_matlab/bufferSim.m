function [buff,data]=bufferSim(action,varargin)

% Action:
% 1 - create
% 2 - fill
% 3 - empty



switch nargin
    case 2
        size = varargin{1};
    case 3
         switch action
            case 2
                buff = varargin{1};
                data_bits = varargin{2};
            case 3
                buff = varargin{1};
                num_bits = varargin{2};
         end       
end


switch action
    case 1
        buff = vrsta(3,size);
        data = 'true';
    case 2
        st_paketa = max(buff)+1;
        for i = 1:data_bits
            buff = vrsta(1,buff,st_paketa);
        end
    case 3
        data = [];
        for i=1:num_bits
            [buff,tmp_bit]=vrsta(2,buff);
            data = [tmp_bit data];     
        end
end
end
