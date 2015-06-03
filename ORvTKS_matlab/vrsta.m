function [queue,data] = vrsta(action,varargin)

% Action:
% 1 - push
% 2 - pop
% 3 - create
% 
% optional variables
% length = size of queue

size = 0;
switch nargin    
    case 2
        switch action
            case 2
                input=varargin{1}; %za pop rabimo samo vrsto
            case 3
                size=varargin{1}; % za create rabimo samo velikost
        end
    case 3
        input=varargin{1}; % za pop rabimo vrsto in podatek za vnos
        data=varargin{2};       
end


    
if(size == 0)
    size = length(input);
end

switch action
    case 1
        %push
        prosta_mesta=find(input==0);
        if(length(prosta_mesta) > 0)
            input(prosta_mesta(length(prosta_mesta))) = data;
            data='true';
        else
            data='false';
        end
        queue = input;
    case 2
        %pop
        data = input(length(input));
        input = [0 input];
        input(length(input))=[];
        queue = input;
    case 3
        queue = zeros(1,size);
        data='false';
end


    