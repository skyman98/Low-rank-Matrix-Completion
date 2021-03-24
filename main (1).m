R=[ 5,3,0,1;
     4,0,0,1;
     1,1,0,5;
     1,0,0,4;
     0,1,5,4];
sz=size(R); 
N = sz(1);
M = sz(2);
K = 2;
for i=1:N
    for j=1:M
        X(i,j)=j;
        Y(i,j)=i;
    end
end
P = rand(N,K);
Q= rand(K,M);
[nP,nQ]=Matrix_Factorization(R,P,Q,K);
disp(nP);
disp(nQ);
final=nP*nQ;
disp(final);
rank(final)
stem3(X,Y,R,'Color','r','Marker',"*",'MarkerSize',8);
hold on
stem3(X,Y,final,'MarkerFaceColor','b','MarkerSize',7)
xlabel('USER');
ylabel('Movies');
zlabel('Rating');
title('Matrix Completion algorithms');
legend({'Original Value','Updated Value'});
hold off
savefig output/outputfigure