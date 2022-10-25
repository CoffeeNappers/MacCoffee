package com.vk.music.formatter;

import java.util.concurrent.TimeUnit;
/* loaded from: classes2.dex */
public enum Duration {
    MINUTE(TimeUnit.MINUTES.toSeconds(1)),
    HOUR(TimeUnit.HOURS.toSeconds(1)),
    DAY(TimeUnit.DAYS.toSeconds(1)),
    WEEK(DAY.seconds * 7),
    MONTH(DAY.seconds * 30),
    YEAR(DAY.seconds * 365);
    
    private long seconds;

    Duration(long seconds) {
        this.seconds = seconds;
    }

    public long seconds() {
        return this.seconds;
    }

    public boolean isLowerThan(long seconds) {
        return this.seconds < seconds;
    }

    public boolean isGreaterThan(long seconds) {
        return this.seconds > seconds;
    }
}
