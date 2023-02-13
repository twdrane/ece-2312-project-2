
generate_sin_function(5000);

function generate_sin_function(f);

t = 0:(1/44100):5;
sine = sin(2*pi*f*t);
plot(t,sine);
sound(sine,44100)


end
