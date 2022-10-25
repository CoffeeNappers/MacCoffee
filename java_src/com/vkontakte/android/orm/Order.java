package com.vkontakte.android.orm;
/* loaded from: classes3.dex */
public enum Order {
    ASC,
    DESC,
    RANDOM;

    @Override // java.lang.Enum
    public String toString() {
        switch (this) {
            case ASC:
                return "ASC";
            case DESC:
                return "DESC";
            case RANDOM:
                return "RANDOM()";
            default:
                return super.toString();
        }
    }
}
