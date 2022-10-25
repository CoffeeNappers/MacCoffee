package com.vkontakte.android.media;

import com.vkontakte.android.media.VigoPool;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class VigoBinaryBuffer {
    public static final short CLIENT_INFORMATION_TAG = 1;
    public static final short CONTENT_INFORMATION_TAG = 2;
    public static final short EVENT_INFORMATION_TAG = 6;
    public static final short LV_LEN_POSITION = 0;
    public static final short MAX_BUFFER_SIZE = 4096;
    public static final short NETWORK_INFORMATION_TAG = 5;
    public static final short NO_TAG = 0;
    public static final short PLAYBACK_EVENT_INFORMATION_TAG = 4;
    public static final short PLAYBACK_INFORMATION_TAG = 3;
    private static final short POOL_SIZE = 256;
    public static final short SESSION_INFORMATION_TAG = 7;
    public static final short TLV_LEN_POSITION = 2;
    public static final short TLV_LEN_SIZE = 2;
    private static final VigoPool<VigoBinaryBuffer> pool = new VigoPool<>(new VigoPool.ObjectFactory<VigoBinaryBuffer>() { // from class: com.vkontakte.android.media.VigoBinaryBuffer.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // com.vkontakte.android.media.VigoPool.ObjectFactory
        /* renamed from: newInstance */
        public VigoBinaryBuffer mo1082newInstance() {
            return new VigoBinaryBuffer();
        }
    }, 256);
    private byte[] buf;
    private final AtomicBoolean inPool = new AtomicBoolean();
    private int position;
    private short tag;

    public static VigoBinaryBuffer getObject() {
        VigoBinaryBuffer obj = pool.getObject();
        obj.inPool.set(false);
        return obj;
    }

    public void returnObject() {
        if (this.inPool.compareAndSet(false, true)) {
            init();
            pool.setFree(this);
        }
    }

    public VigoBinaryBuffer() {
        init();
        this.buf = new byte[4096];
        this.inPool.set(true);
    }

    private void clear() {
        this.position = 0;
    }

    private void init() {
        clear();
        this.tag = (short) -1;
    }

    public final void reset() {
        clear();
        if (this.tag != -1) {
            if (this.tag != 0) {
                addShortToBuffer(this.tag);
            }
            addShortToBuffer((short) 0);
        }
    }

    public void setTag(short tag) {
        this.tag = tag;
        reset();
    }

    public byte[] getBuffer() {
        return Arrays.copyOf(this.buf, this.position);
    }

    private boolean checkSize(int size) {
        return this.buf.length - this.position >= size;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (!(o instanceof VigoBinaryBuffer)) {
            return false;
        }
        VigoBinaryBuffer other = (VigoBinaryBuffer) o;
        if (this.tag == other.tag && this.position == other.position) {
            for (int i = 0; i < this.position; i++) {
                if (this.buf[i] != other.buf[i]) {
                    return false;
                }
            }
            return true;
        }
        return false;
    }

    public void updateLength() {
        if (this.tag != -1) {
            if (this.tag == 0) {
                this.buf[0] = (byte) ((this.position - 2) & 255);
                this.buf[1] = (byte) (((this.position - 2) >>> 8) & 255);
                return;
            }
            this.buf[2] = (byte) ((this.position - 4) & 255);
            this.buf[3] = (byte) (((this.position - 4) >>> 8) & 255);
        }
    }

    public VigoBinaryBuffer addStringToBuffer(String src) {
        if (src != null && src.length() <= 32767) {
            try {
                byte[] tmp = src.getBytes("UTF-8");
                addShortToBuffer((short) tmp.length);
                addBytesToBuffer(tmp, tmp.length);
            } catch (UnsupportedEncodingException e) {
                addShortToBuffer((short) 0);
            }
        } else {
            addShortToBuffer((short) 0);
        }
        return this;
    }

    public VigoBinaryBuffer addLongToBuffer(long src) {
        if (checkSize(8)) {
            byte[] bArr = this.buf;
            int i = this.position;
            this.position = i + 1;
            bArr[i] = (byte) (src & 255);
            byte[] bArr2 = this.buf;
            int i2 = this.position;
            this.position = i2 + 1;
            bArr2[i2] = (byte) ((src >>> 8) & 255);
            byte[] bArr3 = this.buf;
            int i3 = this.position;
            this.position = i3 + 1;
            bArr3[i3] = (byte) ((src >>> 16) & 255);
            byte[] bArr4 = this.buf;
            int i4 = this.position;
            this.position = i4 + 1;
            bArr4[i4] = (byte) ((src >>> 24) & 255);
            byte[] bArr5 = this.buf;
            int i5 = this.position;
            this.position = i5 + 1;
            bArr5[i5] = (byte) ((src >>> 32) & 255);
            byte[] bArr6 = this.buf;
            int i6 = this.position;
            this.position = i6 + 1;
            bArr6[i6] = (byte) ((src >>> 40) & 255);
            byte[] bArr7 = this.buf;
            int i7 = this.position;
            this.position = i7 + 1;
            bArr7[i7] = (byte) ((src >>> 48) & 255);
            byte[] bArr8 = this.buf;
            int i8 = this.position;
            this.position = i8 + 1;
            bArr8[i8] = (byte) ((src >>> 56) & 255);
        }
        return this;
    }

    public VigoBinaryBuffer addIntToBuffer(int src) {
        if (checkSize(4)) {
            byte[] bArr = this.buf;
            int i = this.position;
            this.position = i + 1;
            bArr[i] = (byte) (src & 255);
            byte[] bArr2 = this.buf;
            int i2 = this.position;
            this.position = i2 + 1;
            bArr2[i2] = (byte) ((src >>> 8) & 255);
            byte[] bArr3 = this.buf;
            int i3 = this.position;
            this.position = i3 + 1;
            bArr3[i3] = (byte) ((src >>> 16) & 255);
            byte[] bArr4 = this.buf;
            int i4 = this.position;
            this.position = i4 + 1;
            bArr4[i4] = (byte) ((src >>> 24) & 255);
        }
        return this;
    }

    public VigoBinaryBuffer addShortToBuffer(short src) {
        if (checkSize(2)) {
            byte[] bArr = this.buf;
            int i = this.position;
            this.position = i + 1;
            bArr[i] = (byte) (src & 255);
            byte[] bArr2 = this.buf;
            int i2 = this.position;
            this.position = i2 + 1;
            bArr2[i2] = (byte) ((src >>> 8) & 255);
        }
        return this;
    }

    public VigoBinaryBuffer addByteToBuffer(byte src) {
        if (checkSize(1)) {
            byte[] bArr = this.buf;
            int i = this.position;
            this.position = i + 1;
            bArr[i] = src;
        }
        return this;
    }

    public VigoBinaryBuffer addBooleanToBuffer(boolean src) {
        int i = 1;
        if (checkSize(1)) {
            byte[] bArr = this.buf;
            int i2 = this.position;
            this.position = i2 + 1;
            if (!src) {
                i = 0;
            }
            bArr[i2] = (byte) i;
        }
        return this;
    }

    public VigoBinaryBuffer addBytesToBuffer(byte[] src, int limit) {
        if (src != null) {
            System.arraycopy(src, 0, this.buf, this.position, limit);
            this.position += limit;
        }
        return this;
    }

    public VigoBinaryBuffer addBuffer(VigoBinaryBuffer src) {
        if (src != null && checkSize(src.position)) {
            addBytesToBuffer(src.buf, src.position);
        }
        return this;
    }
}
