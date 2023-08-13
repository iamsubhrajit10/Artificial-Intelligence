%Attacking Queen Pairs-Matlab Code Subhrajit Das,90/MCS/210015

queenPosRow=randi(8,1,8);
queenPosCol=randi(8,1,8);
M=zeros(8,8);
for k=1:8
    M(queenPosRow(k),queenPosCol(k))=1;
end
M
attackingqueens=computeAttackingQueens(M);
attackingqueens

function [num]=computeAttackingQueens(M)
num=0;
for i=1:8
        for j=1:8
            if(M(i,j))==1
                for m=1:8
                    if(m==i)
                        continue;
                    end
                    if(M(m,j)==1)
                        num=num+1;
                    end
                end
                for m=1:8
                    if(m==j)
                        continue;
                    end
                    if(M(i,m)==1)
                        num=num+1;
                    end
                end
                m=i-1;
                n=j-1;
                while(m>=1 && n>=1)
                    if(M(m,n)==1)
                        num=num+1;
                    end
                    m=m-1;
                    n=n-1;
                end
                m=i-1;
                n=j+1;
                while(m>=1 && n<=8)
                    if(M(m,n)==1)
                        num=num+1;
                    end
                    m=m-1;
                    n=n+1;
                end
                m=i+1;
                n=j-1;
                while(m<=8 && n>=1)
                    if(M(m,n)==1)
                        num=num+1;
                    end
                    m=m+1;
                    n=n-1;
                end
                m=i+1;
                n=j+1;
                while(m<=8 && n<=8)
                    if(M(m,n)==1)
                        num=num+1;
                    end
                    m=m+1;
                    n=n+1;
                end
            end
    end
end
num=num/2;
end