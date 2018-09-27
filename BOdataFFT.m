%�ҵ�Ѫ���źŸ���Ҷչ�������ݵļ�ֵ��
data=bodata;
FlattenedData = data(:)';                % չ������Ϊһ�У�Ȼ��ת��Ϊһ��
Y = mapminmax(FlattenedData, 0, 1);      % ��һ��  y=(x-MinValue)/(MaxValue-MinValue)
N= length(Y);

fs=50;          %fsΪ����Ƶ��

F=fft(Y,N);     %FFT����

F=abs(F);
F=F(1:N/10);
ft=[0:(fs/N):fs/2]; %ת����ʵ��Ƶ��
ft=ft(1: N/10);

F(1)=min(F);        
F(1)=max(F)/0.82;    %���㿴ͼ ��ֱ��������С

plot(ft,F);     %����Ƶ��ͼ
xlabel('Ƶ��/Hz');
grid on

hold on;



[maxv,maxl] = findpeaks(F,'minpeakdistance',9);
fpeaks = ft(maxl);         %��ֵ���Ӧ��Ƶ��
apeaks = maxv;             %��ֵ���Ӧ�����
plot(fpeaks,apeaks,'*','color','R');hold on;                %�������ֵ��

aratio = [1,0.85,0,0,0,0];
for i=3:6
    aratio(i) = aratio(2) * apeaks(i-1) / apeaks(1);
end

