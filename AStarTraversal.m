%A*-Matlab Code Subhrajit Das,90/MCS/210015
%NODE(NODE NUMBER): S(1),B(2),A(3),F(4),E(5),D(6),C(7),G(8)

nodenames={'S' 'B' 'A' 'F' 'E' 'D' 'C' 'G'};
Ad=[0 1 2 3 0 0 0 0;0 0 0 0 4 2 0 0;0 0 0 0 0 3 2 0;0 0 0 0 0 0 0 6;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 4;0 0 0 0 0 0 0 4;0 0 0 0 0 0 0 0];
G=digraph(Ad,nodenames);
start=findnode(G,'S');
goal=findnode(G,'G');
subplot(1,2,1),plot(G,'EdgeLabel',G.Edges.Weight),title('Orignal Graph');
h=[6 5 4 4 8 2 2 0];
[H,pred,path]=aStar(G,start,goal,h);
path
pred
I=rmedge(G,1:numedges(G));
k=goal;
k
actualpath=[];
if(k>0)
    while (pred(k)>0)
        actualpath(end+1)=k;
        I=addedge(I,pred(k),k,G.Edges.Weight(findedge(G,pred(k),k)));
        k=pred(k);
    end
end
 actualpath(end+1)=start;
actualpath=fliplr(actualpath);
    subplot(1,2,2),plot(I,'Layout','layered','EdgeLabel',I.Edges.Weight),title(['A* Path from starting node to goal node: ','Path Cost']),subtitle([sum(I.Edges.Weight), 'Path Sequence: ',nodenames(actualpath)]);

function [H,pred,path] = aStar(G,start,goal,h)
    n=numedges(G);
    H=rmedge(G,1:n);
    g(start)=0;
    f(start)=h(start);
    u=start;
    successor=successors(G,u);
    Q=[];
    path=[];
    Marker=zeros(n,1);
    Marker(start)=1;
    flag=false;
    for i=1:length(successor)
        Q(end+1)=successor(i);
        pred(successor(i))=start;
        g(successor(i))=g(u)+G.Edges.Weight(findedge(G,u,successor(i)));
        f(successor(i))=g(successor(i))+h(successor(i));
    end
    path(end+1)=start;
    v=findMinimumCostNodeID(Q,f);
    while(~isempty(Q))
        H=addedge(H,pred(v),v,findedge(G,pred(v),v));
        f(v)=150;
        Marker(v)=1;
        path(end+1)=v;
        successor=successors(G,v);
        for i=1:length(successor)
            Q(end+1)=successor(i);
            pred(successor(i))=v;
            g(successor(i))=g(v)+G.Edges.Weight(findedge(G,v,successor(i)));
            f(successor(i))=g(successor(i))+h(successor(i));
        end
        v=findMinimumCostNodeID(Q,f);
        p=checkAllPredecessorsDiscovered(G,v,Marker);
        if(p==true)
            x=findNodeLocInQueue(Q,v);
            Q(x)=[];
            if(v==goal)
                'goal reached'
                flag=true;
            end
        end
    end
end

function[id]=findMinimumCostNodeID(Q,f)
    id=Q(1);
    min=f(Q(1));
    for i=1:length(Q)
        if(min>f(Q(i)))
            min=f(Q(i));
            id=Q(i);
        end
    end

end
function[loc]=findNodeLocInQueue(Q,v)
    loc=-1;
    for i=1:length(Q)
        if(v==Q(i))
            loc=i;
            return
        end
    end
end
function[p]=checkAllPredecessorsDiscovered(G,v,Marker)
    p=true;
    predecessor=predecessors(G,v);
    for i=1:length(predecessor)
        if ~(Marker(predecessor(i))==1)
            p=false;
            return
        end
    end
end