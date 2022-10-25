package com.vkontakte.android.orm;

import android.annotation.SuppressLint;
import android.annotation.TargetApi;
import android.content.ContentValues;
import android.content.Context;
import android.content.SharedPreferences;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteOpenHelper;
import android.os.Build;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.vkontakte.android.orm.ORM;
import java.io.File;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* loaded from: classes3.dex */
public final class EntityManager implements AbsEntityManager {
    public static final String WHERE_CLAUSE = " = ?";
    public static final String WHERE_IN = " IN (?)";
    final ORM.Config mConfig;
    final Context mContext;
    SQLiteDatabase mDatabase;
    File mDbFile;
    final String mDbName;
    final Object mLock = new Object();

    public EntityManager(Context context) {
        this.mContext = context.getApplicationContext();
        this.mConfig = ORM.Config.getInstance(context);
        this.mDbName = this.mConfig.mDbName;
        openConnection();
    }

    public EntityManager(Context context, String database) {
        this.mContext = context.getApplicationContext();
        this.mConfig = ORM.Config.getInstance(context);
        this.mDbName = database;
        openConnection();
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public void close() {
        if (this.mDatabase != null) {
            synchronized (this.mLock) {
                this.mDatabase.close();
                this.mDatabase = null;
            }
        }
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    @Nullable
    public <T> T find(@NonNull Class<T> entity, long id) {
        T t;
        synchronized (this.mLock) {
            ClassMetaData<T> metaData = ClassLoader.get(entity);
            Cursor cursor = getDatabase().query(true, metaData.getRecordName(), null, metaData.getPrimaryColumnName() + WHERE_CLAUSE, new String[]{String.valueOf(id)}, null, null, null, null);
            if (cursor.getCount() > 0) {
                cursor.moveToFirst();
                t = metaData.parse(cursor);
                cursor.close();
            } else {
                t = null;
                cursor.close();
            }
        }
        return t;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    @Nullable
    public <T> List<T> findAll(@NonNull Class<T> entity) {
        List<T> result = null;
        synchronized (this.mLock) {
            ClassMetaData<T> metaData = ClassLoader.get(entity);
            Cursor cursor = getDatabase().query(true, metaData.getRecordName(), null, null, null, null, null, null, null);
            if (cursor.getCount() > 0) {
                result = new ArrayList<>(cursor.getCount());
                cursor.moveToFirst();
                while (!cursor.isAfterLast()) {
                    result.add(metaData.parse(cursor));
                    cursor.moveToNext();
                }
                cursor.close();
            } else {
                cursor.close();
            }
        }
        return result;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> long create(@NonNull T entity) {
        long insert;
        synchronized (this.mLock) {
            ClassMetaData<T> metaData = ClassLoader.get(entity.getClass());
            ContentValues cv = new ContentValues();
            metaData.bind(cv, (ContentValues) entity);
            insert = getDatabase().insert(metaData.getRecordName(), null, cv);
        }
        return insert;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> long create(@Nullable T... entities) {
        long count;
        synchronized (this.mLock) {
            count = 0;
            if (entities != null) {
                if (entities.length < 0) {
                    ClassMetaData<T> metaData = null;
                    DatabaseUtils.InsertHelper helper = null;
                    int i = 0;
                    try {
                        int entitiesLength = entities.length;
                        DatabaseUtils.InsertHelper helper2 = null;
                        while (i < entitiesLength) {
                            try {
                                T entity = entities[i];
                                if (helper2 == null) {
                                    metaData = ClassLoader.get(entity.getClass());
                                    helper = new DatabaseUtils.InsertHelper(getDatabase(), metaData.getRecordName());
                                } else {
                                    helper = helper2;
                                }
                                helper.prepareForInsert();
                                metaData.bind(helper, (DatabaseUtils.InsertHelper) entity);
                                count += helper.execute();
                                i++;
                                helper2 = helper;
                            } catch (Throwable th) {
                                th = th;
                                helper = helper2;
                                if (helper != null) {
                                    helper.close();
                                }
                                throw th;
                            }
                        }
                        if (helper2 != null) {
                            helper2.close();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
            }
        }
        return count;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> long create(@Nullable List<T> entities) {
        long count;
        synchronized (this.mLock) {
            count = 0;
            if (entities != null) {
                if (!entities.isEmpty()) {
                    ClassMetaData<T> metaData = null;
                    DatabaseUtils.InsertHelper helper = null;
                    int i = 0;
                    try {
                        int entitiesSize = entities.size();
                        DatabaseUtils.InsertHelper helper2 = null;
                        while (i < entitiesSize) {
                            try {
                                T entity = entities.get(i);
                                if (helper2 == null) {
                                    metaData = ClassLoader.get(entity.getClass());
                                    helper = new DatabaseUtils.InsertHelper(getDatabase(), metaData.getRecordName());
                                } else {
                                    helper = helper2;
                                }
                                helper.prepareForInsert();
                                metaData.bind(helper, (DatabaseUtils.InsertHelper) entity);
                                count += helper.execute();
                                i++;
                                helper2 = helper;
                            } catch (Throwable th) {
                                th = th;
                                helper = helper2;
                                if (helper != null) {
                                    helper.close();
                                }
                                throw th;
                            }
                        }
                        if (helper2 != null) {
                            helper2.close();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
            }
        }
        return count;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> int save(@NonNull T entity) {
        int update;
        synchronized (this.mLock) {
            ContentValues cv = new ContentValues();
            ClassMetaData<T> metaData = ClassLoader.get(entity.getClass());
            try {
                metaData.bind(cv, (ContentValues) entity);
                update = getDatabase().update(metaData.getRecordName(), cv, metaData.getPrimaryColumnName() + WHERE_CLAUSE, new String[]{metaData.getPrimaryKey(entity)});
            } catch (IllegalAccessException e) {
                throw new RuntimeException(e);
            }
        }
        return update;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> int save(@Nullable T... entities) {
        int count;
        synchronized (this.mLock) {
            count = 0;
            if (entities != null) {
                if (entities.length > 0) {
                    DatabaseUtils.InsertHelper helper = null;
                    ClassMetaData<T> metaData = null;
                    int i = 0;
                    try {
                        int entitiesLength = entities.length;
                        DatabaseUtils.InsertHelper helper2 = null;
                        while (i < entitiesLength) {
                            try {
                                T entity = entities[i];
                                if (helper2 == null) {
                                    metaData = ClassLoader.get(entity.getClass());
                                    helper = new DatabaseUtils.InsertHelper(getDatabase(), metaData.getRecordName());
                                } else {
                                    helper = helper2;
                                }
                                helper.prepareForReplace();
                                metaData.bind(helper, (DatabaseUtils.InsertHelper) entity);
                                count = (int) (count + helper.execute());
                                i++;
                                helper2 = helper;
                            } catch (Throwable th) {
                                th = th;
                                helper = helper2;
                                if (helper != null) {
                                    helper.close();
                                }
                                throw th;
                            }
                        }
                        if (helper2 != null) {
                            helper2.close();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
            }
        }
        return count;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> int save(@Nullable List<T> entities) {
        int count;
        synchronized (this.mLock) {
            count = 0;
            if (entities != null) {
                if (!entities.isEmpty()) {
                    DatabaseUtils.InsertHelper helper = null;
                    ClassMetaData<T> metaData = null;
                    int i = 0;
                    try {
                        int entitiesSize = entities.size();
                        DatabaseUtils.InsertHelper helper2 = null;
                        while (i < entitiesSize) {
                            try {
                                T entity = entities.get(i);
                                if (helper2 == null) {
                                    metaData = ClassLoader.get(entity.getClass());
                                    helper = new DatabaseUtils.InsertHelper(getDatabase(), metaData.getRecordName());
                                } else {
                                    helper = helper2;
                                }
                                helper.prepareForReplace();
                                metaData.bind(helper, (DatabaseUtils.InsertHelper) entity);
                                count = (int) (count + helper.execute());
                                i++;
                                helper2 = helper;
                            } catch (Throwable th) {
                                th = th;
                                helper = helper2;
                                if (helper != null) {
                                    helper.close();
                                }
                                throw th;
                            }
                        }
                        if (helper2 != null) {
                            helper2.close();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
            }
        }
        return count;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> int save(@Nullable Collection<T> entities) {
        int count;
        DatabaseUtils.InsertHelper helper;
        synchronized (this.mLock) {
            count = 0;
            if (entities != null) {
                if (!entities.isEmpty()) {
                    DatabaseUtils.InsertHelper helper2 = null;
                    ClassMetaData<T> metaData = null;
                    try {
                        Iterator<T> it = entities.iterator();
                        while (true) {
                            try {
                                helper = helper2;
                                if (!it.hasNext()) {
                                    break;
                                }
                                T entity = it.next();
                                if (helper == null) {
                                    metaData = ClassLoader.get(entity.getClass());
                                    helper2 = new DatabaseUtils.InsertHelper(getDatabase(), metaData.getRecordName());
                                } else {
                                    helper2 = helper;
                                }
                                helper2.prepareForReplace();
                                metaData.bind(helper2, (DatabaseUtils.InsertHelper) entity);
                                count = (int) (count + helper2.execute());
                            } catch (Throwable th) {
                                th = th;
                                helper2 = helper;
                                if (helper2 != null) {
                                    helper2.close();
                                }
                                throw th;
                            }
                        }
                        if (helper != null) {
                            helper.close();
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                }
            }
        }
        return count;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public int delete(@NonNull Class entity, long... ids) {
        int delete;
        synchronized (this.mLock) {
            if (ids != null) {
                if (ids.length > 0) {
                    ClassMetaData metaData = ClassLoader.get(entity);
                    StringBuilder sb = new StringBuilder();
                    boolean firstTime = true;
                    for (long id : ids) {
                        if (firstTime) {
                            firstTime = false;
                        } else {
                            sb.append(',');
                        }
                        sb.append(id);
                    }
                    delete = getDatabase().delete(metaData.getRecordName(), metaData.getPrimaryColumnName() + WHERE_IN, new String[]{sb.toString()});
                }
            }
            delete = 0;
        }
        return delete;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> int delete(@Nullable T... entities) {
        int i = 0;
        synchronized (this.mLock) {
            if (entities != null) {
                if (entities.length > 0) {
                    try {
                        ClassMetaData metaData = ClassLoader.get(entities[0].getClass());
                        StringBuilder sb = new StringBuilder();
                        boolean firstTime = true;
                        for (T entity : entities) {
                            if (firstTime) {
                                firstTime = false;
                            } else {
                                sb.append(',');
                            }
                            sb.append(metaData.getPrimaryKey(entity));
                        }
                        i = getDatabase().delete(metaData.getRecordName(), metaData.getPrimaryColumnName() + WHERE_IN, new String[]{sb.toString()});
                    } catch (IllegalAccessException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        }
        return i;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> int delete(@Nullable List<T> entities) {
        int i = 0;
        synchronized (this.mLock) {
            if (entities != null) {
                if (!entities.isEmpty()) {
                    try {
                        ClassMetaData metaData = ClassLoader.get(entities.iterator().next().getClass());
                        StringBuilder sb = new StringBuilder();
                        boolean firstTime = true;
                        int entitiesSize = entities.size();
                        for (int i2 = 0; i2 < entitiesSize; i2++) {
                            T entity = entities.get(i2);
                            if (firstTime) {
                                firstTime = false;
                            } else {
                                sb.append(',');
                            }
                            sb.append(metaData.getPrimaryKey(entity));
                        }
                        i = getDatabase().delete(metaData.getRecordName(), metaData.getPrimaryColumnName() + WHERE_IN, new String[]{sb.toString()});
                    } catch (IllegalAccessException e) {
                        throw new RuntimeException(e);
                    }
                }
            }
        }
        return i;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public int delete(@NonNull Class entity, long id) {
        int delete;
        synchronized (this.mLock) {
            ClassMetaData metaData = ClassLoader.get(entity);
            delete = getDatabase().delete(metaData.getRecordName(), metaData.getPrimaryColumnName() + WHERE_CLAUSE, new String[]{String.valueOf(id)});
        }
        return delete;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public int delete(@NonNull Object entity) {
        int i = 0;
        synchronized (this.mLock) {
            ClassMetaData metaData = ClassLoader.get(entity.getClass());
            try {
                i = getDatabase().delete(metaData.getRecordName(), metaData.getPrimaryColumnName() + WHERE_CLAUSE, new String[]{metaData.getPrimaryKey(entity)});
            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }
        return i;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public int deleteAll(@NonNull Class entity) {
        int delete;
        synchronized (this.mLock) {
            delete = getDatabase().delete(ClassLoader.get(entity).getRecordName(), null, null);
        }
        return delete;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> List<T> executeRawQuery(Class<T> entity, String sql, String... params) {
        List<T> result = null;
        synchronized (this.mLock) {
            Cursor cursor = getDatabase().rawQuery(sql, null);
            ClassMetaData<T> metaData = ClassLoader.get(entity);
            if (cursor.getCount() > 0) {
                result = new ArrayList<>(cursor.getCount());
                cursor.moveToFirst();
                while (!cursor.isAfterLast()) {
                    result.add(metaData.parse(cursor));
                    cursor.moveToNext();
                }
                cursor.close();
            } else {
                cursor.close();
            }
        }
        return result;
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> Query<T> createQuery(Class<T> entity) {
        return new Query<>(ClassLoader.get(entity), this);
    }

    protected <T> Query<T> createQuery(ClassMetaData<T> data) {
        return new Query<>(data, this);
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public <T> RawQuery<T> createSQLQuery(Class<T> entity, String sql) {
        return new RawQuery<>(this, ClassLoader.get(entity), sql);
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public Cursor cursorQuery(String sql, String... selectionArgs) {
        return getDatabase().rawQuery(sql, selectionArgs);
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public void beginTransaction() {
        if (Build.VERSION.SDK_INT > 10) {
            beginTransactionNonExclusive();
        } else {
            getDatabase().beginTransaction();
        }
    }

    @TargetApi(11)
    void beginTransactionNonExclusive() {
        getDatabase().beginTransactionNonExclusive();
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public void commit() {
        getDatabase().setTransactionSuccessful();
        getDatabase().endTransaction();
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public void rollback() {
        getDatabase().endTransaction();
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public String getRecordName(Class<?> clazz) {
        return ClassLoader.get(clazz).getRecordName();
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public String getColumnName(Class<?> clazz, Field field) {
        return ClassLoader.get(clazz).getColumnName(field);
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public String getColumnName(Field field) {
        return getColumnName(field.getDeclaringClass(), field);
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public String getPrimaryKey(Class<?> clazz) {
        return ClassLoader.get(clazz).getPrimaryColumnName();
    }

    @Override // com.vkontakte.android.orm.AbsEntityManager
    public SQLiteDatabase getDatabase() {
        if (this.mDatabase == null) {
            openConnection();
        }
        return this.mDatabase;
    }

    public void backupDatabase(File backupTo) {
        close();
        ORM.copy(getDatabaseFile(), backupTo);
        openConnection();
    }

    public void restoreBackup(File restoreFrom) {
        close();
        ORM.copy(restoreFrom, getDatabaseFile());
        openConnection();
    }

    File getDatabaseFile() {
        if (this.mDbFile == null) {
            this.mDbFile = this.mContext.getDatabasePath(this.mDbName);
        }
        return this.mDbFile;
    }

    /* JADX WARN: Type inference failed for: r0v1, types: [com.vkontakte.android.orm.EntityManager$1] */
    void openConnection() {
        if (this.mDatabase == null) {
            this.mDatabase = new SQLiteOpenHelper(this.mContext, this.mDbName, null, this.mConfig.mDbVersion) { // from class: com.vkontakte.android.orm.EntityManager.1
                @Override // android.database.sqlite.SQLiteOpenHelper
                public void onCreate(SQLiteDatabase db) {
                    EntityManager.this.migrateDatabase(db);
                }

                @Override // android.database.sqlite.SQLiteOpenHelper
                public void onUpgrade(SQLiteDatabase db, int oldVersion, int newVersion) {
                    EntityManager.this.migrateDatabase(db);
                }
            }.getWritableDatabase();
        }
    }

    @SuppressLint({"CommitPrefEdits"})
    void migrateDatabase(SQLiteDatabase db) {
        synchronized (this.mLock) {
            ClassLoader.loadClasses(this.mContext);
            SharedPreferences preferences = this.mContext.getSharedPreferences(this.mDbName + "_meta", 0);
            Map<String, Object> versions = preferences.getAll();
            for (ClassMetaData data : ClassLoader.values()) {
                String modelRecordName = data.getRecordName();
                Object version = versions.get(modelRecordName);
                Integer intVersion = Integer.valueOf(version == null ? 0 : Integer.parseInt(String.valueOf(version)));
                if (version == null) {
                    versions.put(modelRecordName, Integer.valueOf(data.createRecord(db)));
                } else if (data.isMigrationRequired(intVersion.intValue())) {
                    versions.put(modelRecordName, Integer.valueOf(data.migrate(intVersion.intValue(), db)));
                } else {
                    versions.remove(modelRecordName);
                }
            }
            SharedPreferences.Editor editor = preferences.edit();
            for (Map.Entry<String, Object> entry : versions.entrySet()) {
                editor.putString(entry.getKey(), String.valueOf(entry.getValue()));
            }
            editor.commit();
        }
    }
}
