%Self-similar random process generator
readme = "data generated with dr Artem Lenskiy's algorithm"
clc
clear all

%% setup
subjects = 100; %number of subjects
N=50000;
fr=floor(N/2);

f=zeros(1,N);


S=zeros(1,N);

%% 1 PSD generator 

gamma=2; % hurst = alpha = (gamma+1)/2
for s = 1:subjects
    for i=1:N
        S(i)=(1/i)^gamma;
    end;
    % 2
    a=randn(1,fr);
    b=randn(1,fr);
    f(1)=randn(1);
    f(fr)=randn(1);

    for i=2:N-1
        if(i<fr)
            f(i)=0.5*sqrt(S(i))*(a(i)+j*b(i));
        end;
        if(i>fr)
            f(i)=0.5*sqrt(S(N-i))*(a(N-i)-j*b(N-i));
        end;
    end;
    % 3)
    signal = abs(ifft(f));
    gamma_2(s,:) = signal;
     %figure;plot(signal)
    % title(['process generated based on PSD=$\frac{1}{f}^\gamma$ for $\gamma$ = ',num2str(gamma)],'Interpreter','latex')
end
%%
save artificial_data.mat gamma_1 gamma_2 gamma_0 readme
