package io.sentry.time;

import java.util.Date;
/* loaded from: classes3.dex */
public class SystemClock implements Clock {
    @Override // io.sentry.time.Clock
    public long millis() {
        return System.currentTimeMillis();
    }

    @Override // io.sentry.time.Clock
    public Date date() {
        return new Date();
    }
}
