%8puzzle(tiles,dist)-Matlab Code Subhrajit Das,90/MCS/210015
x=generate8PuzzleStates();
x
goalstate=[1:3;4:6;7:9];
goalstate
misplaced=computeNumberOfMisplacedTiles(x,goalstate);
misplaced
manhattan=computeManhattanDistance(x,goalstate);
manhattan
function [mat]=generate8PuzzleStates()
    mat=[];
    r=randperm(9);
    count=1;
    for i=1:3
        for j=1:3
            mat(i,j)=r(count);
            count=count+1;
        end
    end
end

function [num]=computeNumberOfMisplacedTiles(x,goalstate)
    num=0;
    for i=1:3
        for j=1:3
            if(x(i,j)==9)
                continue;
            end
            if ~(x(i,j)==goalstate(i,j))
                num=num+1;
            end
        end
    end
end
function [num]=computeManhattanDistance(x,goalstate)
    num=0;
    for i=1:3
        for j=1:3
            temp=goalstate(i,j);
            if(temp==9)
                continue;
            end
            for m=1:3
                for n=1:3
                    if(temp==x(m,n))
                        xd=sqrt((i-m)^2);
                        yd=sqrt((j-n)^2);
                        num=num+(xd+yd);
                    end
                end
            end
        end
    end
end