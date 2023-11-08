function [s,n_sample,width_window_sample]=janelamento(y,fs,width_window_s,overlap_percent,plotar)

    mode_test=plotar;
    
    y_aux=y;
    
    %transforma a largura da janela em segundo em amostras
    width_window_sample=width_window_s*fs;
    
    %transforma a sobreposição percentual em amostras de acordo com a largura
    %da janela
    overlap_sample=width_window_sample*(overlap_percent/100);
    
    d=size(y,1)/fs; %duração do sinal em segundos
    o=overlap_sample/fs; %duração da sobreposição em segundos
    j=width_window_s; %duração da janela da amostra em segundos
    
    n_sample=ceil((d-o)/(j-o)); %cálculo estimado de amostras
    
    s(width_window_sample,n_sample)=zeros; %aloca memória para a matriz de saída
    
    %Para debug
    if mode_test==1
        %y_aux=y_aux(1:480000);
        plot(y_aux);
        xlim([0 size(y_aux,1)]);
        xlabel("Amostra");
        ylabel("Amplitude");
        title("Amotras com Sobreposição")
        hold on;
        i=1;
    end
    
    %duração do primeiro sinal
    start_signal=1;
    end_signal=width_window_sample;
    
    j=1;
    
    %percorre todo o sinal
    while end_signal < size(y_aux,1)
    
        %primeira iteração
        if j==1
            s(:,j)=y_aux(start_signal:end_signal);
    
        %demais iterações
        else
            %calcula o início do sinal, considerando o overlap setado
            start_signal=end_signal-overlap_sample;
            %calcula o final do sinal adicionando o tamanho da janela desejada
            end_signal=start_signal+width_window_sample;
    
            %Isso é para garantir que o script funcione, pois a última amostra
            %pode não ter o tamanho correto, dessa forma é forçado que o
            % segmento do sinal acabe exatamente com mesmo tamanho do sinal
            % que está sendo segmentado.
            if(end_signal>size(y_aux,1))
                end_signal=size(y_aux,1);
            end
    
            %variável auxiliar que recebe o sinal segmentado o sinal
            s_aux=y_aux(start_signal:end_signal-1);
    
            %verifica se o sinal segmentado tem uma duração menor do que a
            %janela específicada, se sim completa com 0. Sem isso não é
            %possível retornar uma matriz com os sinais segmentados
            if(size(s_aux,1)<width_window_sample)
                s_aux(end:width_window_sample)=0;
            end
    
            %atribui o sinal segmentado na matriz
            s(:,j)=s_aux;
    
        end
    
        j=j+1;
    
        if mode_test==1
    
            %guarda os valores de início e fim do sinal para fazer a legenda do
            %plot
            x(i)=start_signal;
            i=i+1;
            x(i)=end_signal;
            i=i+1;
    
            %plota linha de início e fim do sinal
            xline(start_signal,'-.r');
            xline(end_signal,'-.b');
    
        end
           
    end
    
    if mode_test==1
    
        %organiza vetor de legenda e plota a legenda
        x1=sort(x,'ascend');
        x1=unique(x1);
        xticks(x1);
        xticklabels(x1);
        legend("","início da amostra","fim da amostra")
    
    end

end