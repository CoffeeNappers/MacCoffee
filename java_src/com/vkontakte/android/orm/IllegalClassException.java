package com.vkontakte.android.orm;
/* loaded from: classes3.dex */
public class IllegalClassException extends Exception {
    public IllegalClassException() {
    }

    public IllegalClassException(String detailMessage) {
        super(detailMessage);
    }

    public IllegalClassException(String detailMessage, Throwable throwable) {
        super(detailMessage, throwable);
    }

    public IllegalClassException(Throwable throwable) {
        super(throwable);
    }

    public IllegalClassException(Class clazz) {
        this("Class " + clazz + " is not @View or @Entity");
    }
}
