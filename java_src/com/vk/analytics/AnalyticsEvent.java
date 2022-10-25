package com.vk.analytics;

import android.os.Bundle;
import android.text.TextUtils;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class AnalyticsEvent {
    public static final int EVENTS_TOTAL_MAX_ERRORS = 4;
    protected String mName;
    protected Bundle mParams = new Bundle();
    protected HashMap<String, String> mTags = new HashMap<>();

    public boolean isReady() {
        return true;
    }

    public Bundle params() {
        return this.mParams;
    }

    public String getName() {
        return this.mName;
    }

    public String getEventName() {
        return getName();
    }

    /* loaded from: classes2.dex */
    public static class ErrorEvent extends AnalyticsEvent {
        protected static final int EVENTS_MAX_ERRORS = 2;
        protected static int sErrorEventCounter = 0;

        public ErrorEvent(String name) {
            this.mName = name;
            sErrorEventCounter++;
        }

        @Override // com.vk.analytics.AnalyticsEvent
        public boolean isReady() {
            return sErrorEventCounter <= 2;
        }
    }

    /* loaded from: classes2.dex */
    public static class MediaDecoderErrorEvent extends ErrorEvent {
        public MediaDecoderErrorEvent(boolean isVideo, String msg) {
            super(isVideo ? AnalyticsConst.EVENT_MEDIA_DECODER_VIDEO : AnalyticsConst.EVENT_MEDIA_DECODER_AUDIO);
            if (!TextUtils.isEmpty(msg)) {
                params().putString(AnalyticsConst.KEY_DECODER, msg);
            }
            params().putString(AnalyticsConst.KEY_FAILURE_COUNTER, Integer.toString(sErrorEventCounter));
        }
    }

    /* loaded from: classes2.dex */
    public static class MediaPlayerErrorEvent extends ErrorEvent {
        public MediaPlayerErrorEvent(String msg) {
            super(AnalyticsConst.EVENT_MEDIA_PLAYER_ERROR);
            if (!TextUtils.isEmpty(msg)) {
                params().putString(AnalyticsConst.KEY_DECODER, msg);
            }
            params().putString(AnalyticsConst.KEY_FAILURE_COUNTER, Integer.toString(sErrorEventCounter));
        }
    }

    /* loaded from: classes2.dex */
    public static class MediaVideoStreamEvent extends ErrorEvent {
        public MediaVideoStreamEvent(int ownerId, int videoId) {
            super(AnalyticsConst.EVENT_MEDIA_VIDEO_ERROR);
            params().putString(AnalyticsConst.KEY_VIDEO_OID, String.valueOf(ownerId));
            params().putString(AnalyticsConst.KEY_VIDEO_VID, String.valueOf(videoId));
        }
    }

    /* loaded from: classes2.dex */
    public static class MediaPlayerSuccessEvent extends AnalyticsEvent {
        protected static final int EVENTS_COLLECT = 16;
        private static int sSuccessEventCounter = 0;

        public MediaPlayerSuccessEvent() {
            this.mName = AnalyticsConst.EVENT_MEDIA_PLAYER_SUCCESS;
            sSuccessEventCounter++;
        }

        @Override // com.vk.analytics.AnalyticsEvent
        public boolean isReady() {
            return sSuccessEventCounter == 16;
        }
    }

    /* loaded from: classes2.dex */
    public static class MediaCameraEvent extends AnalyticsEvent {
        public static final int BAD_FPS = 14;
        private static final String BAD_SUFFIX = "_BAD";
        private static final int EVENTS_COLLECT = 4;
        public static final int GOOD_FPS = 20;
        private static final String UGLY_SUFFIX = "_UGLY";
        private static int sSuccessEventCounter = 0;
        private String mEventName;

        public MediaCameraEvent() {
            this.mName = AnalyticsConst.EVENT_CAMERA_SUCCESS;
            sSuccessEventCounter++;
        }

        public void fill(int fps, ArrayList<String> stat) {
            if (!stat.isEmpty()) {
                StringBuilder sb = new StringBuilder();
                Iterator<String> it = stat.iterator();
                while (it.hasNext()) {
                    String event = it.next();
                    sb.append(event);
                }
                params().putString(AnalyticsConst.KEY_CAMERA_FPS, sb.toString());
                if (fps >= 14 && fps < 20) {
                    this.mEventName = this.mName + BAD_SUFFIX;
                } else if (fps < 14) {
                    this.mEventName = this.mName + UGLY_SUFFIX;
                }
                this.mTags.put(AnalyticsConst.KEY_CAMERA_FPS, String.valueOf(fps));
            }
        }

        @Override // com.vk.analytics.AnalyticsEvent
        public String getEventName() {
            return !TextUtils.isEmpty(this.mEventName) ? this.mEventName : this.mName;
        }

        @Override // com.vk.analytics.AnalyticsEvent
        public boolean isReady() {
            return sSuccessEventCounter == 4;
        }
    }

    /* loaded from: classes2.dex */
    public static class MediaRecorderEvent extends ErrorEvent {
        /* JADX WARN: Illegal instructions before constructor call */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        public MediaRecorderEvent(boolean r2, boolean r3) {
            /*
                r1 = this;
                if (r2 != 0) goto L9
                java.lang.String r0 = "ERROR_RECORDER"
            L5:
                r1.<init>(r0)
                return
            L9:
                if (r3 == 0) goto Lf
                java.lang.String r0 = "ERROR_ENCODER_VIDEO"
                goto L5
            Lf:
                java.lang.String r0 = "ERROR_ENCODER_AUDIO"
                goto L5
            */
            throw new UnsupportedOperationException("Method not decompiled: com.vk.analytics.AnalyticsEvent.MediaRecorderEvent.<init>(boolean, boolean):void");
        }
    }
}
