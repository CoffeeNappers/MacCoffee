package ru.mail.libverify.utils;

import android.os.Build;
import android.os.Process;
import android.util.Log;
import java.io.ByteArrayOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.security.Provider;
import java.security.SecureRandom;
import java.security.SecureRandomSpi;
import java.security.Security;
/* loaded from: classes3.dex */
public final class i {
    private static final byte[] a = e();

    /* loaded from: classes3.dex */
    public static class a extends SecureRandomSpi {
        private static final File a = new File("/dev/urandom");
        private static final Object b = new Object();
        private static DataInputStream c;
        private static OutputStream d;
        private boolean e;

        private static DataInputStream a() {
            DataInputStream dataInputStream;
            synchronized (b) {
                if (c == null) {
                    try {
                        c = new DataInputStream(new FileInputStream(a));
                    } catch (IOException e) {
                        throw new SecurityException("Failed to open " + a + " for reading", e);
                    }
                }
                dataInputStream = c;
            }
            return dataInputStream;
        }

        private static OutputStream b() {
            OutputStream outputStream;
            synchronized (b) {
                if (d == null) {
                    d = new FileOutputStream(a);
                }
                outputStream = d;
            }
            return outputStream;
        }

        @Override // java.security.SecureRandomSpi
        protected byte[] engineGenerateSeed(int i) {
            byte[] bArr = new byte[i];
            engineNextBytes(bArr);
            return bArr;
        }

        @Override // java.security.SecureRandomSpi
        protected void engineNextBytes(byte[] bArr) {
            DataInputStream a2;
            if (!this.e) {
                engineSetSeed(i.c());
            }
            try {
                synchronized (b) {
                    a2 = a();
                }
                synchronized (a2) {
                    a2.readFully(bArr);
                }
            } catch (IOException e) {
                throw new SecurityException("Failed to read from " + a, e);
            }
        }

        @Override // java.security.SecureRandomSpi
        protected void engineSetSeed(byte[] bArr) {
            OutputStream b2;
            try {
                synchronized (b) {
                    b2 = b();
                }
                b2.write(bArr);
                b2.flush();
            } catch (IOException e) {
                Log.w(i.class.getSimpleName(), "Failed to mix seed into " + a);
            } finally {
                this.e = true;
            }
        }
    }

    /* loaded from: classes3.dex */
    private static class b extends Provider {
        public b() {
            super("LinuxPRNG", 1.0d, "A Linux-specific random number provider that uses /dev/urandom");
            put("SecureRandom.SHA1PRNG", a.class.getName());
            put("SecureRandom.SHA1PRNG ImplementedIn", "Software");
        }
    }

    private i() {
    }

    public static void a() {
        try {
            if (Build.VERSION.SDK_INT >= 16 && Build.VERSION.SDK_INT <= 18) {
                try {
                    Class.forName("org.apache.harmony.xnet.provider.jsse.NativeCrypto").getMethod("RAND_seed", byte[].class).invoke(null, c());
                    int intValue = ((Integer) Class.forName("org.apache.harmony.xnet.provider.jsse.NativeCrypto").getMethod("RAND_load_file", String.class, Long.TYPE).invoke(null, "/dev/urandom", 1024)).intValue();
                    if (intValue != 1024) {
                        throw new IOException("Unexpected number of bytes read from Linux PRNG: " + intValue);
                    }
                } catch (Exception e) {
                    throw new SecurityException("Failed to seed OpenSSL PRNG", e);
                }
            }
            if (Build.VERSION.SDK_INT > 18) {
                return;
            }
            Provider[] providers = Security.getProviders("SecureRandom.SHA1PRNG");
            if (providers == null || providers.length <= 0 || !b.class.equals(providers[0].getClass())) {
                Security.insertProviderAt(new b(), 1);
            }
            SecureRandom secureRandom = new SecureRandom();
            if (!b.class.equals(secureRandom.getProvider().getClass())) {
                throw new SecurityException("new SecureRandom() backed by wrong Provider: " + secureRandom.getProvider().getClass());
            }
            try {
                SecureRandom secureRandom2 = SecureRandom.getInstance("SHA1PRNG");
                if (b.class.equals(secureRandom2.getProvider().getClass())) {
                    return;
                }
                throw new SecurityException("SecureRandom.getInstance(\"SHA1PRNG\") backed by wrong Provider: " + secureRandom2.getProvider().getClass());
            } catch (NoSuchAlgorithmException e2) {
                throw new SecurityException("SHA1PRNG not available", e2);
            }
        } catch (Exception e3) {
            d.a("PRNGFixes", "failed to apply fixes", e3);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static byte[] c() {
        try {
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            DataOutputStream dataOutputStream = new DataOutputStream(byteArrayOutputStream);
            dataOutputStream.writeLong(System.currentTimeMillis());
            dataOutputStream.writeLong(System.nanoTime());
            dataOutputStream.writeInt(Process.myPid());
            dataOutputStream.writeInt(Process.myUid());
            dataOutputStream.write(a);
            dataOutputStream.close();
            return byteArrayOutputStream.toByteArray();
        } catch (IOException e) {
            throw new SecurityException("Failed to generate seed", e);
        }
    }

    private static String d() {
        try {
            return (String) Build.class.getField("SERIAL").get(null);
        } catch (Exception e) {
            return null;
        }
    }

    private static byte[] e() {
        StringBuilder sb = new StringBuilder();
        String str = Build.FINGERPRINT;
        if (str != null) {
            sb.append(str);
        }
        String d = d();
        if (d != null) {
            sb.append(d);
        }
        try {
            return sb.toString().getBytes("UTF-8");
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException("UTF-8 encoding not supported");
        }
    }
}
