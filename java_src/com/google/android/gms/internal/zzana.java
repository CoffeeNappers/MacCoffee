package com.google.android.gms.internal;

import com.google.android.gms.internal.zzamt;
import java.io.DataInputStream;
import java.io.IOException;
import java.net.SocketTimeoutException;
/* loaded from: classes2.dex */
class zzana {
    private zzamv bjS;
    private zzamt.zzb bjU;
    private DataInputStream bjR = null;
    private zzamw bjw = null;
    private byte[] bjT = new byte[112];
    private volatile boolean bjV = false;

    /* JADX INFO: Access modifiers changed from: package-private */
    public zzana(zzamv zzamvVar) {
        this.bjS = null;
        this.bjS = zzamvVar;
    }

    private int read(byte[] bArr, int i, int i2) throws IOException {
        this.bjR.readFully(bArr, i, i2);
        return i2;
    }

    private void zza(boolean z, byte b, byte[] bArr) {
        if (b == 9) {
            if (!z) {
                throw new zzamx("PING must not fragment across frames");
            }
            zzax(bArr);
        } else if (this.bjU != null && b != 0) {
            throw new zzamx("Failed to continue outstanding frame");
        } else {
            if (this.bjU == null && b == 0) {
                throw new zzamx("Received continuing frame, but there's nothing to continue");
            }
            if (this.bjU == null) {
                this.bjU = zzamt.zzb(b);
            }
            if (!this.bjU.zzau(bArr)) {
                throw new zzamx("Failed to decode frame");
            }
            if (!z) {
                return;
            }
            zzamz e = this.bjU.e();
            this.bjU = null;
            if (e == null) {
                throw new zzamx("Failed to decode whole message");
            }
            this.bjw.zza(e);
        }
    }

    private void zzax(byte[] bArr) {
        if (bArr.length <= 125) {
            this.bjS.zzaw(bArr);
            return;
        }
        throw new zzamx("PING frame too long");
    }

    private void zzc(zzamx zzamxVar) {
        r();
        this.bjS.zzb(zzamxVar);
    }

    private long zze(byte[] bArr, int i) {
        return (bArr[i + 0] << 56) + ((bArr[i + 1] & 255) << 48) + ((bArr[i + 2] & 255) << 40) + ((bArr[i + 3] & 255) << 32) + ((bArr[i + 4] & 255) << 24) + ((bArr[i + 5] & 255) << 16) + ((bArr[i + 6] & 255) << 8) + ((bArr[i + 7] & 255) << 0);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void r() {
        this.bjV = true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void run() {
        int read;
        boolean z;
        this.bjw = this.bjS.i();
        while (!this.bjV) {
            try {
                read = read(this.bjT, 0, 1) + 0;
                z = (this.bjT[0] & 128) != 0;
            } catch (zzamx e) {
                zzc(e);
            } catch (SocketTimeoutException e2) {
            } catch (IOException e3) {
                zzc(new zzamx("IO Error", e3));
            }
            if ((this.bjT[0] & 112) != 0) {
                throw new zzamx("Invalid frame received");
            }
            byte b = (byte) (this.bjT[0] & 15);
            int read2 = read + read(this.bjT, read, 1);
            byte b2 = this.bjT[1];
            long j = 0;
            if (b2 < 126) {
                j = b2;
            } else if (b2 == 126) {
                int read3 = read(this.bjT, read2, 2) + read2;
                j = ((this.bjT[2] & 255) << 8) | (this.bjT[3] & 255);
            } else if (b2 == Byte.MAX_VALUE) {
                j = zze(this.bjT, (read(this.bjT, read2, 8) + read2) - 8);
            }
            byte[] bArr = new byte[(int) j];
            read(bArr, 0, (int) j);
            if (b == 8) {
                this.bjS.j();
            } else if (b == 10) {
                continue;
            } else if (b != 1 && b != 2 && b != 9 && b != 0) {
                throw new zzamx(new StringBuilder(24).append("Unsupported opcode: ").append((int) b).toString());
            } else {
                zza(z, b, bArr);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void zza(DataInputStream dataInputStream) {
        this.bjR = dataInputStream;
    }
}
