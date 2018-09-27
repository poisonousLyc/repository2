%找到血氧信号傅里叶展开后数据的极值点
data=bodata;
FlattenedData = data(:)';                % 展开矩阵为一列，然后转置为一行
Y = mapminmax(FlattenedData, 0, 1);      % 归一化  y=(x-MinValue)/(MaxValue-MinValue)
N= length(Y);

fs=50;          %fs为抽样频率

F=fft(Y,N);     %FFT分析

F=abs(F);
F=F(1:N/10);
ft=[0:(fs/N):fs/2]; %转换成实际频率
ft=ft(1: N/10);

F(1)=min(F);        
F(1)=max(F)/0.82;    %方便看图 将直流分量化小

plot(ft,F);     %画出频谱图
xlabel('频率/Hz');
grid on

hold on;



[maxv,maxl] = findpeaks(F,'minpeakdistance',9);
fpeaks = ft(maxl);         %极值点对应的频率
apeaks = maxv;             %极值点对应的振幅
plot(fpeaks,apeaks,'*','color','R');hold on;                %绘制最大值点

aratio = [1,0.85,0,0,0,0];
for i=3:6
    aratio(i) = aratio(2) * apeaks(i-1) / apeaks(1);
end

