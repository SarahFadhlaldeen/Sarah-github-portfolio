%% Q_1: G=LU (pivoting hidden in L)

G = [1 -1 1 -1; 1 -0.4 0.16 -0.064; 1 0 0 0; 1 0.7 0.49 0.343; 1 1 1 1];
d = [0.8; 0.4; 0; 0.5; 1.8];

[L1,U1]=lu(G); % calculating L and U, Ly=d, solving for y
y1=zeros(4,1);
for i= 1:4
    y1(i,1)=d(i);
    if i~=1
        for j=1:i-1
            y1(i,1)=y1(i,1)-L1(i,j)*y1(j,1);
        end
    end
end
disp(y1); % y=[0.8; -0.4; -0.6; 0.346]

m1=zeros(4,1); % Um=y, solving for m 
for i=4:-1:1
    m1(i,1)=y1(i,1);
    if i==4
        m1(i,1)=m1(i,1)/U1(i,i);
    else
        for j=i+1:4
            m1(i,1)=m1(i,1)-U1(i,j)*m1(j,1);
        end
        m1(i,1)=m1(i,1)/U1(i,i);
    end
end
disp(m1); % m=[0; 0.7692; 0.6; -0.9692]

%% PG=LU (pivoting)

[L2,U2,P2]=lu(G); % calculating L, U and P, Ly=Pd, solving for y
Pd=P2*d;
y2=zeros(4,1);
for i= 1:4
    y2(i,1)=Pd(i);
    if i~=1
        for j=1:i-1
            y2(i,1)=y2(i,1)-L2(i,j)*y2(j,1);
        end
    end
end
disp(y2); % y2=[0.8; 1; -1.3; -0.487]

m2=zeros(4,1); % Um=y, solving for m
for i=4:-1:1
    m2(i,1)=y2(i,1);
    if i==4
        m2(i,1)=m2(i,1)/U2(i,i);
    else
        for j=i+1:4
            m2(i,1)=m2(i,1)-U2(i,j)*m2(j,1);
        end
        m2(i,1)=m2(i,1)/U2(i,i);
    end
end
disp(m2); % m2=[0; -0.8641; 1.3; 1.3641]

%% G=QR
[Q1,R1]=qr(G); % calculating Q and R, solving for m LSQR
R1=R1(1:4,:);
QTd=Q1'*d;
QTd=QTd(1:4);
m_ls=zeros(4,1);
for i=4:-1:1
    m_ls(i,1)=QTd(i,1);
    if i==4
        m_ls(i,1)=m_ls(i,1)/R1(i,i);
    else
        for j=i+1:4
            m_ls(i,1)=m_ls(i,1)-R1(i,j)*m_ls(j,1);
        end
        m_ls(i,1)=m_ls(i,1)/R1(i,i);
    end
end
disp(m_ls); % m_ls=[-0.0227; -0.7768; 1.3174; 1.2746]
%disp(R1);

nor_m1mls = norm(m_ls-m1);
nor_m2mls = norm(m_ls-m2);
disp(['Norm of the difference m_ls m1: ' num2str(nor_m1mls)])
disp(['Norm of the difference m_ls m2: ' num2str(nor_m2mls)])
%Norm of the difference m_ls m1: 2.8178
%Norm of the difference m_ls m2: 0.1283

%% plotting results 
xd=[-1,-0.4,0,0.7,1];
x=-1.3:0.001:1.3;
y_m1=m1(1)+m1(2)*x+m1(3)*x.^2+m1(4)*x.^3;
y_m2=m2(1)+m2(2)*x+m2(3)*x.^2+m2(4)*x.^3;
y_mls=m_ls(1)+m_ls(2)*x+m_ls(3)*x.^2+m_ls(4)*x.^3;

figure(1)
plot( x,y_m1,'r' ) ; hold on;
plot( x,y_m2,'b' ) ; 
plot( x,y_mls,'g', 'LineStyle','--', 'LineWidth', 2) ; 
scatter(xd,d,'LineWidth',2,'Marker','*')
title( 'Quadratic polynomial data fitting','FontSize',10 )
xlabel('x');
ylabel('y');
legend({'LU','LU with pivoting','QR','data'},'Location','northwest'); grid on; hold off; 


