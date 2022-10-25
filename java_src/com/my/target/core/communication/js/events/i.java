package com.my.target.core.communication.js.events;

import java.util.List;
/* compiled from: JSStatEvent.java */
/* loaded from: classes2.dex */
public final class i extends a {
    private List<String> a;
    private String b;

    public final List<String> b() {
        return this.a;
    }

    public i(List<String> list, String str) {
        super("onStat");
        this.a = list;
        this.b = str;
    }
}
