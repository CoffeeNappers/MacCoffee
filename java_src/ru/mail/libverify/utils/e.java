package ru.mail.libverify.utils;
/* loaded from: classes3.dex */
public interface e {

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

    String a();

    String a(String str);

    void b();
}
