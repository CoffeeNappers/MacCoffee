package com.vkontakte.android.cache;

import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.preference.PreferenceManager;
import android.support.annotation.Nullable;
import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.NewsfeedList;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.concurrent.Semaphore;
/* loaded from: classes2.dex */
public class NewsfeedCache {
    private static final String INCREMENT_ORDER_PREFIX = "UPDATE news SET order_position = order_position + ";
    private static final String INCREMENT_ORDER_SUFFIX = " WHERE order_position >= 0";
    private static Semaphore semaphore = new Semaphore(1);
    private static Boolean isNewsfeedTop = null;

    public static SQLiteDatabase getWritableDatabase() {
        return CacheOpenHelper.getInstance(VKApplication.context).getWritableDatabase();
    }

    public static SQLiteDatabase getReadableDatabase() {
        return CacheOpenHelper.getInstance(VKApplication.context).getReadableDatabase();
    }

    /* loaded from: classes2.dex */
    public static class CacheOpenHelper extends SQLiteOpenHelper {
        private static volatile CacheOpenHelper instance = null;

        public CacheOpenHelper(Context context) {
            super(context, "posts.db", (SQLiteDatabase.CursorFactory) null, 27);
        }

        public static void clearInstance() {
            instance = null;
        }

        public static CacheOpenHelper getInstance(Context ctx) {
            if (instance == null) {
                synchronized (CacheOpenHelper.class) {
                    if (instance == null) {
                        instance = new CacheOpenHelper(ctx.getApplicationContext());
                    }
                }
            }
            return instance;
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            CacheTables.createPosts(db);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            onCreate(db);
        }
    }

    public static String saveFrom(String from) {
        PreferenceManager.getDefaultSharedPreferences(VKApplication.context).edit().putString("newFromPaging", from == null ? AppEventsConstants.EVENT_PARAM_VALUE_NO : from).apply();
        return from;
    }

    public static int saveFirstShowedIndex(int i) {
        PreferenceManager.getDefaultSharedPreferences(VKApplication.context).edit().putInt("newsfeedCacheFirstShowIndex", i).apply();
        return i;
    }

    public static int saveFirstShowedOffset(int i) {
        PreferenceManager.getDefaultSharedPreferences(VKApplication.context).edit().putInt("newsfeedCacheFirstShowOffset", i).apply();
        return i;
    }

    public static String getFrom() {
        return PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getString("newFromPaging", AppEventsConstants.EVENT_PARAM_VALUE_NO);
    }

    public static int getFirstShowedIndex() {
        return PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getInt("newsfeedCacheFirstShowIndex", -1);
    }

    public static int getFirstShowedOffset() {
        return PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getInt("newsfeedCacheFirstShowOffset", -1);
    }

    public static ArrayList<NewsEntry> get() {
        try {
            semaphore.acquire();
            SQLiteDatabase db = getReadableDatabase();
            ArrayList<NewsEntry> result = new ArrayList<>();
            try {
                Cursor cursor = db.query("news", null, null, null, null, null, "`order_position` asc");
                if (cursor != null && cursor.getCount() > 0) {
                    cursor.moveToFirst();
                    do {
                        NewsEntry entry = new NewsEntry();
                        entry.readFromSQLite(cursor);
                        result.add(entry);
                        Log.i("vk", "post from cache: " + entry);
                    } while (cursor.moveToNext());
                }
            } catch (Exception x) {
                Log.e("vk", "Error reading news cache DB!", x);
            }
            semaphore.release();
            return result;
        } catch (Exception x2) {
            L.e(x2, new Object[0]);
            semaphore.release();
            return null;
        }
    }

    public static void clear() {
        CacheOpenHelper.clearInstance();
        isNewsfeedTop = null;
    }

    public static void replace(List<NewsEntry> items) {
        new Thread(NewsfeedCache$$Lambda$1.lambdaFactory$(items)).start();
    }

    public static /* synthetic */ void lambda$replace$0(List items) {
        try {
            semaphore.acquire();
            SQLiteDatabase db = getWritableDatabase();
            db.beginTransaction();
            try {
                db.delete("news", null, null);
                int i = 0;
                Iterator it = items.iterator();
                while (it.hasNext()) {
                    NewsEntry entry = (NewsEntry) it.next();
                    entry.order_position = entry.order_position >= 0 ? i : entry.order_position;
                    entry.writeToSQLite(db, "news");
                    i++;
                }
                db.setTransactionSuccessful();
            } catch (Exception x) {
                Log.e("vk", "Error writing news cache DB!", x);
            }
            db.endTransaction();
        } catch (Exception x2) {
            Log.w("vk", "Error writing post to cache", x2);
        }
        semaphore.release();
    }

    public static void addToTop(NewsEntry entry) {
        try {
            if (VKApplication.context.getSharedPreferences(null, 0).getInt("feed_list", 0) == 0) {
                SQLiteDatabase db = getWritableDatabase();
                db.execSQL("UPDATE news SET order_position = order_position + 1 WHERE order_position >= 0");
                entry.order_position = 0;
                entry.writeToSQLite(db, "news");
            }
        } catch (Exception x) {
            L.e(x, new Object[0]);
        }
    }

    public static void addToTop(@Nullable Collection<NewsEntry> entries) {
        if (entries != null) {
            try {
                SQLiteDatabase db = getWritableDatabase();
                db.execSQL(INCREMENT_ORDER_PREFIX + entries.size() + INCREMENT_ORDER_SUFFIX);
                db.beginTransaction();
                int i = 0;
                for (NewsEntry entry : entries) {
                    entry.order_position = entry.order_position >= 0 ? i : entry.order_position;
                    entry.writeToSQLite(db, "news");
                    i++;
                }
                db.setTransactionSuccessful();
                db.endTransaction();
            } catch (Exception x) {
                L.e(x, new Object[0]);
            }
        }
    }

    public static void removeNotifications() {
        try {
            semaphore.acquire();
            SQLiteDatabase db = getWritableDatabase();
            try {
                db.delete("news", "`uid`=2000000001", null);
            } catch (Exception x) {
                Log.e("vk", "Error writing news cache DB!", x);
            }
        } catch (Exception x2) {
            L.e(x2, new Object[0]);
        }
        semaphore.release();
    }

    public static void remove(int oid, int pid) {
        try {
            semaphore.acquire();
            SQLiteDatabase db = getWritableDatabase();
            try {
                db.delete("news", "`pid`=" + pid + " AND `uid`=" + oid, null);
            } catch (Exception x) {
                Log.e("vk", "Error writing news cache DB!", x);
            }
        } catch (Exception x2) {
            L.e(x2, new Object[0]);
        }
        semaphore.release();
    }

    public static void replaceOne(NewsEntry e) {
        replaceOne(e, true);
    }

    public static void replaceOne(NewsEntry e, boolean usingFlags) {
        try {
            StringBuilder selection = new StringBuilder("`pid`=").append(e.postID).append(" AND `uid`=").append(e.ownerID);
            if (usingFlags) {
                selection.append(" AND `flags`=").append(e.flags);
            }
            semaphore.acquire();
            SQLiteDatabase db = getWritableDatabase();
            try {
                Cursor cursor = db.query("news", null, selection.toString(), null, null, null, "`time` desc");
                if (cursor != null) {
                    if (cursor.moveToFirst()) {
                        NewsEntry entry = new NewsEntry();
                        entry.readFromSQLite(cursor);
                        e.order_position = entry.order_position;
                        Log.i("vk", "post from cache: " + entry);
                    }
                    cursor.close();
                }
                int count = db.delete("news", selection.toString(), null);
                if (count > 0) {
                    e.writeToSQLite(db, "news");
                }
            } catch (Exception x) {
                Log.e("vk", "Error writing news cache DB!", x);
            }
        } catch (Exception x2) {
            L.e(x2, new Object[0]);
        }
        semaphore.release();
    }

    public static void update(int oid, int pid, int likes, int comments, int retweets, boolean liked, boolean retweeted) {
        int flags;
        int flags2;
        try {
            SQLiteDatabase db = getWritableDatabase();
            try {
                Cursor cursor = db.query("news", new String[]{"flags"}, "`pid`=" + pid + " AND `uid`=" + oid, null, null, null, null);
                if (0 == 0 && cursor != null && cursor.getCount() > 0) {
                    cursor.moveToFirst();
                    int flags3 = cursor.getInt(0);
                    cursor.close();
                    ContentValues values = new ContentValues();
                    values.put(ServerKeys.LIKES, Integer.valueOf(likes));
                    if (comments != -1) {
                        values.put("comments", Integer.valueOf(comments));
                    }
                    if (liked) {
                        flags = flags3 | 8;
                    } else {
                        flags = flags3 & (-9);
                    }
                    if (retweets != -1) {
                        values.put("retweets", Integer.valueOf(retweets));
                    }
                    if (retweeted) {
                        flags2 = flags | 4;
                    } else {
                        flags2 = flags & (-5);
                    }
                    values.put("flags", Integer.valueOf(flags2));
                    db.update("news", values, "`pid`=" + pid + " AND `uid`=" + oid, null);
                    return;
                }
                cursor.close();
            } catch (Exception x) {
                Log.e("vk", "Error writing news cache DB!", x);
            }
        } catch (Exception x2) {
            L.e(x2, new Object[0]);
        }
    }

    public static ArrayList<NewsfeedList> getLists() {
        Cursor cursor;
        ContentValues values;
        ArrayList<NewsfeedList> result = new ArrayList<>();
        try {
            SQLiteDatabase db = getWritableDatabase();
            try {
                cursor = db.query("feed_lists", null, null, null, null, null, null);
                values = new ContentValues();
            } catch (Exception x) {
                Log.e("vk", "Error reading news cache DB!", x);
            }
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
        if (cursor.getCount() > 0) {
            cursor.moveToFirst();
            NewsfeedList.resetCounter();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                if (values.getAsInteger("promo").intValue() == 1) {
                    result.add(new NewsfeedList(values.getAsString("pid"), values.getAsString("title")));
                } else {
                    result.add(new NewsfeedList(values.getAsInteger("lid").intValue(), values.getAsString("title")));
                }
            } while (cursor.moveToNext());
            cursor.close();
            return result;
        }
        cursor.close();
        return result;
    }

    public static void setLists(@Nullable List<NewsfeedList> lists, boolean async) {
        if (lists != null) {
            Runnable r = NewsfeedCache$$Lambda$2.lambdaFactory$(lists);
            if (async) {
                new Thread(r).start();
            } else {
                r.run();
            }
        }
    }

    public static /* synthetic */ void lambda$setLists$1(@Nullable List lists) {
        try {
            SQLiteDatabase db = getWritableDatabase();
            try {
                db.beginTransaction();
                db.delete("feed_lists", null, null);
                ContentValues values = new ContentValues();
                Iterator it = lists.iterator();
                while (it.hasNext()) {
                    NewsfeedList list = (NewsfeedList) it.next();
                    boolean isPromo = list.isPromoList();
                    values.put("lid", Integer.valueOf(list.getId()));
                    values.put("pid", list.getPromoId());
                    values.put("title", list.getTitle());
                    values.put("promo", Boolean.valueOf(isPromo));
                    db.insert("feed_lists", null, values);
                }
                db.setTransactionSuccessful();
            } catch (Exception x) {
                Log.e("vk", "Error reading news cache DB!", x);
            }
            db.endTransaction();
        } catch (Exception x2) {
            L.e(x2, new Object[0]);
        }
    }

    public static boolean hasEntries() {
        try {
            SQLiteDatabase db = getReadableDatabase();
            Cursor cursor = db.rawQuery("SELECT COUNT(*) FROM `news`", null);
            cursor.moveToFirst();
            boolean result = cursor.getInt(0) > 0;
            cursor.close();
            return result;
        } catch (Exception x) {
            Log.e("vk", "Error reading news cache DB!", x);
            return false;
        }
    }

    public static boolean isNewsfeedTop() {
        if (isNewsfeedTop == null) {
            Boolean valueOf = Boolean.valueOf(VKApplication.context.getSharedPreferences(null, 0).getBoolean("newsfeed_is_top", false));
            isNewsfeedTop = valueOf;
            return valueOf.booleanValue();
        }
        return isNewsfeedTop.booleanValue();
    }

    public static void setNewsfeedTop(@Nullable Boolean b) {
        if (b != null) {
            SharedPreferences.Editor edit = VKApplication.context.getSharedPreferences(null, 0).edit();
            isNewsfeedTop = b;
            edit.putBoolean("newsfeed_is_top", b.booleanValue()).apply();
        }
    }
}
