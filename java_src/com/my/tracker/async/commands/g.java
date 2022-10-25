package com.my.tracker.async.commands;

import android.content.Context;
/* compiled from: LastStopCommand.java */
/* loaded from: classes2.dex */
public final class g extends b {
    private final long b;

    public g(long j, Context context) {
        super(context);
        this.b = j;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.tracker.async.commands.a
    public final e c() {
        e c = super.c();
        if (c.a()) {
            try {
                com.my.tracker.utils.e a = com.my.tracker.utils.e.a().a(this.a);
                if (a != null) {
                    a.c(this.b);
                }
            } catch (Exception e) {
                c.a(false);
                com.my.tracker.a.a("Preference manager exception");
            }
        }
        return c;
    }
}
