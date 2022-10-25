package com.danikula.videocache.sourcestorage;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import com.danikula.videocache.Preconditions;
import com.danikula.videocache.SourceInfo;
/* loaded from: classes.dex */
class DatabaseSourceInfoStorage extends SQLiteOpenHelper implements SourceInfoStorage {
    private static final String COLUMN_URL = "url";
    private static final String CREATE_SQL = "CREATE TABLE SourceInfo (_id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,url TEXT NOT NULL,mime TEXT,length INTEGER);";
    private static final String TABLE = "SourceInfo";
    private static final String COLUMN_ID = "_id";
    private static final String COLUMN_LENGTH = "length";
    private static final String COLUMN_MIME = "mime";
    private static final String[] ALL_COLUMNS = {COLUMN_ID, "url", COLUMN_LENGTH, COLUMN_MIME};

    /* JADX INFO: Access modifiers changed from: package-private */
    public DatabaseSourceInfoStorage(Context context) {
        super(context, "AndroidVideoCache.db", (SQLiteDatabase.CursorFactory) null, 1);
        Preconditions.checkNotNull(context);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onCreate(SQLiteDatabase db) {
        Preconditions.checkNotNull(db);
        db.execSQL(CREATE_SQL);
    }

    @Override // android.database.sqlite.SQLiteOpenHelper
    public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
        throw new IllegalStateException("Should not be called. There is no any migration");
    }

    @Override // com.danikula.videocache.sourcestorage.SourceInfoStorage
    public SourceInfo get(String url) {
        Preconditions.checkNotNull(url);
        Cursor cursor = null;
        try {
            cursor = getReadableDatabase().query(TABLE, ALL_COLUMNS, "url=?", new String[]{url}, null, null, null);
            return (cursor == null || !cursor.moveToFirst()) ? null : convert(cursor);
        } finally {
            if (cursor != null) {
                cursor.close();
            }
        }
    }

    @Override // com.danikula.videocache.sourcestorage.SourceInfoStorage
    public void put(String url, SourceInfo sourceInfo) {
        Preconditions.checkAllNotNull(url, sourceInfo);
        SourceInfo sourceInfoFromDb = get(url);
        boolean exist = sourceInfoFromDb != null;
        ContentValues contentValues = convert(sourceInfo);
        if (exist) {
            getWritableDatabase().update(TABLE, contentValues, "url=?", new String[]{url});
        } else {
            getWritableDatabase().insert(TABLE, null, contentValues);
        }
    }

    @Override // com.danikula.videocache.sourcestorage.SourceInfoStorage
    public void release() {
        close();
    }

    private SourceInfo convert(Cursor cursor) {
        return new SourceInfo(cursor.getString(cursor.getColumnIndexOrThrow("url")), cursor.getInt(cursor.getColumnIndexOrThrow(COLUMN_LENGTH)), cursor.getString(cursor.getColumnIndexOrThrow(COLUMN_MIME)));
    }

    private ContentValues convert(SourceInfo sourceInfo) {
        ContentValues values = new ContentValues();
        values.put("url", sourceInfo.url);
        values.put(COLUMN_LENGTH, Integer.valueOf(sourceInfo.length));
        values.put(COLUMN_MIME, sourceInfo.mime);
        return values;
    }
}
