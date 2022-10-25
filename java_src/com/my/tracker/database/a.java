package com.my.tracker.database;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.support.v4.app.NotificationManagerCompat;
import com.facebook.internal.NativeProtocol;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.my.tracker.models.events.b;
import com.my.tracker.models.events.c;
import com.my.tracker.models.events.d;
import com.my.tracker.models.events.e;
import com.my.tracker.models.events.f;
import com.my.tracker.models.events.g;
import com.my.tracker.models.events.h;
import com.my.tracker.models.events.i;
import com.my.tracker.models.events.j;
import com.vkontakte.android.data.ServerKeys;
import io.reactivex.annotations.SchedulerSupport;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
/* compiled from: MyTrackerDBHelper.java */
/* loaded from: classes2.dex */
public final class a extends SQLiteOpenHelper {
    public a(String str, Context context) {
        super(context, "mytracker_" + str + ".db", (SQLiteDatabase.CursorFactory) null, 4);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onCreate(SQLiteDatabase sQLiteDatabase) {
        sQLiteDatabase.execSQL("CREATE TABLE table_events (id integer primary key autoincrement, type text not null, name text not null, timestamps_skipped integer not null, event_timestamp_start integer, value text not null, old_value text not null, params text not null  );");
        sQLiteDatabase.execSQL("CREATE TABLE table_sessions (sid integer not null, session_timestamp_start integer not null, session_timestamp_end integer  );");
        sQLiteDatabase.execSQL("CREATE TABLE table_timestamps (event_id integer not null, timestamp integer not null  );");
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onUpgrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS table_events");
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS table_sessions");
        sQLiteDatabase.execSQL("DROP TABLE IF EXISTS table_timestamps");
        onCreate(sQLiteDatabase);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public final void onDowngrade(SQLiteDatabase sQLiteDatabase, int i, int i2) {
        onUpgrade(sQLiteDatabase, i, i2);
    }

    public final int a() {
        Cursor rawQuery = getReadableDatabase().rawQuery("SELECT COUNT(*) FROM table_events", new String[0]);
        rawQuery.moveToFirst();
        int i = rawQuery.getInt(0);
        rawQuery.close();
        return i;
    }

    public final boolean a(c cVar, long j) {
        String a = cVar.a();
        if (SchedulerSupport.CUSTOM.equals(a)) {
            Cursor rawQuery = getReadableDatabase().rawQuery("SELECT COUNT(*) FROM table_events WHERE type=?", new String[]{a});
            rawQuery.moveToFirst();
            int i = rawQuery.getInt(0);
            rawQuery.close();
            if (i >= 500) {
                com.my.tracker.a.a("exceeded maximum number of custom events, event ignored");
                return false;
            }
        }
        com.my.tracker.a.a("insert event type: " + a);
        ContentValues contentValues = new ContentValues();
        contentValues.put(ServerKeys.TYPE, a);
        contentValues.put("name", cVar.b());
        contentValues.put("timestamps_skipped", Long.valueOf(cVar.h()));
        contentValues.put("event_timestamp_start", Long.valueOf(cVar.i()));
        contentValues.put("value", cVar.c());
        contentValues.put("old_value", cVar.d());
        contentValues.put(NativeProtocol.WEB_DIALOG_PARAMS, cVar.e());
        SQLiteDatabase writableDatabase = getWritableDatabase();
        long insert = writableDatabase.insert("table_events", null, contentValues);
        writableDatabase.beginTransaction();
        for (Long l : cVar.f()) {
            ContentValues contentValues2 = new ContentValues();
            contentValues2.put(JsonMarshaller.EVENT_ID, Long.valueOf(insert));
            contentValues2.put(JsonMarshaller.TIMESTAMP, Long.valueOf(l.longValue() - j));
            writableDatabase.insert("table_timestamps", null, contentValues2);
        }
        writableDatabase.setTransactionSuccessful();
        writableDatabase.endTransaction();
        com.my.tracker.a.a("events count: " + a());
        return true;
    }

    public final boolean a(c cVar, long j, long j2) {
        com.my.tracker.a.a("try to update event type: " + cVar.a());
        Cursor rawQuery = getReadableDatabase().rawQuery("SELECT id, event_timestamp_start, timestamps_skipped FROM table_events WHERE type=? AND name=? AND value=? AND old_value=? AND params=?", new String[]{cVar.a(), cVar.b(), cVar.c(), cVar.d(), cVar.e()});
        if (rawQuery.getCount() > 0) {
            rawQuery.moveToFirst();
            long j3 = rawQuery.getLong(rawQuery.getColumnIndex("id"));
            com.my.tracker.a.a("found event for update. id: " + j3);
            ContentValues contentValues = new ContentValues();
            if (cVar.a().equals("session")) {
                contentValues.put("event_timestamp_start", Long.valueOf(cVar.i()));
                if (rawQuery.isNull(rawQuery.getColumnIndex("event_timestamp_start"))) {
                    rawQuery.close();
                } else {
                    long j4 = rawQuery.getLong(rawQuery.getColumnIndex("event_timestamp_start"));
                    com.my.tracker.a.a("push session [" + (j4 - j) + "," + (j2 == 0 ? "null" : Long.valueOf(j2 - j)) + "]");
                    ContentValues contentValues2 = new ContentValues();
                    contentValues2.put("sid", Long.valueOf(j3));
                    contentValues2.put("session_timestamp_start", Long.valueOf(j4 - j));
                    if (j2 == 0) {
                        contentValues2.putNull("session_timestamp_end");
                    } else {
                        contentValues2.put("session_timestamp_end", Long.valueOf(j2 - j));
                    }
                    getWritableDatabase().insert("table_sessions", null, contentValues2);
                    int i = rawQuery.getInt(rawQuery.getColumnIndex("timestamps_skipped"));
                    rawQuery.close();
                    Cursor rawQuery2 = getReadableDatabase().rawQuery("SELECT COUNT(*) FROM table_sessions WHERE sid=?", new String[]{String.valueOf(j3)});
                    rawQuery2.moveToFirst();
                    int i2 = rawQuery2.getInt(0);
                    rawQuery2.close();
                    if (i2 > 500) {
                        int i3 = i2 - 500;
                        com.my.tracker.a.a("exceeded maximum number of sessions, remove oldest sessions. count: " + i3);
                        com.my.tracker.a.a("delete sessions");
                        com.my.tracker.a.a("deleted count: " + getWritableDatabase().delete("table_sessions", "rowid IN (SELECT rowid FROM table_sessions WHERE sid=? LIMIT ?)", new String[]{String.valueOf(j3), String.valueOf(i3)}));
                        contentValues.put("timestamps_skipped", Integer.valueOf(i + i3));
                    }
                }
            } else {
                long j5 = rawQuery.getLong(rawQuery.getColumnIndex("timestamps_skipped"));
                rawQuery.close();
                Cursor rawQuery3 = getReadableDatabase().rawQuery("SELECT COUNT(*) FROM table_timestamps WHERE event_id=?", new String[]{String.valueOf(j3)});
                rawQuery3.moveToFirst();
                int i4 = rawQuery3.getInt(0);
                rawQuery3.close();
                int size = cVar.f().size() + i4 + NotificationManagerCompat.IMPORTANCE_UNSPECIFIED;
                if (size > 0) {
                    com.my.tracker.a.a("delete timestamps");
                    int delete = getWritableDatabase().delete("table_timestamps", "rowid IN (SELECT rowid FROM table_timestamps WHERE event_id=? LIMIT ?)", new String[]{String.valueOf(j3), String.valueOf(size)});
                    com.my.tracker.a.a("deleted count: " + delete);
                    contentValues.put("timestamps_skipped", Long.valueOf(delete + j5));
                }
            }
            SQLiteDatabase writableDatabase = getWritableDatabase();
            if (contentValues.size() > 0) {
                writableDatabase.update("table_events", contentValues, "id=?", new String[]{String.valueOf(j3)});
            }
            writableDatabase.beginTransaction();
            for (Long l : cVar.f()) {
                ContentValues contentValues3 = new ContentValues();
                contentValues3.put(JsonMarshaller.EVENT_ID, Long.valueOf(j3));
                contentValues3.put(JsonMarshaller.TIMESTAMP, Long.valueOf(l.longValue() - j));
                writableDatabase.insert("table_timestamps", null, contentValues3);
            }
            writableDatabase.setTransactionSuccessful();
            writableDatabase.endTransaction();
            com.my.tracker.a.a("event updated");
            return true;
        }
        rawQuery.close();
        com.my.tracker.a.a("no events found for update");
        return false;
    }

    private ArrayList<Long[]> a(long j) {
        ArrayList<Long[]> arrayList = new ArrayList<>();
        Cursor rawQuery = getReadableDatabase().rawQuery("SELECT * FROM table_sessions WHERE sid=?", new String[]{String.valueOf(j)});
        if (rawQuery.getCount() > 0) {
            rawQuery.moveToFirst();
            while (!rawQuery.isAfterLast()) {
                Long[] lArr = {Long.valueOf(rawQuery.getLong(rawQuery.getColumnIndex("session_timestamp_start"))), null};
                if (!rawQuery.isNull(rawQuery.getColumnIndex("session_timestamp_end"))) {
                    lArr[1] = Long.valueOf(rawQuery.getLong(rawQuery.getColumnIndex("session_timestamp_end")));
                }
                arrayList.add(lArr);
                rawQuery.moveToNext();
            }
        }
        rawQuery.close();
        return arrayList;
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Type inference failed for: r12v1, types: [com.my.tracker.models.events.b] */
    /* JADX WARN: Type inference failed for: r3v25, types: [com.my.tracker.models.events.e] */
    /* JADX WARN: Type inference failed for: r3v26, types: [com.my.tracker.models.events.h] */
    /* JADX WARN: Type inference failed for: r3v27, types: [com.my.tracker.models.events.j] */
    /* JADX WARN: Type inference failed for: r3v28, types: [com.my.tracker.models.events.g] */
    /* JADX WARN: Type inference failed for: r3v29, types: [com.my.tracker.models.events.d] */
    /* JADX WARN: Type inference failed for: r5v1, types: [com.my.tracker.models.events.i] */
    public final List<c> b() {
        f fVar;
        ArrayList arrayList;
        Cursor rawQuery = getReadableDatabase().rawQuery("SELECT * FROM table_timestamps", new String[0]);
        HashMap hashMap = new HashMap();
        if (rawQuery.getCount() > 0) {
            rawQuery.moveToFirst();
            while (!rawQuery.isAfterLast()) {
                long j = rawQuery.getLong(rawQuery.getColumnIndex(JsonMarshaller.EVENT_ID));
                if (!hashMap.containsKey(Long.valueOf(j))) {
                    arrayList = new ArrayList();
                    hashMap.put(Long.valueOf(j), arrayList);
                } else {
                    arrayList = (ArrayList) hashMap.get(Long.valueOf(j));
                }
                arrayList.add(Long.valueOf(rawQuery.getLong(rawQuery.getColumnIndex(JsonMarshaller.TIMESTAMP))));
                rawQuery.moveToNext();
            }
        }
        rawQuery.close();
        ArrayList arrayList2 = new ArrayList();
        Cursor rawQuery2 = getReadableDatabase().rawQuery("SELECT * FROM table_events ORDER BY id", new String[0]);
        if (rawQuery2.getCount() > 0) {
            rawQuery2.moveToFirst();
            while (!rawQuery2.isAfterLast()) {
                long j2 = rawQuery2.getLong(rawQuery2.getColumnIndex("id"));
                String string = rawQuery2.getString(rawQuery2.getColumnIndex(ServerKeys.TYPE));
                String string2 = rawQuery2.getString(rawQuery2.getColumnIndex("name"));
                String string3 = rawQuery2.getString(rawQuery2.getColumnIndex("value"));
                rawQuery2.getString(rawQuery2.getColumnIndex("old_value"));
                String string4 = rawQuery2.getString(rawQuery2.getColumnIndex(NativeProtocol.WEB_DIALOG_PARAMS));
                long j3 = rawQuery2.getLong(rawQuery2.getColumnIndex("event_timestamp_start"));
                List list = (List) hashMap.get(Long.valueOf(j2));
                long j4 = rawQuery2.getLong(rawQuery2.getColumnIndex("timestamps_skipped"));
                char c = 65535;
                switch (string.hashCode()) {
                    case -1350309703:
                        if (string.equals("registration")) {
                            c = 5;
                            break;
                        }
                        break;
                    case -1183699191:
                        if (string.equals("invite")) {
                            c = 3;
                            break;
                        }
                        break;
                    case -1109843021:
                        if (string.equals("launch")) {
                            c = 6;
                            break;
                        }
                        break;
                    case -838846263:
                        if (string.equals("update")) {
                            c = 2;
                            break;
                        }
                        break;
                    case 103149417:
                        if (string.equals(FirebaseAnalytics.Event.LOGIN)) {
                            c = 4;
                            break;
                        }
                        break;
                    case 1250593422:
                        if (string.equals("level_achieved")) {
                            c = '\b';
                            break;
                        }
                        break;
                    case 1328981571:
                        if (string.equals("install_referrer")) {
                            c = 1;
                            break;
                        }
                        break;
                    case 1743324417:
                        if (string.equals(ProductAction.ACTION_PURCHASE)) {
                            c = '\t';
                            break;
                        }
                        break;
                    case 1957569947:
                        if (string.equals("install")) {
                            c = 0;
                            break;
                        }
                        break;
                    case 1984987798:
                        if (string.equals("session")) {
                            c = 7;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        fVar = new d(Long.valueOf(string3).longValue(), null, string4, list);
                        break;
                    case 1:
                        fVar = new g(string3, null, string4, list);
                        break;
                    case 2:
                        fVar = new j(string3, string2, null, string4, list);
                        break;
                    case 3:
                    case 4:
                    case 5:
                    case 6:
                        fVar = new i(string, string4, list, j4);
                        break;
                    case 7:
                        fVar = new h(j3, j4);
                        break;
                    case '\b':
                        fVar = new e(string4, list, j4);
                        break;
                    case '\t':
                        fVar = new f(string4, list);
                        break;
                    default:
                        fVar = new b(string2, string4, list, j4);
                        break;
                }
                fVar.c(j2);
                if (fVar.a().equals("session") && (fVar instanceof h)) {
                    h hVar = (h) fVar;
                    ArrayList<Long[]> a = a(hVar.j());
                    if (a.size() > 0) {
                        Iterator<Long[]> it = a.iterator();
                        while (it.hasNext()) {
                            hVar.a(it.next());
                        }
                        arrayList2.add(hVar);
                    }
                } else {
                    arrayList2.add(fVar);
                }
                rawQuery2.moveToNext();
            }
        }
        rawQuery2.close();
        return arrayList2;
    }
}
