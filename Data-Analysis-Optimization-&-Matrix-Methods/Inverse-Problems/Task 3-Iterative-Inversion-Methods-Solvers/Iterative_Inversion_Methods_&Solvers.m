%% data 
[G,mtrue]=CastleImage;
d=G*mtrue;
dn=d+0.05*randn(101,1);
sz=size(mtrue,1);
m=zeros(sz,1);
%% Q1 Kaczmarz Method dtrue 

for i=0:sz-1
    m_inv=m-(G(i+1,:)*m-d(i+1,1))/(G(i+1,:)*G(i+1,:)')*G(i+1,:)';
    m=m_inv;
end
figure (1);
plot(m_inv); hold on; 
plot(mtrue);
legend('minv','mtrue');
title( 'Kaczmarz Method inversion-true data','FontSize',16 );
%% Q1 Kaczmarz Method dperturbed

m=zeros(sz,1);
for i=0:sz-1
    m_pert=m-(G(i+1,:)*m-dn(i+1,1))/(G(i+1,:)*G(i+1,:)')*G(i+1,:)';
    m=m_pert;
end
figure (2);
plot(m_pert); hold on; 
plot(mtrue);
legend('mpertur','mtrue');
title( 'Kaczmarz Method inversion-perturbed data','FontSize',16 );
%% Q1 conjugate gradient dtrue 

m=zeros(sz,1);
belta=0;
p=zeros(sz,1);
r=d-G*m;

for k=1:200
    p=r+belta*p;
    alpha=(r'*r)/(p'*G*p);
    m_cg=m+alpha*p;
    r_0=r;
    r=r_0-alpha*G*p;
    belta=(r'*r)/(r_0'*r_0);
    normr=norm(r);

    if normr<=1e-6
        break
    end
    m=m_cg;
end

figure (3)
plot(m_cg); hold on; 
plot(mtrue);
legend('m CG ','mtrue')
title( 'conjugate gradient inversion-true data','FontSize',16 );
%% Q1 conjugate gradient dperturbed 

rn=dn-G*m;

for k=1:100
    p=rn+belta*p;
    alpha=(rn'*rn)/(p'*G*p);
    m_cgpert=m+alpha*p;
    r_0=rn;
    rn=r_0-alpha*G*p;
    belta=(rn'*rn)/(r_0'*r_0);
    normrn=norm(rn);
    if normrn<=5
        break
    end
    m=m_cgpert;
end
figure (4)
plot(m_cgpert); hold on; 
plot(mtrue);
legend('m CG pertr','mtrue')
title( 'conjugate gradient inversion-perturbed data','FontSize',16 );
%% Q2 Landweber Iterative Method dtrue
[G,mtrue]=CastleImage;
d=G*mtrue;
dn=d+0.05*randn(101,1);
sz=size(mtrue,1);

[u,s,v] = svd(G);
s1=s(1,1);
w_max=2/(s1^2);
w=1;

m=zeros(sz,1);
for i=1:1000
    m=m-w*G'*(G*m-d);
end
figure (1)
plot(m); hold on; 
plot(mtrue);
legend('m 1000','mtrue')
title( 'Landweber Iterative Method-true data','FontSize',16 );

disp(s1);  % 0.9972
disp(w_max);  % 2.0114
%% Q2 Landweber Iterative Method noisy data

for i=1:100
    m=m-w*G'*(G*m-dn);
end
figure (2)
plot(m); hold on; 
plot(mtrue);
legend('m 100','mtrue')
title( 'Landweber Iterative Method-noisy data','FontSize',16 );
%% Q3 svd 

[u,s,v]=svd(G);

Vect = [rank(s)];
for i = Vect
    [Ui,Si,Vi] = svds(G,i) ;
    m_svd=Vi*inv(Si)*Ui'*dn;
    figure(5);
    plot(m_svd); hold on; 
    plot(mtrue);
    title (['m svd with noise'],'FontSize',14);
    k=k+1;
end
for i = Vect
    [Ui,Si,Vi] = svds(G,i) ;
    m_svd=Vi*inv(Si)*Ui'*d;
    figure(6);
    plot(m_svd); hold on; 
    plot(mtrue);
    title (['m svd without noise '],'FontSize',14);
    k=k+1;
end
for i = 28
    [Ui,Si,Vi] = svds(G,i) ;
    m_svd=Vi*inv(Si)*Ui'*dn;
    figure(7);
    plot(m_svd); hold on; 
    plot(mtrue);
    title (['m svd with noise,p = ' num2str(i)],'FontSize',14);
    k=k+1;
end
%% Q3 LU 
[p,l,u]=lu(G);
%  solve Ly=b
y=l\(p*d);
%  solve Ux=y
m_lu=u\y;

figure(8);
plot(m_lu); hold on; 
plot(mtrue);
title( 'm lu without niose','FontSize',16 );

[p,l,u]=lu(G);
%  solve Ly=b
y=l\(p*dn);
%  solve Ux=y
m_lu=u\y;

figure(9);
plot(m_lu); hold on; 
plot(mtrue);
title( 'm lu with niose','FontSize',16 );