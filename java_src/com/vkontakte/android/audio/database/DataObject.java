package com.vkontakte.android.audio.database;

import android.content.ContentValues;
import android.database.Cursor;
import com.vkontakte.android.audio.database.DataObject;
import com.vkontakte.android.audio.utils.Utils;
/* loaded from: classes.dex */
public abstract class DataObject<T extends DataObject<?>> {
    protected static final String[] COLUMNS = {"_id"};
    protected static final int INDEX_ID = 0;
    private final DataProvider<T> mDataProvider;
    private long mId;

    /* JADX INFO: Access modifiers changed from: protected */
    public DataObject(DataProvider<? extends T> dataProvider) {
        this.mDataProvider = (DataProvider) Utils.checkedCast(dataProvider);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static String[] concatColumns(String[] src, String... columns) {
        return Utils.concatStringArrays(src, columns);
    }

    public long getId() {
        return this.mId;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setId(long id) {
        this.mId = id;
    }

    public boolean save() {
        return this.mDataProvider.save(this);
    }

    public boolean update() {
        return this.mDataProvider.update(this);
    }

    public boolean remove() {
        return this.mDataProvider.remove((DataProvider<T>) this);
    }

    public void copyFrom(T object) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void loadFromCursor(Cursor cursor) {
        this.mId = cursor.getLong(0);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fillContentValues(ContentValues contentValues) {
    }
}
