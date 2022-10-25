package ru.mail.libverify.api;

import android.support.annotation.NonNull;
/* loaded from: classes3.dex */
public interface ac {

    /* loaded from: classes3.dex */
    public static class a {
        public final String a;
        public final String b;
        public final String c;
        public final Boolean d;
        public final String e;
        public final String f;
        public final String g;
        public final String h;

        public a(@NonNull String str, @NonNull String str2, @NonNull String str3, @NonNull String str4, @NonNull String str5, String str6, Boolean bool, String str7) {
            this.a = str2;
            this.b = str4;
            this.c = str6;
            this.d = bool;
            this.e = str3;
            this.f = str;
            this.g = str7;
            this.h = str5;
        }

        public final String toString() {
            return "UINotificationInfo{message='" + this.a + "', from='" + this.b + "', confirmText='" + this.c + "', confirmEnabled=" + this.d + ", phone='" + this.e + "', notificationId='" + this.f + "', description='" + this.g + "', deliveryMethod='" + this.h + "'}";
        }
    }

    /* loaded from: classes3.dex */
    public interface b {
        void a(a aVar);
    }

    void a(@NonNull String str, int i);

    void a(@NonNull String str, @NonNull b bVar);

    void i(@NonNull String str);

    void j(@NonNull String str);

    void k(@NonNull String str);
}
