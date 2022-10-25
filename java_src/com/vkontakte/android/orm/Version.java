package com.vkontakte.android.orm;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.util.Map;
import java.util.TreeMap;
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.dex */
public @interface Version {
    Migration[] map();

    int version();

    /* loaded from: classes.dex */
    public static final class MetaData {
        final Map<Integer, Class<? extends MigrationScript>> mapTable;
        final int version;

        MetaData(int version, Map<Integer, Class<? extends MigrationScript>> mapTable) {
            this.version = version;
            this.mapTable = mapTable;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public MetaData(Version migration) {
            this.version = migration.version();
            Migration[] map = migration.map();
            if (map != null && map.length > 0) {
                this.mapTable = new TreeMap();
                for (Migration m : map) {
                    this.mapTable.put(Integer.valueOf(m.version()), m.script());
                }
                return;
            }
            this.mapTable = null;
        }
    }
}
