%%the true image %%
[G, mtrue] = CastleImage;
%plot(mtrue);
d = G*mtrue;

figure(1)
plot(mtrue);hold on;
plot(d);
xlabel('x');
ylabel('y');
title( 'mtrue and d','FontSize',12 )
legend( 'mtrue','d')
%% direct inversion %%

m_direct =G\d;

figure(2)
plot(m_direct);
title( 'direct inversion','FontSize',12 );
xlabel('x');
ylabel('y');

cond_G =cond(G,inf);
disp(cond_G)
% k_infinity = 9.0432e+16
m_direct_e=norm((mtrue-m_direct),inf)/norm(m_direct,inf);
disp(m_direct_e)
% m_direct_e = 0.4830

%% LU
[l,u,p]=lu(G);
pd=p*d;

sz=size(mtrue,1);
y_plu=zeros(sz,1);
m_plu=zeros(sz,1);

% Ly=Pb
for i=1:sz
    y_plu(i,1)=pd(i);
    if (i~=1)
        for j=1:i-1
            y_plu(i,1)=y_plu(i,1)-l(i,j)*y_plu(j,1);
        end
    end
end

% Ux=y
for i=sz:-1:1
    m_plu(i,1)=y_plu(i,1);
    if i==sz
        m_plu(i,1)=m_plu(i,1)/u(i,i);
    else
        for j=i+1:sz
            m_plu(i,1)=m_plu(i,1)-u(i,j)*m_plu(j,1);
        end
        m_plu(i,1)=m_plu(i,1)/u(i,i);
    end
end
figure(3)
plot(m_plu)
title( 'PLU decomposition','FontSize',12 );
xlabel('x');
ylabel('y');

m_plu_e=norm((mtrue-m_plu),inf)/norm(m_plu,inf);
disp(m_plu_e)
% m_plu_e = 0.3884
%% SVD 
[u,s,v]=svd(G);
r_u=rank(u);
r_s=rank(s);
r_v=rank(v);
ur=u(:,1:95);
vr=v(:,1:95);
sr=s(1:95,1:95);
m_tsvd=vr*inv(sr)*ur'*d;
figure(4)
plot(m_tsvd);
title( 'SVD decomposition','FontSize',12 );
xlabel('x');
ylabel('y');

m_svd_e=norm((mtrue-m_tsvd),inf)/norm(m_tsvd,inf);
disp(m_svd_e)
%m_svd_e = 0.0200 
%% %%%%%%%%%%%%%%% Q2 %%%%%%%%%%%%%%%%
%% 2.3 Si of G
[u,s,v]=svd(G);
%gtg=v*(s'*s)*v';
%ggt=u*(s*s')*u';
Si=diag(s);

figure(5)
plot(Si);
title( 'Si','FontSize',12 );
%% 2.4 relative energies 
inertia_s=sum(Si);
inertia=zeros(rank(s),1);
inertia(1)=Si(1)/inertia_s*100;
for i=2:rank(s)
    inertia(i)=inertia(i-1)+Si(i)/inertia_s*100;
end

figure(6)
plot(inertia)
title( 'cumulative sum of the relative energies','FontSize',12 );
%% 2.6 TSVD for p= 30, 40, 50, 60 
p = 60; % change p to the desired value 
[Ui, Si, Vi] = svds(G, p);
m_tsvd = Vi * inv(Si) * Ui' * d;

figure(7);
plot(m_tsvd);
title(['m_t_s_v_d, p = ' num2str(p)], 'FontSize', 12);
%% 2.7 data with random noise N(0, 0.0025)
dn =d+sqrt(0.0025)*randn(101,1);

figure(8)
plot(dn);
xlabel('x');
ylabel('y');
title( 'noisy image','FontSize',12 )

p = 60; % change p to the desired value 
[Ui, Si, Vi] = svds(G, p);
m_tsvd_n = Vi * inv(Si) * Ui' * dn;

figure(9);
plot(m_tsvd_n);
title(['m_t_s_v_d from noisy data, p = ' num2str(p)], 'FontSize', 12);
%% 2.8 model resolution matrix 
p = 40; % change for p=N =101 
[Ui, Si, Vi] = svds(G, p);
Rm=Vi*Vi';

p2 = 101; % change for p=N =101 
[Ui2, Si2, Vi2] = svds(G, p2);
Rm2=Vi2*Vi2';

figure(10)
subplot(1,2,1);
imagesc(Rm); colorbar;
title ('Rm, p=40 ','FontSize',12);

subplot(1,2,2);
imagesc(Rm2); colorbar;
title ('Rm, N=101 ','FontSize',12);

sgtitle('model resolution matrix', 'FontSize', 15)
%% 2.9 data resolution matrix 

p = 40; % change for p=N =101 
[Ui, Si, Vi] = svds(G, p);
Rd=Ui*Ui';

p2 = 101; % change for p=N =101 
[Ui2, Si2, Vi2] = svds(G, p2);
Rd2=Ui2*Ui2';

figure(11)
subplot(1,2,1);
imagesc(Rd); colorbar;
title ('Rd, p=40 ','FontSize',12);

subplot(1,2,2);
imagesc(Rd2); colorbar;
title ('Rd, N=101 ','FontSize',12);

sgtitle('data resolution matrix', 'FontSize', 15)
%% 2.11 parameters cov matrix 

p = 40; % change for p=N =101 
[Ui, Si, Vi] = svds(G, p);
covm=0.0025*Vi*inv(Si)*inv(Si')*Vi';

p2 = 101; % change for p=N =101 
[Ui2, Si2, Vi2] = svds(G, p2);
covm2=0.0025*Vi2*inv(Si2)*inv(Si2')*Vi2';

figure(12)
subplot(1,2,1);
imagesc(covm); colorbar;
title ('covm, p=40 ','FontSize',12);

subplot(1,2,2);
imagesc(covm2); colorbar;
title ('covm, N=101 ','FontSize',12);

sgtitle('model covariance matrix', 'FontSize', 15)
%% %%%%%%%% Q3 %%%%%%%%%
%% 3.1 LU of G without pivoting 
[l,u]=lu(sparse(G),0); 
cond_L=condest(l);
cond_U=condest(u);
disp(cond_L); % cond_L = 3.5274e+08
disp(cond_U); % cond_U = 7.5734e+15
%% 3.2 solving Um=y, find y and compute m_lu
%LUm=d, Um=y, Ly=d, y= inv(l)* d, y=l\d, hence m= inv(U)*y
y =l\d;
m_lu=u\y;

figure(13);
plot(m_lu);hold on;
plot(mtrue);
legend('m_l_u', 'mtrue');
%% 3.3 commands spy(U), spy( max(U - 1e-6, 0)
figure(14)
subplot(1,2,1);
spy(u);
title('spy(u)');

subplot(1,2,2);
spy(max(u-1e-6,0));
title('spy(max(u-1e-6,0))');
%% 3.4.b
r= rank(G); disp(r); % rank(G)= 95
k= 100; % use the same code for r= 95, r+5=100, r-5=90, r-10= 85, r-15= 80
uk = u(1:k, :);
yk = y(1:k, 1);
m_ml = uk' * inv(uk * uk') * yk;

figure(15);
plot(m_ml);
title(['m_m_l, k = ' num2str(k)], 'FontSize', 12);
%% 3.4.e
k= 100;
u11=u(1:k,1:k);
u12=u(1:k,k+1:101);
m11=u11'*inv(u12*u12'+u11*u11')*y(1:k,1);
m12=u12'*inv(u12*u12'+u11*u11')*y(1:k,1);
m_4e=[m11;m12];

figure(16);
plot(m_4e, 'r');hold on;
plot(m_ml, 'g');
legend('m 6&7','m_m_l')
title(['m 6&7 and m_m_l , k = ' num2str(k)], 'FontSize', 12);hold off;
%% 3.4.f
d_n=d+0.05*randn(101,1);
y_n=l\d_n;

k=80;

u11=u(1:k,1:k);
u12=u(1:k,k+1:101);
m11=u11'*inv(u12*u12'+u11*u11')*y_n(1:k,1);    
m12=u12'*inv(u12*u12'+u11*u11')*y_n(1:k,1);
m_4f=[m11;m12];

figure (17);
plot(m_4f);
title('m_m_l from b from noisy data, k=80')
