import processing.sound.*;

Input input;
SinOsc out;
SinOsc out1;
SinOsc out2;
SinOsc out3;
int freq = 40;
float multiplier = 0.005;
float amp = 0.25;
SoundFile messiaen;
int timer;
boolean isPlaying = false;
SawOsc warning;
Reverb reverb;
WhiteNoise noise;
float dronePosition = 0;

BlackHole hole;
Drone drone;

void setup() {
    fullScreen(P2D);
    frameRate(10);
    pixelDensity(displayDensity());
    input = new Input(this);

    noise = new WhiteNoise(this);
    noise.amp(0);
    noise.play();

    reverb = new Reverb(this);

    warning = new SawOsc(this);
    reverb.process(warning);
    warning.amp(0);
    warning.play();
    warning.freq(4200);

    out = new SinOsc(this);
    out.amp(0.25);
    out.play();
    out.freq(freq);

    out1 = new SinOsc(this);
    out1.amp(0.25);
    out1.play();
    out1.freq(freq);

    out2 = new SinOsc(this);
    out2.amp(0.25);
    out2.play();
    out2.freq(freq);

    out3 = new SinOsc(this);
    out3.amp(0.25);
    out3.play();
    out3.freq(freq);

    messiaen = new SoundFile(this, "m.mp3");
    background(0);

    hole = new BlackHole(6);
    drone = new Drone();
}

void draw() {
    hole.draw();
    drone.draw();

    warning.amp(0);
    noise.amp(0);

    if (timer > 0) {
        drone.move();
    }

    if ((timer > 0) && (millis() - timer > messiaen.duration() * 1000)) {
        exit();
    }

    if (amp > 0.9 && isPlaying == false) {
        messiaen.play();
        timer = millis();
        isPlaying = true;
        out.amp(0);
        out1.amp(0);
        out2.amp(0);
        out3.amp(0);
        hole.reverse();
    }

    if (amp > 0.9) {
        return;
    }

    out.freq(random(40) + 10);
    out1.freq(random(50) + 20);
    out2.freq(random(30) + 5);
    out3.freq(random(30) + 20);

    amp += multiplier;

    out.amp(amp);
    out1.amp(amp);
    out2.amp(amp);
    out3.amp(amp);

    int value = int(input.value() * 10000);

    if (value > 1) {
        warning.amp(0.25);
        noise.amp(0.25);
        warning.freq(random(3000) + 1000);
        amp = 0.25;
    }
}
