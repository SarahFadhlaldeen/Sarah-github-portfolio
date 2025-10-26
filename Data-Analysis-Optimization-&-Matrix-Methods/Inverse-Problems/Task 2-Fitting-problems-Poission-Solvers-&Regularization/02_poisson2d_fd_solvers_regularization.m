%% Q2_b
% parameters
nx=80;
ny=40;
lx=0.8;
ly=0.4;
sz_m=[nx+1 ny+1];
num_m=(nx+1)*(ny+1);
bc11=1.1; bc12=1.2; bc21=2.1; bc22=2.2;   %(change bc in the function input for each question in part b results)  
%get G, d, x, y
[G,d,x,y]=BoundCond(nx,ny,lx,ly,bc21);
%% direct inversion
tic
minv=inv(G)*d;
tinv=toc;
disp( [ 'Time elapsed using inv = ' num2str( tinv ) ] )
%% LU decomp.
tic
[l,u]=lu(G);
ylu=zeros(num_m,1);
mlu=zeros(num_m,1);

for i=1:num_m %Ly=b
    ylu(i,1)=d(i);
    if (i~=1)
        for j=1:i-1
            ylu(i,1)=ylu(i,1)-l(i,j)*ylu(j,1);
        end
    end
end

for i=num_m:-1:1 %Ux=y
    mlu(i,1)=ylu(i,1);
    if i==num_m
        mlu(i,1)=mlu(i,1)/u(i,i);
    else
        for j=i+1:num_m
            mlu(i,1)=mlu(i,1)-u(i,j)*mlu(j,1);
        end
        mlu(i,1)=mlu(i,1)/u(i,i);
    end
end
tlu=toc;
disp( [ 'Time elapsed using LU = ' num2str( tlu ) ] )
%% PLU decomp.
tic
[lp,up,p]=lu(G);
pd=p*d;
yplu=zeros(num_m,1);
mplu=zeros(num_m,1);

for i=1:num_m %Ly=Pb
    yplu(i,1)=pd(i);
    if (i~=1)
        for j=1:i-1
            yplu(i,1)=yplu(i,1)-lp(i,j)*yplu(j,1);
        end
    end
end

for i=num_m:-1:1 %Ux=y
    mplu(i,1)=yplu(i,1);
    if i==num_m
        mplu(i,1)=mplu(i,1)/up(i,i);
    else
        for j=i+1:num_m
            mplu(i,1)=mplu(i,1)-up(i,j)*mplu(j,1);
        end
        mplu(i,1)=mplu(i,1)/up(i,i);
    end
end
tplu=toc;
disp( [ 'Time elapsed using PLU = ' num2str( tplu ) ] )
%% QR decomp.
tic
[q,r]=qr(G);
mqr=zeros(num_m,1);

qtd=q'*d; %Qy=b

for i=num_m:-1:1 %Rx=y
    mqr(i,1)=qtd(i,1);
    if i==num_m
        mqr(i,1)=mqr(i,1)/r(i,i);
    else
        for j=i+1:num_m
            mqr(i,1)=mqr(i,1)-r(i,j)*mqr(j,1);
        end
        mqr(i,1)=mqr(i,1)/r(i,i);
    end
end
tqr=toc;
disp( [ 'Time elapsed using QR = ' num2str( tqr ) ] )
%% plots
[X,Y]=meshgrid(x,y);

m_invc=zeros(nx+1,ny+1);
for i=1:num_m
    [row,column]=ind2sub(sz_m,i);
    m_invc(row,column)=minv(i);
end

m_luc=zeros(nx+1,ny+1);
for i=1:num_m
    [row,column]=ind2sub(sz_m,i);
    m_luc(row,column)=mlu(i);
end

m_pluc=zeros(nx+1,ny+1);
for i=1:num_m
    [row,column]=ind2sub(sz_m,i);
    m_pluc(row,column)=mplu(i);
end

m_qrc=zeros(nx+1,ny+1);
for i=1:num_m
    [row,column]=ind2sub(sz_m,i);
    m_qrc(row,column)=mqr(i);
end

figure (1)
surf(X',Y',m_invc);
xlabel('x');
ylabel('y');
title( 'direct inversion','FontSize',12 );
xlim([0 0.8]);
ylim([0 0.4]);
colorbar();

figure (2)
surf(X',Y',m_luc);
xlabel('x');
ylabel('y');
title( 'LU decomp.','FontSize',12 );
xlim([0 0.8]);
ylim([0 0.4]);
colorbar();

figure (3)
surf(X',Y',m_pluc);
xlabel('x');
ylabel('y');
title( 'PLU decomp.','FontSize',12 );
xlim([0 0.8]);
ylim([0 0.4]);
colorbar();

figure (4)
surf(X',Y',m_qrc);
xlabel('x');
ylabel('y');
title( 'QR decomp.','FontSize',12 );
xlim([0 0.8]);
ylim([0 0.4]);
colorbar();

%% times
%%%%% for 1.1 %%%% 
%Time elapsed using inv = 0.97656 s
%Time elapsed using LU = 0.76286 s
%Time elapsed using PLU = 0.92082 s
%Time elapsed using QR = 1.8605 s
%%%%% for 1.2 %%%% 
%Time elapsed using inv = 1.0736 s
%Time elapsed using LU = 0.75181 s
%Time elapsed using PLU = 0.99871 s
%Time elapsed using QR = 1.5312 s
%%%%% for 2.1 %%%% 
%Time elapsed using inv = 1.0423 s
%Time elapsed using LU = 0.91239 s
%Time elapsed using PLU = 0.79937 s
%Time elapsed using QR = 1.6096 s
%%%%% for 2.2 %%%% 
%Time elapsed using inv = 1.2778 s
%Time elapsed using LU = 0.7688 s
%Time elapsed using PLU = 1.0325 s
%Time elapsed using QR = 1.4825 s
%% Q2_c
%parameters
bc23=2.3; % for part c.1
[G,d,~,~]=BoundCond(nx,ny,lx,ly,bc23);
%eliminate value on tao2
% 1_ML sol.
Gc=zeros((nx+1)*ny,num_m);
dc=zeros((nx+1)*ny,1);
k=1;
for i=1:num_m
    [co,ro]=ind2sub(sz_m,i);
    if ro~=ny+1
        Gc(k,:)=G(i,:);
        dc(k,:)=d(i,:);
        k=k+1;
    end
end

mml=Gc'*inv(Gc*Gc')*dc;

mmlc=zeros(nx+1,ny+1);
for i=1:num_m
    [row,column]=ind2sub(sz_m,i);
    mmlc(row,column)=mml(i);
end

figure (5)
surf(X',Y',mmlc);
xlabel('x');
ylabel('y');
title( 'ML sol.','FontSize',12 );
colorbar();
%% 2D smoothing operator 
b=zeros(num_m,num_m);
for i =2:nx
    for j=2:ny
        glo_ind =sub2ind(sz_m,i,j);
        glo_ind_left =sub2ind(sz_m,i-1,j);
        glo_ind_right =sub2ind(sz_m,i+1,j);
        glo_ind_up =sub2ind(sz_m,i,j+1);
        glo_ind_down =sub2ind(sz_m,i,j-1);

        b(glo_ind,glo_ind)=-4;
        b(glo_ind,glo_ind_left)=1;
        b(glo_ind,glo_ind_right)=1;
        b(glo_ind,glo_ind_up)=1;
        b(glo_ind,glo_ind_down)=1;
    end
end

bc=zeros((nx-1)*(ny-1),num_m);
nb=1;
for i=1:num_m
    [co,ro]=ind2sub(sz_m,i);
    if (ro~=ny+1)&&(ro~=1)&&(co~=nx+1)&&(co~=1)
        bc(nb,:)=b(i,:);
        nb=nb+1;
    end
end

m_smooth=inv(bc'*bc)*Gc'*inv(Gc*inv(bc'*bc)*Gc')*dc;

figure (6)
surf(X',Y',m_smooth);
xlabel('x');
ylabel('y');
title( 'smoothed sol.','FontSize',12 );
%Matrix is singular to working precision. 
%Matrix is singular, close to singular or badly scaled. Results may be inaccurate. RCOND = NaN.
%% using prior
bc_prior=3; % c.3
[G_prior,d_prior,x,y]=BoundCond(nx,ny,lx,ly,bc_prior);
m_prior=G_prior\d_prior;

mp=m_prior+Gc'*inv(Gc*Gc')*(dc-Gc*m_prior);

sol_fin=zeros(nx+1,ny+1);
for i=1:(nx+1)*(ny+1)
    [row,column]=ind2sub(sz_m,i);
    sol_fin(row,column)=mp(i);
end

figure (7); 
surf(X',Y',sol_fin);
xlabel('x');
ylabel('y');
xlim([0 0.8]);
ylim([0 0.4]);
set(gca,'fontsize',12);
title('solution with prior');
colorbar();