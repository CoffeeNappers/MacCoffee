package ru.mail.libverify.utils;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.io.ByteArrayOutputStream;
import java.io.PrintStream;
import java.io.UnsupportedEncodingException;
/* loaded from: classes3.dex */
public final class c {
    public static volatile a a;

    /* loaded from: classes3.dex */
    public interface a {
        void a(Throwable th);
    }

    public static String a(@NonNull Throwable th, @Nullable Thread thread) {
        String str = null;
        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
        try {
            PrintStream printStream = new PrintStream(byteArrayOutputStream, false, "UTF-8");
            if (thread != null) {
                try {
                    printStream.append((CharSequence) thread.getName()).append("\n");
                } catch (Exception e) {
                } finally {
                    printStream.close();
                }
            }
            th.printStackTrace(printStream);
            str = byteArrayOutputStream.toString("UTF-8");
        } catch (UnsupportedEncodingException e2) {
        }
        return str;
    }

    public static void a(@NonNull String str, @Nullable String str2, @NonNull Throwable th) {
        d.a(str, str2, th);
        if (a != null) {
            a.a(th);
        }
    }

    public static void a(@NonNull String str, @NonNull Throwable th, @NonNull String str2, Object... objArr) {
        d.a(str, th, str2, objArr);
        if (a != null) {
            a aVar = a;
            String.format(str2, objArr);
            aVar.a(th);
        }
    }
}
