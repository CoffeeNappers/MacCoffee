package com.vkontakte.android.orm;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
@Target({ElementType.TYPE})
@Retention(RetentionPolicy.RUNTIME)
/* loaded from: classes.dex */
public @interface View {
    boolean inheritance() default false;

    String query();

    String value();

    /* loaded from: classes.dex */
    public static final class MetaData {
        final boolean inheritance;
        final String name;
        final String query;

        MetaData(String name, String query, boolean inheritance) {
            this.name = name;
            this.query = query;
            this.inheritance = inheritance;
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public MetaData(View view) {
            this.name = view.value();
            this.query = view.query();
            this.inheritance = view.inheritance();
        }
    }
}
