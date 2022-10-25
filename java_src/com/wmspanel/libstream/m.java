package com.wmspanel.libstream;

import android.util.Base64;
import android.util.Log;
import com.google.android.exoplayer2.C;
import com.google.android.gms.safetynet.SafetyNetStatusCodes;
import com.vk.media.camera.CameraUtilsEffects;
import com.vkontakte.android.media.audio.AudioMessageUtils;
import com.wmspanel.libstream.StreamBuffer;
import com.wmspanel.libstream.Streamer;
import io.fabric.sdk.android.services.network.HttpRequest;
import io.fabric.sdk.android.services.settings.SettingsJsonConstants;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.util.Random;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class m extends com.wmspanel.libstream.a {
    private static final String TAG = "RtspConnection";
    StreamBuffer.VideoFormatParams bh;
    StreamBuffer.AudioFormatParams bi;
    private int bs;
    private long bw;
    private long cA;
    private long cB;
    private int cC;
    private long cD;
    private long cE;
    private int cF;
    private final int cG;
    private int cH;
    private String cI;
    private String cJ;
    private String cK;
    int cL;
    private a cp;
    private Streamer.STATUS cq;
    private n cr;
    private String cs;
    private String ct;
    private String cu;
    private byte[] cv;
    final long cw;
    final int cx;
    private BufferItem cy;
    private int cz;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public enum a {
        INITIAL,
        OPTIONS,
        OPTIONS_AUTH,
        ANNOUNCE_WAIT,
        ANNOUNCE,
        ANNOUNCE_AUTH,
        SETUP_VIDEO,
        SETUP_AUDIO,
        RECORD,
        SEND_NEW_ITEM,
        SEND_VIDEO_PART,
        CLOSED
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public m(d dVar, int i, Streamer.MODE mode, String str, String str2, int i2, String str3, String str4) throws IOException {
        super(dVar, i, mode, str2, i2);
        this.cv = new byte[32];
        this.bw = 0L;
        this.cw = 4294967296L;
        this.cx = 90000;
        this.bs = -1;
        this.cz = new Random().nextInt();
        this.cA = -1L;
        this.cB = -1L;
        this.cC = new Random().nextInt();
        this.cD = -1L;
        this.cE = -1L;
        this.cF = 0;
        this.cG = 20000;
        this.cH = 0;
        this.cL = 1;
        this.cs = str;
        this.ct = str3;
        this.cu = str4;
        this.cp = a.INITIAL;
        this.cq = Streamer.STATUS.CONN_FAIL;
        this.cr = new n();
    }

    @Override // com.wmspanel.libstream.a
    void c() {
        this.cq = Streamer.STATUS.UNKNOWN_FAIL;
        a(Streamer.CONNECTION_STATE.CONNECTED, Streamer.STATUS.SUCCESS);
        V();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.wmspanel.libstream.a
    public synchronized void close() {
        if (this.cp != a.CLOSED) {
            this.cp = a.CLOSED;
            super.close();
            a(Streamer.CONNECTION_STATE.DISCONNECTED, this.cq);
        }
    }

    @Override // com.wmspanel.libstream.a
    int a(ByteBuffer byteBuffer) {
        int b = this.cr.b(byteBuffer.array(), byteBuffer.position());
        if (b < 0) {
            Log.e(TAG, "failed to parse rtsp");
            close();
            return byteBuffer.position();
        } else if (this.cr.aa().booleanValue()) {
            T();
            return b;
        } else {
            return b;
        }
    }

    void Q() {
        if (this.b == Streamer.MODE.VIDEO_ONLY || this.b == Streamer.MODE.AUDIO_VIDEO) {
            this.bh = this.c.x().ac();
            if (this.bh == null) {
                this.cp = a.ANNOUNCE_WAIT;
                return;
            }
        }
        if (this.b == Streamer.MODE.AUDIO_ONLY || this.b == Streamer.MODE.AUDIO_VIDEO) {
            this.bi = this.c.x().ad();
            if (this.bi == null) {
                this.cp = a.ANNOUNCE_WAIT;
                return;
            }
        }
        W();
        this.cp = a.ANNOUNCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.a
    public void d() {
        switch (this.cp) {
            case ANNOUNCE_WAIT:
                Q();
                return;
            case SEND_NEW_ITEM:
                R();
                return;
            case SEND_VIDEO_PART:
                break;
            default:
                return;
        }
        while (this.bs < this.cy.getData().length) {
            int a2 = a(this.cy, this.bs);
            if (a2 <= 0) {
                Log.e(TAG, "failed to send video part");
                return;
            }
            this.bs = a2 + this.bs;
            if (b() > 0) {
                this.cp = a.SEND_VIDEO_PART;
                return;
            }
        }
        this.cp = a.SEND_NEW_ITEM;
        R();
    }

    void R() {
        while (b() <= 0) {
            this.cy = this.c.x().d(this.bw);
            if (this.cy != null) {
                this.bw = this.cy.o() + 1;
                switch (this.cy.m()) {
                    case VIDEO:
                        if (this.b != Streamer.MODE.AUDIO_VIDEO && this.b != Streamer.MODE.VIDEO_ONLY) {
                            break;
                        } else if (this.cy.q() || (this.o != 0 && this.cy.n() - this.r <= 1)) {
                            b(this.cy);
                            byte[] data = this.cy.getData();
                            if (((data[0] >> 7) & 1) != 0) {
                                Log.e(TAG, "skip frame if fzb is set");
                                break;
                            } else if (!e(this.cy)) {
                                Log.e(TAG, "failed to send video report");
                                return;
                            } else if (data.length + 16 < 20000) {
                                if (!g(this.cy)) {
                                    Log.e(TAG, "failed to send video frame");
                                    return;
                                } else {
                                    this.cp = a.SEND_NEW_ITEM;
                                    break;
                                }
                            } else {
                                this.bs = 1;
                                while (this.bs < this.cy.getData().length) {
                                    int a2 = a(this.cy, this.bs);
                                    if (a2 <= 0) {
                                        Log.e(TAG, "failed to send video part");
                                        return;
                                    }
                                    this.bs = a2 + this.bs;
                                    if (b() > 0) {
                                        this.cp = a.SEND_VIDEO_PART;
                                        return;
                                    }
                                }
                                this.cp = a.SEND_NEW_ITEM;
                                break;
                            }
                        }
                        break;
                    case AUDIO:
                        if (this.b != Streamer.MODE.AUDIO_VIDEO && this.b != Streamer.MODE.AUDIO_ONLY) {
                            break;
                        } else if (!f(this.cy)) {
                            Log.e(TAG, "failed to send audio report");
                            return;
                        } else if (!h(this.cy)) {
                            Log.e(TAG, "failed to send audio frame");
                            return;
                        } else {
                            this.cp = a.SEND_NEW_ITEM;
                            break;
                        }
                    default:
                        Log.e(TAG, "unsupported frame type " + this.cy.m());
                        break;
                }
            } else {
                return;
            }
        }
    }

    private boolean e(BufferItem bufferItem) {
        if (this.cA == -1 && this.cD == -1) {
            this.cA = S();
            this.cB = c(bufferItem, 90000);
            if (!a(1, this.cz, this.cA, this.cB)) {
                Log.e(TAG, "failed to send report");
                return false;
            } else if (this.b != Streamer.MODE.AUDIO_VIDEO) {
                return true;
            } else {
                this.cE = (this.cB * this.bi.sampleRate) / 90000;
                if (a(3, this.cC, this.cA, this.cE)) {
                    return true;
                }
                Log.e(TAG, "failed to send report");
                return false;
            }
        } else if (this.cA == -1) {
            long c = c(bufferItem, 90000);
            this.cA = (((c - this.cB) * 4294967296L) / 90000) + this.cD;
            this.cB = c;
            if (a(1, this.cz, this.cA, this.cB)) {
                return true;
            }
            Log.e(TAG, "failed to send report");
            return false;
        } else if (!bufferItem.q()) {
            return true;
        } else {
            long c2 = c(bufferItem, 90000);
            long j = c2 - this.cB;
            if (j <= 450000) {
                return true;
            }
            this.cA = ((j * 4294967296L) / 90000) + this.cA;
            this.cB = c2;
            if (a(1, this.cz, this.cA, this.cB)) {
                return true;
            }
            Log.e(TAG, "failed to send report");
            return false;
        }
    }

    private boolean f(BufferItem bufferItem) {
        if (this.cD == -1 && this.cA == -1) {
            this.cD = S();
            this.cE = c(bufferItem, this.bi.sampleRate);
            if (!a(3, this.cC, this.cD, this.cE)) {
                Log.e(TAG, "failed to send report");
                return false;
            } else if (this.b == Streamer.MODE.AUDIO_VIDEO) {
                this.cB = (this.cE * 90000) / this.bi.sampleRate;
                if (!a(1, this.cz, this.cD, this.cB)) {
                    Log.e(TAG, "failed to send report");
                    return false;
                }
            }
        } else if (this.cD == -1) {
            long c = c(bufferItem, this.bi.sampleRate);
            this.cD = ((c - this.cE) * this.bi.sampleRate) + this.cA;
            this.cE = c;
            if (!a(3, this.cC, this.cD, this.cE)) {
                Log.e(TAG, "failed to send report");
                return false;
            }
        } else {
            long c2 = c(bufferItem, this.bi.sampleRate) - this.cE;
            if (c2 > this.bi.sampleRate * 5) {
                this.cD += (4294967296L * c2) / this.bi.sampleRate;
                this.cE = c2 + this.cE;
                if (!a(3, this.cC, this.cD, this.cE)) {
                    Log.e(TAG, "failed to send report");
                    return false;
                }
            }
        }
        return true;
    }

    private boolean g(BufferItem bufferItem) {
        l e = l.e(this.cv);
        e.a(0, this.cy.getData().length + 12);
        e.a((byte) 2);
        e.f((byte) 96);
        int i = this.cF;
        this.cF = i + 1;
        e.m(i);
        e.e((byte) 1);
        e.n((int) c(bufferItem, 90000));
        e.o(this.cz);
        try {
            append(this.cv, 0, 16);
            a(this.cy.getData());
            this.o++;
            return true;
        } catch (Exception e2) {
            Log.e(TAG, Log.getStackTraceString(e2));
            return false;
        }
    }

    private int a(BufferItem bufferItem, int i) {
        int i2 = 20000;
        int length = this.cy.getData().length;
        int i3 = length - i;
        if (i3 <= 20000) {
            i2 = i3;
        }
        l e = l.e(this.cv);
        e.a(0, i2 + 14);
        e.a((byte) 2);
        e.f((byte) 96);
        int i4 = this.cF;
        this.cF = i4 + 1;
        e.m(i4);
        e.e((byte) 1);
        e.n((int) c(bufferItem, 90000));
        e.o(this.cz);
        byte[] data = bufferItem.getData();
        byte b = (byte) (data[0] & AudioMessageUtils.NORMALIZED_MAX_VALUE);
        e.g((byte) ((data[0] >> 5) & 3));
        if (i == 1) {
            e.a(b, true, false);
        } else if (i + i2 >= length) {
            e.a(b, false, true);
        } else {
            e.a(b, false, false);
        }
        try {
            append(this.cv, 0, 18);
            send(data, i, i2);
            this.o++;
            return i2;
        } catch (Exception e2) {
            Log.e(TAG, Log.getStackTraceString(e2));
            return -1;
        }
    }

    private long S() {
        long currentTimeMillis = System.currentTimeMillis();
        return (((currentTimeMillis % 1000) * 4294967296L) / 1000) + (((currentTimeMillis / 1000) + 2208988800L) << 32);
    }

    private boolean a(int i, int i2, long j, long j2) {
        l e = l.e(this.cv);
        e.a(i, 28);
        e.a((byte) 2);
        e.i((byte) -56);
        e.p(28);
        e.q(i2);
        e.b(j);
        e.c(j2);
        try {
            append(this.cv, 0, 32);
            return true;
        } catch (Exception e2) {
            Log.e(TAG, Log.getStackTraceString(e2));
            return false;
        }
    }

    long c(BufferItem bufferItem, int i) {
        return (i * bufferItem.getTimestamp()) / C.MICROS_PER_SECOND;
    }

    boolean h(BufferItem bufferItem) {
        a(bufferItem);
        int length = bufferItem.getData().length;
        if (length <= 2) {
            return false;
        }
        l e = l.e(this.cv);
        e.a(2, length + 16);
        e.a((byte) 2);
        e.f((byte) 97);
        int i = this.cH;
        this.cH = i + 1;
        e.m(i);
        e.e((byte) 1);
        e.n((int) c(bufferItem, this.bi.sampleRate));
        e.o(this.cC);
        e.a((short) length);
        try {
            append(this.cv, 0, 20);
            a(bufferItem.getData());
            this.m++;
            return true;
        } catch (Exception e2) {
            Log.e(TAG, Log.getStackTraceString(e2));
            return false;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:18:0x0054  */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0064  */
    /* JADX WARN: Removed duplicated region for block: B:28:0x0087  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0097  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void T() {
        /*
            Method dump skipped, instructions count: 342
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.wmspanel.libstream.m.T():void");
    }

    private String U() {
        String d = this.cr.d("Session");
        return (d == null || d.isEmpty()) ? "" : "Session: " + d + "\r\n";
    }

    private String c(String str) {
        if (this.cJ != null && this.cI != null) {
            try {
                return ((((("Authorization: Digest username=\"" + this.ct + "\"") + ",realm=\"" + this.cJ + "\"") + ",nonce=\"" + this.cI + "\"") + ",uri=\"" + this.cs + "\"") + ",response=\"" + o.g(o.g(this.ct + ":" + this.cJ + ":" + this.cu) + ":" + this.cI + ":" + o.g(str + ":" + this.cs)) + "\"") + "\r\n";
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
            }
        } else if (this.cK != null) {
            try {
                return "Authorization: Basic " + Base64.encodeToString((this.ct + ":" + this.cu).getBytes("US-ASCII"), 2) + "\r\n";
            } catch (UnsupportedEncodingException e2) {
                Log.e(TAG, Log.getStackTraceString(e2));
            }
        }
        return "";
    }

    private void V() {
        StringBuilder append = new StringBuilder().append("OPTIONS " + this.cs + " RTSP/1.0\r\n").append("CSeq: ");
        int i = this.cL;
        this.cL = i + 1;
        try {
            a(((append.append(i).append("\r\n").toString() + "User-Agent: " + this.c.z() + "\r\n") + c(HttpRequest.METHOD_OPTIONS)) + "\r\n");
            this.cp = a.OPTIONS;
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    private void W() {
        int i;
        String str = "v=0\r\n";
        if (this.b == Streamer.MODE.VIDEO_ONLY || this.b == Streamer.MODE.AUDIO_VIDEO) {
            if (this.bh == null) {
                close();
                return;
            }
            String g = o.g(this.bh.sps_buf, 1, 3);
            String encodeToString = Base64.encodeToString(this.bh.sps_buf, 0, this.bh.sps_len, 2);
            str = (((str + "m=video 0 RTP/AVP/TCP 96\r\n") + "a=rtpmap:96 H264/90000\r\n") + "a=fmtp:96 packetization-mode=1; sprop-parameter-sets=" + encodeToString + "," + Base64.encodeToString(this.bh.pps_buf, 0, this.bh.pps_len, 2) + "; profile-level-id=" + g + "\r\n") + "a=control:streamid=0\r\n";
        }
        if (this.b == Streamer.MODE.AUDIO_ONLY || this.b == Streamer.MODE.AUDIO_VIDEO) {
            if (this.bi == null) {
                close();
                return;
            }
            String g2 = o.g(this.bi.configBuf, 0, this.bi.configLen);
            if (this.bi.sampleRate == -1) {
                int[] iArr = {96000, 88200, SettingsJsonConstants.SETTINGS_LOG_BUFFER_SIZE_DEFAULT, 48000, 44100, 32000, 24000, 22050, 16000, SafetyNetStatusCodes.SAFE_BROWSING_UNSUPPORTED_THREAT_TYPES, 11025, 8000, 7350, -1, -1, -1};
                if (this.bi.configLen < 1) {
                    Log.e(TAG, "failed to parse audio format params");
                    close();
                    return;
                }
                this.bi.sampleRate = iArr[((this.bi.configBuf[0] & 7) << 1) | ((this.bi.configBuf[1] >> 7) & 1)];
                if (this.bi.sampleRate == -1) {
                    Log.e(TAG, "failed to get sample rate, config=" + g2);
                    close();
                    return;
                }
            }
            if (this.bi.channelCount == -1) {
                this.bi.channelCount = new int[]{-1, 1, 2, 3, 4, 5, 6, 8, -1, -1, -1, -1, -1, -1, -1, -1}[(this.bi.configBuf[1] >> 3) & 15];
                if (this.bi.channelCount == -1) {
                    Log.e(TAG, "failed to get channel count, config=" + g2);
                    close();
                    return;
                }
            }
            str = (((str + "m=audio 0 RTP/AVP/TCP 97\r\n") + "a=rtpmap:97 mpeg4-generic/" + this.bi.sampleRate + CameraUtilsEffects.FILE_DELIM + this.bi.channelCount + "\r\n") + "a=fmtp:97 profile-level-id=1;mode=AAC-hbr;sizelength=13;indexlength=3;indexdeltalength=3;config=" + g2 + "\r\n") + "a=control:streamid=1\r\n";
        }
        StringBuilder append = new StringBuilder().append("ANNOUNCE ").append(this.cs).append(" RTSP/1.0\r\nContent-Type: application/sdp\r\nCSeq: ");
        this.cL = this.cL + 1;
        try {
            a(((((append.append(i).append("\r\nUser-Agent: ").append(this.c.z()).append("\r\n").toString() + "Content-Length: " + str.length() + "\r\n") + U()) + c("ANNOUNCE")) + "\r\n") + str);
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    private void X() {
        StringBuilder append = new StringBuilder().append(("SETUP " + this.cs + "/streamid=0 RTSP/1.0\r\n") + "Transport: RTP/AVP/TCP;unicast;interleaved=0-1;mode=record\r\n").append("CSeq: ");
        int i = this.cL;
        this.cL = i + 1;
        try {
            a((((append.append(i).append("\r\n").toString() + "User-Agent: " + this.c.z() + "\r\n") + U()) + c("SETUP")) + "\r\n");
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    private void Y() {
        StringBuilder append = new StringBuilder().append(("SETUP " + this.cs + "/streamid=1 RTSP/1.0\r\n") + "Transport: RTP/AVP/TCP;unicast;interleaved=2-3;mode=record\r\n").append("CSeq: ");
        int i = this.cL;
        this.cL = i + 1;
        try {
            a((((append.append(i).append("\r\n").toString() + "User-Agent: " + this.c.z() + "\r\n") + U()) + c("SETUP")) + "\r\n");
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    private void Z() {
        StringBuilder append = new StringBuilder().append(("RECORD " + this.cs + " RTSP/1.0\r\n") + "Range: npt=0.000-\r\n").append("CSeq: ");
        int i = this.cL;
        this.cL = i + 1;
        try {
            a((((append.append(i).append("\r\n").toString() + "User-Agent: " + this.c.z() + "\r\n") + U()) + c("RECORD")) + "\r\n");
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }
}
