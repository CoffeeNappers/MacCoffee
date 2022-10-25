package com.facebook.appevents;

import android.os.Bundle;
import com.facebook.LoggingBehavior;
import com.facebook.internal.Logger;
import com.vkontakte.android.TimeUtils;
import java.io.Serializable;
import java.util.Locale;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class FacebookTimeSpentData implements Serializable {
    private static final long FIRST_TIME_LOAD_RESUME_TIME = -1;
    private static final long INTERRUPTION_THRESHOLD_MILLISECONDS = 1000;
    private static final long NUM_MILLISECONDS_IDLE_TO_BE_NEW_SESSION = 60000;
    private static final long serialVersionUID = 1;
    private String firstOpenSourceApplication;
    private int interruptionCount;
    private boolean isAppActive;
    private boolean isWarmLaunch;
    private long lastActivateEventLoggedTime;
    private long lastResumeTime;
    private long lastSuspendTime;
    private long millisecondsSpentInSession;
    private static final String TAG = AppEventsLogger.class.getCanonicalName();
    private static final long APP_ACTIVATE_SUPPRESSION_PERIOD_IN_MILLISECONDS = 300000;
    private static final long[] INACTIVE_SECONDS_QUANTA = {APP_ACTIVATE_SUPPRESSION_PERIOD_IN_MILLISECONDS, 900000, 1800000, TimeUtils.HOUR, 21600000, 43200000, TimeUtils.DAY, 172800000, 259200000, TimeUtils.WEEK, 1209600000, 1814400000, 2419200000L, 5184000000L, 7776000000L, 10368000000L, 12960000000L, 15552000000L, TimeUtils.YEAR};

    /* loaded from: classes.dex */
    private static class SerializationProxyV1 implements Serializable {
        private static final long serialVersionUID = 6;
        private final int interruptionCount;
        private final long lastResumeTime;
        private final long lastSuspendTime;
        private final long millisecondsSpentInSession;

        SerializationProxyV1(long lastResumeTime, long lastSuspendTime, long millisecondsSpentInSession, int interruptionCount) {
            this.lastResumeTime = lastResumeTime;
            this.lastSuspendTime = lastSuspendTime;
            this.millisecondsSpentInSession = millisecondsSpentInSession;
            this.interruptionCount = interruptionCount;
        }

        private Object readResolve() {
            return new FacebookTimeSpentData(this.lastResumeTime, this.lastSuspendTime, this.millisecondsSpentInSession, this.interruptionCount);
        }
    }

    private FacebookTimeSpentData(long lastResumeTime, long lastSuspendTime, long millisecondsSpentInSession, int interruptionCount) {
        resetSession();
        this.lastResumeTime = lastResumeTime;
        this.lastSuspendTime = lastSuspendTime;
        this.millisecondsSpentInSession = millisecondsSpentInSession;
        this.interruptionCount = interruptionCount;
    }

    /* loaded from: classes.dex */
    private static class SerializationProxyV2 implements Serializable {
        private static final long serialVersionUID = 6;
        private final String firstOpenSourceApplication;
        private final int interruptionCount;
        private final long lastResumeTime;
        private final long lastSuspendTime;
        private final long millisecondsSpentInSession;

        SerializationProxyV2(long lastResumeTime, long lastSuspendTime, long millisecondsSpentInSession, int interruptionCount, String firstOpenSourceApplication) {
            this.lastResumeTime = lastResumeTime;
            this.lastSuspendTime = lastSuspendTime;
            this.millisecondsSpentInSession = millisecondsSpentInSession;
            this.interruptionCount = interruptionCount;
            this.firstOpenSourceApplication = firstOpenSourceApplication;
        }

        private Object readResolve() {
            return new FacebookTimeSpentData(this.lastResumeTime, this.lastSuspendTime, this.millisecondsSpentInSession, this.interruptionCount, this.firstOpenSourceApplication);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public FacebookTimeSpentData() {
        resetSession();
    }

    private FacebookTimeSpentData(long lastResumeTime, long lastSuspendTime, long millisecondsSpentInSession, int interruptionCount, String firstOpenSourceApplication) {
        resetSession();
        this.lastResumeTime = lastResumeTime;
        this.lastSuspendTime = lastSuspendTime;
        this.millisecondsSpentInSession = millisecondsSpentInSession;
        this.interruptionCount = interruptionCount;
        this.firstOpenSourceApplication = firstOpenSourceApplication;
    }

    private Object writeReplace() {
        return new SerializationProxyV2(this.lastResumeTime, this.lastSuspendTime, this.millisecondsSpentInSession, this.interruptionCount, this.firstOpenSourceApplication);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onSuspend(AppEventsLogger logger, long eventTime) {
        if (!this.isAppActive) {
            Logger.log(LoggingBehavior.APP_EVENTS, TAG, "Suspend for inactive app");
            return;
        }
        long delta = eventTime - this.lastResumeTime;
        if (delta < 0) {
            Logger.log(LoggingBehavior.APP_EVENTS, TAG, "Clock skew detected");
            delta = 0;
        }
        this.millisecondsSpentInSession += delta;
        this.lastSuspendTime = eventTime;
        this.isAppActive = false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void onResume(AppEventsLogger logger, long eventTime, String sourceApplicationInfo) {
        long interruptionDurationMillis;
        if (isColdLaunch() || eventTime - this.lastActivateEventLoggedTime > APP_ACTIVATE_SUPPRESSION_PERIOD_IN_MILLISECONDS) {
            Bundle eventParams = new Bundle();
            eventParams.putString(AppEventsConstants.EVENT_PARAM_SOURCE_APPLICATION, sourceApplicationInfo);
            logger.logEvent(AppEventsConstants.EVENT_NAME_ACTIVATED_APP, eventParams);
            this.lastActivateEventLoggedTime = eventTime;
        }
        if (this.isAppActive) {
            Logger.log(LoggingBehavior.APP_EVENTS, TAG, "Resume for active app");
            return;
        }
        if (wasSuspendedEver()) {
            interruptionDurationMillis = eventTime - this.lastSuspendTime;
        } else {
            interruptionDurationMillis = 0;
        }
        if (interruptionDurationMillis < 0) {
            Logger.log(LoggingBehavior.APP_EVENTS, TAG, "Clock skew detected");
            interruptionDurationMillis = 0;
        }
        if (interruptionDurationMillis > 60000) {
            logAppDeactivatedEvent(logger, interruptionDurationMillis);
        } else if (interruptionDurationMillis > 1000) {
            this.interruptionCount++;
        }
        if (this.interruptionCount == 0) {
            this.firstOpenSourceApplication = sourceApplicationInfo;
        }
        this.lastResumeTime = eventTime;
        this.isAppActive = true;
    }

    private void logAppDeactivatedEvent(AppEventsLogger logger, long interruptionDurationMillis) {
        Bundle eventParams = new Bundle();
        eventParams.putInt(AppEventsConstants.EVENT_NAME_SESSION_INTERRUPTIONS, this.interruptionCount);
        eventParams.putString(AppEventsConstants.EVENT_NAME_TIME_BETWEEN_SESSIONS, String.format(Locale.ROOT, "session_quanta_%d", Integer.valueOf(getQuantaIndex(interruptionDurationMillis))));
        eventParams.putString(AppEventsConstants.EVENT_PARAM_SOURCE_APPLICATION, this.firstOpenSourceApplication);
        logger.logEvent(AppEventsConstants.EVENT_NAME_DEACTIVATED_APP, this.millisecondsSpentInSession / 1000, eventParams);
        resetSession();
    }

    private static int getQuantaIndex(long timeBetweenSessions) {
        int quantaIndex = 0;
        while (quantaIndex < INACTIVE_SECONDS_QUANTA.length && INACTIVE_SECONDS_QUANTA[quantaIndex] < timeBetweenSessions) {
            quantaIndex++;
        }
        return quantaIndex;
    }

    private void resetSession() {
        this.isAppActive = false;
        this.lastResumeTime = -1L;
        this.lastSuspendTime = -1L;
        this.interruptionCount = 0;
        this.millisecondsSpentInSession = 0L;
    }

    private boolean wasSuspendedEver() {
        return this.lastSuspendTime != -1;
    }

    private boolean isColdLaunch() {
        boolean result = !this.isWarmLaunch;
        this.isWarmLaunch = true;
        return result;
    }
}
