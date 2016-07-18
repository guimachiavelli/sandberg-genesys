class Drone {
    int size = 2;
    float x;
    float y;

    Drone() {
        x = width/2 - size - width/4;
        y = height/2 - size;
    }

    void draw() {
        fill(random(200), 15, 0);
        noStroke();
        rect(x, y, size, size);
    }

    void move() {
        x += 2;
    }
}
