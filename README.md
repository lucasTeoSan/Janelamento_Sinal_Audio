# Janelamento_Sinal_Audio
Aplicação em matlab que faz o janelamento (segmentação) de um sinal de áudio (.wav) com overlap. Com essa função é possível realizar um aumento artificial das amostras de um banco de dados.

O arquivo "janelamento" é a função que segmenta o sinal.
O arquivo "janelamento_sinal" utiliza a fução janelamento para executar esse processamento em lote (batch).

## Exemplo de uso da função:

[s,n]=janelamento(y,fs,width_window_s,overlap_percent,0);


**Entrada:**


**y**= Sinal original.

**fs**= Frequência de amostragem do sinal original.

**width_window_s**= Largura da janela em segundos.

**overlap_percent**= Porcentagem de overlap.

**plotar**= Plotar a segmentação do sinal (Utilizado para debug).


**Saída:**


**s**= Matriz com os sinais segmentados. 

**n**= Número de amostras após a segmentação.


![untitled](https://github.com/lucasTeoSan/Janelamento_Sinal_Audio/assets/34036704/4fd8178c-98ab-441b-99fc-71c27ea8dee2)




