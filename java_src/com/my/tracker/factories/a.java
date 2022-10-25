package com.my.tracker.factories;

import android.content.Context;
import com.my.tracker.async.commands.d;
import com.my.tracker.async.commands.g;
import com.my.tracker.async.commands.i;
import com.my.tracker.models.events.c;
/* compiled from: AsyncCommandsFactory.java */
/* loaded from: classes2.dex */
public final class a {
    public static d a(c cVar, com.my.tracker.database.a aVar, com.my.tracker.b bVar, Context context) {
        return new i(com.my.tracker.net.a.a(), cVar, aVar, bVar, context);
    }

    public static d a(long j, Context context) {
        return new g(j, context);
    }
}
