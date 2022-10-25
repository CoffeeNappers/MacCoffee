package me.grishka.appkit.api;

import java.util.ArrayList;
import java.util.Collection;
/* loaded from: classes3.dex */
public abstract class PaginatedList<T> extends ArrayList<T> {
    public abstract int total();

    public PaginatedList(int capacity) {
        super(capacity);
    }

    public PaginatedList() {
    }

    public PaginatedList(Collection<? extends T> collection) {
        super(collection);
    }
}
