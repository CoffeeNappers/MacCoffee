package com.my.target.core.communication.js.events;
/* compiled from: JSErrorEvent.java */
/* loaded from: classes2.dex */
public final class e extends a {
    private String a;

    public final String b() {
        return this.a;
    }

    public e(String str) {
        super("onError");
        this.a = str;
    }

    public e() {
        super("onError");
    }
}
