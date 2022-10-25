package com.vkontakte.android.cache;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.vkontakte.android.Log;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes2.dex */
public class GroupsCache {

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class CacheOpenHelper extends SQLiteOpenHelper {
        public CacheOpenHelper(Context context) {
            super(context, "groups.db", (SQLiteDatabase.CursorFactory) null, 10);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            CacheTables.createGroups(db);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            onCreate(db);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getWritableDatabase() {
            SQLiteDatabase db = super.getWritableDatabase();
            db.setLockingEnabled(false);
            return db;
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getReadableDatabase() {
            SQLiteDatabase db = super.getReadableDatabase();
            db.setLockingEnabled(false);
            return db;
        }
    }

    public static List<Group> get() {
        CacheOpenHelper helper = new CacheOpenHelper(VKApplication.context);
        SQLiteDatabase db = helper.getReadableDatabase();
        List<Group> result = new ArrayList<>();
        try {
            Cursor cursor = db.query("groups", null, null, null, null, null, null);
            if (cursor != null && cursor.getCount() > 0) {
                cursor.moveToFirst();
                ContentValues values = new ContentValues();
                do {
                    DatabaseUtils.cursorRowToContentValues(cursor, values);
                    Group group = new Group();
                    group.id = values.getAsInteger("id").intValue();
                    group.name = values.getAsString("title");
                    group.photo = values.getAsString("photo");
                    group.activity = values.getAsString("activity");
                    group.domain = values.getAsString("domain");
                    group.type = values.getAsInteger(ServerKeys.TYPE).intValue();
                    group.startTime = values.getAsInteger("event_time").intValue();
                    group.isClosed = values.getAsInteger("closed").intValue();
                    group.isAdmin = values.getAsInteger("admin").intValue() == 1;
                    group.adminLevel = values.getAsInteger("admin_level").intValue();
                    group.verified = values.getAsInteger("verified").intValue() == 1;
                    group.members_count = values.getAsInteger(ServerKeys.MEMBERS_COUNT).intValue();
                    result.add(group);
                } while (cursor.moveToNext());
            }
        } catch (Exception x) {
            Log.e("vk", "Error reading groups cache DB!", x);
        }
        try {
            db.close();
            helper.close();
        } catch (Exception e) {
        }
        return result;
    }

    public static List<Group> get(Context context, int count) {
        CacheOpenHelper helper = new CacheOpenHelper(context);
        SQLiteDatabase db = helper.getReadableDatabase();
        List<Group> result = new ArrayList<>();
        int i = 0;
        try {
            Cursor cursor = db.query("groups", null, null, null, null, null, null);
            if (cursor != null && cursor.getCount() > 0) {
                cursor.moveToFirst();
                ContentValues values = new ContentValues();
                do {
                    DatabaseUtils.cursorRowToContentValues(cursor, values);
                    Group group = new Group();
                    group.id = values.getAsInteger("id").intValue();
                    group.name = values.getAsString("title");
                    group.photo = values.getAsString("photo");
                    group.activity = values.getAsString("activity");
                    group.domain = values.getAsString("domain");
                    group.type = values.getAsInteger(ServerKeys.TYPE).intValue();
                    group.startTime = values.getAsInteger("event_time").intValue();
                    group.isClosed = values.getAsInteger("closed").intValue();
                    group.isAdmin = values.getAsBoolean("admin").booleanValue();
                    group.adminLevel = values.getAsInteger("admin_level").intValue();
                    group.verified = values.getAsInteger("verified").intValue() == 1;
                    group.members_count = values.getAsInteger(ServerKeys.MEMBERS_COUNT).intValue();
                    result.add(group);
                    i++;
                    if (i < count) {
                    }
                } while (cursor.moveToNext());
            }
        } catch (Exception x) {
            Log.e("vk", "Error reading groups cache DB!", x);
        }
        try {
            db.close();
            helper.close();
        } catch (Exception e) {
        }
        return result;
    }

    public static void replace(List<Group> items) {
        CacheOpenHelper helper = new CacheOpenHelper(VKApplication.context);
        SQLiteDatabase db = null;
        try {
            try {
                db = helper.getWritableDatabase();
                db.beginTransaction();
                db.delete("groups", null, null);
                for (Group g : items) {
                    ContentValues values = new ContentValues();
                    values.put("id", Integer.valueOf(g.id));
                    values.put("title", g.name);
                    values.put("photo", g.photo);
                    values.put("activity", g.activity);
                    values.put(ServerKeys.TYPE, Integer.valueOf(g.type));
                    values.put("closed", Integer.valueOf(g.isClosed));
                    values.put("admin", Boolean.valueOf(g.isAdmin));
                    values.put("admin_level", Integer.valueOf(g.adminLevel));
                    values.put("event_time", Integer.valueOf(g.startTime));
                    values.put("verified", Integer.valueOf(g.verified ? 1 : 0));
                    values.put("domain", g.domain);
                    values.put(ServerKeys.MEMBERS_COUNT, Integer.valueOf(g.members_count));
                    db.insert("groups", null, values);
                }
                db.setTransactionSuccessful();
                if (db != null) {
                    db.endTransaction();
                }
            } catch (Exception x) {
                Log.e("vk", "Error writing groups cache DB!", x);
                if (db != null) {
                    db.endTransaction();
                }
            }
            if (db != null) {
                db.close();
            }
            helper.close();
        } catch (Throwable th) {
            if (db != null) {
                db.endTransaction();
            }
            throw th;
        }
    }

    public static void add(Group g, Context context) {
        CacheOpenHelper helper = new CacheOpenHelper(context);
        SQLiteDatabase db = helper.getWritableDatabase();
        try {
            ContentValues values = new ContentValues();
            values.put("id", Integer.valueOf(g.id));
            values.put("title", g.name);
            values.put("photo", g.photo);
            values.put("activity", g.activity);
            values.put(ServerKeys.TYPE, Integer.valueOf(g.type));
            values.put("closed", Integer.valueOf(g.isClosed));
            values.put("admin", Boolean.valueOf(g.isAdmin));
            values.put("admin_level", Integer.valueOf(g.adminLevel));
            values.put("domain", g.domain);
            values.put("event_time", Integer.valueOf(g.startTime));
            values.put("verified", Integer.valueOf(g.verified ? 1 : 0));
            db.insert("groups", null, values);
        } catch (Exception x) {
            Log.e("vk", "Error writing friends cache DB!", x);
        }
        db.close();
        helper.close();
    }

    public static void remove(int gid, Context context) {
        CacheOpenHelper helper = new CacheOpenHelper(context);
        SQLiteDatabase db = helper.getWritableDatabase();
        try {
            db.delete("groups", "`id`=" + gid, null);
        } catch (Exception x) {
            Log.e("vk", "Error writing groups cache DB!", x);
        }
        db.close();
        helper.close();
    }

    public static boolean hasEntries(Context context) {
        try {
            CacheOpenHelper helper = new CacheOpenHelper(context);
            SQLiteDatabase db = helper.getReadableDatabase();
            Cursor cursor = db.rawQuery("SELECT COUNT(*) FROM `groups`", null);
            cursor.moveToFirst();
            boolean result = cursor.getInt(0) > 0;
            cursor.close();
            db.close();
            helper.close();
            return result;
        } catch (Exception x) {
            Log.e("vk", "Error reading groups cache DB!", x);
            return false;
        }
    }
}
