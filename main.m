%first you must define a pair
f1=[0 0 1 0 0 0 0 0 0 1];%Characteristic polynomial from x^1 to x^10
f2=[1 1 1 0 1 1 0 0 0 1];
gold=gold_seq(f1,f2);%size 1023 1023
gold=2*gold-1;%from 0/1 to -1/1

%primpoly(10,'all')
%take 9 code as the address code
goldcode=zeros(32,32,9);

for i=1:9
    code=gold(i,:);%select row i as an address code
    code=[code,randi([0 1],1)];%add a random number in the last
    code=reshape(code,32,32);
    goldcode(:,:,i)=code;
end

h5create('goldcode.h5','/data',[32 32 9]);
h5write('goldcode.h5', '/data', goldcode);

%x=h5read('goldcode.h5','/data');