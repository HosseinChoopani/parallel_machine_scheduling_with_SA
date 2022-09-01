function [ new_s] = Schedule_Generator( s)
%Generate a new random schedule based on previous schedule by I) exchanging two jobs from two machine 
%or II) transfering a job from a machine to another machine
[m,n]=size(s);
new_s=s;
%Cheking if plan I is possible (there are two machines with assigned job)
nasm=0;
for i=1:m
    if nnz(s(i,:))>0
       nasm=nasm+1;
    end
end
if nasm>=2
    r0=rand;
else  %if plan I is not possible, plan II should execute
    r0=1;
end
if r0<0.5
    %plan I:
    %randomly choosing two different assigned machines
    v=randi(m);
    while nnz(s(v,:))==0
        v=randi(m);
    end
    c=randi(m);
    while v==c
        c=randi(m);
    end
    while nnz(s(c,:))==0
        c=randi(m);
    end
    %randomly choosing one job from each machine
    %first machine:
    x1=find(s(v,:)~=0);
    r1=randi(length(x1));
    vv=x1(r1);
    %second machine:
    x2=find(s(c,:)~=0);
    r2=randi(length(x2));
    cc=x2(r2);
    %exchanging jobs:
    new_s(v,vv)=s(c,cc);
    new_s(c,cc)=s(v,vv);
else %plan II:
   %randomly choosing two different machines 
    v=randi(m);
    while nnz(s(v,:))==0
        v=randi(m);
    end
    c=randi(m);   %second machine can be unassigned
    while v==c
        c=randi(m);
    end
    %randomly choosing one job from each machine
    x1=find(s(v,:)~=0);
    r1=randi(length(x1));
    vv=x1(r1);
   %job in second machine should be a zero element
    x2=find(s(c,:)==0);
    r2=randi(length(x2));
    cc=x2(r2);
    %transfering
    new_s(c,cc)=s(v,vv);
    new_s(v,vv)=0;
end

