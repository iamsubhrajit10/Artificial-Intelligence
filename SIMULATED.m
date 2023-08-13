%SIMULATED_ANNEALING-Matlab Code Subhrajit Das,90/MCS/210015
%f(x)=(100*sinx)/x , -20<=x<=0

[E,x,epochs,plotterF,plotterX]=SIMULATED_ANNEALING();

subplot(1,2,1),plot(plotterF),title('Plot of F')
subplot(1,2,2),plot(plotterX),title('Plot of x')

fprintf('Value of f(x)=%f with %d number of epochs for x',E,epochs);
x

function[EOld,stateOld,count,plotterF,plotterX]=SIMULATED_ANNEALING()
TMax=1000;
TMin=10^-6;
MAXITER=100;
stateOld=randi([0 20],1,1);
EOld=f(stateOld);
T=TMax;
alpha=0.1;
T0=T;
count=1;
flag=true;
plotterF=[];
plotterX=[];
plotterF(end+1)=EOld;
plotterX(end+1)=stateOld;
while(T>TMin)
    count=count+1;
    c=1;
    for i=1:MAXITER
        [stateNew,ENew,flag]=perturb(stateOld,T,T0);
        if flag==false
            break;
        end
        DeltaE=EOld-ENew;
        if DeltaE>=0
            plotterF(end+1)=ENew;
            plotterX(end+1)=stateNew;
            EOld=ENew;
            flag=1;
        else
            r=rand;
            b=-DeltaE/(T);
            DeltaE
            theta=exp(b);
            theta
            if(r<theta)
                plotterF(end+1)=ENew;
                EOld=ENew;
                stateOld=stateNew;
                plotterX(end+1)=stateNew;
                flag=1;
            else
                plotterF(end+1)=EOld;
                plotterX(end+1)=stateOld;
                flag=0;
            end
        end
               
    end
    T=alpha*T;
end
if(flag==0)
    EOld=ENew;
end
end

function[stateNew,ENew,flag]=perturb(stateOld,T,T0)
    ratio=T/T0;
    flag=true;
    sign=rand;
    stateNew=(1-ratio)*stateOld+ratio*randi([0 100],1,1);
    if (stateNew>20)
        stateNew=20;
        flag=false;
    else
        if stateNew<0
            stateNew=0.001;
            flag=false;
        end
        
    end
    ENew=f(stateNew);
end
function [Energy]=f(state)
    x=state;
    if(x<=0)
        x=0.00001;
    end
    Energy=100*(sind(x))/x;
end
