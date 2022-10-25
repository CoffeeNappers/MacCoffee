package com.google.android.gms.location;

import android.os.SystemClock;
import com.google.android.gms.location.internal.ParcelableGeofence;
/* loaded from: classes2.dex */
public interface Geofence {
    public static final int GEOFENCE_TRANSITION_DWELL = 4;
    public static final int GEOFENCE_TRANSITION_ENTER = 1;
    public static final int GEOFENCE_TRANSITION_EXIT = 2;
    public static final long NEVER_EXPIRE = -1;

    /* loaded from: classes2.dex */
    public static final class Builder {
        private double ajT;
        private double ajU;
        private float ajV;
        private String zzcec = null;
        private int ajQ = 0;
        private long ajR = Long.MIN_VALUE;
        private short ajS = -1;
        private int ajW = 0;
        private int ajX = -1;

        public Geofence build() {
            if (this.zzcec == null) {
                throw new IllegalArgumentException("Request ID not set.");
            }
            if (this.ajQ == 0) {
                throw new IllegalArgumentException("Transitions types not set.");
            }
            if ((this.ajQ & 4) != 0 && this.ajX < 0) {
                throw new IllegalArgumentException("Non-negative loitering delay needs to be set when transition types include GEOFENCE_TRANSITION_DWELLING.");
            }
            if (this.ajR == Long.MIN_VALUE) {
                throw new IllegalArgumentException("Expiration not set.");
            }
            if (this.ajS == -1) {
                throw new IllegalArgumentException("Geofence region not set.");
            }
            if (this.ajW >= 0) {
                return new ParcelableGeofence(this.zzcec, this.ajQ, (short) 1, this.ajT, this.ajU, this.ajV, this.ajR, this.ajW, this.ajX);
            }
            throw new IllegalArgumentException("Notification responsiveness should be nonnegative.");
        }

        public Builder setCircularRegion(double d, double d2, float f) {
            this.ajS = (short) 1;
            this.ajT = d;
            this.ajU = d2;
            this.ajV = f;
            return this;
        }

        public Builder setExpirationDuration(long j) {
            if (j < 0) {
                this.ajR = -1L;
            } else {
                this.ajR = SystemClock.elapsedRealtime() + j;
            }
            return this;
        }

        public Builder setLoiteringDelay(int i) {
            this.ajX = i;
            return this;
        }

        public Builder setNotificationResponsiveness(int i) {
            this.ajW = i;
            return this;
        }

        public Builder setRequestId(String str) {
            this.zzcec = str;
            return this;
        }

        public Builder setTransitionTypes(int i) {
            this.ajQ = i;
            return this;
        }
    }

    String getRequestId();
}
