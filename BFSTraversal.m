%BFS-Matlab Code Subhrajit Das,90/MCS/210015
%NODE(NODE NUMBER): S(1),B(2),A(3),F(4),E(5),D(6),C(7),G(8)

nodenames={'S' 'B' 'A' 'F' 'E' 'D' 'C' 'G'};
Ad=[0 1 2 3 0 0 0 0;0 0 0 0 4 2 0 0;0 0 0 0 0 3 2 0;0 0 0 0 0 0 0 6;0 0 0 0 0 0 0 0;0 0 0 0 0 0 0 4;0 0 0 0 0 0 0 4;0 0 0 0 0 0 0 0];
G=digraph(Ad,nodenames);
start=findnode(G,'S');
goal=findnode(G,'G');
subplot(1,3,1),plot(G,'EdgeLabel',G.Edges.Weight),title('Orignal Graph');
[H,f,path,pred]=BFS(G,start,goal);
I=rmedge(G,1:numedges(G));
k=goal;
actualpath=[];
if(k>0)
    while (pred(k)>0)
        actualpath(end+1)=k;
        I=addedge(I,pred(k),k,findedge(G,pred(k),k));
        k=pred(k);
    end
end
 actualpath(end+1)=start;
actualpath=fliplr(actualpath);
%I=addedge(I,findnode(G,'S'),k,findedge(G,findnode(G,'S'),k));
pause(1)
subplot(1,3,2),plot(H,'Layout','layered','EdgeLabel',H.Edges.Weight),title(['BFS Graph with ','Traversal Cost']),subtitle([sum(H.Edges.Weight), 'Traversal sequence: ',nodenames(path)]);
if(f==false)
    subplot(1,3,3),plot(H),title('Path from starting node to goal node not found!!');
    'No path found'
else
    subplot(1,3,3),plot(I,'Layout','layered','EdgeLabel',I.Edges.Weight),title(['Path from starting node to goal node: ','Path Cost']),subtitle([sum(I.Edges.Weight), 'Path Sequence: ',nodenames(actualpath)]);

    'Path is: ',nodenames(path)
end

function [H,flag,route,pred] = BFS(G,start,goal)
route=[];
Q=zeros(numnodes(G),1); tail=0; head=0;
n=numnodes(G);

d=-1*ones(n,1); discoverytime=-1*ones(n,1); pred=zeros(1,n);
% start bfs at u
tail=tail+1; Q(tail)=start;t=0;
d(start)=0; discoverytime(start)=t; t=t+1; pred(start)=0;
route(end+1)=start;
finishtime=-1*ones(n,1);


H=rmedge(G,1:numedges(G));

while((tail-head)>0)
    head=head+1; u=Q(head);
       successor = successors(G,u);
       for i=1:length(successor)
           v=successor(i);
           if(v==goal)
                   subplot(1,2,2),plot(H,'Layout','layered','EdgeLabel',H.Edges.Weight),title(['BFS Graph with ','Cost']),subtitle(sum(H.Edges.Weight));
                   pause(1)
                   H=addedge(H,u,v,findedge(G,u,v));
                   route(end+1)=v;
                   flag=true;
                   pred(v)=u;
                   return;
           end
           
           if(d(v)<0)
               subplot(1,2,2),plot(H,'Layout','layered','EdgeLabel',H.Edges.Weight),title(['BFS Graph with ','Cost']),subtitle(sum(H.Edges.Weight));
               pause(1)
               H=addedge(H,u,v,findedge(G,u,v));
               route(end+1)=v;
               d(v)=d(u)+1;
               pred(v)=u;
               tail=tail+1; Q(tail)=v;
               discoverytime(v)=t;
               t=t+1;
           end
       end
       finishtime(u)=t;
end
     flag=false;          
end
% end of bfs
