package com.vkontakte.android.orm;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.dex */
public @interface Entity {
    boolean inheritance() default false;

    String value();

    /* loaded from: classes.dex */
    public static final class MetaData {
        final boolean inheritance;
        final String tableName;

        MetaData(String tableName, boolean inheritance) {
            this.tableName = tableName;
            this.inheritance = inheritance;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public MetaData(Entity entity) {
            this.tableName = entity.value();
            this.inheritance = entity.inheritance();
        }
    }
}
