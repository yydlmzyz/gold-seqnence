function[goldseq]=gold_seq(fbconnection1,fbconnection2)
mseq1=m_sequence(fbconnection1);
mseq2=m_sequence(fbconnection2);
N=2^length(fbconnection1)-1;
for shift_amount=0:N-1
    shift_mseq2=[mseq2(shift_amount+1:N) mseq2(1:shift_amount)];
    goldseq(shift_amount+1,:)=mod(mseq1+shift_mseq2,2);
end
