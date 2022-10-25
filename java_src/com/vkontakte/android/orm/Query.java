package com.vkontakte.android.orm;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import android.text.TextUtils;
import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public final class Query<T> {
    static final String All = "*";
    static final String And = "AND";
    static final String Between = "BETWEEN";
    static final String Delimiter = ", ";
    static final String From = "FROM";
    static final String GroupBy = "GROUP BY";
    static final String Having = "HAVING";
    static final String In = "IN";
    static final String IsEqualTo = "=";
    static final String IsGreaterThan = ">";
    static final String IsGreaterThanOrEqualTo = ">=";
    static final String IsLessThan = "<";
    static final String IsLessThanOrEqualTo = "<=";
    static final String IsNotEqualTo = "!=";
    static final String IsNotNull = "IS NOT NULL";
    static final String IsNull = "IS NULL";
    static final String Like = "LIKE";
    static final String Limit = "LIMIT";
    static final String NotBetween = "NOT BETWEEN";
    static final String NotIn = "NOT IN";
    static final String NotLike = "NOT LIKE";
    static final String Offset = "OFFSET";
    static final String Or = "OR";
    static final String OrderBy = "ORDER BY";
    static final String Select = "SELECT";
    static final String SelectCount = "SELECT COUNT(*)";
    static final String SelectDistinct = "SELECT DISTINCT";
    static final String Set = "SET";
    static final String Update = "UPDATE";
    static final String Where = "WHERE";
    final AbsEntityManager mEntityManager;
    String[] mFields;
    String[] mGroupBy;
    String mHaving;
    final ClassMetaData<T> mMetaData;
    String mOrderBy;
    Order mOrderDirection;
    boolean mUseWhere;
    List<String> mWhereArgs;
    int mLimit = -1;
    int mOffset = -1;
    boolean mDistinct = false;

    public Query(ClassMetaData<T> classMetaData, AbsEntityManager em) {
        this.mMetaData = classMetaData;
        this.mEntityManager = em;
    }

    public Query<T> distinct() {
        this.mDistinct = true;
        return this;
    }

    public Query<T> fields(String... fields) {
        this.mFields = fields;
        return this;
    }

    public Query<T> fields(Field... fields) {
        this.mFields = new String[fields.length];
        for (int i = 0; i < fields.length; i++) {
            this.mFields[i] = this.mMetaData.getColumnName(fields[i]);
        }
        return this;
    }

    public Query<T> between(Object val1, Object val2) {
        return addComparison(Between, val1, val2);
    }

    public Query<T> in(Object... vals) {
        return addComparison(In, vals);
    }

    public Query<T> isEqualTo(Object val) {
        return addComparison(IsEqualTo, val);
    }

    public Query<T> isNull() {
        return addComparison(IsNull);
    }

    public Query<T> isNotNull() {
        return addComparison(IsNotNull);
    }

    public Query<T> isGreaterThan(Object val) {
        return addComparison(IsGreaterThan, val);
    }

    public Query<T> isGreaterThanOrEqualTo(Object val) {
        return addComparison(IsGreaterThanOrEqualTo, val);
    }

    public Query<T> isLessThan(Object val) {
        return addComparison(IsLessThan, val);
    }

    public Query<T> isLessThanOrEqualTo(Object val) {
        return addComparison(IsLessThanOrEqualTo, val);
    }

    public Query<T> isNotEqualTo(Object val) {
        return addComparison(IsNotEqualTo, val);
    }

    public Query<T> like(Object val) {
        return addComparison(Like, val.toString());
    }

    public Query<T> notBetween(Object val1, Object val2) {
        return addComparison(NotBetween, val1, val2);
    }

    public Query<T> notIn(Object... vals) {
        return addComparison(NotIn, vals);
    }

    public Query<T> notIn(List<Object> vals) {
        return addComparison(NotIn, vals.toArray());
    }

    public Query<T> notLike(Object val) {
        return addComparison(NotLike, val);
    }

    public Query<T> where(String column) {
        this.mUseWhere = true;
        return addComparison(column);
    }

    public Query<T> where(Field field) {
        return where(this.mMetaData.getColumnName(field));
    }

    public Query<T> and(String column) {
        return addComparison("AND " + column);
    }

    public Query<T> and(Field field) {
        return and(this.mMetaData.getColumnName(field));
    }

    public Query<T> or(String column) {
        return addComparison("OR " + column);
    }

    public Query<T> or(Field field) {
        return or(this.mMetaData.getColumnName(field));
    }

    public Query<T> groupBy(String... fields) {
        this.mGroupBy = fields;
        return this;
    }

    public Query<T> groupBy(Field... fields) {
        String[] array = new String[fields.length];
        for (int i = 0; i < fields.length; i++) {
            array[i] = this.mMetaData.getColumnName(fields[i]);
        }
        return groupBy(array);
    }

    public Query<T> having(String having) {
        this.mHaving = having;
        return this;
    }

    public Query<T> orderBy(String field, Order direction) {
        this.mOrderBy = field;
        this.mOrderDirection = direction;
        return this;
    }

    public Query<T> orderBy(Field field, Order direction) {
        return orderBy(this.mMetaData.getColumnName(field), direction);
    }

    public Query<T> limit(int count) {
        this.mLimit = count;
        return this;
    }

    public Query<T> limit(int count, int offset) {
        this.mLimit = count;
        this.mOffset = offset;
        return this;
    }

    public List<T> load() {
        return this.mEntityManager.executeRawQuery(this.mMetaData.mTargetClass, selectQuery(), new String[0]);
    }

    public Cursor loadCursor() {
        return this.mEntityManager.cursorQuery(selectQuery(), new String[0]);
    }

    public long loadCount() {
        SQLiteStatement sql = this.mEntityManager.getDatabase().compileStatement("SELECT COUNT(*) FROM `" + this.mMetaData.getRecordName() + "` " + ((Object) compile()));
        try {
            return sql.simpleQueryForLong();
        } finally {
            sql.close();
        }
    }

    public T loadSingle() {
        limit(1);
        List<T> entities = load();
        if (entities == null || entities.isEmpty()) {
            return null;
        }
        return entities.get(0);
    }

    public int delete() {
        String str = null;
        if (this.mMetaData.mViewData != null) {
            throw new IllegalArgumentException("Query.delete() is not supported for views. Please use for entities only.");
        }
        SQLiteDatabase db = this.mEntityManager.getDatabase();
        CharSequence sql = compile();
        try {
            db.beginTransaction();
            String recordName = this.mMetaData.getRecordName();
            if (!TextUtils.isEmpty(sql)) {
                str = sql.toString();
            }
            int count = db.delete(recordName, str, null);
            db.setTransactionSuccessful();
            return count;
        } finally {
            db.endTransaction();
        }
    }

    public void update(Object... filedNamesAndValues) {
        if (this.mMetaData.mViewData != null) {
            throw new IllegalArgumentException("Query.update() is not supported for views. Please use for entities only.");
        }
        this.mEntityManager.getDatabase();
        StringBuilder sb = new StringBuilder(Update);
        sb.append(' ');
        sb.append('`');
        sb.append(this.mMetaData.getRecordName());
        sb.append('`');
        sb.append(' ');
        sb.append(Set);
        boolean firstTime = true;
        for (int i = 0; i < filedNamesAndValues.length; i += 2) {
            if (firstTime) {
                firstTime = false;
            } else {
                sb.append(Delimiter);
            }
            sb.append(' ');
            sb.append('`');
            sb.append(filedNamesAndValues[i]);
            sb.append('`');
            sb.append(' ');
            sb.append(IsEqualTo);
            sb.append(' ');
            sb.append(RawQuery.escapeValue(filedNamesAndValues[i + 1]));
        }
        CharSequence where = compile();
        if (!TextUtils.isEmpty(where)) {
            sb.append(' ');
            sb.append(where);
        }
        this.mEntityManager.getDatabase().execSQL(sb.toString());
    }

    public void rawUpdate(Object... filedNamesAndValues) {
        if (this.mMetaData.mViewData != null) {
            throw new IllegalArgumentException("Query.update() is not supported for views. Please use for entities only.");
        }
        this.mEntityManager.getDatabase();
        StringBuilder sb = new StringBuilder(Update);
        sb.append(' ');
        sb.append('`');
        sb.append(this.mMetaData.getRecordName());
        sb.append('`');
        sb.append(' ');
        sb.append(Set);
        boolean firstTime = true;
        for (int i = 0; i < filedNamesAndValues.length; i += 2) {
            if (firstTime) {
                firstTime = false;
            } else {
                sb.append(Delimiter);
            }
            sb.append(' ');
            sb.append('`');
            sb.append(filedNamesAndValues[i]);
            sb.append('`');
            sb.append(' ');
            sb.append(IsEqualTo);
            sb.append(' ');
            sb.append(filedNamesAndValues[i + 1]);
        }
        CharSequence where = compile();
        if (!TextUtils.isEmpty(where)) {
            sb.append(' ');
            sb.append(where);
        }
        this.mEntityManager.getDatabase().execSQL(sb.toString());
    }

    private Query<T> addComparison(String val) {
        if (this.mWhereArgs == null) {
            this.mWhereArgs = new ArrayList();
        }
        this.mWhereArgs.add(val);
        return this;
    }

    private Query<T> addComparison(String comparison, Object val) {
        return addComparison(comparison + ' ' + RawQuery.escapeValue(val));
    }

    private Query<T> addComparison(String comparison, Object val1, Object val2) {
        return addComparison(comparison + ' ' + RawQuery.escapeValue(val1) + ' ' + And + ' ' + RawQuery.escapeValue(val2));
    }

    private Query<T> addComparison(String comparison, Object... vals) {
        int i = 0;
        StringBuilder sb = new StringBuilder();
        boolean firstTime = true;
        if (vals != null && vals.length > 0) {
            Object firstElem = vals[0];
            if (firstElem instanceof Iterable) {
                for (Object val : (Iterable) firstElem) {
                    if (firstTime) {
                        firstTime = false;
                    } else {
                        sb.append(Delimiter);
                    }
                    sb.append(RawQuery.escapeValue(val));
                }
            } else {
                Class<?> clazz = firstElem.getClass();
                if (int[].class == clazz) {
                    int[] iArr = (int[]) firstElem;
                    int length = iArr.length;
                    while (i < length) {
                        int val2 = iArr[i];
                        if (firstTime) {
                            firstTime = false;
                        } else {
                            sb.append(Delimiter);
                        }
                        sb.append(RawQuery.escapeValue(Integer.valueOf(val2)));
                        i++;
                    }
                } else if (long[].class == clazz) {
                    long[] jArr = (long[]) firstElem;
                    int length2 = jArr.length;
                    while (i < length2) {
                        long val3 = jArr[i];
                        if (firstTime) {
                            firstTime = false;
                        } else {
                            sb.append(Delimiter);
                        }
                        sb.append(RawQuery.escapeValue(Long.valueOf(val3)));
                        i++;
                    }
                } else if (Object[].class.isAssignableFrom(clazz)) {
                    Object[] objArr = (Object[]) firstElem;
                    int length3 = objArr.length;
                    while (i < length3) {
                        Object val4 = objArr[i];
                        if (firstTime) {
                            firstTime = false;
                        } else {
                            sb.append(Delimiter);
                        }
                        sb.append(RawQuery.escapeValue(val4));
                        i++;
                    }
                } else {
                    int length4 = vals.length;
                    while (i < length4) {
                        Object val5 = vals[i];
                        if (firstTime) {
                            firstTime = false;
                        } else {
                            sb.append(Delimiter);
                        }
                        sb.append(RawQuery.escapeValue(val5));
                        i++;
                    }
                }
            }
        }
        return addComparison(comparison + " (" + ((Object) sb) + ')');
    }

    CharSequence compile() {
        String[] strArr;
        StringBuilder result = new StringBuilder();
        boolean appendSpace = false;
        if (this.mUseWhere && this.mWhereArgs != null) {
            result.append(Where);
            for (String operator : this.mWhereArgs) {
                result.append(' ');
                result.append(operator);
            }
            appendSpace = true;
        }
        if (this.mGroupBy != null && this.mGroupBy.length > 0) {
            if (appendSpace) {
                result.append(' ');
            }
            result.append(GroupBy);
            result.append(' ');
            boolean firstTime = true;
            for (String groupBy : this.mGroupBy) {
                if (firstTime) {
                    firstTime = false;
                } else {
                    result.append(Delimiter);
                }
                result.append(groupBy);
            }
            appendSpace = true;
        }
        if (this.mHaving != null) {
            if (appendSpace) {
                result.append(' ');
            }
            result.append(Having);
            result.append(' ');
            result.append(this.mHaving);
            appendSpace = true;
        }
        if (this.mOrderBy != null && this.mOrderDirection != null) {
            if (appendSpace) {
                result.append(' ');
            }
            result.append(OrderBy);
            result.append(' ');
            result.append(this.mOrderBy);
            result.append(' ');
            result.append(this.mOrderDirection);
            appendSpace = true;
        }
        if (this.mLimit >= 0) {
            if (appendSpace) {
                result.append(' ');
            }
            result.append(Limit);
            result.append(' ');
            result.append(this.mLimit);
            if (this.mOffset >= 0) {
                result.append(' ');
                result.append(Offset);
                result.append(' ');
                result.append(this.mOffset);
            }
        }
        return result;
    }

    String selectQuery() {
        CharSequence compiledSource = compile();
        return (this.mDistinct ? SelectDistinct : Select) + ' ' + (this.mFields == null ? "*" : TextUtils.join(Delimiter, this.mFields)) + ' ' + From + ' ' + (TextUtils.isEmpty(compiledSource) ? this.mMetaData.getRecordName() : this.mMetaData.getRecordName() + ' ' + ((Object) compiledSource));
    }
}
