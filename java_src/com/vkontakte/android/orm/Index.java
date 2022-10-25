package com.vkontakte.android.orm;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
@Target({ElementType.FIELD})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.dex */
public @interface Index {
    boolean fulltext() default false;

    long length() default 0;

    boolean unique() default false;

    String value();

    /* loaded from: classes.dex */
    public static final class MetaData {
        final boolean fulltext;
        final long length;
        final boolean unique;
        final String value;

        MetaData(String value, boolean unique, long length, boolean fulltext) {
            this.value = value;
            this.unique = unique;
            this.length = length;
            this.fulltext = fulltext;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public MetaData(Index index) {
            this.value = index.value();
            this.unique = index.unique();
            this.fulltext = index.fulltext();
            this.length = index.length();
        }
    }
}
