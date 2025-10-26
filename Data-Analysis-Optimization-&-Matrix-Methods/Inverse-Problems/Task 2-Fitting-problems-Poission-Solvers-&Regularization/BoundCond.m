
function [G,d,x,y] = BoundCond(nx,ny,lx,ly,bc)
% function that takes nx, ny, lx, ly, bc as inputs, and returns G, d, x, y for different boundry conditions BoundCond
%bc=[1.1 1.2 2.1 2.2 2.3 3]; corresponding to Q no.
sz_m=[nx+1 ny+1];
num_m=(nx+1)*(ny+1);
m=zeros(num_m,1);
G=zeros(num_m);
d=60*ones(num_m,1);
dx=zeros(nx,1);
dy=zeros(ny,1);

% x direc. and y direc. and the relation between indices and subindices
for i=1:nx
    if i<=(nx/4)
        dx(i)=2*lx/nx;
    else
        dx(i)=2*lx/nx/3;
    end
end

for i=1:ny
    if i<=(ny*3/4)
        dy(i)=2*ly/ny/3;
    else
        dy(i)=2*ly/ny;
    end
end

x=zeros(nx+1,1);
for i=2:nx+1
    x(i)=x(i-1)+dx(i-1);
end

y=zeros(ny+1,1);
for i=2:ny+1
    y(i)=y(i-1)+dy(i-1);
end

for i=2:nx
    for j=2:ny
        gloind=sub2ind(sz_m,i,j);
        gloind_ia1=sub2ind(sz_m,i+1,j);
        gloind_im1=sub2ind(sz_m,i-1,j);
        gloind_ja1=sub2ind(sz_m,i,j+1);
        gloind_jm1=sub2ind(sz_m,i,j-1);
        
        G(gloind,gloind)=1/(dx(i)*(dx(i)/2+dx(i-1)/2))+1/(dx(i-1)*(dx(i)/2+dx(i-1)/2))+ ...,
                               1/(dy(j)*(dy(j)/2+dy(j-1)/2))+1/(dy(j-1)*(dy(j)/2+dy(j-1)/2));
        G(gloind,gloind_ia1)=-1/(dx(i)*(dx(i)/2+dx(i-1)/2));
        G(gloind,gloind_im1)=-1/(dx(i-1)*(dx(i)/2+dx(i-1)/2));
        G(gloind,gloind_ja1)=-1/(dy(j)*(dy(j)/2+dy(j-1)/2));
        G(gloind,gloind_jm1)=-1/(dy(j-1)*(dy(j)/2+dy(j-1)/2));

    end
end
% Dirichlet bc, case 1.1        
if bc==1.1 
    for i=1:nx:nx+1
        for j=1:ny+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=0;
        end
    end
    for j=1:ny:ny+1
        for i=1:nx+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=0;
        end
    end
% Dirichlet bc, case 1.2    
elseif bc==1.2  
    for i=1:nx:nx+1
        for j=1:ny+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=x(i)*y(j);
        end
    end
    for j=1:ny:ny+1
        for i=1:nx+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=x(i)*y(j);
        end
    end
% mixed Dirichlet and Neumann bc, case 2.1
elseif bc==2.1  
    for i=1:nx:nx+1
        for j=1:ny+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=x(i)*y(j);
        end
    end
    for j=ny+1
        for i=1:nx+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=x(i)*y(j);
        end
    end
    % tao1 (boundry)
    for j=1
        for i=1:nx+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=-1;
            gloind_ja1=sub2ind(sz_m,i,j+1);
            G(gloind,gloind_ja1)=1;
            d(gloind,1)=0;
        end
    end
% mixed Dirichlet and Neumann bc, case 2.2        
elseif bc==2.2  
    for i=nx+1
        for j=1:ny+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=sqrt(x(i)*y(j));
        end
    end
    for j=1:ny:ny+1
        for i=1:nx+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=sqrt(x(i)*y(j));
        end
    end
    % tao3 (boundry)
    for i=1
        for j=1:ny+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            gloind_ia1=sub2ind(sz_m,i+1,j);
            G(gloind,gloind_ia1)=-1;
            d(gloind,1)=dx(i)*sin(y(j));
        end
    end
elseif bc==2.3
    for i=1:nx:nx+1
        for j=1:ny+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=1;
        end
    end
    for j=1
        for i=1:nx+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=1;
        end
    end
% with prior     
elseif bc==3
    for i=1:nx:nx+1
        for j=1:ny+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=1;
        end
    end
    for j=1:ny:ny+1
        for i=1:nx+1
            gloind=sub2ind(sz_m,i,j);
            G(gloind,gloind)=1;
            d(gloind,1)=1;
        end
    end
    for i=2:nx
        for j=2:ny
            gloind=sub2ind(sz_m,i,j);
            d(gloind,1)=30;
        end
    end
            
end
end