package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public final class FetcherInfo implements Gsonable {
    private DetailStatus detail_status;
    private long lastModified;
    private Status status;
    private int timeout;
    private long timestamp;
    private String url;

    /* loaded from: classes.dex */
    public enum DetailStatus {
        CALL_TEMPLATE_SENT,
        ERROR,
        UNKNOWN
    }

    /* loaded from: classes.dex */
    public enum Status {
        ENABLED,
        DISABLED,
        UNKNOWN
    }

    public final long getLastModified() {
        return this.lastModified;
    }

    public final Status getStatus() {
        if (this.status == null) {
            this.status = Status.UNKNOWN;
        }
        return this.status;
    }

    public final int getTimeout() {
        return this.timeout;
    }

    public final long getTimestamp() {
        return this.timestamp;
    }

    public final String getUrl() {
        return this.url;
    }

    public final void setLastModified(@Nullable Long l) {
        if (l == null) {
            return;
        }
        this.lastModified = l.longValue();
    }

    public final void setTimestamp(long j) {
        this.timestamp = j;
    }

    public final String toString() {
        return "FetcherInfo{timeout=" + this.timeout + ", url='" + this.url + "', timestamp=" + this.timestamp + ", lastModified=" + this.lastModified + ", status=" + this.status + ", detail_status=" + this.detail_status + '}';
    }
}
