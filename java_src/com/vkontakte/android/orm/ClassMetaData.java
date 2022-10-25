package com.vkontakte.android.orm;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteDatabase;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.orm.Column;
import com.vkontakte.android.orm.Entity;
import com.vkontakte.android.orm.Index;
import com.vkontakte.android.orm.Version;
import com.vkontakte.android.orm.View;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class ClassMetaData<T> {
    static final String CREATE_TABLE = "CREATE TABLE IF NOT EXISTS ";
    static final String CREATE_VIEW = "CREATE VIEW IF NOT EXISTS ";
    static final String CREATE_VIEW_AS = " AS ";
    static final String INDEX_CREATE = "CREATE";
    static final String INDEX_FULLTEXT = " FULLTEXT";
    static final String INDEX_IF_NOT_EXISTS = " INDEX IF NOT EXISTS ";
    static final String INDEX_ON = " ON ";
    static final String INDEX_UNIQUE = " UNIQUE";
    Map<Field, Column.MetaData> mColumnMetaData;
    private final boolean mCustom;
    Entity.MetaData mEntityData;
    Map<Field, Index.MetaData> mIndexMetaData;
    Version.MetaData mMigrationData;
    private Field mPrimaryKey;
    private String mPrimaryKeyColumn;
    final Class<T> mTargetClass;
    View.MetaData mViewData;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ClassMetaData(Class<T> clazz) throws IllegalClassException {
        this.mTargetClass = clazz;
        boolean inheritance = false;
        boolean isViewOrEntity = false;
        this.mCustom = CustomRecord.class.isAssignableFrom(clazz);
        Annotation entity = clazz.getAnnotation(Entity.class);
        if (entity != null) {
            this.mEntityData = new Entity.MetaData((Entity) entity);
            isViewOrEntity = true;
            inheritance = this.mEntityData.inheritance;
        } else {
            Annotation view = clazz.getAnnotation(View.class);
            if (view != null) {
                this.mViewData = new View.MetaData((View) view);
                isViewOrEntity = true;
                inheritance = this.mViewData.inheritance;
            }
        }
        if (isViewOrEntity) {
            Annotation migration = this.mTargetClass.getAnnotation(Version.class);
            if (migration != null) {
                this.mMigrationData = new Version.MetaData((Version) migration);
            }
            loadFieldsMetaData(this.mTargetClass, inheritance);
            return;
        }
        throw new IllegalClassException(clazz);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getRecordName() {
        return this.mEntityData != null ? this.mEntityData.tableName : this.mViewData.name;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isMigrationRequired(int currentVersionCode) {
        return this.mMigrationData != null && this.mMigrationData.version > currentVersionCode && this.mMigrationData.mapTable != null && !this.mMigrationData.mapTable.isEmpty();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int migrate(int currentVersionCode, SQLiteDatabase db) {
        for (Map.Entry<Integer, Class<? extends MigrationScript>> entry : this.mMigrationData.mapTable.entrySet()) {
            int migrationVersion = entry.getKey().intValue();
            Class<? extends MigrationScript> clazz = entry.getValue();
            if (migrationVersion >= currentVersionCode && migrationVersion <= this.mMigrationData.version && clazz != null) {
                try {
                    currentVersionCode = clazz.newInstance().apply(currentVersionCode, db);
                } catch (IllegalAccessException e) {
                    throw new RuntimeException(e);
                } catch (InstantiationException e2) {
                    throw new RuntimeException(e2);
                }
            }
        }
        return currentVersionCode;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int createRecord(SQLiteDatabase database) {
        return this.mEntityData != null ? createTable(database) : createView(database);
    }

    private int createView(SQLiteDatabase database) {
        database.execSQL(CREATE_VIEW + this.mViewData.name + CREATE_VIEW_AS + this.mViewData.query + ';');
        if (this.mMigrationData == null) {
            return 1;
        }
        return this.mMigrationData.version;
    }

    private int createTable(SQLiteDatabase database) {
        database.execSQL(CREATE_TABLE + this.mEntityData.tableName + ' ' + ((Object) describeColumns()) + ';');
        if (this.mIndexMetaData != null && !this.mIndexMetaData.isEmpty()) {
            StringBuilder sb = new StringBuilder();
            for (Map.Entry<Field, Index.MetaData> entry : this.mIndexMetaData.entrySet()) {
                describeIndex(sb, entry);
                database.execSQL(sb.toString());
                sb.setLength(0);
            }
        }
        if (this.mMigrationData == null) {
            return 1;
        }
        return this.mMigrationData.version;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void bind(ContentValues cv, T entity) {
        if (this.mViewData != null) {
            throw new IllegalArgumentException("Insert or Update are not supported for Views");
        }
        try {
            for (Map.Entry<Field, Column.MetaData> entry : this.mColumnMetaData.entrySet()) {
                Column.MetaData data = entry.getValue();
                data.bind(data.name, entry.getKey(), cv, entity);
            }
            if (this.mCustom) {
                ((CustomRecord) entity).beforeDeflate();
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void bind(DatabaseUtils.InsertHelper helper, T entity) {
        if (this.mViewData != null) {
            throw new IllegalArgumentException("Insert or Update are not supported for Views");
        }
        try {
            for (Map.Entry<Field, Column.MetaData> entry : this.mColumnMetaData.entrySet()) {
                Column.MetaData data = entry.getValue();
                Field field = entry.getKey();
                if (data.bindColumnIndex < 0) {
                    data.bindColumnIndex = helper.getColumnIndex(data.name);
                }
                data.bind(data.bindColumnIndex, field, helper, entity);
            }
            if (this.mCustom) {
                ((CustomRecord) entity).beforeDeflate();
            }
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public T parse(Cursor cursor) {
        try {
            T result = this.mTargetClass.newInstance();
            for (Map.Entry<Field, Column.MetaData> entry : this.mColumnMetaData.entrySet()) {
                Column.MetaData data = entry.getValue();
                Field field = entry.getKey();
                if (data.cursorColumnIndex < 0) {
                    data.cursorColumnIndex = cursor.getColumnIndex(data.name);
                }
                data.set(data.cursorColumnIndex, field, cursor, result);
            }
            if (this.mCustom) {
                ((CustomRecord) result).afterInflate();
            }
            return result;
        } catch (IllegalAccessException e) {
            throw new RuntimeException(e);
        } catch (InstantiationException e2) {
            throw new RuntimeException(e2);
        }
    }

    CharSequence describeColumns() {
        StringBuilder sb = new StringBuilder();
        sb.append('(');
        boolean firstTime = true;
        for (Column.MetaData entry : this.mColumnMetaData.values()) {
            if (firstTime) {
                firstTime = false;
            } else {
                sb.append(',');
                sb.append(' ');
            }
            sb.append(entry.name);
            sb.append(' ');
            describeType(sb, entry);
            if (entry.unique && !entry.primaryKey) {
                sb.append(INDEX_UNIQUE);
            }
            if (!entry.nullable && !entry.primaryKey) {
                sb.append(" NOT NULL");
            }
            if (!entry.primaryKey && !TextUtils.isEmpty(entry.defaultValue)) {
                sb.append(" DEFAULT ");
                sb.append(entry.defaultValue);
            }
            if (entry.primaryKey) {
                sb.append(" PRIMARY KEY");
            }
            if (entry.autoincrement) {
                sb.append(" AUTOINCREMENT");
            }
        }
        sb.append(')');
        return sb;
    }

    void describeType(StringBuilder sb, Column.MetaData entry) {
        if (!TextUtils.isEmpty(entry.type)) {
            sb.append(entry.type);
        } else {
            sb.append(entry.getDefaultSQLType());
        }
        if (entry.size > 0) {
            sb.append('(');
            sb.append(entry.size);
            sb.append(')');
        }
    }

    void describeIndex(StringBuilder sb, Map.Entry<Field, Index.MetaData> entry) {
        Field field = entry.getKey();
        Index.MetaData data = entry.getValue();
        sb.append(INDEX_CREATE);
        if (data.unique) {
            sb.append(INDEX_UNIQUE);
        } else if (data.fulltext) {
            sb.append(INDEX_FULLTEXT);
        }
        sb.append(INDEX_IF_NOT_EXISTS);
        sb.append(data.value);
        sb.append(INDEX_ON);
        sb.append(getRecordName());
        sb.append(' ');
        sb.append('(');
        Column.MetaData columnData = this.mColumnMetaData.get(field);
        if (columnData == null) {
            throw new IllegalStateException("Index " + data.value + " is using without @Column annotation");
        }
        sb.append(columnData.name);
        if (data.length > 0) {
            sb.append('(');
            sb.append(data.length);
            sb.append(')');
        }
        sb.append(')');
        sb.append(';');
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getPrimaryKey(Object from) throws IllegalAccessException {
        Class type = this.mPrimaryKey.getType();
        if (Integer.TYPE == type) {
            return String.valueOf(this.mPrimaryKey.getInt(from));
        }
        if (Long.TYPE == type) {
            return String.valueOf(this.mPrimaryKey.getLong(from));
        }
        return String.valueOf(this.mPrimaryKey.get(from));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public String getPrimaryColumnName() {
        if (this.mPrimaryKeyColumn == null && this.mPrimaryKey != null) {
            this.mPrimaryKeyColumn = getColumnName(this.mPrimaryKey);
        }
        return this.mPrimaryKeyColumn;
    }

    private void loadFieldsMetaData(Class clazz, boolean recursive) {
        Field[] declaredFields;
        Annotation[] annotations;
        for (Field field : clazz.getDeclaredFields()) {
            field.setAccessible(true);
            if (!Modifier.isStatic(field.getModifiers()) && (annotations = field.getAnnotations()) != null) {
                for (Annotation annotation : annotations) {
                    if (annotation instanceof Column) {
                        if (this.mColumnMetaData == null) {
                            this.mColumnMetaData = new LinkedHashMap();
                        }
                        Column.MetaData metaData = new Column.MetaData((Column) annotation, field);
                        if (metaData.primaryKey) {
                            this.mPrimaryKey = field;
                        }
                        this.mColumnMetaData.put(field, metaData);
                    }
                    if (annotation instanceof Index) {
                        if (this.mIndexMetaData == null) {
                            this.mIndexMetaData = new HashMap();
                        }
                        Index.MetaData indexMetaData = new Index.MetaData((Index) annotation);
                        this.mIndexMetaData.put(field, indexMetaData);
                    }
                }
            }
        }
        Class<?> superclass = clazz.getSuperclass();
        if (recursive && superclass != null && !superclass.equals(Object.class)) {
            loadFieldsMetaData(superclass, true);
        }
    }

    public String getColumnName(Field field) {
        return this.mColumnMetaData.get(field).name;
    }
}
