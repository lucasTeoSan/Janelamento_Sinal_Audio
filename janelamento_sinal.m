clc; clear all; close all;

%Pasta onde estão os sinais que serão segmentados
%folder='D:\OneDrive\Lucas_Teodoro\Mestrado\Dissertação\Desenvolvimento\SinaisFalhas_MIC1\H';
folder = uigetdir('C:\','Selecionar pasta') %Comando para abrir um dialog para selecionar a pasta

%Lista somente os arquivos de áudio
filedir=dir(strcat(folder,'/*.wav'));

%monta o caminho onde será salvo os sinais segmentados
output_folder=strcat(folder,'\Sinais_Segmentados');

%cria a pasta onde os sinais serão salvos
mkdir(output_folder);

%Tamanho da janela em segundos e a porcentagem de sobreposição
width_window_s=1;
overlap_percent=50;

%Verifica se a pasta escolhida possui sinal de áuido .wav
if isempty(filedir)
    disp('A pasta não possui nenhum sinal de áudio (.wav)');
else

    %Para cada sinal da pasta realiza a segmentação
    for i=1:length(filedir)

        %lê o sinal de áudio
        [y,fs] = audioread(strcat(folder,'\',filedir(i).name));

        %realiza o janelamento(segmentação)
        %s é uma matrix que contem todos os sinais
        %n é o numero de sinais resultantes da segmentação
        [s,n]=janelamento(y,fs,width_window_s,overlap_percent,0);

        %cada sinal segmentado é salvo em .wav
        for j=1:size(s,2)
            
            %cria uma variável que recebe um único sinal segmentado para
            %salvá-lo
            eval(['y_out=s(:,j);']);

            %tira a extensão do nome do arquivo
            str_temp=erase(filedir(i).name,".wav");
            
            %monta o caminho onde será salvo o novo sinal com seu nome que é
            %composto do nome do sinal original adicionando o prefixo PT
            %(parte)
            name_segmented_sinal=strcat(output_folder,'\',str_temp,'_PT',num2str(j),'.wav')

            %salva o novo sinal segmentado 
            audiowrite(name_segmented_sinal,y_out,fs)

        end

    end
  
    msgbox('Os sinais segmentados foram gerados');

end







