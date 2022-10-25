package com.vkontakte.android.cache;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Environment;
import android.preference.PreferenceManager;
import com.vkontakte.android.Log;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
/* loaded from: classes2.dex */
public class AudioCache {

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes2.dex */
    public static class CacheOpenHelper extends SQLiteOpenHelper {
        public CacheOpenHelper(Context context) {
            super(context, "audio.db", (SQLiteDatabase.CursorFactory) null, 5);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            CacheTables.createAudio(db);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            Log.w("vk", "ON UPGRADE!! " + oldVersion + " -> " + newVersion);
            if (oldVersion < 6) {
                if (oldVersion == 3) {
                    db.execSQL("ALTER TABLE files ADD cover_version int not null default 0");
                    db.execSQL("ALTER TABLE files ADD lyrics text");
                }
                db.execSQL("ALTER TABLE files ADD file_size int not null default -1");
                return;
            }
            onCreate(db);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onDowngrade(SQLiteDatabase db, int oldv, int newv) {
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getWritableDatabase() {
            while (true) {
                try {
                    SQLiteDatabase db = super.getWritableDatabase();
                    db.setLockingEnabled(false);
                    return db;
                } catch (Exception e) {
                    try {
                        Thread.sleep(100L);
                    } catch (Exception e2) {
                    }
                }
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public SQLiteDatabase getReadableDatabase() {
            SQLiteDatabase db = super.getReadableDatabase();
            db.setLockingEnabled(false);
            return db;
        }
    }

    public static File getFileForMusic(MusicTrack musicTrack) {
        return new File(getCacheDir(), musicTrack.getMid());
    }

    public static File getCacheDir() {
        String root = PreferenceManager.getDefaultSharedPreferences(VKApplication.context).getString("audioCacheLocation", Environment.getExternalStorageDirectory().getAbsolutePath());
        return getCacheDir(new File(root));
    }

    private static File getCacheDir(File root) {
        return root.getAbsolutePath().equals(Environment.getExternalStorageDirectory().getAbsolutePath()) ? new File(root, "/.vkontakte/cache/audio") : new File(root, "/Android/data/" + VKApplication.context.getPackageName() + "/files/cache/audio");
    }

    public static void deleteOld(Context context) {
        CacheOpenHelper helper = new CacheOpenHelper(context);
        SQLiteDatabase db = helper.getWritableDatabase();
        try {
            Cursor cursor = db.query("files", null, "user=0", null, null, null, "lastplay asc");
            cursor.moveToFirst();
            if (cursor.getCount() > 10) {
                int nDel = cursor.getCount() - 10;
                String where = "";
                for (int i = 0; i < nDel; i++) {
                    Log.d("vk", "Deleted audio " + cursor.getInt(0) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + cursor.getInt(1));
                    where = where + "or(oid=" + cursor.getInt(0) + " AND aid=" + cursor.getInt(1) + ")";
                    new File(getCacheDir(), cursor.getInt(0) + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + cursor.getInt(1)).delete();
                    cursor.moveToNext();
                }
                cursor.close();
                db.delete("files", where.substring(2), null);
            }
        } catch (Exception x) {
            Log.w("vk", x);
        }
        db.close();
        helper.close();
    }

    public static void clear() {
        CacheOpenHelper helper = new CacheOpenHelper(VKApplication.context);
        SQLiteDatabase db = helper.getWritableDatabase();
        Log.d("vk", "Clear audio cache");
        try {
            db.delete("files", null, null);
            File[] files = getCacheDir().listFiles();
            for (File f : files) {
                if (f.getName().endsWith(".cover") || f.getName().endsWith(".covers")) {
                    Log.d("vk", "Deleting: " + f.getAbsolutePath());
                    f.delete();
                }
            }
            Log.d("vk", "All deleted");
        } catch (Exception x) {
            Log.w("vk", x);
        }
        db.close();
        helper.close();
    }

    public static ArrayList<MusicTrack> getCachedList(Context context) {
        File dir = getCacheDir();
        if (!dir.exists()) {
            dir.mkdirs();
        }
        CacheOpenHelper helper = new CacheOpenHelper(context);
        SQLiteDatabase db = helper.getWritableDatabase();
        ArrayList<MusicTrack> list = new ArrayList<>();
        Log.i("vk", "DB version = " + db.getVersion());
        try {
            Cursor cursor = db.query("files", null, null, null, null, null, null);
            cursor.moveToFirst();
            int i = 0;
            ContentValues values = new ContentValues();
            do {
                DatabaseUtils.cursorRowToContentValues(cursor, values);
                MusicTrack file = new MusicTrack();
                file.oid = values.getAsInteger(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID).intValue();
                file.aid = values.getAsInteger(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID).intValue();
                file.title = values.getAsString("title");
                file.artist = values.getAsString("artist");
                file.duration = values.getAsInteger("duration").intValue();
                file.lyricsID = values.getAsInteger(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_LYRICS_ID).intValue();
                file.durationS = String.format("%d:%02d", Integer.valueOf(file.duration / 60), Integer.valueOf(file.duration % 60));
                list.add(file);
                i++;
            } while (cursor.moveToNext());
            cursor.close();
        } catch (Exception x) {
            Log.w("vk", x);
        }
        db.close();
        helper.close();
        deleteOld(context);
        Collections.reverse(list);
        return list;
    }
}
