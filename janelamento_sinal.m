clc; clear all; close all;

% %Split audio
[y,fs] = audioread('D:\OneDrive\Lucas_Teodoro\Mestrado\Dissertação\Desenvolvimento\SinaisFalhas\H\MIC1_H_1_0N.wav');

%Tamanho da janela em segundos e a porcentagem de sobreposição
width_window_s=1.5;
overlap_percent=50;

[s,n]=janelamento(y,fs,width_window_s,overlap_percent,1);





