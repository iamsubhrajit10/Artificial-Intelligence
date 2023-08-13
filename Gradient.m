%GRADIENT_DESCENT-Matlab Code Subhrajit Das,90/MCS/210015
%f=x(x-4)+y*(y-5), -20<=x,y<=20


[f,x,y,plotter]=GRADIENT_DESCENT(20,20,-20,-20);
f
x
y
plot(plotter),title('GRADIENT DESCENT f=x(x-4)+y*(y-5), -20<=x,y<=20)')

function[f,x0,y0,plotter]=GRADIENT_DESCENT(xplim,yplim,xnlim,ynlim)
x0=xplim;
y0=yplim;
lamda=.1;
i=1;
F=[];
plotter=[];
while i<2||notTerminated(F)
    x0=x0-lamda*stepX(x0);
    y0=y0-lamda*stepY(y0);
    F(i,1)=x0;
    F(i,2)=y0;
    f=x0*(x0-4)+y0*(y0-5);
    plotter(end+1)=f;
    i=i+1;
    if (x0<xnlim||y0<ynlim) || (x0>xplim ||y0>yplim)
        break;
    end
end

end
function[delX]= stepX(x0)
    delX=2*x0-4;
end

function[delY]= stepY(y0)
    delY=2*y0-5;
end

function [flag]=notTerminated(F)
    n=length(F);
    valArray=evaluate(F);
    flag=true;
    temp=valArray(n-1);
    i=n-2;
    while(i>=1)
        if(temp<valArray(i))
            flag=true;
        else
            flag=false;
            return
        end
        i=i-1;
    end
    
end
function [value]=evaluate(F)
    value=[];
    for j=1:length(F)-1
        x=F(j,1);
        y=F(j,2);
        value(j)=x*(x-4)+y*(y-5);
    
    end
end