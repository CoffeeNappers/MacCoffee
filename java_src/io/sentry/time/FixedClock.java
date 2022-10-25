package io.sentry.time;

import java.util.Date;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public class FixedClock implements Clock {
    private Date date;

    public FixedClock(Date date) {
        this.date = date;
    }

    @Override // io.sentry.time.Clock
    public long millis() {
        return this.date.getTime();
    }

    @Override // io.sentry.time.Clock
    public Date date() {
        return this.date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public void tick(long duration, TimeUnit unit) {
        this.date = new Date(this.date.getTime() + unit.toMillis(duration));
    }
}
