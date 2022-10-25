package com.wmspanel.libstream;

import com.vkontakte.android.media.audio.AudioMessageUtils;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class BufferItem {
    private int A;
    private long mFrameId;
    private long mMessageIndex = -1;
    private byte[] w;
    private long x;
    private a y;
    private byte[] z;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface BufferFlag {
    }

    /* loaded from: classes.dex */
    enum a {
        VIDEO,
        AUDIO
    }

    private BufferItem(long frameId, a type, int len) {
        this.mFrameId = frameId;
        this.y = type;
        this.w = new byte[len];
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static BufferItem a(long j, int i) {
        return new BufferItem(j, a.AUDIO, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static BufferItem b(long j, int i) {
        return new BufferItem(j, a.VIDEO, i);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setFlags(int flags) {
        this.A = flags;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getFlags() {
        return this.A;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public a m() {
        return this.y;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTimestamp(long ts) {
        this.x = ts;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long getTimestamp() {
        return this.x;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long n() {
        return this.mFrameId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(long j) {
        this.mMessageIndex = j;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public long o() {
        return this.mMessageIndex;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte[] getData() {
        return this.w;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void c(byte[] bArr) {
        this.z = bArr;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public byte[] p() {
        return this.z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean q() {
        if (a.VIDEO != this.y) {
            throw new IllegalArgumentException("not applicable to audio frame");
        }
        if ((this.A & 1) != 0) {
            return true;
        }
        return ((this.w[0] >> 5) & 3) != 0 && (this.w[0] & AudioMessageUtils.NORMALIZED_MAX_VALUE) == 5;
    }
}
