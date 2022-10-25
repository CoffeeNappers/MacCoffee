package com.google.android.gms.internal;

import android.support.v4.media.TransportMediator;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.Channels;
import java.nio.channels.WritableByteChannel;
import java.util.Random;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.LinkedBlockingQueue;
/* loaded from: classes2.dex */
class zzanb {
    private zzamv bjS;
    private BlockingQueue<ByteBuffer> bjW;
    private WritableByteChannel bjY;
    private final Random bcK = new Random();
    private volatile boolean bjV = false;
    private boolean bjX = false;
    private final Thread bjB = zzamv.getThreadFactory().newThread(new Runnable() { // from class: com.google.android.gms.internal.zzanb.1
        @Override // java.lang.Runnable
        public void run() {
            zzanb.this.v();
        }
    });

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzanb(zzamv zzamvVar, String str, int i) {
        zzamv.h().zza(o(), new StringBuilder(String.valueOf(str).length() + 18).append(str).append("Writer-").append(i).toString());
        this.bjS = zzamvVar;
        this.bjW = new LinkedBlockingQueue();
    }

    private byte[] s() {
        byte[] bArr = new byte[4];
        this.bcK.nextBytes(bArr);
        return bArr;
    }

    private void t() throws InterruptedException, IOException {
        this.bjY.write(this.bjW.take());
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void v() {
        while (!this.bjV && !Thread.interrupted()) {
            try {
                t();
            } catch (IOException e) {
                zzc(new zzamx("IO Exception", e));
                return;
            } catch (InterruptedException e2) {
                return;
            }
        }
        for (int i = 0; i < this.bjW.size(); i++) {
            t();
        }
    }

    private ByteBuffer zza(byte b, boolean z, byte[] bArr) throws IOException {
        int i = 2;
        if (z) {
            i = 6;
        }
        int length = bArr.length;
        if (length >= 126) {
            i = length <= 65535 ? i + 2 : i + 8;
        }
        ByteBuffer allocate = ByteBuffer.allocate(i + bArr.length);
        allocate.put((byte) (b | Byte.MIN_VALUE));
        if (length < 126) {
            allocate.put((byte) (z ? length | 128 : length));
        } else if (length <= 65535) {
            allocate.put((byte) (z ? 254 : 126));
            allocate.putShort((short) length);
        } else {
            int i2 = TransportMediator.KEYCODE_MEDIA_PAUSE;
            if (z) {
                i2 = 255;
            }
            allocate.put((byte) i2);
            allocate.putInt(0);
            allocate.putInt(length);
        }
        if (z) {
            byte[] s = s();
            allocate.put(s);
            for (int i3 = 0; i3 < bArr.length; i3++) {
                allocate.put((byte) (bArr[i3] ^ s[i3 % 4]));
            }
        }
        allocate.flip();
        return allocate;
    }

    private void zzc(zzamx zzamxVar) {
        this.bjS.zzb(zzamxVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Thread o() {
        return this.bjB;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void u() {
        this.bjV = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized void zzb(byte b, boolean z, byte[] bArr) throws IOException {
        ByteBuffer zza = zza(b, z, bArr);
        if (this.bjV && (this.bjX || b != 8)) {
            throw new zzamx("Shouldn't be sending");
        }
        if (b == 8) {
            this.bjX = true;
        }
        this.bjW.add(zza);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zzb(OutputStream outputStream) {
        this.bjY = Channels.newChannel(outputStream);
    }
}
