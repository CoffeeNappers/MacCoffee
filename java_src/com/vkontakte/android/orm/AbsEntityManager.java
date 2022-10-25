package com.vkontakte.android.orm;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.lang.reflect.Field;
import java.util.Collection;
import java.util.List;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public interface AbsEntityManager {
    void beginTransaction();

    void close();

    void commit();

    <T> long create(@NonNull T t);

    <T> long create(@Nullable List<T> list);

    <T> long create(@Nullable T... tArr);

    <T> Query<T> createQuery(Class<T> cls);

    <T> RawQuery<T> createSQLQuery(Class<T> cls, String str);

    Cursor cursorQuery(String str, String... strArr);

    int delete(@NonNull Class cls, long j);

    int delete(@NonNull Class cls, long... jArr);

    int delete(@NonNull Object obj);

    <T> int delete(@Nullable List<T> list);

    <T> int delete(@Nullable T... tArr);

    int deleteAll(@NonNull Class cls);

    <T> List<T> executeRawQuery(Class<T> cls, String str, String... strArr);

    @Nullable
    <T> T find(@NonNull Class<T> cls, long j);

    @Nullable
    <T> List<T> findAll(@NonNull Class<T> cls);

    String getColumnName(Class<?> cls, Field field);

    String getColumnName(Field field);

    SQLiteDatabase getDatabase();

    String getPrimaryKey(Class<?> cls);

    String getRecordName(Class<?> cls);

    void rollback();

    <T> int save(@NonNull T t);

    <T> int save(@Nullable Collection<T> collection);

    <T> int save(@Nullable List<T> list);

    <T> int save(@Nullable T... tArr);
}
