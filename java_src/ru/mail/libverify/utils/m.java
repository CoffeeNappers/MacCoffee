package ru.mail.libverify.utils;

import android.annotation.TargetApi;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.res.Resources;
import android.database.Cursor;
import android.net.Proxy;
import android.os.BatteryManager;
import android.os.Build;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import android.util.Base64;
import com.google.android.gms.common.GoogleApiAvailability;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.fabric.sdk.android.services.common.CommonUtils;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.io.UnsupportedEncodingException;
import java.security.KeyStore;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.cert.Certificate;
import java.security.cert.CertificateFactory;
import java.util.Locale;
import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManagerFactory;
/* loaded from: classes3.dex */
public final class m {
    public static int a(Context context) {
        try {
            return context.getPackageManager().getPackageInfo(context.getPackageName(), 0).versionCode;
        } catch (PackageManager.NameNotFoundException e) {
            throw new RuntimeException("Could not get package name: " + e);
        }
    }

    public static String a(Bundle bundle) {
        if (bundle == null) {
            return "null";
        }
        StringBuilder sb = new StringBuilder();
        for (String str : bundle.keySet()) {
            if (str != null && bundle.get(str) != null) {
                sb.append(str).append("='").append(bundle.get(str).toString()).append("', ");
            }
        }
        return sb.toString();
    }

    public static String a(@NonNull File file) {
        RandomAccessFile randomAccessFile;
        try {
            randomAccessFile = new RandomAccessFile(file, "r");
        } catch (Throwable th) {
            th = th;
            randomAccessFile = null;
        }
        try {
            byte[] bArr = new byte[(int) randomAccessFile.length()];
            randomAccessFile.readFully(bArr);
            String str = new String(bArr, "UTF-8");
            try {
                randomAccessFile.close();
            } catch (IOException e) {
                d.a("Utils", "failed to close file", e);
            }
            return str;
        } catch (Throwable th2) {
            th = th2;
            if (randomAccessFile != null) {
                try {
                    randomAccessFile.close();
                } catch (IOException e2) {
                    d.a("Utils", "failed to close file", e2);
                }
            }
            throw th;
        }
    }

    public static String a(@NonNull String str) {
        try {
            byte[] bytes = str.getBytes("UTF-8");
            try {
                MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
                messageDigest.reset();
                messageDigest.update(bytes);
                return a(messageDigest.digest());
            } catch (NoSuchAlgorithmException e) {
                d.a("Utils", "stringToSHA256", e);
                return a(ru.mail.libverify.utils.bouncycastle.c.a(bytes));
            }
        } catch (UnsupportedEncodingException e2) {
            return str;
        }
    }

    public static String a(@NonNull Locale locale) {
        String language = locale.getLanguage();
        String country = locale.getCountry();
        return TextUtils.isEmpty(language) ? "en_US" : !TextUtils.isEmpty(country) ? language + '_' + country : language;
    }

    public static String a(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bArr) {
            if ((b & 255) < 16) {
                sb.append('0');
            }
            sb.append(Integer.toHexString(b & 255));
        }
        return String.valueOf(sb);
    }

    public static void a(Cursor cursor) {
        if (cursor == null || cursor.isClosed()) {
            return;
        }
        cursor.close();
    }

    public static void a(@NonNull File file, @NonNull String str) {
        FileOutputStream fileOutputStream;
        try {
            fileOutputStream = new FileOutputStream(file);
        } catch (Throwable th) {
            th = th;
            fileOutputStream = null;
        }
        try {
            fileOutputStream.write(str.getBytes("UTF-8"));
            fileOutputStream.close();
            try {
                fileOutputStream.close();
            } catch (IOException e) {
                d.a("Utils", "failed to close file", e);
            }
        } catch (Throwable th2) {
            th = th2;
            if (fileOutputStream != null) {
                try {
                    fileOutputStream.close();
                } catch (IOException e2) {
                    d.a("Utils", "failed to close file", e2);
                }
            }
            throw th;
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:17:0x0025 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean a(@android.support.annotation.NonNull android.content.Context r8, @android.support.annotation.NonNull java.lang.String r9) {
        /*
            r2 = 1
            r1 = 0
            android.content.pm.PackageManager r0 = r8.getPackageManager()     // Catch: java.lang.Throwable -> L3a
            java.lang.String r0 = r0.getInstallerPackageName(r9)     // Catch: java.lang.Throwable -> L3a
            android.content.pm.PackageManager r3 = r8.getPackageManager()     // Catch: java.lang.Throwable -> L3a
            java.lang.String r4 = r8.getPackageName()     // Catch: java.lang.Throwable -> L3a
            java.lang.String r3 = r3.getInstallerPackageName(r4)     // Catch: java.lang.Throwable -> L3a
            boolean r4 = android.text.TextUtils.isEmpty(r0)     // Catch: java.lang.Throwable -> L3a
            if (r4 != 0) goto L38
            boolean r0 = android.text.TextUtils.equals(r0, r3)     // Catch: java.lang.Throwable -> L3a
            if (r0 == 0) goto L38
            r0 = r2
        L23:
            if (r0 != 0) goto L37
            java.lang.String r4 = "Utils"
            java.lang.String r5 = "Package %s was installed manually or installer is not equal to %s"
            r6 = 2
            java.lang.Object[] r6 = new java.lang.Object[r6]     // Catch: java.lang.Throwable -> L4a
            r7 = 0
            r6[r7] = r9     // Catch: java.lang.Throwable -> L4a
            r7 = 1
            r6[r7] = r3     // Catch: java.lang.Throwable -> L4a
            ru.mail.libverify.utils.d.b(r4, r5, r6)     // Catch: java.lang.Throwable -> L4a
        L37:
            return r0
        L38:
            r0 = r1
            goto L23
        L3a:
            r0 = move-exception
            r0 = r1
        L3c:
            java.lang.String r3 = "Utils"
            java.lang.String r4 = "Failed to get package %s installer name"
            java.lang.Object[] r2 = new java.lang.Object[r2]
            r2[r1] = r9
            ru.mail.libverify.utils.d.a(r3, r4, r2)
            goto L37
        L4a:
            r3 = move-exception
            goto L3c
        */
        throw new UnsupportedOperationException("Method not decompiled: ru.mail.libverify.utils.m.a(android.content.Context, java.lang.String):boolean");
    }

    @TargetApi(16)
    public static boolean a(@NonNull Context context, @NonNull String str, @NonNull String str2) {
        if (Build.VERSION.SDK_INT < 16) {
            return false;
        }
        try {
            PackageInfo packageInfo = context.getPackageManager().getPackageInfo(str, 4096);
            for (int i = 0; i < packageInfo.requestedPermissions.length; i++) {
                if (TextUtils.equals(packageInfo.requestedPermissions[i], str2) && (packageInfo.requestedPermissionsFlags[i] & 2) == 2) {
                    return true;
                }
            }
            d.b("Utils", "Package %s hasn't permission %s", str, str2);
            return false;
        } catch (Throwable th) {
            d.a("Utils", "Failed to check package %s permission %s", str, str2);
            return false;
        }
    }

    public static File b(@NonNull Context context) {
        return Build.VERSION.SDK_INT >= 21 ? context.getNoBackupFilesDir() : context.getFilesDir();
    }

    public static String b(@NonNull String str) {
        String a;
        try {
            byte[] bytes = str.getBytes("UTF-8");
            try {
                MessageDigest messageDigest = MessageDigest.getInstance(CommonUtils.MD5_INSTANCE);
                messageDigest.reset();
                messageDigest.update(bytes);
                a = a(messageDigest.digest());
            } catch (NoSuchAlgorithmException e) {
                d.a("Utils", "stringToMD5", e);
                try {
                    byte[] bytes2 = str.getBytes("UTF-8");
                    int[] iArr = new int[16];
                    int[] iArr2 = {1732584193, -271733879, -1732584194, 271733878};
                    int[] iArr3 = new int[2];
                    byte[] bArr = new byte[64];
                    g.a(bytes2, bytes2.length, iArr, iArr2, iArr3, bArr);
                    byte[] a2 = g.a(new byte[16], iArr3, 8);
                    byte[] bArr2 = new byte[64];
                    bArr2[0] = Byte.MIN_VALUE;
                    int i = (iArr3[0] >>> 3) & 63;
                    g.a(bArr2, i < 56 ? 56 - i : 120 - i, iArr, iArr2, iArr3, bArr);
                    g.a(a2, 8, iArr, iArr2, iArr3, bArr);
                    a = a(g.a(a2, iArr2, 16));
                } catch (UnsupportedEncodingException e2) {
                    return str;
                }
            }
            return a;
        } catch (UnsupportedEncodingException e3) {
            return str;
        }
    }

    public static boolean b(@NonNull Context context, @NonNull String str) {
        try {
            return ContextCompat.checkSelfPermission(context, str) == 0;
        } catch (Exception e) {
            d.a("Utils", "Failed to check self permission %s", str);
            return false;
        }
    }

    public static String c(String str) {
        String str2 = "";
        for (int i = 0; i < str.length(); i++) {
            try {
                str2 = str2 + Integer.toHexString(str.charAt(i));
            } catch (Exception e) {
            }
        }
        return str2;
    }

    public static SSLContext c(@NonNull Context context, @NonNull String str) {
        try {
            return d(context, str);
        } catch (Throwable th) {
            throw new IOException(th);
        }
    }

    public static boolean c(@NonNull Context context) {
        try {
            String property = Build.VERSION.SDK_INT >= 14 ? System.getProperty("http.proxyHost") : Proxy.getHost(context);
            d.b("Utils", "proxy host %s", property);
            return !TextUtils.isEmpty(property);
        } catch (Throwable th) {
            d.a("Utils", "Failed to check proxy settings", th);
            return false;
        }
    }

    @Nullable
    public static Boolean d(@NonNull Context context) {
        Boolean valueOf;
        try {
            if (Build.VERSION.SDK_INT >= 22) {
                valueOf = Boolean.valueOf(((TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE)).isVoiceCapable());
            } else {
                int identifier = Resources.getSystem().getIdentifier("config_voice_capable", "bool", AbstractSpiCall.ANDROID_CLIENT_TYPE);
                valueOf = identifier == 0 ? null : Boolean.valueOf(context.getResources().getBoolean(identifier));
            }
            return valueOf;
        } catch (Throwable th) {
            d.a("Utils", "failed to get voice capable property");
            return null;
        }
    }

    public static String d(@NonNull String str) {
        try {
            return Base64.encodeToString(str.getBytes("UTF-8"), 2);
        } catch (UnsupportedEncodingException e) {
            return str;
        }
    }

    private static SSLContext d(@NonNull Context context, @NonNull String str) {
        CertificateFactory certificateFactory = CertificateFactory.getInstance("X.509");
        BufferedInputStream bufferedInputStream = new BufferedInputStream(context.getResources().openRawResource(context.getResources().getIdentifier(str, "raw", context.getPackageName())));
        try {
            Certificate generateCertificate = certificateFactory.generateCertificate(bufferedInputStream);
            bufferedInputStream.close();
            KeyStore keyStore = KeyStore.getInstance(KeyStore.getDefaultType());
            keyStore.load(null, null);
            keyStore.setCertificateEntry("ca", generateCertificate);
            TrustManagerFactory trustManagerFactory = TrustManagerFactory.getInstance(TrustManagerFactory.getDefaultAlgorithm());
            trustManagerFactory.init(keyStore);
            SSLContext sSLContext = SSLContext.getInstance("TLS");
            sSLContext.init(null, trustManagerFactory.getTrustManagers(), null);
            return sSLContext;
        } catch (Throwable th) {
            bufferedInputStream.close();
            throw th;
        }
    }

    @Nullable
    public static Boolean e(@NonNull Context context) {
        try {
            return Boolean.valueOf(((TelephonyManager) context.getSystemService(SignupPhoneFragment.KEY_PHONE)).isNetworkRoaming());
        } catch (Throwable th) {
            d.a("Utils", "failed to detect roaming");
            return null;
        }
    }

    public static byte[] e(@NonNull String str) {
        try {
            return Base64.decode(str.getBytes("UTF-8"), 2);
        } catch (UnsupportedEncodingException e) {
            return null;
        }
    }

    @Nullable
    public static Integer f(@NonNull Context context) {
        Integer valueOf;
        try {
            if (Build.VERSION.SDK_INT >= 21) {
                valueOf = Integer.valueOf(((BatteryManager) context.getSystemService("batterymanager")).getIntProperty(4));
            } else {
                Intent registerReceiver = context.registerReceiver(null, new IntentFilter("android.intent.action.BATTERY_CHANGED"));
                if (registerReceiver == null) {
                    d.a("Utils", "failed to get intent for battery level");
                    valueOf = null;
                } else {
                    int intExtra = registerReceiver.getIntExtra("level", -1);
                    int intExtra2 = registerReceiver.getIntExtra("scale", -1);
                    valueOf = (intExtra == -1 || intExtra2 == -1) ? null : intExtra2 != 0 ? Integer.valueOf(Math.round((intExtra / intExtra2) * 100.0f)) : null;
                }
            }
            return valueOf;
        } catch (Throwable th) {
            d.a("Utils", "failed to get battery status");
            return null;
        }
    }

    public static String f(String str) {
        String str2;
        if (!TextUtils.isEmpty(str)) {
            char[] charArray = str.toCharArray();
            str = "";
            int length = charArray.length;
            int i = 0;
            boolean z = true;
            while (i < length) {
                char c = charArray[i];
                if (!z || !Character.isLetter(c)) {
                    if (Character.isWhitespace(c)) {
                        z = true;
                    }
                    str2 = str + c;
                } else {
                    str2 = str + Character.toUpperCase(c);
                    z = false;
                }
                i++;
                str = str2;
            }
        }
        return str;
    }

    public static boolean g(@NonNull Context context) {
        try {
            int isGooglePlayServicesAvailable = GoogleApiAvailability.getInstance().isGooglePlayServicesAvailable(context);
            d.b("Utils", "play services api availability %d", Integer.valueOf(isGooglePlayServicesAvailable));
            return isGooglePlayServicesAvailable == 0;
        } catch (Throwable th) {
            return false;
        }
    }
}
