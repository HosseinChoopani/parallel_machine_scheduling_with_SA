%MAIN CODE
clc;clear;close; 
%Problem Parameters----------------------------------------
m=3;     %number of machines
n=15;    %number of jobs
%S: set-up times, P: production times (random)
S=cat(3,rand(n+1)*2,rand(n+1)*2,rand(n+1)*2);
P=1+rand(n,m)*20;
%initial schedule------------------------------------------
p1(1,:)=[randperm(n),zeros(1,m*n-n)];
p2(1,:)=randperm(m*n);
s=[];
for i=p2(1,:)
    s=[s p1(1,i)];
end
s=reshape(s,n,m)';    
z=Makespan(s,S,P,m,n);
allZ=[];
meanZ=mean(allZ);
s_best=s;
z_best=z;
%Algorithm Parameters------------------------------------
T=100;
alpha=0.98;
N=15;
T_final=0.0001;
%Main loops----------------------------------------------
while(T>T_final)
    for j=1:N 
        new_S=Schedule_Generator(s);        
        new_Z=Makespan(new_S,S,P,m,n);
        if new_Z<z
            s=new_S;
            z=new_Z;
            allZ=[allZ z];
            meanZ=[meanZ mean(allZ)];
            if z<=min(allZ)
                s_best=s;
                z_best=[z_best z];
            end
        else r=rand;
            if r<exp(-1*((new_Z-z)/T))
               s=new_S;
               z=new_Z;
               allZ=[allZ z];
               meanZ=[meanZ mean(allZ)];
            end
        end
    end
    T=alpha*T;
end
%PLOTS--------------------------------------------------
best_possible=30;          %best GAMS answer(not real)
xx=1:100:(length(allZ)+150);
opt=zeros(1,length(xx))+best_possible;
plot(allZ)
hold on
plot(meanZ,'r')
plot(xx,opt,'g')
legend('makespan','average','GAMS')
xlabel('iteration'); ylabel('makespan')
%RESULT---------------------------------------------------
disp('best makespan');disp(z_best(end));disp('best schedule');disp('-------------------------------');disp(s_best)

        
