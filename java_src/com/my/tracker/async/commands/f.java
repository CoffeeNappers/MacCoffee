package com.my.tracker.async.commands;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import io.reactivex.annotations.SchedulerSupport;
import java.util.List;
/* compiled from: EventsActionCommand.java */
/* loaded from: classes2.dex */
public abstract class f extends c {
    private com.my.tracker.database.a e;

    public f(String str, com.my.tracker.database.a aVar, com.my.tracker.b bVar, Context context) {
        super(str, bVar, context);
        this.e = aVar;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean a(com.my.tracker.models.events.c cVar) {
        return a(cVar, 0L);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean a(com.my.tracker.models.events.c cVar, long j) {
        try {
            com.my.tracker.utils.e a = com.my.tracker.utils.e.a().a(this.a);
            long e = a.e();
            if (e == 0) {
                e = cVar.g();
                a.b(e);
            }
            if (!this.e.a(cVar, e, j) && !this.e.a(cVar, e) && cVar.a().equals(SchedulerSupport.CUSTOM)) {
                a.a(a.d() + 1);
            }
            return true;
        } catch (Throwable th) {
            com.my.tracker.a.a("PreferencesManager error: " + th);
            return false;
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public final boolean a(com.my.tracker.enums.a aVar) {
        boolean z;
        long j;
        if (!e()) {
            com.my.tracker.a.a("no internet connection");
            return false;
        }
        try {
            com.my.tracker.utils.e a = com.my.tracker.utils.e.a().a(this.a);
            com.my.tracker.a.a("send criterion: " + aVar.name());
            if (aVar != com.my.tracker.enums.a.MAJOR_EVENT) {
                if (aVar == com.my.tracker.enums.a.EVENTS_COUNT) {
                    z = this.e.a() >= 100;
                } else {
                    z = aVar == com.my.tracker.enums.a.TIME_INTERVAL;
                }
            } else {
                Cursor rawQuery = this.e.getReadableDatabase().rawQuery("SELECT COUNT(*) FROM table_events WHERE type IN ('install','install_referrer','update')", new String[0]);
                rawQuery.moveToFirst();
                int i = rawQuery.getInt(0);
                rawQuery.close();
                z = i > 0;
            }
            if (!z) {
                return true;
            }
            com.my.tracker.a.a("criterion accepted");
            List<com.my.tracker.models.events.c> b = this.e.b();
            int size = b.size();
            if (size > 0) {
                d();
                com.my.tracker.builders.a aVar2 = new com.my.tracker.builders.a();
                aVar2.a(a.e());
                aVar2.b(System.currentTimeMillis() / 1000);
                long d = a.d();
                if (d > 0) {
                    aVar2.c(d);
                }
                com.my.tracker.providers.e.a().a(aVar2);
                this.c.a(aVar2);
                aVar2.a(b);
                String aVar3 = aVar2.toString();
                com.my.tracker.a.a("send events. count: " + size);
                boolean a2 = a(aVar3);
                if (a2) {
                    com.my.tracker.a.a("events sent successfully");
                    com.my.tracker.database.a aVar4 = this.e;
                    com.my.tracker.a.a("delete all events except running sessions");
                    int delete = aVar4.getWritableDatabase().delete("table_events", "type <>?  AND event_timestamp_start IS NOT NULL", new String[]{"session"});
                    aVar4.getWritableDatabase().delete("table_timestamps", null, null);
                    com.my.tracker.a.a("deleted count: " + delete);
                    com.my.tracker.database.a aVar5 = this.e;
                    com.my.tracker.a.a("delete all sessions");
                    com.my.tracker.a.a("deleted count: " + aVar5.getWritableDatabase().delete("table_sessions", null, null));
                    Cursor rawQuery2 = this.e.getReadableDatabase().rawQuery("SELECT COUNT(*) FROM table_events WHERE type =?", new String[]{"session"});
                    rawQuery2.moveToFirst();
                    int i2 = rawQuery2.getInt(0);
                    rawQuery2.close();
                    if (!(i2 > 0)) {
                        a.b(0L);
                    } else {
                        Cursor rawQuery3 = this.e.getReadableDatabase().rawQuery("SELECT event_timestamp_start FROM table_events WHERE type=? AND event_timestamp_start IS NOT NULL ", new String[]{"session"});
                        if (rawQuery3.getCount() > 0) {
                            rawQuery3.moveToFirst();
                            j = rawQuery3.getLong(rawQuery3.getColumnIndex("event_timestamp_start"));
                            rawQuery3.close();
                        } else {
                            j = 0;
                        }
                        a.b(j);
                    }
                    com.my.tracker.database.a aVar6 = this.e;
                    ContentValues contentValues = new ContentValues();
                    contentValues.put("timestamps_skipped", (Integer) 0);
                    aVar6.getWritableDatabase().update("table_events", contentValues, null, null);
                    a.a(0L);
                    com.my.tracker.providers.e.a().a(this.a);
                    return a2;
                }
                com.my.tracker.a.a("Send events failed");
                return a2;
            }
            com.my.tracker.a.a("no events to send");
            return true;
        } catch (Throwable th) {
            com.my.tracker.a.a("PreferencesManager error: " + th);
            return false;
        }
    }
}
