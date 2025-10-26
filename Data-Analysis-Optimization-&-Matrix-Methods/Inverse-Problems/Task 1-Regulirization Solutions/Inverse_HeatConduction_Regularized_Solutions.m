%% problem2_Q2 %%%%%%%%%%%%%%%%%%%%
L=5;
M=101;
sigma_A = 0.2;
sigma_B = 0.1;
Mu_A = L/4;
Mu_B = (3*L)/4;
Yi_A = linspace(0.05, 2.45, 49); %generating slab A points, boundries are not included 
Yi_B = linspace(2.55, 4.95, 49); %generating slab B points, boundries and interface are not included 
S_A = exp(- (Yi_A-Mu_A).^2/(2*(sigma_A).^2));
S_B = exp(- (Yi_B-Mu_B).^2/(2*(sigma_B).^2));

figure(1);
plot(Yi_A, S_A, '-r'); hold on;
plot(Yi_B, S_B, '-r'); grid on; 
title( 'source terms for slabs A & B','FontSize',10 )
xlabel('Y');
ylabel('S(Y)');


%% problem2_Q3 %%%%%%%%%%%%%%%%%%%%
%parameters 
K_A = 0.17;
K_B = 0.13;
T_infinity = 25; 
h = 30;
q0 = 800;
c = 1.2;

S_0 = -(h * T_infinity) - q0; %boundry1
S_51 = 0; %interface 
S_101 = -(h * T_infinity) - (q0 * c);%boundry2
S = [S_0 -S_A S_51 -S_B S_101]; %use S_A and S_B calculated in previous question 
d=S'; % one column d

y = linspace(0,5,101); % define the length of the whole slab (the discretization) 
delta_y = L/(M-1);
%generate G 
% devide the G matrix into matrices for boundry (B1) at position 0, slab A, interface (intr) at position 51, Slab B, B2 at position 101 
G_B1 = zeros(1,101);
G_A = zeros(49,101);
G_intr = zeros(1,101);
G_B = zeros(49,101);
G_B2 = zeros(1,101);

for i=2:50 %slab A
    G_A(i-1,i-1) = K_A;
    G_A(i-1,i) = -2*K_A;
    G_A(i-1,i+1) = K_A;
end

for i=52:100 %slab B
    G_B(i-51,i-1) = K_B;
    G_B(i-51,i) = -2*K_B;
    G_B(i-51,i+1) = K_B;
end
G_B1(1,1) = -K_A*delta_y - h*delta_y^2;
G_B1(1,2) = K_A*delta_y;
G_intr(1,50) = K_A;
G_intr(1,51) = -(K_A+K_B);
G_intr(1,52) = K_B;
G_B2(1,100) = K_B*delta_y;
G_B2(1,101) = -K_B*delta_y - h*delta_y^2;
G = [G_B1;G_A;G_intr;G_B;G_B2]; %assembling the sub G's into the G matrix 
G = G/delta_y^2;

m = G\d;  %inverting using \

figure(2);
plot(y, m, 'b'); grid on;  
title( 'Temperature Distribution (Direct Inversion)','FontSize',10 );
xlabel('y');  % the discrete slab where temprature are being determined 
ylabel('T(y)'); % vector m is the solution which represent values of T

%% Problem2_Q4 %%%%%%%%%%%%%%%%%%%
%Q4.2: the minimum length solution (ml) % m =Gt(GGt).^-1 *d
G_new = G(1,:);  %constract the new matrix G, i=1,2,3,...,m-2,M
for i=1:50
    G_new = [G_new;G(2*i+1,:)];
end
d_new = d(1,1); % constract the new d, i=1,2,3,...,m-2,M
for i=1:50
    d_new = [d_new;d(2*i+1,1)];
end
Gt = G_new';  %Gt= G transpose 

ml_m = Gt*inv(G_new*Gt)*d_new;

figure(3);
plot(y, ml_m, 'b'); grid on;  
title( 'Temperature Distribution (Minimum Length solution)','FontSize',10 )
xlabel('y');
ylabel('T(y)');

%Q4.3: the damped least square solution (DLSQR) % m =[GtG + k.^2 *I].^-1 *Gt*d
k_sqr=1.5;

DLSQR_m = (Gt*G_new+k_sqr*eye(101)) \ (Gt*d_new);

figure(4)
plot(y, DLSQR_m, 'b'); grid on;   
title( 'Temperature Distribution (DLSQR Solution with k^2=1.5)','FontSize',10 )
xlabel('y');
ylabel('T(y)');

%Q4.4: the flattened solution  % m =[GtG + Wm].^-1 *Gt*d, Wm+Dtf*Df
Df =zeros(100,101); % creat Df
for i=1:100
    Df(i,i)=-1;
    Df(i,i+1)=1;
end

Dtf =Df';
Wm = 1.5*(Dtf*Df);
flattened_m =(Gt*G_new + Wm)\ (Gt*d_new);

figure(5)
plot(y, flattened_m, 'b' ); grid on;  
title( 'Temperature Distribution (Flattened Solution)', 'FontSize',10 )
xlabel('y');
ylabel('T(y)');

%Q4.5: the smoothed solution  % m =[GtG + Wm].^-1 *Gt*d, Wm+Dts*Ds
Ds =zeros(99,101); %creat Ds
for i=1:99
    Ds(i,i)=1;
    Ds(i,i+1)=-2;
    Ds(i,i+2)=1;
end

Dts =Ds';
Wms = 1.5*(Dts*Ds);
smoothed_m =(Gt*G_new + Wms)\ (Gt*d_new);

figure(6)
plot(y, smoothed_m, 'b' ); grid on;  
title( 'Temperature Distribution (smoothed Solution)','FontSize',10 )
xlabel('y');
ylabel('T(y)');

%Q4.6: L2 norm of the prediction error 
pred_err_ml = G_new*ml_m-d_new; %for minimum length solution 
L2_ml = norm(pred_err_ml);
fprintf('L2 norm of prediciation error ml: %.4f\n', L2_ml)

pred_err_DLSQR = G_new*DLSQR_m-d_new; %for DLSQR solution
L2_DLSQR = norm(pred_err_DLSQR);
fprintf('L2 norm of prediciation error DLSQR: %.4f\n', L2_DLSQR)

pred_err_flattening = G_new*flattened_m-d_new; %for flattened solution 
L2_flat = norm(pred_err_flattening);
fprintf('L2 norm of prediciation error flattened: %.4f\n', L2_flat)

pred_err_smoothing = G_new*smoothed_m-d_new; %for flattened solution 
L2_smooth = norm(pred_err_smoothing);
fprintf('L2 norm of prediciation error smoothed: %.4f\n', L2_smooth)

%Q4.8: fourth order smoothing solution 
D4s=zeros(97,101);
for i=1:97
    D4s(i,i)=1;
    D4s(i,i+1)=-4;
    D4s(i,i+2)=6;
    D4s(i,i+3)=-4;
    D4s(i,i+4)=1;
end
Dt4s =D4s';
Wms4 =1.5*(Dt4s*D4s);
D4s_m = (Gt*G_new + Wms4)\ (Gt*d_new);

figure(7)
plot(y, D4s_m,'b' ) ; grid on ;  
title( 'Temperature Distribution (fourth order smoothed solution)','FontSize',10 )
xlabel('y'); 
ylabel('T(y)');

%Q4.9: fourth order smoothing solution with noisy data 
dn = 0.05*randn(51,1) + d_new; % standard devation = 0.05
 
Dns_m = (Gt*G_new + Wms4)\ (Gt*dn); %use all the previous defined in fourth order smoothing

figure(8)
plot(y, Dns_m,'b' ) ;  grid on ;  
title( 'Temperature Distribution (fourth order smoothed solution of noisy data)','FontSize',10 )
xlabel('y'); 
ylabel('T(y)');

%Q4.10-2: covariance of the DLSQ solution  
mean_d = mean(dn); %clculate the mean to calculate cov(d)
cov_d =(dn-mean_d).*(dn-mean_d)';
M = (Gt*G_new+k_sqr*eye(101)) \ (Gt);
cov_m = M*(cov_d)*M';

figure(10)
imagesc( cov_m ); grid on ;  
title( 'cov(m_D_L_S_Q_R)','FontSize',10 )

figure(11)
plot(y, cov_m,'b' ) ;  grid on ;  
title( 'cov(m_D_L_S_Q_R)','FontSize',10 )
xlabel('y'); 
ylabel('cov(T(y))');