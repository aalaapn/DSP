[y,L,fs] = read_data('seven.wav');

r = 20;
rectangle = zeros(L);
rectangle(1:r+1) = 1; 
y_half = ifft(Y.*rectangle,1024);
rectangle(end-r+1:end) = 1;    
y_rect = ifft(Y.*rectangle,1024);

plot(y_rect)