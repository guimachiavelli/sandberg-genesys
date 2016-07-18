class BlackHole {

    ArrayList<Horizon> horizons = new ArrayList<Horizon>();

    BlackHole(int circleAmount) {
        for (int i = circleAmount; i > 0; i -= 1) {
            horizons.add(new Horizon(
                            width/2, height/2,
                            random(13 * i) + 10,
                            width/(i + 2),
                            i * 10 + random(i * i)
                        ));
        }
    }

    void draw() {
        for (Horizon horizon : horizons) {
            horizon.draw();
        }
    }

    void reverse() {
        for (Horizon horizon : horizons) {
            horizon.reverse();
        }
    }

}
