package com.facebook.imagepipeline.producers;

import android.content.ContentValues;
import android.content.Context;
import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.net.Uri;
import android.provider.BaseColumns;
import bolts.Task;
import com.facebook.cache.common.CacheKey;
import com.facebook.cache.common.CacheKeyUtil;
import com.facebook.common.logging.FLog;
import com.facebook.imagepipeline.image.EncodedImage;
import com.facebook.imagepipeline.request.MediaVariations;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;
import java.util.concurrent.Executor;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class MediaVariationsIndexDatabase implements MediaVariationsIndex {
    private static final String SQL_DELETE_ENTRIES = "DROP TABLE IF EXISTS media_variations_index";
    private final LazyIndexDbOpenHelper mDbHelper;
    private final Executor mReadExecutor;
    private final Executor mWriteExecutor;
    private static final String TAG = MediaVariationsIndexDatabase.class.getSimpleName();
    private static final String[] PROJECTION = {IndexEntry.COLUMN_NAME_CACHE_KEY, "width", "height"};

    public MediaVariationsIndexDatabase(Context context, Executor readExecutor, Executor writeExecutor) {
        this.mDbHelper = new LazyIndexDbOpenHelper(context);
        this.mReadExecutor = readExecutor;
        this.mWriteExecutor = writeExecutor;
    }

    @Override // com.facebook.imagepipeline.producers.MediaVariationsIndex
    public Task<List<MediaVariations.Variant>> getCachedVariants(final String mediaId) {
        try {
            return Task.call(new Callable<List<MediaVariations.Variant>>() { // from class: com.facebook.imagepipeline.producers.MediaVariationsIndexDatabase.1
                @Override // java.util.concurrent.Callable
                public List<MediaVariations.Variant> call() throws Exception {
                    return MediaVariationsIndexDatabase.this.getCachedVariantsSync(mediaId);
                }
            }, this.mReadExecutor);
        } catch (Exception exception) {
            FLog.w(TAG, exception, "Failed to schedule query task for %s", mediaId);
            return Task.forError(exception);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized List<MediaVariations.Variant> getCachedVariantsSync(String mediaId) {
        List<MediaVariations.Variant> variants = null;
        synchronized (this) {
            SQLiteDatabase db = this.mDbHelper.getWritableDatabase();
            try {
                String[] selectionArgs = {mediaId};
                Cursor c = db.query(IndexEntry.TABLE_NAME, PROJECTION, "media_id = ?", selectionArgs, null, null, null);
                if (c.getCount() != 0) {
                    int columnIndexCacheKey = c.getColumnIndexOrThrow(IndexEntry.COLUMN_NAME_CACHE_KEY);
                    int columnIndexWidth = c.getColumnIndexOrThrow("width");
                    int columnIndexHeight = c.getColumnIndexOrThrow("height");
                    variants = new ArrayList<>(c.getCount());
                    while (c.moveToNext()) {
                        variants.add(new MediaVariations.Variant(Uri.parse(c.getString(columnIndexCacheKey)), c.getInt(columnIndexWidth), c.getInt(columnIndexHeight)));
                    }
                    if (c != null) {
                        c.close();
                    }
                    db.close();
                } else {
                    if (c != null) {
                        c.close();
                    }
                    db.close();
                }
            } catch (SQLException x) {
                FLog.e(TAG, x, "Error reading for %s", mediaId);
                throw x;
            }
        }
        return variants;
    }

    @Override // com.facebook.imagepipeline.producers.MediaVariationsIndex
    public void saveCachedVariant(final String mediaId, final CacheKey cacheKey, final EncodedImage encodedImage) {
        this.mWriteExecutor.execute(new Runnable() { // from class: com.facebook.imagepipeline.producers.MediaVariationsIndexDatabase.2
            @Override // java.lang.Runnable
            public void run() {
                SQLiteDatabase db = MediaVariationsIndexDatabase.this.mDbHelper.getWritableDatabase();
                try {
                    db.beginTransaction();
                    ContentValues contentValues = new ContentValues();
                    contentValues.put(IndexEntry.COLUMN_NAME_MEDIA_ID, mediaId);
                    contentValues.put("width", Integer.valueOf(encodedImage.getWidth()));
                    contentValues.put("height", Integer.valueOf(encodedImage.getHeight()));
                    contentValues.put(IndexEntry.COLUMN_NAME_CACHE_KEY, cacheKey.getUriString());
                    contentValues.put(IndexEntry.COLUMN_NAME_RESOURCE_ID, CacheKeyUtil.getFirstResourceId(cacheKey));
                    db.insertOrThrow(IndexEntry.TABLE_NAME, null, contentValues);
                    db.setTransactionSuccessful();
                } catch (Exception x) {
                    FLog.e(MediaVariationsIndexDatabase.TAG, x, "Error writing for %s", mediaId);
                } finally {
                    db.endTransaction();
                }
            }
        });
    }

    /* loaded from: classes.dex */
    private static final class IndexEntry implements BaseColumns {
        public static final String COLUMN_NAME_CACHE_KEY = "cache_key";
        public static final String COLUMN_NAME_HEIGHT = "height";
        public static final String COLUMN_NAME_MEDIA_ID = "media_id";
        public static final String COLUMN_NAME_RESOURCE_ID = "resource_id";
        public static final String COLUMN_NAME_WIDTH = "width";
        public static final String TABLE_NAME = "media_variations_index";

        private IndexEntry() {
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class LazyIndexDbOpenHelper {
        private final Context mContext;
        @Nullable
        private IndexDbOpenHelper mIndexDbOpenHelper;

        private LazyIndexDbOpenHelper(Context context) {
            this.mContext = context;
        }

        public synchronized SQLiteDatabase getWritableDatabase() {
            if (this.mIndexDbOpenHelper == null) {
                this.mIndexDbOpenHelper = new IndexDbOpenHelper(this.mContext);
            }
            return this.mIndexDbOpenHelper.getWritableDatabase();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public static class IndexDbOpenHelper extends SQLiteOpenHelper {
        public static final String DATABASE_NAME = "FrescoMediaVariationsIndex.db";
        public static final int DATABASE_VERSION = 1;
        private static final String INTEGER_TYPE = " INTEGER";
        private static final String SQL_CREATE_ENTRIES = "CREATE TABLE media_variations_index (_id INTEGER PRIMARY KEY,media_id TEXT,width INTEGER,height INTEGER,cache_key TEXT,resource_id TEXT )";
        private static final String SQL_CREATE_INDEX = "CREATE INDEX index_media_id ON media_variations_index (media_id)";
        private static final String TEXT_TYPE = " TEXT";

        public IndexDbOpenHelper(Context context) {
            super(context, DATABASE_NAME, (SQLiteDatabase.CursorFactory) null, 1);
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onCreate(SQLiteDatabase db) {
            db.beginTransaction();
            try {
                db.execSQL(SQL_CREATE_ENTRIES);
                db.execSQL(SQL_CREATE_INDEX);
                db.setTransactionSuccessful();
            } finally {
                db.endTransaction();
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            db.beginTransaction();
            try {
                db.execSQL(MediaVariationsIndexDatabase.SQL_DELETE_ENTRIES);
                db.setTransactionSuccessful();
            } finally {
                db.endTransaction();
            }
        }

        @Override // android.database.sqlite.SQLiteOpenHelper
        public void onDowngrade(SQLiteDatabase db, int oldVersion, int newVersion) {
            onUpgrade(db, oldVersion, newVersion);
        }
    }
}
