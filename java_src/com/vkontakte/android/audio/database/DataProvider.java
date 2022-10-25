package com.vkontakte.android.audio.database;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.audio.database.DataObject;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes2.dex */
public abstract class DataProvider<T extends DataObject<?>> {
    private boolean mAllLoaded;
    private final ConcurrentHashMap<Long, T> mCache;
    private final String mTableName;

    /* renamed from: createNew */
    protected abstract T mo947createNew();

    protected abstract SQLiteDatabase getDatabase();

    protected abstract String[] getProjection();

    public DataProvider(String tableName, boolean useCache) {
        this.mTableName = tableName;
        this.mCache = useCache ? new ConcurrentHashMap<>() : null;
    }

    public String getTableName() {
        return this.mTableName;
    }

    public boolean save(T object) {
        ContentValues contentValues = new ContentValues();
        object.fillContentValues(contentValues);
        long id = object.getId();
        if (id <= 0) {
            long id2 = getDatabase().insert(this.mTableName, null, contentValues);
            if (id2 != -1) {
                object.setId(id2);
                putToCache(object);
                onTableModified();
                return true;
            }
        } else if (getDatabase().update(this.mTableName, contentValues, "_id = ?", new String[]{Long.toString(id)}) > 0) {
            putToCache(object);
            onTableModified();
            return true;
        }
        return false;
    }

    public boolean update(T object) {
        ContentValues contentValues = new ContentValues();
        object.fillContentValues(contentValues);
        long id = object.getId();
        if (id <= 0 || getDatabase().update(this.mTableName, contentValues, "_id = ?", new String[]{Long.toString(id)}) <= 0) {
            return false;
        }
        putToCache(object);
        onTableModified();
        return true;
    }

    public boolean remove(long id) {
        boolean result = true;
        if (id <= 0) {
            return false;
        }
        if (getDatabase().delete(this.mTableName, "_id = ?", new String[]{Long.toString(id)}) <= 0) {
            result = false;
        }
        removeFromCache(id);
        if (result) {
            onTableModified();
        }
        return result;
    }

    public boolean remove(T object) {
        return remove(object.getId());
    }

    public boolean remove(String where, String[] whereArgs) {
        clearCache();
        boolean result = getDatabase().delete(this.mTableName, where, whereArgs) > 0;
        if (result) {
            onTableModified();
        }
        return result;
    }

    public boolean removeAll() {
        return remove(null, null);
    }

    public T getById(long id) {
        T object = getFromCache(id);
        return object != null ? object : getByQuery("_id = ?", new String[]{Long.toString(id)});
    }

    public Collection<T> getAll() {
        return getCollectionByQuery(null, null);
    }

    public int getCount() {
        int count = getCacheCount();
        if (count >= 0) {
            return count;
        }
        Cursor cursor = getDatabase().query(false, this.mTableName, new String[]{"count(1)"}, null, null, null, null, null, null);
        if (cursor != null && cursor.moveToFirst()) {
            count = cursor.getInt(0);
            cursor.close();
        }
        return count;
    }

    protected T getByCursor(Cursor cursor) {
        T object;
        long id = cursor.getLong(0);
        if (isUseCache()) {
            T object2 = getFromCache(id);
            if (object2 == null) {
                synchronized (this) {
                    object = getFromCache(id);
                    if (object == null) {
                        object = mo947createNew();
                        object.loadFromCursor(cursor);
                        putToCache(object);
                    }
                }
                return object;
            }
            return object2;
        }
        T object3 = mo947createNew();
        object3.loadFromCursor(cursor);
        return object3;
    }

    protected T getByQuery(String where, String[] whereArgs) {
        T t = null;
        Cursor cursor = getDatabase().query(this.mTableName, getProjection(), where, whereArgs, null, null, null, AppEventsConstants.EVENT_PARAM_VALUE_YES);
        try {
            if (cursor.moveToFirst()) {
                t = getByCursor(cursor);
            }
            return t;
        } finally {
            cursor.close();
        }
    }

    protected Collection<T> getCollectionByQuery(String where, String[] whereArgs) {
        Collection<T> result = TextUtils.isEmpty(where) ? getAllFromCache(true) : null;
        if (result != null) {
            return result;
        }
        return loadListByQuery(false, where, whereArgs, null, null, null);
    }

    protected ArrayList<T> getListByQuery(boolean distinct, String where, String[] whereArgs, String groupBy, String orderBy, String limit) {
        Collection<T> result = (distinct || !TextUtils.isEmpty(where) || !TextUtils.isEmpty(groupBy) || !TextUtils.isEmpty(orderBy) || !TextUtils.isEmpty(limit)) ? null : getAllFromCache(false);
        if (result != null) {
            return new ArrayList<>(result);
        }
        return loadListByQuery(distinct, where, whereArgs, groupBy, orderBy, limit);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ArrayList<T> getListByQuery(String where, String[] whereArgs, String orderBy) {
        return getListByQuery(false, where, whereArgs, null, orderBy, null);
    }

    protected ArrayList<T> getListByCursor(Cursor cursor) {
        ArrayList<T> list = new ArrayList<>(cursor.getCount());
        if (cursor.moveToFirst()) {
            do {
                list.add(getByCursor(cursor));
            } while (cursor.moveToNext());
            return list;
        }
        return list;
    }

    protected void onTableModified() {
    }

    private ArrayList<T> loadListByQuery(boolean distinct, String where, String[] whereArgs, String groupBy, String orderBy, String limit) {
        ArrayList<T> list;
        Cursor cursor = getDatabase().query(distinct, this.mTableName, getProjection(), where, whereArgs, groupBy, null, orderBy, limit);
        try {
            synchronized (this) {
                list = getListByCursor(cursor);
                if (isUseCache() && TextUtils.isEmpty(where)) {
                    this.mAllLoaded = true;
                }
            }
            return list;
        } finally {
            cursor.close();
        }
    }

    public void clearCache() {
        if (isUseCache()) {
            synchronized (this) {
                this.mCache.clear();
                this.mAllLoaded = false;
            }
        }
    }

    protected void putToCache(T object) {
        if (isUseCache()) {
            this.mCache.put(Long.valueOf(object.getId()), object);
        }
    }

    protected void removeFromCache(T object) {
        if (isUseCache()) {
            this.mCache.remove(Long.valueOf(object.getId()));
        }
    }

    protected int getCacheCount() {
        if (!isUseCache() || !this.mAllLoaded) {
            return -1;
        }
        return this.mCache.size();
    }

    private boolean isUseCache() {
        return this.mCache != null;
    }

    private T getFromCache(long id) {
        if (isUseCache()) {
            return this.mCache.get(Long.valueOf(id));
        }
        return null;
    }

    private void removeFromCache(long id) {
        T object = getFromCache(id);
        if (object != null) {
            removeFromCache((DataProvider<T>) object);
        }
    }

    private Collection<T> getAllFromCache(boolean unmodifiable) {
        Collection<T> result = null;
        if (!isUseCache()) {
            return null;
        }
        synchronized (this) {
            if (this.mAllLoaded) {
                result = this.mCache.values();
            }
        }
        if (result != null && unmodifiable) {
            return Collections.unmodifiableCollection(result);
        }
        return result;
    }
}
