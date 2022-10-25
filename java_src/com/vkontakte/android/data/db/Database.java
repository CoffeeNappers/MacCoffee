package com.vkontakte.android.data.db;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.util.SparseArray;
import com.vk.analytics.Analytics;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.SavedTrack;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.statistics.SentTable;
import com.vkontakte.android.utils.L;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;
/* loaded from: classes2.dex */
public class Database extends SQLiteOpenHelper {
    private static final String DATABASE_NAME = "databaseVerThree.db";
    private static final int DATABASE_VERSION = 22;
    private static final int DATABASE_VERSION_ADD_RESTRICTION_FIELD = 21;
    private static final int DATABASE_VERSION_NEW_MUSIC = 20;
    private static final int DATABASE_VERSION_STATISTIC_PIXELS = 22;
    private static volatile Database instance = null;
    private static final String[] COLUMNS = {"key"};

    public static Database getInst(Context ctx) {
        if (instance == null) {
            synchronized (Database.class) {
                if (instance == null) {
                    instance = new Database(ctx.getApplicationContext(), DATABASE_NAME, null, 22);
                }
            }
        }
        return instance;
    }

    private Database(Context context, String name, SQLiteDatabase.CursorFactory factory, int version) {
        super(context, name, factory, version);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        db.execSQL(GameRequest.createSql());
        db.execSQL(PlayerTrack.createSql());
        db.execSQL(SavedTrack.createSql());
        db.execSQL(SentTable.createSql());
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        db.execSQL(Table.dropSql(GameRequest.TABLE));
        db.execSQL(GameRequest.createSql());
        db.execSQL(PlayerTrack.createSql());
        db.execSQL(SavedTrack.createSql());
        db.execSQL(SentTable.createSql());
        if (oldVersion >= 20 && oldVersion < 21) {
            try {
                db.execSQL("ALTER TABLE player_track ADD restriction int default 0");
                db.execSQL("ALTER TABLE saved_track ADD restriction int default 0");
                L.e("ALTER TABLE isOk");
            } catch (Exception e) {
                L.e(e, new Object[0]);
                Analytics.logException(e);
                db.execSQL(Table.dropSql(PlayerTrack.TABLE));
                db.execSQL(PlayerTrack.createSql());
                db.execSQL(Table.dropSql(SavedTrack.TABLE));
                db.execSQL(SavedTrack.createSql());
            }
        }
    }

    public ArrayList<GameRequest> getRequests(int appId, SparseArray<UserProfile> profiles) {
        Cursor cursor = getReadableDatabase().query(GameRequest.TABLE, GameRequest.COLUMNS, "app_id=?", new String[]{String.valueOf(appId)}, null, null, ServerKeys.DATE, "20");
        ArrayList<GameRequest> gameRequests = new ArrayList<>();
        if (cursor != null && cursor.moveToFirst()) {
            do {
                GameRequest gameRequest = new GameRequest(cursor);
                if (profiles != null) {
                    gameRequest.fillUserProfiles(profiles);
                }
                gameRequests.add(gameRequest);
            } while (cursor.moveToNext());
            cursor.close();
        }
        return gameRequests;
    }

    public void removeRequest(GameRequest gameRequest) {
        if (gameRequest.id > 0) {
            getWritableDatabase().delete(GameRequest.TABLE, "_id=" + gameRequest.id, null);
        }
    }

    public void insertRequest(GameRequest gameRequest) {
        getWritableDatabase().insertWithOnConflict(GameRequest.TABLE, null, gameRequest.toContentValues(), 5);
    }

    public Set<String> getSentStatistics() {
        Cursor cursor = getReadableDatabase().query(SentTable.TABLE, COLUMNS, null, null, null, null, null);
        Set<String> sentStatistics = new HashSet<>();
        if (cursor != null && cursor.moveToFirst()) {
            do {
                sentStatistics.add(cursor.getString(0));
            } while (cursor.moveToNext());
            cursor.close();
        }
        return sentStatistics;
    }

    public boolean addSentStatisticsAndDropOldValues(@Nullable String key, int maxSaved, int period) {
        if (!TextUtils.isEmpty(key)) {
            if (period <= 0) {
                period = 1;
            }
            if (maxSaved <= 0) {
                maxSaved = 1;
            }
            ContentValues contentValues = new ContentValues();
            contentValues.put("key", key);
            long id = getWritableDatabase().insert(SentTable.TABLE, "key", contentValues);
            if (id % period != 0) {
                return true;
            }
            getWritableDatabase().delete(SentTable.TABLE, "_id< " + (id - maxSaved), null);
            return true;
        }
        return false;
    }
}
