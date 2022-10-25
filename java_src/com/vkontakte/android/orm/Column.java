package com.vkontakte.android.orm;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.DatabaseUtils;
import android.support.annotation.NonNull;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.dex */
public @interface Column {
    boolean Id() default false;

    boolean autoincrement() default false;

    String defaultValue() default "";

    boolean nullable() default true;

    long size() default 0;

    String type() default "";

    boolean unique() default false;

    String value();

    /* loaded from: classes.dex */
    public static final class MetaData {
        final boolean autoincrement;
        int bindColumnIndex = -1;
        int cursorColumnIndex = -1;
        final String defaultValue;
        private final FieldType fieldType;
        final String name;
        final boolean nullable;
        final boolean primaryKey;
        final long size;
        final String type;
        final boolean unique;

        MetaData(String name, boolean nullable, boolean unique, String defaultValue, String type, long size, boolean primaryKey, boolean autoincrement, Field field) {
            this.name = name;
            this.nullable = nullable;
            this.unique = unique;
            this.defaultValue = defaultValue;
            this.type = type;
            this.size = size;
            this.primaryKey = primaryKey;
            this.autoincrement = autoincrement;
            this.fieldType = FieldType.parse(field);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public MetaData(Column column, Field field) {
            this.name = column.value();
            this.nullable = column.nullable();
            this.unique = column.unique();
            this.defaultValue = column.defaultValue();
            this.type = column.type();
            this.size = column.size();
            this.primaryKey = column.Id();
            this.autoincrement = column.autoincrement();
            this.fieldType = FieldType.parse(field);
        }

        public String getDefaultSQLType() {
            return this.fieldType.getDefaultSQLType();
        }

        public void bind(String key, Field what, ContentValues to, @NonNull Object from) throws IllegalAccessException {
            this.fieldType.bind(key, what, to, from);
        }

        public void bind(int columnId, Field what, DatabaseUtils.InsertHelper to, @NonNull Object from) throws IllegalAccessException {
            this.fieldType.bind(columnId, what, to, from);
        }

        public void set(int columnId, Field what, Cursor from, Object to) throws IllegalAccessException {
            this.fieldType.set(columnId, what, from, to);
        }
    }
}
