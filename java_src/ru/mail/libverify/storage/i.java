package ru.mail.libverify.storage;

import android.annotation.TargetApi;
import android.content.Context;
import android.os.Build;
import android.security.KeyPairGeneratorSpec;
import android.security.keystore.KeyGenParameterSpec;
import android.support.annotation.NonNull;
import android.text.TextUtils;
import java.io.File;
import java.io.FileOutputStream;
import java.io.RandomAccessFile;
import java.math.BigInteger;
import java.security.InvalidKeyException;
import java.security.KeyPair;
import java.security.KeyStore;
import java.security.NoSuchAlgorithmException;
import java.security.ProviderException;
import java.security.UnrecoverableKeyException;
import java.util.GregorianCalendar;
import java.util.Locale;
import java.util.UUID;
import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.security.auth.x500.X500Principal;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class i {
    private static final a a = new b();
    private static String b = null;
    private static String c;
    private static j d;
    private static File e;

    i() {
    }

    private static String a() {
        ru.mail.libverify.utils.i.a();
        return UUID.randomUUID().toString();
    }

    public static synchronized String a(@NonNull Context context) {
        String str;
        synchronized (i.class) {
            if (TextUtils.isEmpty(b)) {
                File d2 = d(context);
                if (!d2.exists()) {
                    b = a();
                    a(context, b, d2);
                } else {
                    String a2 = a(context, d2);
                    b = a2;
                    if (TextUtils.isEmpty(a2)) {
                        c(context);
                        b = a();
                        a(context, b, d2);
                    }
                }
            }
            str = b;
        }
        return str;
    }

    private static String a(@NonNull Context context, @NonNull File file) {
        RandomAccessFile randomAccessFile;
        try {
            randomAccessFile = new RandomAccessFile(file, "r");
            try {
                byte[] bArr = new byte[(int) randomAccessFile.length()];
                randomAccessFile.readFully(bArr);
                String a2 = a(context, bArr);
                randomAccessFile.close();
                return a2;
            } catch (Throwable th) {
                th = th;
                if (randomAccessFile != null) {
                    randomAccessFile.close();
                }
                throw th;
            }
        } catch (Throwable th2) {
            th = th2;
            randomAccessFile = null;
        }
    }

    private static String a(@NonNull Context context, @NonNull byte[] bArr) {
        if (Build.VERSION.SDK_INT < 18 || f(context).a()) {
            return new String(bArr, "UTF-8");
        }
        try {
            KeyPair g = g(context);
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1PADDING");
            cipher.init(2, g.getPrivate());
            return new String(cipher.doFinal(bArr), "UTF-8");
        } catch (IllegalArgumentException e2) {
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id (unsupported system locale)", e2);
            return null;
        } catch (IllegalStateException e3) {
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id (credentials storage locked)", e3);
            return null;
        } catch (InvalidKeyException e4) {
            e = e4;
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id, no such algorithm", e);
            return null;
        } catch (NoSuchAlgorithmException e5) {
            e = e5;
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id, no such algorithm", e);
            return null;
        } catch (UnrecoverableKeyException e6) {
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id (private key error)", e6);
            return null;
        } catch (BadPaddingException e7) {
            e = e7;
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id, bad key", e);
            return null;
        } catch (IllegalBlockSizeException e8) {
            e = e8;
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id, bad key", e);
            return null;
        } catch (NoSuchPaddingException e9) {
            e = e9;
            ru.mail.libverify.utils.d.a("Installation", "Failed to decrypt installation id, no such algorithm", e);
            return null;
        } catch (Throwable th) {
            ru.mail.libverify.utils.c.a("Installation", "Failed to decrypt installation id", th);
            return null;
        }
    }

    private static void a(@NonNull Context context, @NonNull String str, @NonNull File file) {
        FileOutputStream fileOutputStream;
        try {
            fileOutputStream = new FileOutputStream(file);
        } catch (Throwable th) {
            th = th;
            fileOutputStream = null;
        }
        try {
            fileOutputStream.write(a(context, str));
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (Throwable th2) {
            th = th2;
            if (fileOutputStream != null) {
                fileOutputStream.close();
            }
            throw th;
        }
    }

    private static byte[] a(@NonNull Context context, @NonNull String str) {
        byte[] bytes = str.getBytes("UTF-8");
        if (Build.VERSION.SDK_INT < 18 || f(context).a()) {
            return bytes;
        }
        try {
            KeyPair g = g(context);
            Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1PADDING");
            cipher.init(1, g.getPublic());
            return cipher.doFinal(bytes);
        } catch (IllegalArgumentException e2) {
            e = e2;
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id (unsupported system locale)", e);
            f(context).a(context, true);
            return bytes;
        } catch (IllegalStateException e3) {
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id (credentials storage locked)", e3);
            f(context).a(context, true);
            return bytes;
        } catch (InvalidKeyException e4) {
            e = e4;
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id, no such algorithm", e);
            f(context).a(context, true);
            return bytes;
        } catch (NoSuchAlgorithmException e5) {
            e = e5;
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id, no such algorithm", e);
            f(context).a(context, true);
            return bytes;
        } catch (ProviderException e6) {
            e = e6;
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id (unsupported system locale)", e);
            f(context).a(context, true);
            return bytes;
        } catch (UnrecoverableKeyException e7) {
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id (private key error)", e7);
            f(context).a(context, true);
            return bytes;
        } catch (BadPaddingException e8) {
            e = e8;
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id (use plain text one)", e);
            f(context).a(context, true);
            return bytes;
        } catch (IllegalBlockSizeException e9) {
            e = e9;
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id (use plain text one)", e);
            f(context).a(context, true);
            return bytes;
        } catch (NoSuchPaddingException e10) {
            e = e10;
            ru.mail.libverify.utils.d.a("Installation", "Failed to encrypt installation id, no such algorithm", e);
            f(context).a(context, true);
            return bytes;
        } catch (Exception e11) {
            ru.mail.libverify.utils.c.a("Installation", "Failed to encrypt installation id (use plain text one)", e11);
            f(context).a(context, true);
            return bytes;
        }
    }

    public static synchronized boolean b(@NonNull Context context) {
        boolean exists;
        synchronized (i.class) {
            exists = !TextUtils.isEmpty(b) ? true : d(context).exists();
        }
        return exists;
    }

    public static synchronized void c(@NonNull Context context) {
        File file;
        synchronized (i.class) {
            b = null;
            File d2 = d(context);
            if (!d2.exists()) {
                f(context).a(context, false);
            } else {
                boolean delete = d2.delete();
                if (!delete && (delete = d2.renameTo((file = new File(ru.mail.libverify.utils.m.b(context), "VERIFY_INSTALLATION_TMP"))))) {
                    delete = file.delete();
                }
                ru.mail.libverify.utils.d.b("Installation", "installation file delete result " + delete);
                f(context).a(context, false);
            }
        }
    }

    private static File d(@NonNull Context context) {
        if (e == null) {
            e = new File(ru.mail.libverify.utils.m.b(context), "VERIFY_INSTALLATION");
        }
        return e;
    }

    private static String e(@NonNull Context context) {
        if (c == null) {
            c = String.format(Locale.US, "%s_libverify_installation_key", context.getPackageName());
        }
        return c;
    }

    private static j f(@NonNull Context context) {
        if (d == null) {
            d = new j(context);
        }
        return d;
    }

    @TargetApi(18)
    private static KeyPair g(@NonNull Context context) {
        KeyStore.Entry h = h(context);
        if (h == null) {
            try {
                ru.mail.libverify.utils.d.c("Installation", "try to remove key");
                a.b(e(context));
            } catch (Exception e2) {
                ru.mail.libverify.utils.d.a("Installation", "failed to clear key", e2);
            }
            GregorianCalendar gregorianCalendar = new GregorianCalendar(Locale.US);
            GregorianCalendar gregorianCalendar2 = new GregorianCalendar(Locale.US);
            gregorianCalendar2.add(1, 5);
            return Build.VERSION.SDK_INT >= 23 ? a.a("RSA", new KeyGenParameterSpec.Builder(e(context), 3).setDigests("SHA-256", "SHA-512").setSignaturePaddings("PKCS1").setEncryptionPaddings("PKCS1Padding").setKeyValidityStart(gregorianCalendar.getTime()).setKeyValidityEnd(gregorianCalendar2.getTime()).build()) : a.a("RSA", new KeyPairGeneratorSpec.Builder(context).setAlias(e(context)).setSubject(new X500Principal("CN=" + e(context))).setSerialNumber(BigInteger.valueOf(1337L)).setStartDate(gregorianCalendar.getTime()).setEndDate(gregorianCalendar2.getTime()).build());
        }
        return new KeyPair(((KeyStore.PrivateKeyEntry) h).getCertificate().getPublicKey(), ((KeyStore.PrivateKeyEntry) h).getPrivateKey());
    }

    private static KeyStore.Entry h(@NonNull Context context) {
        KeyStore.Entry entry = null;
        Exception e2 = null;
        int i = 0;
        while (i < 5) {
            try {
                entry = a.a(e(context));
            } catch (NullPointerException e3) {
                ru.mail.libverify.utils.d.a("Installation", "error raised during key search", e3);
            } catch (Exception e4) {
                e2 = e4;
                ru.mail.libverify.utils.d.a("Installation", e2, "error raised during key search on attempt %s", Integer.valueOf(i));
                i++;
                try {
                    ru.mail.libverify.utils.d.b("Installation", "failed to get extract key during attempt %s", Integer.valueOf(i));
                    synchronized (i.class) {
                        i.class.wait(i * i * 100);
                    }
                } catch (InterruptedException e5) {
                    ru.mail.libverify.utils.d.a("Installation", e5, "failed to wait timeout before next attempt", new Object[0]);
                }
            }
            return entry;
        }
        throw e2;
    }
}
