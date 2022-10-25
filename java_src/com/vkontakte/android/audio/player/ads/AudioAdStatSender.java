package com.vkontakte.android.audio.player.ads;

import com.vkontakte.android.audio.player.MediaPlayerHelperI;
import com.vkontakte.android.audio.player.PlayerRefer;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.ServerKeys;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public class AudioAdStatSender {
    private volatile boolean startedSent = false;
    private volatile boolean progress25Sent = false;
    private volatile boolean progress50Sent = false;
    private volatile boolean progress75Sent = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendRequested(MediaPlayerHelperI.Refer refer) {
        sendStat("requested", refer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendReceived(MediaPlayerHelperI.Refer refer) {
        sendStat("received", refer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendNotReceived(MediaPlayerHelperI.Refer refer) {
        sendStat("not_received", refer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendRejected(MediaPlayerHelperI.Refer refer) {
        sendStat("rejected", refer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendCompleted(MediaPlayerHelperI.Refer refer) {
        sendStat("completed", refer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendReady(MediaPlayerHelperI.Refer refer) {
        sendStat("ready", refer);
        this.progress75Sent = false;
        this.progress50Sent = false;
        this.progress25Sent = false;
        this.startedSent = false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendProgress(float position, float duration, MediaPlayerHelperI.Refer refer) {
        if (position != 0.0f && position != duration) {
            float percent = duration / 100.0f;
            if (Math.abs(position - (percent * 0.0f)) < 1.0f) {
                sendStarted(refer);
            } else if (Math.abs(position - (25.0f * percent)) < 1.0f) {
                sendProgress25(refer);
            } else if (Math.abs(position - (50.0f * percent)) < 1.0f) {
                sendProgress50(refer);
            } else if (Math.abs(position - (75.0f * percent)) < 1.0f) {
                sendProgress75(refer);
            }
        }
    }

    private void sendStarted(MediaPlayerHelperI.Refer refer) {
        if (!this.startedSent) {
            sendStat("started", refer);
            this.startedSent = true;
        }
    }

    private void sendProgress25(MediaPlayerHelperI.Refer refer) {
        if (!this.progress25Sent) {
            sendStat("progress_25", refer);
            this.progress25Sent = true;
        }
    }

    private void sendProgress50(MediaPlayerHelperI.Refer refer) {
        if (!this.progress50Sent) {
            sendStat("progress_50", refer);
            this.progress50Sent = true;
        }
    }

    private void sendProgress75(MediaPlayerHelperI.Refer refer) {
        if (!this.progress75Sent) {
            sendStat("progress_75", refer);
            this.progress75Sent = true;
        }
    }

    private void sendStat(String eventType, MediaPlayerHelperI.Refer refer) {
        Analytics.EventBuilder addParam = Analytics.track("audio_ad").addParam("event", eventType);
        if (refer == null) {
            refer = PlayerRefer.none;
        }
        addParam.addParam(ServerKeys.SECTION, refer.getExtStr()).commit();
    }
}
