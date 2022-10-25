package ru.mail.libverify.accounts;

import android.support.annotation.Nullable;
import android.text.TextUtils;
/* loaded from: classes3.dex */
public final class e {
    String a;
    String b;
    String c;
    public String d;
    String e;
    String f;
    public boolean g;
    public boolean h;
    public String i;
    public String j;
    public String k;
    public String l;
    public String m;

    public static String a(@Nullable String str) {
        if (TextUtils.isEmpty(str) || str.length() < 3) {
            return null;
        }
        return str.substring(0, 3);
    }

    public static String b(@Nullable String str) {
        if (TextUtils.isEmpty(str) || str.length() < 5) {
            return null;
        }
        return str.substring(3);
    }

    public final String toString() {
        return "SimCardData{subscriberId='" + this.a + "', imsi='" + this.b + "', imei='" + this.c + "', simCountryIso='" + this.d + "', simPhoneNumber='" + this.e + "', simState='" + this.f + "'}";
    }
}
