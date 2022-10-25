package com.google.android.gms.internal;
/* loaded from: classes2.dex */
public class zzanc {
    private static final boolean bka = w();

    private static boolean w() {
        try {
            Class.forName("android.app.Activity");
            return true;
        } catch (ClassNotFoundException e) {
            return false;
        }
    }

    public static boolean x() {
        return bka;
    }
}
