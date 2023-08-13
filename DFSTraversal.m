%DFS-Matlab Code Subhrajit Das,90/MCS/210015
%NODE(NODE NUMBER): S(1),B(2),A(3),F(4),E(5),D(6),C(7),G(8)

nodenames={'S' 'B' 'A' 'F' 'E' 'D' 'C' 'G'};
Ad=[0 1 2 3 0 0 0 0;0 0 0 0 4 2 0 0;0 0 0 0 0 3 2 0;0 0 0 0 0 0 0 6;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 4;0 0 0 0 0 0 0 4;0 0 0 0 0 0 0 0];

G=digraph(Ad,nodenames);
start=findnode(G,'S');
goal=findnode(G,'G');
subplot(1,3,1),plot(G,'EdgeLabel',G.Edges.Weight),title('Orignal Graph');

[flag,H,route,pred]=DFS(G,start,goal);
pause(1)
subplot(1,3,2),plot(H,'Layout','layered','EdgeLabel',H.Edges.Weight),title(['DFS Graph with ','Cost']),subtitle([sum(H.Edges.Weight),'Traversal sequence: ',nodenames(route)]);
I=rmedge(G,1:numedges(G));
k=goal;

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
    subplot(1,3,3),plot(I,'Layout','layered','EdgeLabel',I.Edges.Weight),title(['Path from starting node to goal node: ','Path Cost']),subtitle([sum(I.Edges.Weight), 'Path Sequence: ',nodenames(actualpath)]);

function [flag,H,route,pred] = DFS(G,start,goal)

n=numnodes(G);
color=-1*ones(n,1);
pred=zeros(1:n);
route=[];
route(end+1)=start;
H=rmedge(G,1:numedges(G));
% start bfs at u
H=rmedge(G,1:numedges(G));
flag=false;
u=start;
   if(color(u)==-1)
        [H,color,flag,route,pred]=DFSVisit(G,H,u,goal,color,flag,route,pred);
        if(flag==true)
           pred(goal)
            return
        end
   end


end

function [H,color,flag,route,pred]=DFSVisit(G,H,u,goal,color,flag,route,pred)
    color(findnode(G,u))=0;
    successor=successors(G,u);
    for i=1:length(successor)
        if flag==true
            return
        end
        v=successor(i);
        if(color(findnode(G,v))==-1)
            
            pause(1)
            subplot(1,2,2),plot(H,'Layout','layered','EdgeLabel',H.Edges.Weight),title(['DFS Graph with ','Cost']),subtitle(sum(H.Edges.Weight));
            pred(v)=u;
            H=addedge(H,u,v,G.Edges.Weight(findedge(G,pred(v),v)));
            route(end+1)=v;
            if(v==goal)
                'goal reached'
                flag=true;
                pause(1)
                subplot(1,2,2),plot(H,'Layout','layered','EdgeLabel',H.Edges.Weight),title(['DFS Graph with ','Cost']),subtitle(sum(H.Edges.Weight))
                break
            else
                [H,color,flag,route,pred]=DFSVisit(G,H,v,goal,color,flag,route,pred);
            end
            
        end
    end
    color(u)=1;
end

 % end of dfs
