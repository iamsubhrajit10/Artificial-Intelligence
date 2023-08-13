%GENETIC_ALGORTIHM-Matlab Code Subhrajit Das,90/MCS/210015
%f(x)=(100*sinx)/x , 10<=x<=30

[maxValue,x,mCount,eCount,epochs,plotterF,plotterX]=GENETIC_ALGORTIHM(50,20);
subplot(1,2,1),plot(plotterF),title('Plot of F')
subplot(1,2,2),plot(plotterX),title('Plot of x')
fprintf('Maximum Value of the function: %f\n',maxValue);
epochs
x
function [maxValue,x,mCount,eCount,epochs,plotterF,plotterX]=GENETIC_ALGORTIHM(PSize,KSize)
    M=[];
    C=[];
    T=[];
    plotterF=[];
    plotterX=[];
    i=1;
    P=cat(3,[],initialize(PSize));
    [q,p]=bestChromosome(P(:,:,i),PSize);
    plotterF(end+1)=q;
    plotterX(end+1)=p;
    Q=P;
    mCount=0;
    eCount=0;
    while i<2 || notTerminated(P,PSize)
        M=selection(P(:,:,i),PSize,KSize);
        C=crossover(M,KSize);
        [T,mCount]=mutation(C,mCount,KSize);
        [Q,eCount]=createNextGenerationFrom(P(:,:,i),T,eCount,PSize,KSize);
        [P]=cat(3,P,Q);
        [q,p]=bestChromosome(P(:,:,i),PSize);
        plotterF(end+1)=q;
        plotterX(end+1)=p;
        i=i+1;
    end
    epochs=i-1;
    [maxValue,x]=bestChromosome(P(:,:,i),PSize);
end
function [flag]=notTerminated(P,PSize)
    flag=true;
    x=size(P);
    n=x(3);
    if(n>30)
        val=evaluate(P(:,:,n),PSize);
        for i=(n-1):-1:(n-10)
            temp=evaluate(P(:,:,i),PSize);
            if (max(temp)==max(val))
                flag=false;
            else
                flag=true;
            end
        end
    end
end
function [population]=initialize(PSize)
    population=randi([0 1],PSize,8);
end

function [fitness,x]=evaluate(Population,PSize)
fitness=[];
x=[];
for i=1:PSize
    decimalValue=128*Population(i,1)+64*Population(i,2)+32*Population(i,3)+16*Population(i,4)+8*Population(i,5)+4*Population(i,6)+2*Population(i,7)+1*Population(i,8);
    x(i)=((decimalValue*20)/255)+10;
    fitness(i)=100*(sind(x(i)))/x(i);
end
end

function [M]=selection(Population,PSize,KSize)
    M=[];
    selected=randi([1 PSize],1,KSize);
    for i=1:KSize
        for j=1:8
            M(i,j)=Population(selected(i),j);
        end
    end
end

function[C]=crossover(M,KSize)
    crossProb=0.8;
    c=[];
    count=0;
    for i=1:KSize/2
         r=rand;
         if(r<=crossProb)
             count=count+1;
            parent=randi([1 KSize],2,1);
            crossoverpoint=randi([1 8],1,1);
            for j=1:crossoverpoint-1
                temp=M(parent(1),j);
                c(i,j)=M(parent(2),j);
                c(i,j)=temp;
            end
            for j=crossoverpoint:8
                temp=M(parent(1),j);
                c(i,j)=M(parent(2),j);
                c(i,j)=temp;
            end
        end
    end
    x=randi([1 KSize],(KSize/2),1);
    for i=1:count
        for j=1:8
                M(x(i),j)=c(i,j);
        end
    end
    C=M;
end

function[T,mCount]=mutation(C,mCount,KSize)
    mutationProb=0.01;
    for i=1:(KSize/2)
        r=rand;
        if(r<=mutationProb)
            flipPos=randi([1 8],1,1);
            if(C(i,flipPos)==1)
                C(i,flipPos)=0;
            else
                C(i,flipPos)=1;
            end
           mCount=mCount+1;
        end
    end
    T=C;
end
function[Q,eCount]=createNextGenerationFrom(P,T,eCount,PSize,KSize)
    A=P;
    B=T;
    selected=randi([1 PSize],1,KSize);
    for i=1:KSize
        for j=1:8
            A(selected(i),j)=B(i,j);
        end
    end
    x=evaluate(P,PSize);
    old=max(x);
    y=evaluate(T,KSize);
    new=min(y);
    [WorstOfNewGeneration,oldX]=min(new);
    [BestOfOldGeneration,newX]=max(old);
    if (WorstOfNewGeneration<BestOfOldGeneration)
        for i=1:8
            A(oldX,i)=B(newX,i);
        end
        eCount=eCount+1;
    end
    Q=A;
end
function [best,x]= bestChromosome(P,PSize)
    [mx,ix]=evaluate(P,PSize);
    [best,i]=max(mx);
    x=ix(i);
end
