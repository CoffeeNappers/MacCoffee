package com.facebook.common.references;

import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.logging.FLog;
import java.util.IdentityHashMap;
import java.util.Map;
import javax.annotation.concurrent.GuardedBy;
@VisibleForTesting
/* loaded from: classes.dex */
public class SharedReference<T> {
    @GuardedBy("itself")
    private static final Map<Object, Integer> sLiveObjects = new IdentityHashMap();
    @GuardedBy("this")
    private int mRefCount = 1;
    private final ResourceReleaser<T> mResourceReleaser;
    @GuardedBy("this")
    private T mValue;

    public SharedReference(T value, ResourceReleaser<T> resourceReleaser) {
        this.mValue = (T) Preconditions.checkNotNull(value);
        this.mResourceReleaser = (ResourceReleaser) Preconditions.checkNotNull(resourceReleaser);
        addLiveReference(value);
    }

    private static void addLiveReference(Object value) {
        synchronized (sLiveObjects) {
            Integer count = sLiveObjects.get(value);
            if (count == null) {
                sLiveObjects.put(value, 1);
            } else {
                sLiveObjects.put(value, Integer.valueOf(count.intValue() + 1));
            }
        }
    }

    private static void removeLiveReference(Object value) {
        synchronized (sLiveObjects) {
            Integer count = sLiveObjects.get(value);
            if (count == null) {
                FLog.wtf("SharedReference", "No entry in sLiveObjects for value of type %s", value.getClass());
            } else if (count.intValue() == 1) {
                sLiveObjects.remove(value);
            } else {
                sLiveObjects.put(value, Integer.valueOf(count.intValue() - 1));
            }
        }
    }

    public synchronized T get() {
        return this.mValue;
    }

    public synchronized boolean isValid() {
        return this.mRefCount > 0;
    }

    public static boolean isValid(SharedReference<?> ref) {
        return ref != null && ref.isValid();
    }

    public synchronized void addReference() {
        ensureValid();
        this.mRefCount++;
    }

    public void deleteReference() {
        T deleted;
        if (decreaseRefCount() == 0) {
            synchronized (this) {
                deleted = this.mValue;
                this.mValue = null;
            }
            this.mResourceReleaser.release(deleted);
            removeLiveReference(deleted);
        }
    }

    private synchronized int decreaseRefCount() {
        ensureValid();
        Preconditions.checkArgument(this.mRefCount > 0);
        this.mRefCount--;
        return this.mRefCount;
    }

    private void ensureValid() {
        if (!isValid(this)) {
            throw new NullReferenceException();
        }
    }

    public synchronized int getRefCountTestOnly() {
        return this.mRefCount;
    }

    /* loaded from: classes.dex */
    public static class NullReferenceException extends RuntimeException {
        public NullReferenceException() {
            super("Null shared reference");
        }
    }
}
