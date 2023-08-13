%Heuritstics of winning X(tic-tac-toe)-Matlab Code Subhrajit Das,90/MCS/210015

board=generateBoard();
bb=convertBoard(board);
[favour,h]=isFavourableX(board);


function [favour,h]=isFavourableX(board)
    x=computeXwinning(board);
    fprintf('\nPaths for X winning : %d',x);
    o=computeOwinning(board);
    fprintf('\nPaths for O winning : %d',o);
    h=x-o;
    if(h==0)
        'Neutral Configuration'
        favour=false;
    else
        if(h>0)
            'Yes! Favourable to Player X'
            favour=true;
        else
            'Sorry! Not Favourable to Player X'
            favour=false;
        end
    end
end


function [bb]=convertBoard(board)
bb=[];
    for i=1:3
        for j=1:3  
            switch board(i,j)
                case 1
                    bb(i,j)='X';
                case -1
                    bb(i,j)='O';
                case 0
                    bb(i,j)='_';
            end
            fprintf(' %c ', bb(i,j))
        end
        fprintf('\n')
    end
end
function [board]=generateBoard()
board=randi([-1 1],3);
end
function [count]=computeXwinning(board)
count=0;
for i=1:3
    for j=1:3
        if(board(i,j)==1)
            board(i,j)=-1;
            switch i
                case 1
                    switch j
                        case 1
                            if(board(i,j+1)==1 ||board(i,j+1)==0) && (board(i,j+2)==1 ||board(i,j+2)==0)
                                count=count+1;
                            end
                            if(board(i+1,j)==1 ||board(i+1,j)==0) && (board(i+2,j)==1 ||board(i+2,j)==0)
                                count=count+1;
                            end
                            if(board(i+1,j+1)==1 ||board(i+1,j+2)==0) && (board(i+2,j+2)==1 ||board(i+2,j+2)==0)
                                count=count+1;
                            end

                        case 2
                            if(board(i,j-1)==1 ||board(i,j-1)==0) && (board(i,j+1)==1 ||board(i,j+1)==0)
                                count=count+1;
                            end
                             if(board(i+1,j)==1 ||board(i+1,j)==0) && (board(i+2,j)==1 ||board(i+2,j)==0)
                                count=count+1;
                             end

                        case 3
                            if(board(i,j-1)==1 ||board(i,j-1)==0) && (board(i,j-2)==1 ||board(i,j-2)==0)
                                count=count+1;
                            end
                           if(board(i+1,j)==1 ||board(i+1,j)==0) && (board(i+2,j)==1 ||board(i+2,j)==0)
                                count=count+1;
                           end
                            if(board(i+1,j-1)==1 ||board(i+1,j-1)==0) && (board(i+2,j-2)==1 ||board(i+2,j-2)==0)
                                count=count+1;
                            end

                    end
                case 2
                    switch j
                        case 1
                            if(board(i,j+1)==1 ||board(i,j+1)==0) && (board(i,j+2)==1 ||board(i,j+2)==0)
                                count=count+1;
                            end
                            if(board(i-1,j)==1 ||board(i-1,j)==0) && (board(i+1,j)==1 ||board(i+1,j)==0)
                                count=count+1;
                            end

                        case 2
                            if(board(i-1,j)==1 ||board(i-1,j)==0) && (board(i+1,j)==1 ||board(i+1,j)==0)
                                count=count+1;
                            end
                            if(board(i,j-1)==1 ||board(i,j-1)==0) && (board(i,j+1)==1 ||board(i,j+1)==0)
                                count=count+1;
                            end
                            if(board(i-1,j-1)==1 ||board(i-1,j-1)==0) && (board(i+1,j+1)==1 ||board(i+1,j+1)==0)
                                count=count+1;
                            end
                            if(board(i-1,j+1)==1 ||board(i-1,j+1)==0) && (board(i+1,j-1)==1 ||board(i+1,j-1)==0)
                                count=count+1;
                            end

                        case 3
                            if(board(i-1,j)==1 ||board(i-1,j)==0) && (board(i+1,j)==1 ||board(i+1,j)==0)
                                count=count+1;
                            end
                            if(board(i,j-1)==1 ||board(i,j-1)==0) && (board(i,j-2)==1 ||board(i,j-2)==0)
                                count=count+1;
                            end

                    end
                case 3  
                    switch j
                        case 1
                            if(board(i-1,j)==1 ||board(i-1,j)==0) && (board(i-2,j)==1 ||board(i-2,j)==0)
                                count=count+1;
                            end
                            if(board(i,j+1)==1 ||board(i,j+1)==0) && (board(i,j+2)==1 ||board(i,j+2)==0)
                                count=count+1;
                            end
                            if(board(i-1,j+1)==1 ||board(i-1,j+1)==0) && (board(i-2,j+2)==1 ||board(i-2,j+2)==0)
                                count=count+1;
                            end

                        case 2
                            if(board(i,j-1)==1 ||board(i,j-1)==0) && (board(i,j+1)==1 ||board(i,j+1)==0)
                                count=count+1;
                            end
                            if(board(i-1,j)==1 ||board(i-1,j)==0) && (board(i-2,j)==1 ||board(i-2,j)==0)
                                count=count+1;
                            end

                        case 3
                            if(board(i-1,j)==1 ||board(i-1,j)==0) && (board(i-2,j)==1 ||board(i-2,j)==0)
                                count=count+1;
                            end
                            if(board(i,j-1)==1 ||board(i,j-1)==0) && (board(i,j-2)==1 ||board(i,j-2)==0)
                                count=count+1;
                            end
                            if(board(i-1,j-1)==1 ||board(i-1,j-1)==0) && (board(i-2,j-2)==1 ||board(i-2,j-2)==0)
                                count=count+1;
                            end
 
                    end
            end
        end
    end
end
end
function [count]=computeOwinning(board)
count=0;
for i=1:3
    for j=1:3
        if(board(i,j)==-1)
            board(i,j)=1;
            switch i
                case 1
                    switch j
                        case 1
                            if(board(i,j+1)==-1 ||board(i,j+1)==0) && (board(i,j+2)==-1 ||board(i,j+2)==0)
                                count=count+1;
                            end
                            if(board(i+1,j)==-1 ||board(i+1,j)==0) && (board(i+2,j)==-1 ||board(i+2,j)==0)
                                count=count+1;
                            end
                            if(board(i+1,j+1)==-1 ||board(i+1,j+2)==0) && (board(i+2,j+2)==-1 ||board(i+2,j+2)==0)
                                count=count+1;
                            end

                        case 2
                            if(board(i,j-1)==-1 ||board(i,j-1)==0) && (board(i,j+1)==-1 ||board(i,j+1)==0)
                                count=count+1;
                            end
                             if(board(i+1,j)==-1 ||board(i+1,j)==0) && (board(i+2,j)==-1 ||board(i+2,j)==0)
                                count=count+1;
                             end

                        case 3
                            if(board(i,j-1)==-1 ||board(i,j-1)==0) && (board(i,j-2)==-1 ||board(i,j-2)==0)
                                count=count+1;
                            end
                           if(board(i+1,j)==-1 ||board(i+1,j)==0) && (board(i+2,j)==-1 ||board(i+2,j)==0)
                                count=count+1;
                           end
                            if(board(i+1,j-1)==-1 ||board(i+1,j-1)==0) && (board(i+2,j-2)==-1 ||board(i+2,j-2)==0)
                                count=count+1;
                            end

                    end
                case 2
                    switch j
                        case 1
                            if(board(i,j+1)==-1 ||board(i,j+1)==0) && (board(i,j+2)==-1 ||board(i,j+2)==0)
                                count=count+1;
                            end
                            if(board(i-1,j)==-1 ||board(i-1,j)==0) && (board(i+1,j)==-1 ||board(i+1,j)==0)
                                count=count+1;
                            end

                        case 2
                            if(board(i-1,j)==-1 ||board(i-1,j)==0) && (board(i+1,j)==-1 ||board(i+1,j)==0)
                                count=count+1;
                            end
                            if(board(i,j-1)==-1 ||board(i,j-1)==0) && (board(i,j+1)==-1 ||board(i,j+1)==0)
                                count=count+1;
                            end
                            if(board(i-1,j-1)==-1 ||board(i-1,j-1)==0) && (board(i+1,j+1)==-1 ||board(i+1,j+1)==0)
                                count=count+1;
                            end
                            if(board(i-1,j+1)==-1 ||board(i-1,j+1)==0) && (board(i+1,j-1)==-1 ||board(i+1,j-1)==0)
                                count=count+1;
                            end

                        case 3
                            if(board(i-1,j)==-1 ||board(i-1,j)==0) && (board(i+1,j)==-1 ||board(i+1,j)==0)
                                count=count+1;
                            end
                            if(board(i,j-1)==-1 ||board(i,j-1)==0) && (board(i,j-2)==-1 ||board(i,j-2)==0)
                                count=count+1;
                            end

                    end
                case 3  
                    switch j
                        case 1
                            if(board(i-1,j)==-1 ||board(i-1,j)==0) && (board(i-2,j)==-1 ||board(i-2,j)==0)
                                count=count+1;
                            end
                            if(board(i,j+1)==-1 ||board(i,j+1)==0) && (board(i,j+2)==-1 ||board(i,j+2)==0)
                                count=count+1;
                            end
                            if(board(i-1,j+1)==-1 ||board(i-1,j+1)==0) && (board(i-2,j+2)==- 1 ||board(i-2,j+2)==0)
                                count=count+1;
                            end

                        case 2
                            if(board(i,j-1)==-1 ||board(i,j-1)==0) && (board(i,j+1)==-1 ||board(i,j+1)==0)
                                count=count+1;
                            end
                            if(board(i-1,j)==-1 ||board(i-1,j)==0) && (board(i-2,j)==-1 ||board(i-2,j)==0)
                                count=count+1;
                            end

                        case 3
                            if(board(i-1,j)==-1 ||board(i-1,j)==0) && (board(i-2,j)==-1 ||board(i-2,j)==0)
                                count=count+1;
                            end
                            if(board(i,j-1)==-1 ||board(i,j-1)==0) && (board(i,j-2)==-1 ||board(i,j-2)==0)
                                count=count+1;
                            end
                            if(board(i-1,j-1)==-1 ||board(i-1,j-1)==0) && (board(i-2,j-2)==-1 ||board(i-2,j-2)==0)
                                count=count+1;
                            end

                    end
            end
        end
    end
end
end