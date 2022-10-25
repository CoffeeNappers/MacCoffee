package com.my.tracker.async.commands;

import android.content.Context;
/* compiled from: TrackEventCommand.java */
/* loaded from: classes2.dex */
public final class i extends f {
    private com.my.tracker.models.events.c e;

    public i(String str, com.my.tracker.models.events.c cVar, com.my.tracker.database.a aVar, com.my.tracker.b bVar, Context context) {
        super(str, aVar, bVar, context);
        this.e = cVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.tracker.async.commands.a
    public final e c() {
        e c = super.c();
        if (!c.a()) {
            return c;
        }
        boolean a = a(this.e);
        if (a) {
            a = a(com.my.tracker.enums.a.EVENTS_COUNT);
        }
        c.a(a);
        return c;
    }
}
