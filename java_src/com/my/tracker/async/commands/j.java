package com.my.tracker.async.commands;

import android.content.Context;
/* compiled from: TrackLaunchSessionCommand.java */
/* loaded from: classes2.dex */
public final class j extends f {
    private final com.my.tracker.models.events.c e;
    private final com.my.tracker.models.events.h f;
    private long g;

    public j(String str, com.my.tracker.database.a aVar, com.my.tracker.b bVar, long j, Context context) {
        super(str, aVar, bVar, context);
        this.g = j;
        this.e = com.my.tracker.factories.b.b("launch", null);
        this.f = new com.my.tracker.models.events.h();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.my.tracker.async.commands.a
    public final e c() {
        e c = super.c();
        if (!c.a()) {
            return c;
        }
        boolean a = a(this.e);
        if (this.g == 0) {
            try {
                com.my.tracker.utils.e a2 = com.my.tracker.utils.e.a().a(this.a);
                if (a2 != null) {
                    this.g = a2.i();
                }
            } catch (Throwable th) {
                com.my.tracker.a.a("PreferencesManager error: " + th);
            }
        }
        boolean a3 = a ? a(this.f, this.g) : a;
        if (a3) {
            a3 = a(com.my.tracker.enums.a.TIME_INTERVAL);
        }
        c.a(a3);
        return c;
    }
}
