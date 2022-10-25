package io.reactivex.flowables;

import io.reactivex.Flowable;
/* loaded from: classes3.dex */
public abstract class GroupedFlowable<K, T> extends Flowable<T> {
    final K key;

    /* JADX INFO: Access modifiers changed from: protected */
    public GroupedFlowable(K key) {
        this.key = key;
    }

    public K getKey() {
        return this.key;
    }
}
