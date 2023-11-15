# Janelamento_Sinal_Audio
Aplicação que faz o janelamento (segmentação) de um sinal de áudio (.wav) com overlap. Com essa função é possível realizar um aumento artificial das amostras de um banco de dados

O arquivo "janelamento" é a função que segmenta o sinal 

Exemplo de uso:

[s,n]=janelamento(y,fs,width_window_s,overlap_percent,0);

Entradas

y=sinal original
fs=frequência de amostragem 
width_window_s=largura da janela em segundos 
overlap_percent= porcentagem de overlap
plotar= plotar a segmentação do sinal (Utilizado para debug)

Saída:

s=matriz com os sinais segmnetados 
n=numero de amostras após a segmentação

![untitled](https://github.com/lucasTeoSan/Janelamento_Sinal_Audio/assets/34036704/4fd8178c-98ab-441b-99fc-71c27ea8dee2)
