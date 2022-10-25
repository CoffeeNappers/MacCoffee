package com.my.tracker.async.commands;

import android.content.Context;
/* compiled from: SendEventsCommand.java */
/* loaded from: classes2.dex */
public final class h extends f {
    private com.my.tracker.enums.a e;

    public h(String str, com.my.tracker.enums.a aVar, com.my.tracker.database.a aVar2, com.my.tracker.b bVar, Context context) {
        super(str, aVar2, bVar, context);
        this.e = aVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.tracker.async.commands.a
    public final e c() {
        e c = super.c();
        if (c.a()) {
            c.a(a(this.e));
        }
        return c;
    }
}
