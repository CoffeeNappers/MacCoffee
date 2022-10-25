package com.wmspanel.libstream;

import com.wmspanel.libstream.BufferItem;
import java.util.Arrays;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class StreamBuffer {
    private static final String TAG = "StreamBuffer";
    private volatile VideoFormatParams bh;
    private volatile AudioFormatParams bi;

    /* renamed from: do  reason: not valid java name */
    private BufferItem[] f2do;
    private int dp;
    private int dq;
    private long bw = 0;
    private final int dr = 10;
    private int ds = 10;
    private long dt = 0;
    private long du = -1;
    private volatile double dv = -1.0d;

    public StreamBuffer(int max_rtmp_buffer_items, int rtmp_buffer_initial_offset) {
        this.dp = rtmp_buffer_initial_offset;
        this.dq = Math.max(max_rtmp_buffer_items, this.dp);
        this.f2do = new BufferItem[this.dq];
    }

    public synchronized void i(BufferItem bufferItem) {
        if (bufferItem != null) {
            if (bufferItem.m() == BufferItem.a.VIDEO) {
                e(bufferItem.getTimestamp() / 1000);
            }
            bufferItem.a(this.bw);
            this.f2do[(int) (this.bw % this.dq)] = bufferItem;
            this.bw++;
        }
    }

    public synchronized BufferItem d(long j) {
        BufferItem bufferItem;
        if (j >= this.bw) {
            bufferItem = null;
        } else {
            if (this.bw - j > this.dp) {
                if (this.bw < this.dp) {
                    j = 0;
                } else {
                    j = this.bw - this.dp;
                }
            }
            bufferItem = this.f2do[(int) (j % this.dq)];
        }
        return bufferItem;
    }

    /* loaded from: classes3.dex */
    public static class AudioFormatParams {
        public byte[] configBuf;
        public int configLen = 0;
        int sampleRate = -1;
        int channelCount = -1;

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (other == null || getClass() != other.getClass()) {
                return false;
            }
            AudioFormatParams audioFormatParams = (AudioFormatParams) other;
            return this.configLen == audioFormatParams.configLen && this.sampleRate == audioFormatParams.sampleRate && this.channelCount == audioFormatParams.channelCount;
        }
    }

    /* loaded from: classes3.dex */
    public static class VideoFormatParams {
        public byte[] pps_buf;
        public byte[] sps_buf;
        public int sps_len = 0;
        public int pps_len = 0;

        public boolean equals(Object other) {
            if (this == other) {
                return true;
            }
            if (other == null || getClass() != other.getClass()) {
                return false;
            }
            VideoFormatParams videoFormatParams = (VideoFormatParams) other;
            return this.sps_len == videoFormatParams.sps_len && Arrays.equals(this.sps_buf, videoFormatParams.sps_buf) && this.pps_len == videoFormatParams.pps_len && Arrays.equals(this.pps_buf, videoFormatParams.pps_buf);
        }
    }

    public void a(VideoFormatParams videoFormatParams) {
        this.bh = videoFormatParams;
    }

    public VideoFormatParams ac() {
        return this.bh;
    }

    public void a(AudioFormatParams audioFormatParams) {
        this.bi = audioFormatParams;
    }

    public AudioFormatParams ad() {
        return this.bi;
    }

    public double getFps() {
        return this.dv;
    }

    protected void e(long j) {
        if (this.du != -1 && j > this.du) {
            if (this.ds > 0) {
                this.ds--;
            } else {
                this.dt -= this.dt / 10;
            }
            this.dt += j - this.du;
            if (this.ds == 0) {
                this.dv = 10000.0d / this.dt;
            }
        }
        this.du = j;
    }
}
