package io.sentry.connection;

import io.sentry.event.Event;
import java.util.Random;
/* loaded from: classes3.dex */
public class RandomEventSampler implements EventSampler {
    private Random random;
    private double sampleRate;

    public RandomEventSampler(double sampleRate) {
        this(sampleRate, new Random());
    }

    public RandomEventSampler(double sampleRate, Random random) {
        this.sampleRate = sampleRate;
        this.random = random;
    }

    @Override // io.sentry.connection.EventSampler
    public boolean shouldSendEvent(Event event) {
        double randomDouble = this.random.nextDouble();
        return this.sampleRate >= Math.abs(randomDouble);
    }
}
