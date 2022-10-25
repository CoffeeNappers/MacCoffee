package com.wmspanel.libstream;

import android.util.Log;
import com.coremedia.iso.boxes.sampleentry.AudioSampleEntry;
import com.coremedia.iso.boxes.sampleentry.VisualSampleEntry;
import com.google.android.exoplayer2.C;
import com.vk.media.camera.CameraUtilsEffects;
import com.wmspanel.libstream.StreamBuffer;
import com.wmspanel.libstream.Streamer;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.HashMap;
import java.util.Random;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public class i extends com.wmspanel.libstream.a {
    private static final String TAG = "RtmpConnection";
    static final int aV = 65536;
    static final int aX = 3072;
    static final byte bj = 1;
    static final byte bk = 0;
    static final byte bl = -81;
    static final byte bm = 0;
    static final byte bq = 7;
    static final byte br = 1;
    Streamer.a aB;
    byte[] aC;
    double aD;
    double aE;
    boolean aF;
    b aG;
    Streamer.STATUS aH;
    String aI;
    String aJ;
    final int aK;
    final byte aL;
    final byte aM;
    final byte aN;
    final byte aO;
    final byte aP;
    final byte aQ;
    final byte[] aR;
    final int aS;
    final byte aT;
    final byte aU;
    final byte aW;
    int aY;
    int aZ;
    boolean am;
    RtmpChunkStream ba;
    HashMap<Integer, RtmpChunkStream> bb;
    boolean bc;
    boolean bd;
    int be;
    long bf;
    long bg;
    StreamBuffer.VideoFormatParams bh;
    StreamBuffer.AudioFormatParams bi;
    k bn;
    k bo;
    k bp;
    int bs;
    final byte bt;
    final byte bu;
    BufferItem bv;
    long bw;
    boolean bx;
    long by;
    String v;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public enum a {
        RTMP_COMMAND_RESPONSE_UNKNOWN,
        RTMP_COMMAND_RESPONSE_CONNECT,
        RTMP_COMMAND_RESPONSE_CREATE_STREAM,
        RTMP_COMMAND_RESPONSE_PUBLISH
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes3.dex */
    public enum b {
        INITIAL,
        C0C1,
        C2,
        CONNECT,
        CREATE_STREAM,
        PUBLISH,
        SEND_NEXT_ITEM,
        SEND_VIDEO_PART,
        CLOSED
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void b(String str) {
        this.v = str;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(Streamer.a aVar) {
        this.aB = aVar;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public a a(double d) {
        if (((int) d) != d) {
            return a.RTMP_COMMAND_RESPONSE_UNKNOWN;
        }
        switch ((int) d) {
            case -1:
                if (this.aG == b.PUBLISH) {
                    return a.RTMP_COMMAND_RESPONSE_PUBLISH;
                }
                return a.RTMP_COMMAND_RESPONSE_UNKNOWN;
            case 0:
            default:
                return a.RTMP_COMMAND_RESPONSE_UNKNOWN;
            case 1:
                if (this.aG == b.CONNECT) {
                    return a.RTMP_COMMAND_RESPONSE_CONNECT;
                }
                return a.RTMP_COMMAND_RESPONSE_UNKNOWN;
            case 2:
                if (this.aG == b.CREATE_STREAM) {
                    return a.RTMP_COMMAND_RESPONSE_CREATE_STREAM;
                }
                return a.RTMP_COMMAND_RESPONSE_UNKNOWN;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void a(double d, double d2) {
        Log.d(TAG, "success_command_response");
        switch ((int) d) {
            case -1:
                if (this.aG == b.PUBLISH && d2 == this.aE) {
                    this.aF = true;
                    return;
                } else {
                    close();
                    return;
                }
            case 0:
            default:
                return;
            case 1:
                if (this.aG == b.CONNECT) {
                    this.aD = d2;
                    this.aF = true;
                    return;
                }
                close();
                return;
            case 2:
                if (this.aG == b.CREATE_STREAM) {
                    this.aE = d2;
                    this.aF = true;
                    return;
                }
                close();
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public i(d dVar, int i, Streamer.MODE mode, String str, String str2, int i2, String str3, String str4) throws IOException {
        super(dVar, i, mode, str2, i2, 65536);
        this.aC = new byte[16];
        this.aD = -1.0d;
        this.aE = -1.0d;
        this.aF = false;
        this.aG = b.INITIAL;
        this.aH = Streamer.STATUS.CONN_FAIL;
        this.aK = 1536;
        this.aL = (byte) 10;
        this.aM = (byte) 0;
        this.aN = (byte) 0;
        this.aO = (byte) 1;
        this.aP = (byte) 3;
        this.aQ = (byte) 3;
        this.aR = new byte[]{3, 0, 0, 0, 0, 10, 0, 0, 1};
        this.aS = aX;
        this.aT = (byte) 2;
        this.aU = (byte) 1;
        this.aW = (byte) 20;
        this.aY = 128;
        this.am = true;
        this.bb = new HashMap<>();
        this.be = 0;
        this.bf = 0L;
        this.bg = 0L;
        this.bn = new k((byte) 18);
        this.bo = new k((byte) 8);
        this.bp = new k((byte) 9);
        this.bs = 0;
        this.bt = (byte) 10;
        this.bu = (byte) 1;
        this.bw = 0L;
        this.bx = true;
        this.by = 0L;
        Log.d(TAG, TAG);
        this.d = i;
        this.aI = str3;
        this.aJ = str4;
    }

    void H() {
        int i = 0;
        Log.d(TAG, "sendHandshakeC0C1");
        try {
            ByteBuffer allocate = ByteBuffer.allocate(1537);
            allocate.put(this.aR);
            long currentTimeMillis = System.currentTimeMillis() / 1000;
            byte[] bArr = {(byte) currentTimeMillis, (byte) (currentTimeMillis >> 8), (byte) (currentTimeMillis >> 16), (byte) (currentTimeMillis >> 24)};
            while (allocate.position() < allocate.limit()) {
                switch (i % 4) {
                    case 0:
                        bArr[0] = (byte) (bArr[1] + bArr[2]);
                        break;
                    case 1:
                        bArr[1] = (byte) (bArr[2] + bArr[3]);
                        break;
                    case 2:
                        bArr[2] = (byte) (bArr[0] + bArr[1]);
                        break;
                    case 3:
                        bArr[3] = (byte) (bArr[0] + bArr[2]);
                        break;
                }
                allocate.put(bArr);
                i = (i + 1) % 4;
            }
            a(allocate.array());
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    void d(byte[] bArr) {
        try {
            send(bArr, 1, 1536);
        } catch (IOException e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    void f(int i) {
        Log.d(TAG, "sendSetChunkSize");
        try {
            byte[] bArr = new byte[12];
            bArr[0] = 2;
            bArr[6] = 4;
            bArr[7] = 1;
            b(bArr);
            a(new byte[]{(byte) (i >> 24), (byte) (i >> 16), (byte) (i >> 8), (byte) i});
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    protected String g(int i) {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        while (sb.length() < i) {
            sb.append("ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".charAt((int) (random.nextFloat() * "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890".length())));
        }
        return sb.toString();
    }

    void I() {
        Log.d(TAG, "sendConnect");
        try {
            ByteBuffer allocate = ByteBuffer.allocate(aX);
            j.b(allocate, "connect");
            j.a(allocate, 1.0d);
            j.g(allocate);
            j.a(allocate, "app");
            if (this.aB.dB == Streamer.AUTH.LLNW) {
                if (this.aB.v == null || this.aB.v.isEmpty()) {
                    j.b(allocate, this.aI + "?authmod=llnw&user=" + this.aB.username);
                } else {
                    String lowerCase = g(8).toLowerCase();
                    String g = o.g(this.aB.username + ":live:" + this.aB.password);
                    j.b(allocate, this.aI + "?authmod=llnw&user=" + this.aB.username + ("&nonce=" + this.aB.v + "&cnonce=" + lowerCase + "&nc=00000001&response=" + o.g(g + ":" + this.aB.v + ":00000001:" + lowerCase + ":auth:" + o.g("publish:/" + this.aI + "/_definst_"))));
                }
            } else {
                j.b(allocate, this.aI);
            }
            j.a(allocate, "tcUrl");
            j.b(allocate, "rtmp://" + this.e + ":" + this.f + CameraUtilsEffects.FILE_DELIM + this.aI);
            j.a(allocate, "flashVer");
            j.b(allocate, "FMLE/3.0 (compatible; " + this.c.z() + ")");
            j.a(allocate, "fpad");
            j.a(allocate, (byte) 0);
            j.a(allocate, "capabilities");
            j.a(allocate, 15.0d);
            j.a(allocate, "audioCodecs");
            j.a(allocate, 1028.0d);
            j.a(allocate, "videoCodecs");
            j.a(allocate, 128.0d);
            j.a(allocate, "videoFunction");
            j.a(allocate, 1.0d);
            j.h(allocate);
            byte[] bArr = new byte[12];
            bArr[0] = 3;
            int position = allocate.position() & 65535;
            bArr[5] = (byte) ((position >> 8) & 255);
            bArr[6] = (byte) (position & 255);
            bArr[7] = 20;
            a(bArr);
            send(allocate.array(), 0, allocate.position());
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    void J() {
        Log.d(TAG, "sendCreateStream");
        try {
            ByteBuffer allocate = ByteBuffer.allocate(128);
            j.b(allocate, "createStream");
            j.a(allocate, 2.0d);
            j.f(allocate);
            byte[] bArr = new byte[12];
            bArr[0] = 3;
            int position = allocate.position();
            bArr[4] = 0;
            bArr[5] = 0;
            bArr[6] = (byte) position;
            bArr[7] = 20;
            b(bArr);
            send(allocate.array(), 0, allocate.position());
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    void K() {
        Log.d(TAG, "sendPublish");
        try {
            ByteBuffer allocate = ByteBuffer.allocate(aX);
            allocate.put(new byte[12]);
            j.b(allocate, "publish");
            j.a(allocate, 0.0d);
            j.f(allocate);
            j.b(allocate, this.aJ);
            j.b(allocate, "live");
            allocate.put(0, (byte) 8);
            int position = allocate.position() - 12;
            allocate.put(4, (byte) 0);
            allocate.put(5, (byte) ((position >> 8) & 255));
            allocate.put(6, (byte) (position & 255));
            allocate.put(7, (byte) 20);
            int i = (int) this.aE;
            this.bn.l(i);
            this.bp.l(i);
            this.bo.l(i);
            allocate.put(8, (byte) i);
            allocate.put(9, (byte) (i >> 8));
            allocate.put(10, (byte) (i >> 16));
            allocate.put(11, (byte) (i >> 24));
            send(allocate.array(), 0, allocate.position());
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    @Override // com.wmspanel.libstream.a
    void c() {
        Log.d(TAG, "onConnect");
        this.aH = Streamer.STATUS.UNKNOWN_FAIL;
        a(Streamer.CONNECTION_STATE.CONNECTED, Streamer.STATUS.SUCCESS);
        H();
        this.aG = b.C0C1;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.wmspanel.libstream.a
    public synchronized void close() {
        Log.d(TAG, "close");
        if (this.aG != b.CLOSED) {
            if (this.aH == Streamer.STATUS.AUTH_FAIL) {
                this.c.a(this.d, this.v);
            }
            this.aG = b.CLOSED;
            super.close();
            a(Streamer.CONNECTION_STATE.DISCONNECTED, this.aH);
        }
    }

    @Override // com.wmspanel.libstream.a
    int a(ByteBuffer byteBuffer) {
        switch (this.aG) {
            case C0C1:
                if (byteBuffer.position() >= 3073) {
                    if (byteBuffer.array()[0] != 3) {
                        Log.e(TAG, "Invalid protocol version: " + ((int) byteBuffer.array()[0]));
                        close();
                        break;
                    } else {
                        d(byteBuffer.array());
                        j.a(byteBuffer, byteBuffer.position());
                        this.aG = b.C2;
                        f(65536);
                        I();
                        this.aG = b.CONNECT;
                        break;
                    }
                }
                break;
            case CONNECT:
                e(byteBuffer);
                if (this.aF) {
                    J();
                    this.aG = b.CREATE_STREAM;
                    break;
                }
                break;
            case CREATE_STREAM:
                e(byteBuffer);
                if (this.aF) {
                    a(Streamer.CONNECTION_STATE.SETUP, Streamer.STATUS.SUCCESS);
                    K();
                    this.aG = b.PUBLISH;
                    break;
                }
                break;
            case PUBLISH:
                e(byteBuffer);
                if (this.aF) {
                    M();
                    this.aG = b.SEND_NEXT_ITEM;
                    a(Streamer.CONNECTION_STATE.RECORD, Streamer.STATUS.SUCCESS);
                    P();
                    break;
                }
                break;
            case SEND_NEXT_ITEM:
            case SEND_VIDEO_PART:
                e(byteBuffer);
                break;
            default:
                close();
                break;
        }
        return 0;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Override // com.wmspanel.libstream.a
    public void d() {
        switch (this.aG) {
            case SEND_NEXT_ITEM:
                P();
                return;
            case SEND_VIDEO_PART:
                break;
            case C2:
                f(65536);
                I();
                this.aG = b.CONNECT;
                return;
            default:
                return;
        }
        while (this.bs < this.bv.getData().length) {
            int a2 = a(this.bv, this.bs);
            if (a2 <= 0) {
                Log.e(TAG, "failed to send video part");
                return;
            }
            this.bs = a2 + this.bs;
            if (b() > 0) {
                this.aG = b.SEND_VIDEO_PART;
                return;
            }
        }
        this.aG = b.SEND_NEXT_ITEM;
        P();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void h(int i) {
        this.aY = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int L() {
        return this.aY;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void i(int i) {
        this.aZ = i;
    }

    void e(ByteBuffer byteBuffer) {
        int i;
        while (byteBuffer.position() > 0) {
            try {
                if (this.am) {
                    int i2 = byteBuffer.get(0) & 255 & 63;
                    if (i2 == 0) {
                        if (byteBuffer.position() >= 2) {
                            i = (byteBuffer.get(1) & 255) + 64;
                        } else {
                            return;
                        }
                    } else if (i2 != 1) {
                        i = i2;
                    } else if (byteBuffer.position() >= 3) {
                        i = ((byteBuffer.get(1) & 255) << 8) + (byteBuffer.get(1) & 255) + 64;
                    } else {
                        return;
                    }
                    if (i < 2) {
                        close();
                        return;
                    }
                    this.ba = this.bb.get(Integer.valueOf(i));
                    if (this.ba == null) {
                        this.ba = new RtmpChunkStream(this, i);
                        this.bb.put(Integer.valueOf(i), this.ba);
                    }
                }
                int c = this.ba.c(byteBuffer);
                if ((c & 2) != 0) {
                    if ((c & 32) != 0) {
                        this.aH = Streamer.STATUS.AUTH_FAIL;
                    }
                    close();
                    return;
                }
                if ((c & 4) != 0) {
                    this.bc = true;
                }
                if ((c & 16) != 0) {
                    this.bd = true;
                    this.bc = true;
                }
                if ((c & 8) != 0) {
                    this.am = true;
                } else {
                    this.am = false;
                }
                if ((c & 1) == 0) {
                    this.be += this.ba.G();
                } else {
                    return;
                }
            } catch (Exception e) {
                Log.e(TAG, Log.getStackTraceString(e));
                close();
                return;
            }
        }
        j.i(byteBuffer);
        if (this.be <= 0) {
            if (this.be < 0) {
                close();
            } else if (this.aZ > 0) {
                if (this.bf >= -268435456) {
                    this.bf -= this.bg;
                    this.bg = 0L;
                }
                if (this.bf - this.bg >= this.aZ) {
                    if (!j((int) this.bf)) {
                        close();
                        return;
                    }
                    this.bg = this.bf;
                    this.bc = true;
                }
            }
        }
    }

    boolean j(int i) {
        Log.d(TAG, "sendAcknowledgement");
        byte[] bArr = new byte[12];
        bArr[0] = 2;
        bArr[6] = 4;
        bArr[7] = 3;
        byte[] bArr2 = {(byte) (i >> 24), (byte) (i >> 16), (byte) (i >> 8), (byte) i};
        try {
            b(bArr);
            a(bArr2);
            return true;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            return false;
        }
    }

    ByteBuffer a(byte[] bArr, byte[] bArr2) {
        if (bArr.length < 4) {
            Log.e(TAG, "sps must be at least 4 bytes long");
            return null;
        }
        ByteBuffer allocate = ByteBuffer.allocate(bArr.length + 11 + bArr2.length);
        allocate.put((byte) 1);
        allocate.put(bArr, 1, 3);
        allocate.put((byte) -1);
        allocate.put((byte) -31);
        allocate.put((byte) ((bArr.length >> 8) & 255));
        allocate.put((byte) (bArr.length & 255));
        allocate.put(bArr);
        allocate.put((byte) 1);
        allocate.put((byte) ((bArr2.length >> 8) & 255));
        allocate.put((byte) (bArr2.length & 255));
        allocate.put(bArr2);
        return allocate;
    }

    void M() {
        Log.d(TAG, "sendMetaData");
        try {
            ByteBuffer allocate = ByteBuffer.allocate(1500);
            j.b(allocate, "onMetaData");
            j.g(allocate);
            if (this.b == Streamer.MODE.VIDEO_ONLY || this.b == Streamer.MODE.AUDIO_VIDEO) {
                this.bh = this.c.x().ac();
                if (this.bh == null) {
                    Log.e(TAG, "failed to get avc params, check if video capture is started");
                    close();
                    return;
                }
                f a2 = f.a(this.bh.sps_buf, this.bh.sps_len);
                if (a2 == null) {
                    Log.e(TAG, "failed to get sps info");
                    close();
                    return;
                }
                Log.d(TAG, "from sps: width=" + a2.width + ";height=" + a2.height);
                j.a(allocate, "width");
                j.a(allocate, a2.width);
                j.a(allocate, "height");
                j.a(allocate, a2.height);
                j.a(allocate, "videocodecid");
                j.b(allocate, VisualSampleEntry.TYPE3);
            }
            if (this.b == Streamer.MODE.AUDIO_ONLY || this.b == Streamer.MODE.AUDIO_VIDEO) {
                j.a(allocate, "audiocodecid");
                j.b(allocate, AudioSampleEntry.TYPE3);
            }
            j.h(allocate);
            append(this.aC, 0, this.bn.f(this.aC, allocate.position(), 0));
            send(allocate.array(), 0, allocate.position());
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    void N() {
        Log.d(TAG, "sendAvcHeader");
        try {
            byte[] bArr = {23, 0, 0, 0, 0};
            StreamBuffer.VideoFormatParams ac = this.c.x().ac();
            ByteBuffer a2 = a(ac.sps_buf, ac.pps_buf);
            append(this.aC, 0, this.bp.f(this.aC, bArr.length + a2.position(), 0));
            b(bArr);
            send(a2.array(), 0, a2.position());
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    void O() {
        Log.d(TAG, "sendAacHeader");
        try {
            byte[] bArr = {bl, 0};
            this.bi = this.c.x().ad();
            if (this.bi == null) {
                Log.e(TAG, "failed to get aac params, check if audio capture is started");
                close();
            } else {
                append(this.aC, 0, this.bo.f(this.aC, bArr.length + this.bi.configLen, 0));
                b(bArr);
                send(this.bi.configBuf, 0, this.bi.configLen);
            }
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    static byte[] k(int i) {
        byte[] bArr = new byte[4];
        for (int i2 = 0; i2 < 4; i2++) {
            bArr[i2] = (byte) (i >> 24);
            i <<= 8;
        }
        return bArr;
    }

    void c(BufferItem bufferItem) {
        int i = 1;
        try {
            long b2 = b(bufferItem, 1000);
            byte[] data = bufferItem.getData();
            if (!bufferItem.q()) {
                i = 2;
            }
            byte[] bArr = {(byte) ((i << 4) | 7), 1, (byte) 0, (byte) 0, (byte) 0};
            append(this.aC, 0, this.bp.f(this.aC, bArr.length + 4 + data.length, (int) b2));
            b(bArr);
            b(k(data.length));
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    private int a(BufferItem bufferItem, int i) {
        int i2 = i == 0 ? 65527 : 65536;
        try {
            int length = bufferItem.getData().length - i;
            if (length > i2) {
                append(bufferItem.getData(), i, i2);
                a(new byte[]{-59});
                return i2;
            }
            send(bufferItem.getData(), i, length);
            return length;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
            return -1;
        }
    }

    long b(BufferItem bufferItem, int i) {
        return (i * (bufferItem.getTimestamp() - this.by)) / C.MICROS_PER_SECOND;
    }

    void d(BufferItem bufferItem) {
        try {
            byte[] bArr = {bl, 1};
            byte[] data = bufferItem.getData();
            append(this.aC, 0, this.bo.f(this.aC, bArr.length + data.length, (int) b(bufferItem, 1000)));
            b(bArr);
            a(data);
            this.m++;
        } catch (Exception e) {
            Log.e(TAG, Log.getStackTraceString(e));
            close();
        }
    }

    void P() {
        while (b() <= 0) {
            this.bv = this.c.x().d(this.bw);
            if (this.bv != null) {
                this.bw = this.bv.o() + 1;
                switch (this.bv.m()) {
                    case VIDEO:
                        if (this.b != Streamer.MODE.AUDIO_VIDEO && this.b != Streamer.MODE.VIDEO_ONLY) {
                            break;
                        } else if (this.bv.q() || (this.o != 0 && this.bv.n() - this.r <= 1)) {
                            b(this.bv);
                            if (this.bx) {
                                this.bx = false;
                                this.by = this.bv.getTimestamp();
                                N();
                                if (this.b == Streamer.MODE.AUDIO_VIDEO) {
                                    O();
                                }
                            }
                            if (this.bv.getTimestamp() - this.by >= 0) {
                                if (this.bh != this.c.x().ac()) {
                                    StreamBuffer.VideoFormatParams ac = this.c.x().ac();
                                    if (ac == null) {
                                        continue;
                                    } else if (this.bh != null && !this.bh.equals(ac)) {
                                        if (this.bv.q()) {
                                            this.bh = ac;
                                            N();
                                            Log.d(TAG, "Video encoder re-configuration detected");
                                        } else {
                                            continue;
                                        }
                                    }
                                }
                                c(this.bv);
                                this.aG = b.SEND_VIDEO_PART;
                                this.bs = 0;
                                while (this.bs < this.bv.getData().length) {
                                    int a2 = a(this.bv, this.bs);
                                    if (a2 <= 0) {
                                        Log.e(TAG, "failed to send video part");
                                        return;
                                    }
                                    this.bs = a2 + this.bs;
                                    if (b() > 0) {
                                        return;
                                    }
                                }
                                this.o++;
                                this.aG = b.SEND_NEXT_ITEM;
                                break;
                            } else {
                                continue;
                            }
                        }
                        break;
                    case AUDIO:
                        if (this.b != Streamer.MODE.AUDIO_VIDEO && this.b != Streamer.MODE.AUDIO_ONLY) {
                            break;
                        } else {
                            a(this.bv);
                            if (this.bx) {
                                this.bx = false;
                                this.by = this.bv.getTimestamp();
                                O();
                                if (this.b == Streamer.MODE.AUDIO_VIDEO) {
                                    N();
                                }
                            }
                            if (this.bv.getTimestamp() - this.by >= 0) {
                                if (this.bi != this.c.x().ad()) {
                                    StreamBuffer.AudioFormatParams ad = this.c.x().ad();
                                    if (ad == null) {
                                        break;
                                    } else if (this.bi != null && !this.bi.equals(ad)) {
                                        O();
                                        Log.d(TAG, "Audio encoder re-configuration detected");
                                    }
                                }
                                d(this.bv);
                                break;
                            } else {
                                break;
                            }
                        }
                    default:
                        Log.e(TAG, "unsupported frame type " + this.bv.m());
                        break;
                }
            } else {
                return;
            }
        }
    }
}
