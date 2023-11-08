clc; clear all; close all;

% %Split audio
[y,fs] = audioread('D:\OneDrive\Lucas_Teodoro\Mestrado\Dissertação\Desenvolvimento\SinaisFalhas\H\MIC1_H_0_4N.wav');

%sound(yns,fs);

mode_test=1;

%informar a largura da janela em segundos e porcentagem da sobreposição 
width_window_s=1;
overlap_percent=30;


%calcula a duração em segundos do sinal e retira a parte decimal do numero
%(função fix)
size_input_signal=fix(size(y,1)/fs);

%calcula a quantidade de amostras que o array y deve ter para ter um uma
%duração inteira em segundos
sample=size_input_signal*fs;

%quantidade de amostras que devem ser retiradas do fim do array y para
%garantir um sinal com duração inteira
qtd_sample_remove=size(y,1)-sample;

%cria um novo array representando um sinal de saída inteira, 
% retirando as amostras do final 
y_aux=y(1:end-qtd_sample_remove);

%transforma a largura da janela em segundo em amostras
width_window_sample=width_window_s*fs;

%transforma a sobreposição percentual em amostras de acordo com a largura
%da janela
overlap_sample=width_window_sample*(overlap_percent/100);

%Para debug
if mode_test==1
    y_aux=y_aux(1:480000);
    plot(y_aux)
    hold on;
end




star_signal=1;
end_signal=width_window_sample;
i=1;


%percorre todo o sinal
while end_signal < size(y_aux,1)
    
    %primeira iteração
    if i==1
        s1=y_aux(star_signal:end_signal);
    
    %demais iterações
    else
        %calcula o início do sinal, considerando o overlap setado
        star_signal=end_signal-overlap_sample;
        %calcula o final do sinal adicionando o tamanho da janela desejada
        end_signal=star_signal+width_window_sample;
        
        %Isso é para garantir que o script funcione, pois a última amostra
        %pode não ter o tamanho correto, dessa forma é forçado que o 
        % segmento do sinal acabe exatamente com mesmo tamanho do sinal 
        % que está sendo segmentado.
        if(end_signal>size(y_aux,1))
            end_signal=size(y_aux,1);
        end

        %cria o sinal segmentado
        s2=y_aux(star_signal:end_signal-1);
     
    end
    
    if mode_test==1

        %guarda os valores de início e fim do sinal para fazer a legenda do
        %plot 
        x(i)=star_signal;
        i=i+1;
        x(i)=end_signal;
        i=i+1;

        %plota linha de início e fim do sinal 
        xline(star_signal,'-.r');
        xline(end_signal,'-.b');
       
    end

   

end

if mode_test==1

    %organiza vetor de legenda e plota a legenda 
    x1=sort(x,'ascend');
    xticks(x1);
    xticklabels(x1);

end




