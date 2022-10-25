package com.vkontakte.android.media;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes3.dex */
public class VigoPool<T> {
    private final int mMaxSize;
    private final ObjectFactory<T> mObjectFactory;
    private final List<T> mObjects;

    /* loaded from: classes3.dex */
    public interface ObjectFactory<T> {
        /* renamed from: newInstance */
        T mo1082newInstance();
    }

    public VigoPool(ObjectFactory<T> factory, int poolSize) {
        this.mObjectFactory = factory;
        this.mMaxSize = poolSize;
        this.mObjects = new ArrayList(poolSize);
    }

    public T getObject() {
        T obj;
        synchronized (this.mObjects) {
            if (this.mObjects.isEmpty()) {
                obj = this.mObjectFactory.mo1082newInstance();
            } else {
                obj = this.mObjects.remove(this.mObjects.size() - 1);
            }
        }
        return obj;
    }

    public void setFree(T obj) {
        synchronized (this.mObjects) {
            if (this.mObjects.size() < this.mMaxSize) {
                this.mObjects.add(obj);
            }
        }
    }
}
