package com.vkontakte.android.cache;

import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteException;
import java.io.IOException;
/* loaded from: classes2.dex */
public abstract class MessagesAction {
    public abstract void apply(SQLiteDatabase sQLiteDatabase) throws SQLiteException, IOException;
}
