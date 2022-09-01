function [X] = Makespan(schedule,S,P,m,n)
%returns makespan of given schedule
%S: set-up time , P:production time, m:number of machines, n:number of jobs
mjl=[];        %each machine designated jobs list
MS=zeros(m,1);
for i=1:m
    for j=1:n
        if schedule(i,j)~=0
            mjl=[mjl schedule(i,j)];
            if length(mjl)==1  %calculating first assigned job comeletion time (c)
                MS(i,1)=MS(i,1)+S(1,schedule(i,j)+1,i)+P(schedule(i,j),i);
            else             %calculating other assigned jobs comeletion time (c)
                MS(i,1)=MS(i,1)+S(mjl(length(mjl)-1)+1,schedule(i,j)+1,i)+P(schedule(i,j),i);
            end
        end
    end
    mjl=[];
end
X=max(MS(:,1));     %Cmax or makesapn equals to max compeletion time of each machine
end
