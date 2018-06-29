goldcode=zeros(64,64,9);

%FirstPolynomial','x^10+x^3+1',... 'SecondPolynomial','x^10+x^8+x^3+x^2+1',...

for i =1:9
    goldseq = comm.GoldSequence('FirstPolynomial','x^11+x^2+1',...
    'SecondPolynomial','x^11+x^8+x^5+x^2+1',...
    'FirstInitialConditions',[0 0 0 0 0 0 0 0 0 0 1],...
    'SecondInitialConditions',[0 0 0 0 0 0 0 0 0 0 1],...
    'Index',i,'SamplesPerFrame',4096);
    code=goldseq();
    code=reshape(code,64,64);
    goldcode(:,:,i)=code;
end

goldcode=2*goldcode-1;%from 0/1 to -1/1

h5create('goldcode64.h5','/data',[64 64 9]);
h5write('goldcode64.h5', '/data', goldcode);


