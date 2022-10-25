package com.my.target.core.communication.js.events;
/* compiled from: JSAdStartEvent.java */
/* loaded from: classes2.dex */
public final class d extends a {
    private String a;
    private String[] b;

    public final String[] b() {
        return this.b;
    }

    public d(String[] strArr, String str) {
        super("onAdStart");
        this.a = str;
        this.b = strArr;
    }
}
