package com.vkontakte.android.orm;

import android.database.sqlite.SQLiteDatabase;
/* loaded from: classes3.dex */
public interface MigrationScript {
    int apply(int i, SQLiteDatabase sQLiteDatabase);
}
