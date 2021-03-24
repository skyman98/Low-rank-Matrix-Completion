function [nP,nQ]=Matrix_Factorization(R,P,Q,K)
    steps=5000;
    alpha=0.0002;
    beta=0.02;
    sz=size(R);
 
    for step=1:steps
        for i=1:sz(1)
            for j=1:sz(2)
                if R(i,j) > 0
                    eij = R(i,j)-dot(P(i,:),Q(:,j));
                    for k=1:K
                        P(i,k)=P(i,k) + alpha * (2 * eij * Q(k,j) - beta * P(i,k));
                        Q(k,j)=Q(k,j) + alpha * (2 * eij * P(i,k) - beta * Q(k,j));
                    end
                    
                end
            end
        end
        e=0;
        for i=1:sz(1)
            for j=1:sz(2)
                if R(i,j) > 0
                    e= e + pow2(R(i,j)-dot(P(i,:),Q(:,j)));
                    for k=1:K
                        e = e + (beta/2) * (pow2(P(i,k)) + pow2(Q(k,j)));
                    end
                    
                end
            end
        end
        if e < 0.001
            break;
        end
    
    end
    nP=P; 
    nQ=Q;
    
end

