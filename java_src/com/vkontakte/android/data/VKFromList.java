package com.vkontakte.android.data;

import java.util.ArrayList;
/* loaded from: classes2.dex */
public class VKFromList<T> extends ArrayList<T> {
    private String from;

    public VKFromList(String from) {
        this.from = from;
    }

    public String from() {
        return this.from;
    }
}
