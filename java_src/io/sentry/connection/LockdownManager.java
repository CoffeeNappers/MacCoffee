package io.sentry.connection;

import io.sentry.time.Clock;
import io.sentry.time.SystemClock;
import java.util.Date;
import java.util.concurrent.TimeUnit;
/* loaded from: classes3.dex */
public class LockdownManager {
    private long baseLockdownTime;
    private final Clock clock;
    private Date lockdownStartTime;
    private long lockdownTime;
    private long maxLockdownTime;
    public static final long DEFAULT_MAX_LOCKDOWN_TIME = TimeUnit.MINUTES.toMillis(5);
    public static final long DEFAULT_BASE_LOCKDOWN_TIME = TimeUnit.SECONDS.toMillis(1);

    public LockdownManager() {
        this(new SystemClock());
    }

    public LockdownManager(Clock clock) {
        this.maxLockdownTime = DEFAULT_MAX_LOCKDOWN_TIME;
        this.baseLockdownTime = DEFAULT_BASE_LOCKDOWN_TIME;
        this.lockdownTime = 0L;
        this.lockdownStartTime = null;
        this.clock = clock;
    }

    public synchronized boolean isLockedDown() {
        boolean z;
        if (this.lockdownStartTime != null) {
            if (this.clock.millis() - this.lockdownStartTime.getTime() < this.lockdownTime) {
                z = true;
            }
        }
        z = false;
        return z;
    }

    public synchronized void resetState() {
        this.lockdownTime = 0L;
        this.lockdownStartTime = null;
    }

    public synchronized void setState(ConnectionException connectionException) {
        if (!isLockedDown()) {
            if (connectionException != null && connectionException.getRecommendedLockdownTime() != null) {
                this.lockdownTime = connectionException.getRecommendedLockdownTime().longValue();
            } else if (this.lockdownTime != 0) {
                this.lockdownTime *= 2;
            } else {
                this.lockdownTime = this.baseLockdownTime;
            }
            this.lockdownTime = Math.min(this.maxLockdownTime, this.lockdownTime);
            this.lockdownStartTime = this.clock.date();
        }
    }

    public synchronized void setBaseLockdownTime(long baseLockdownTime) {
        this.baseLockdownTime = baseLockdownTime;
    }

    public synchronized void setMaxLockdownTime(long maxLockdownTime) {
        this.maxLockdownTime = maxLockdownTime;
    }
}
