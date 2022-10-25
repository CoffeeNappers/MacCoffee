package com.vk.masks;

import android.os.Handler;
import android.os.Looper;
import android.os.SystemClock;
import android.util.Log;
import com.vk.masks.model.Mask;
import com.vkontakte.android.api.VKAPIRequest;
import java.util.Iterator;
import java.util.LinkedList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksAnalytics {
    private final LinkedList<Event> events = new LinkedList<>();
    private Long maskUsageStart;
    private String pendingMaskId;
    private Integer pendingSectionId;

    public static MasksAnalytics masksAnalytics() {
        return new MasksAnalytics();
    }

    private MasksAnalytics() {
    }

    public void startMaskUsage(int sectionId, String maskId) {
        endMaskUsage();
        this.maskUsageStart = Long.valueOf(SystemClock.elapsedRealtime());
        this.pendingSectionId = Integer.valueOf(sectionId);
        this.pendingMaskId = maskId;
    }

    public void endMaskUsage() {
        if (this.maskUsageStart != null && this.pendingSectionId != null && this.pendingMaskId != null) {
            this.events.add(new MaskUsageEvent(this.pendingSectionId.intValue(), this.pendingMaskId, (int) ((SystemClock.elapsedRealtime() - this.maskUsageStart.longValue()) / 1000)));
        }
        this.maskUsageStart = null;
        this.pendingSectionId = null;
        this.pendingMaskId = null;
    }

    public void trackMaskLoadingSuccess(Mask mask) {
        if (mask != null) {
            this.events.add(new MaskLoadingEvent(mask.getFullId(), "successful"));
        }
    }

    public void trackMaskLoadingFailed(Mask mask) {
        if (mask != null) {
            this.events.add(new MaskLoadingEvent(mask.getFullId(), "failed"));
        }
    }

    public void trackMaskLoadingCanceled(Mask mask) {
        if (mask != null) {
            this.events.add(new MaskLoadingEvent(mask.getFullId(), "canceled"));
        }
    }

    public void clear() {
        this.events.clear();
    }

    public void flush() {
        endMaskUsage();
        new Handler(Looper.getMainLooper()).postDelayed(new Runnable() { // from class: com.vk.masks.MasksAnalytics.1
            @Override // java.lang.Runnable
            public void run() {
                if (MasksAnalytics.this.events.size() != 0) {
                    JSONArray statJson = new JSONArray();
                    Iterator it = MasksAnalytics.this.events.iterator();
                    while (it.hasNext()) {
                        Event e = (Event) it.next();
                        try {
                            JSONObject jo = new JSONObject();
                            e.toJson(jo);
                            statJson.put(jo);
                        } catch (Exception e2) {
                        }
                    }
                    Log.d("tmp", statJson.toString());
                    new VKAPIRequest("stats.trackEvents").param("events", statJson.toString()).exec();
                }
            }
        }, 1000L);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class Event {
        public final String name;

        public Event(String name) {
            this.name = name;
        }

        public void toJson(JSONObject jo) throws JSONException {
            jo.put("e", this.name);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class MaskUsageEvent extends Event {
        private final int duration;
        private final String maskId;
        private final int sectionId;

        public MaskUsageEvent(int sectionId, String maskId, int duration) {
            super("masks_usage");
            this.sectionId = sectionId;
            this.maskId = maskId;
            this.duration = duration;
        }

        @Override // com.vk.masks.MasksAnalytics.Event
        public void toJson(JSONObject jo) throws JSONException {
            super.toJson(jo);
            jo.put("section_id", this.sectionId);
            jo.put("mask_id", this.maskId);
            jo.put("duration", this.duration);
        }
    }

    /* loaded from: classes2.dex */
    private static class MaskLoadingEvent extends Event {
        private final String maskId;
        private final String result;

        public MaskLoadingEvent(String maskId, String result) {
            super("masks_loading");
            this.maskId = maskId;
            this.result = result;
        }

        @Override // com.vk.masks.MasksAnalytics.Event
        public void toJson(JSONObject jo) throws JSONException {
            super.toJson(jo);
            jo.put("mask_id", this.maskId);
            jo.put("result", this.result);
        }
    }
}
