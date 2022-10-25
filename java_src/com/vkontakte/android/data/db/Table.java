package com.vkontakte.android.data.db;

import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class Table {
    private final ArrayList<Column> columns = new ArrayList<>();
    private final String tableName;

    /* loaded from: classes2.dex */
    public static class Column {
        private boolean isAutoincrement;
        private boolean isNotNull;
        private boolean isPrimaryKey;
        private final String name;
        private final Table table;
        private final String type;

        private Column(Table table, String name, String type) {
            this.isPrimaryKey = false;
            this.isAutoincrement = false;
            this.isNotNull = false;
            this.table = table;
            this.name = name;
            this.type = type;
        }

        public Column setPrimaryKey() {
            this.isPrimaryKey = true;
            return this;
        }

        public Column setAutoincrement() {
            this.isAutoincrement = true;
            return this;
        }

        public Column setNotNull() {
            this.isNotNull = true;
            return this;
        }

        public Column withIntegerColumn(String name) {
            Column column = new Column(this.table, name, "INTEGER");
            this.table.columns.add(column);
            return column;
        }

        public Column withTextColumn(String name) {
            Column column = new Column(this.table, name, "TEXT");
            this.table.columns.add(column);
            return column;
        }

        public Column withRealColumn(String name) {
            Column column = new Column(this.table, name, "REAL");
            this.table.columns.add(column);
            return column;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String toSql() {
            StringBuilder builder = new StringBuilder(this.name).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR).append(this.type);
            if (this.isNotNull) {
                builder.append(" NOT NULL");
            }
            if (this.isPrimaryKey) {
                builder.append(" PRIMARY KEY");
            }
            if (this.isAutoincrement) {
                builder.append(" AUTOINCREMENT");
            }
            return builder.toString();
        }

        public String createSql() {
            return this.table.createSql();
        }
    }

    public Table(String tableName) {
        this.tableName = tableName;
    }

    public Column withIntegerColumn(String name) {
        Column column = new Column(name, "INTEGER");
        this.columns.add(column);
        return column;
    }

    public Column withTextColumn(String name) {
        Column column = new Column(name, "TEXT");
        this.columns.add(column);
        return column;
    }

    public Column withRealColumn(String name) {
        Column column = new Column(name, "REAL");
        this.columns.add(column);
        return column;
    }

    public static String dropSql(String tableName) {
        return "DROP TABLE IF EXISTS " + tableName;
    }

    public String createSql() {
        StringBuilder builder = new StringBuilder("CREATE TABLE IF NOT EXISTS ").append(this.tableName).append(MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
        for (int i = 0; i < this.columns.size(); i++) {
            if (i == 0) {
                builder.append(" (");
            }
            builder.append(this.columns.get(i).toSql());
            if (i == this.columns.size() - 1) {
                builder.append(");");
            } else {
                builder.append(", ");
            }
        }
        return builder.toString();
    }
}
