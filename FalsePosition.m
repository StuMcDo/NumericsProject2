function [p,steps,FP] = FalsePosition(varargin)
%FALSEPOSITION Summary of this function goes here
%   Detailed explanation goes here


switch nargin
    case 0
        disp('missing function and p0')
        return
    case 1 
        disp('missing derivative and  p0')
    case 2
         disp('missing function, and derivative or p0')
        
        
    case 3
         f = varargin{1};
        interval = varargin{2};
        maxi = 200;
        e = 0.0004;
    case 4
        f = varargin{1};
        interval = varargin{2};
        maxi = varargin{3};
        e = varargin{4};

end


FP = [];
FP(1,1) = interval(1,1);
FP(1,2) = interval(1,2);
FP(1,3) = 0;
steps = 0;


for i = 1:maxi
    steps = steps +1;
    FP(i,4) = steps;
    FP(i,3) = FP(i,2) - (f(FP(i,2))*(FP(i,2)-FP(i,1)))...
        /(f(FP(i,2))-f(FP(i,1)));
    if steps >1
            tolerance = abs(FP(i,3) - FP(i-1,3))/abs(FP(i-1,3));
                if tolerance <= e
                    p = FP(i,3);
                    break
                end
    end
    if  f(FP(i,1))*f(FP(i,3)) < 0
        FP(i+1,1) = FP(i,1);
        FP(i+1,2) = FP(i,3);
    else
        FP(i+1,1) = FP(i,2);
        FP(i+1,2) = FP(i,3);
        
    end
        



p =0; 

end

