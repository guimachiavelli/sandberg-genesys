class Horizon {
    float brightness;
    float diameter;
    float thickness;
    float x;
    float y;
    boolean reversed = false;

    Horizon(float the_x, float the_y, float the_brightness,
            float the_diameter, float the_thickness) {
        x = the_x;
        y = the_y;
        brightness = the_brightness;
        diameter =  the_diameter;
        thickness = the_thickness;
    }

    void draw() {
        noFill();
        strokeWeight(thickness);
        if (reversed == true) {
            stroke(random(brightness), 0, 10);
        } else {
            stroke(0, 10, random(brightness));
        }
        ellipse(x, y, diameter, diameter);
    }

    void reverse() {
        reversed = true;
    }
}
