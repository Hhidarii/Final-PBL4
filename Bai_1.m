% ==== Trường hợp 1: fa = 100Hz ====
fa  = 100;  wa = 2 * pi * fa;
fc  = 1600; wc = 2 * pi * fc;
fs  = 16 * 2048;
tiv = 1 / fs;
t   = 0 : tiv : (0.03 - tiv);
a   = square(wa * t);
MD  = 0.5; A = 2 + (MD * a);
y   = A .* sin(wc * t);

% Phổ của a(t)
subplot(6, 1, 1);
ffa = fft(a, fs);
sa = fftshift(real(ffa)); 
sa = sa / max(sa);
f = (-fs/2 : fs/2 - 1);  % Trục tần số
plot(f, sa);
axis([-1500 1500 -1 1]);
xlabel('Hz'); title('A(w) – fa = 100Hz');

% Tín hiệu y(t)
subplot(6, 1, 2);
plot(t, y, 'k');
axis([0 0.03 -1.5 1.5]);
xlabel('seconds'); title('y(t) – fa = 100Hz');

% Phổ của y(t)
subplot(6, 1, 3);
ffy = fft(y, fs);
sy = fftshift(real(ffy)); 
sy = sy / max(sy);
plot(f, sy);
axis([-3000 3000 -1 1]);
xlabel('Hz'); title('Y(w) – fa = 100Hz');

% ==== Trường hợp 2: fa = 160Hz ====
fa2 = 160; wa2 = 2 * pi * fa2;
a2 = square(wa2 * t);
A2 = 2 + (MD * a2);
y2 = A2 .* sin(wc * t);

% Phổ của a2(t)
subplot(6, 1, 4);
ffa2 = fft(a2, fs);
sa2 = fftshift(real(ffa2)); 
sa2 = sa2 / max(sa2);
plot(f, sa2);
axis([-1500 1500 -1 1]);
xlabel('Hz'); title('A(w) – fa = 160Hz');

% Tín hiệu y2(t)
subplot(6, 1, 5);
plot(t, y2, 'k');
axis([0 0.03 -1.5 1.5]);
xlabel('seconds'); title('y(t) – fa = 160Hz');

% Phổ của y2(t)
subplot(6, 1, 6);
ffy2 = fft(y2, fs);
sy2 = fftshift(real(ffy2)); 
sy2 = sy2 / max(sy2);
plot(f, sy2);
axis([-3000 3000 -1 1]);
xlabel('Hz'); title('Y(w) – fa = 160Hz');
