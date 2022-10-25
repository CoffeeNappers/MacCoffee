package com.vkontakte.android.orm;

import android.database.DatabaseUtils;
import android.database.sqlite.SQLiteStatement;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* loaded from: classes3.dex */
public final class RawQuery<T> {
    private static final String BOOLEAN_FALSE = "0";
    private static final String BOOLEAN_TRUE = "1";
    private static final String EMPTY_STRING = "";
    private static final String ESCAPE_MATCH = "'";
    private static final String ESCAPE_REPLACE = "\\'";
    private String mCompiledStatement;
    private EntityManager mEntityManager;
    private ClassMetaData<T> mMetaData;
    private Map<String, Object> mParams;
    private StringBuilder mSqlQuery;

    /* JADX INFO: Access modifiers changed from: package-private */
    public RawQuery(EntityManager em, ClassMetaData<T> metadata, String sql) {
        this.mEntityManager = em;
        this.mMetaData = metadata;
        this.mSqlQuery = new StringBuilder(sql);
    }

    public RawQuery<T> set(String key, Object value) {
        if (this.mCompiledStatement != null) {
            throw new IllegalStateException("Statement is already compiled");
        }
        if (this.mParams == null) {
            this.mParams = new HashMap();
        }
        this.mParams.put(key, value);
        return this;
    }

    public List<T> execute() {
        return this.mEntityManager.executeRawQuery(this.mMetaData.mTargetClass, toSQL(), new String[0]);
    }

    public long count() {
        SQLiteStatement sql = this.mEntityManager.getDatabase().compileStatement(toSQL());
        try {
            return sql.simpleQueryForLong();
        } finally {
            if (sql != null) {
                sql.close();
            }
        }
    }

    public String toSQL() {
        return this.mCompiledStatement != null ? this.mCompiledStatement : applyParams();
    }

    private String applyParams() {
        if (this.mParams != null) {
            for (Map.Entry<String, Object> entry : this.mParams.entrySet()) {
                String key = keyToken(entry.getKey());
                int start = this.mSqlQuery.indexOf(key);
                this.mSqlQuery.replace(start, key.length() + start, escapeValue(entry.getValue()));
            }
        }
        String sb = this.mSqlQuery.toString();
        this.mCompiledStatement = sb;
        return sb;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String escapeValue(Object value) {
        if (value == null) {
            return "";
        }
        Class<?> type = value.getClass();
        if (String.class == type) {
            return DatabaseUtils.sqlEscapeString((String) value);
        }
        if (Boolean.class == type) {
            return ((Boolean) value).booleanValue() ? "1" : "0";
        } else if (RawQuery.class == type) {
            return ((RawQuery) value).toSQL();
        } else {
            if (value instanceof Enum) {
                return DatabaseUtils.sqlEscapeString(((Enum) value).name());
            }
            return String.valueOf(value);
        }
    }

    private static String keyToken(String key) {
        return ':' + key + ':';
    }
}
