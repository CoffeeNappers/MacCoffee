package com.google.android.gms.internal;

import android.support.v4.media.session.PlaybackStateCompat;
import com.google.android.gms.internal.zzaf;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.io.UnsupportedEncodingException;
import java.nio.ByteBuffer;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;
import java.util.Iterator;
import java.util.Vector;
import java.util.concurrent.CountDownLatch;
import java.util.concurrent.TimeUnit;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class zzan {
    static boolean zzyj = false;
    private static MessageDigest zzyk = null;
    private static final Object zzyl = new Object();
    private static final Object zzym = new Object();
    static CountDownLatch zzyn = new CountDownLatch(1);

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static final class zza implements Runnable {
        private zza() {
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                MessageDigest unused = zzan.zzyk = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
            } catch (NoSuchAlgorithmException e) {
            } finally {
                zzan.zzyn.countDown();
            }
        }
    }

    private static int zza(boolean z) {
        return z ? 239 : 255;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zza(zzaf.zza zzaVar, String str, boolean z) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        return zza(zzasa.zzf(zzaVar), str, z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String zza(String str, String str2, boolean z) {
        byte[] zzb = zzb(str, str2, z);
        return zzb != null ? zzal.zza(zzb, true) : Integer.toString(7);
    }

    static String zza(byte[] bArr, String str, boolean z) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        return zzal.zza(z ? zzb(bArr, str) : zza(bArr, str), true);
    }

    static Vector<byte[]> zza(byte[] bArr, int i) {
        if (bArr == null || bArr.length <= 0) {
            return null;
        }
        int length = ((bArr.length + i) - 1) / i;
        Vector<byte[]> vector = new Vector<>();
        for (int i2 = 0; i2 < length; i2++) {
            int i3 = i2 * i;
            try {
                vector.add(Arrays.copyOfRange(bArr, i3, bArr.length - i3 > i ? i3 + i : bArr.length));
            } catch (IndexOutOfBoundsException e) {
                return null;
            }
        }
        return vector;
    }

    static void zza(String str, byte[] bArr) throws UnsupportedEncodingException {
        if (str.length() > 32) {
            str = str.substring(0, 32);
        }
        new zzaqt(str.getBytes("UTF-8")).zzay(bArr);
    }

    static byte[] zza(byte[] bArr, String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        Vector<byte[]> zza2 = zza(bArr, 255);
        if (zza2 == null || zza2.size() == 0) {
            return zzb(zzasa.zzf(zzb(PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM)), str);
        }
        zzaf.zzf zzfVar = new zzaf.zzf();
        zzfVar.zzga = new byte[zza2.size()];
        Iterator<byte[]> it = zza2.iterator();
        int i = 0;
        while (it.hasNext()) {
            zzfVar.zzga[i] = zzb(it.next(), str, false);
            i++;
        }
        zzfVar.zzfv = zzh(bArr);
        return zzasa.zzf(zzfVar);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void zzau() {
        synchronized (zzym) {
            if (!zzyj) {
                zzyj = true;
                new Thread(new zza()).start();
            }
        }
    }

    static MessageDigest zzav() {
        zzau();
        boolean z = false;
        try {
            z = zzyn.await(2L, TimeUnit.SECONDS);
        } catch (InterruptedException e) {
        }
        if (z && zzyk != null) {
            return zzyk;
        }
        return null;
    }

    static zzaf.zza zzb(long j) {
        zzaf.zza zzaVar = new zzaf.zza();
        zzaVar.zzdt = Long.valueOf(j);
        return zzaVar;
    }

    static byte[] zzb(String str, String str2, boolean z) {
        zzaf.zzc zzcVar = new zzaf.zzc();
        try {
            zzcVar.zzft = str.length() < 3 ? str.getBytes("ISO-8859-1") : zzal.zza(str, true);
            zzcVar.zzfu = z ? str2.length() < 3 ? str2.getBytes("ISO-8859-1") : zzal.zza(str2, true) : (str2 == null || str2.length() == 0) ? Integer.toString(5).getBytes("ISO-8859-1") : zzal.zza(zza(str2.getBytes("ISO-8859-1"), (String) null, zzdr.zzbho.get().booleanValue()), true);
            return zzasa.zzf(zzcVar);
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
            return null;
        }
    }

    static byte[] zzb(byte[] bArr, String str) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        return zzb(bArr, str, true);
    }

    private static byte[] zzb(byte[] bArr, String str, boolean z) throws NoSuchAlgorithmException, UnsupportedEncodingException {
        byte[] array;
        int zza2 = zza(z);
        if (bArr.length > zza2) {
            bArr = zzasa.zzf(zzb(PlaybackStateCompat.ACTION_SKIP_TO_QUEUE_ITEM));
        }
        if (bArr.length < zza2) {
            byte[] bArr2 = new byte[zza2 - bArr.length];
            new SecureRandom().nextBytes(bArr2);
            array = ByteBuffer.allocate(zza2 + 1).put((byte) bArr.length).put(bArr).put(bArr2).array();
        } else {
            array = ByteBuffer.allocate(zza2 + 1).put((byte) bArr.length).put(bArr).array();
        }
        if (z) {
            array = ByteBuffer.allocate(256).put(zzh(array)).put(array).array();
        }
        byte[] bArr3 = new byte[256];
        new zzao().zzb(array, bArr3);
        if (str != null && str.length() > 0) {
            zza(str, bArr3);
        }
        return bArr3;
    }

    public static byte[] zzh(byte[] bArr) throws NoSuchAlgorithmException {
        byte[] digest;
        synchronized (zzyl) {
            MessageDigest zzav = zzav();
            if (zzav == null) {
                throw new NoSuchAlgorithmException("Cannot compute hash");
            }
            zzav.reset();
            zzav.update(bArr);
            digest = zzyk.digest();
        }
        return digest;
    }
}
