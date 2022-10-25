package ru.mail.libverify.api;

import android.support.annotation.NonNull;
import java.util.Collection;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public interface w {

    /* JADX WARN: Failed to restore enum class, 'enum' modifier removed */
    /* loaded from: classes3.dex */
    public static final class a extends Enum<a> {
        public static final int a = 1;
        public static final int b = 2;
        public static final int c = 3;
        private static final /* synthetic */ int[] d = {a, b, c};

        public static int[] a() {
            return (int[]) d.clone();
        }
    }

    Collection<ae> a(int i);

    ae a(@NonNull String str);

    ae a(@NonNull String str, int i);

    ae a(@NonNull String str, @NonNull ae aeVar);

    boolean a();

    int b();

    List<String> b(int i);

    boolean b(@NonNull String str);

    void c();

    boolean c(@NonNull String str);

    ae d(@NonNull String str);

    boolean d();

    ae e(@NonNull String str);
}
