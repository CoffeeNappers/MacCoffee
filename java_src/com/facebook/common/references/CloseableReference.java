package com.facebook.common.references;

import com.facebook.common.internal.Closeables;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.VisibleForTesting;
import com.facebook.common.logging.FLog;
import java.io.Closeable;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import javax.annotation.Nullable;
import javax.annotation.concurrent.GuardedBy;
/* loaded from: classes.dex */
public final class CloseableReference<T> implements Cloneable, Closeable {
    @Nullable
    private static volatile UnclosedReferenceListener sUnclosedReferenceListener;
    @Nullable
    private Throwable mClonedTrace;
    @GuardedBy("this")
    private boolean mIsClosed;
    @Nullable
    private final Throwable mObtainedTrace;
    private final SharedReference<T> mSharedReference;
    private static Class<CloseableReference> TAG = CloseableReference.class;
    private static final ResourceReleaser<Closeable> DEFAULT_CLOSEABLE_RELEASER = new ResourceReleaser<Closeable>() { // from class: com.facebook.common.references.CloseableReference.1
        @Override // com.facebook.common.references.ResourceReleaser
        public void release(Closeable value) {
            try {
                Closeables.close(value, true);
            } catch (IOException e) {
            }
        }
    };

    /* loaded from: classes.dex */
    public interface UnclosedReferenceListener {
        void onUnclosedReferenceFinalized(CloseableReference<?> closeableReference, Throwable th);
    }

    private CloseableReference(SharedReference<T> sharedReference) {
        this.mIsClosed = false;
        this.mSharedReference = (SharedReference) Preconditions.checkNotNull(sharedReference);
        sharedReference.addReference();
        this.mObtainedTrace = getTraceOrNull();
    }

    private CloseableReference(T t, ResourceReleaser<T> resourceReleaser) {
        this.mIsClosed = false;
        this.mSharedReference = new SharedReference<>(t, resourceReleaser);
        this.mObtainedTrace = getTraceOrNull();
    }

    /* JADX WARN: Incorrect types in method signature: <T::Ljava/io/Closeable;>(TT;)Lcom/facebook/common/references/CloseableReference<TT;>; */
    @Nullable
    public static CloseableReference of(@Nullable Closeable closeable) {
        if (closeable == null) {
            return null;
        }
        return new CloseableReference(closeable, DEFAULT_CLOSEABLE_RELEASER);
    }

    @Nullable
    public static <T> CloseableReference<T> of(@Nullable T t, ResourceReleaser<T> resourceReleaser) {
        if (t == null) {
            return null;
        }
        return new CloseableReference<>(t, resourceReleaser);
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() {
        synchronized (this) {
            if (!this.mIsClosed) {
                this.mIsClosed = true;
                this.mSharedReference.deleteReference();
            }
        }
    }

    public synchronized T get() {
        Preconditions.checkState(!this.mIsClosed);
        return this.mSharedReference.get();
    }

    /* renamed from: clone */
    public synchronized CloseableReference<T> m198clone() {
        this.mClonedTrace = getTraceOrNull();
        Preconditions.checkState(isValid());
        return new CloseableReference<>(this.mSharedReference);
    }

    public synchronized CloseableReference<T> cloneOrNull() {
        this.mClonedTrace = getTraceOrNull();
        return isValid() ? new CloseableReference<>(this.mSharedReference) : null;
    }

    public synchronized boolean isValid() {
        return !this.mIsClosed;
    }

    protected void finalize() throws Throwable {
        try {
            synchronized (this) {
                if (!this.mIsClosed) {
                    UnclosedReferenceListener listener = sUnclosedReferenceListener;
                    if (listener != null) {
                        Throwable cause = this.mClonedTrace != null ? this.mClonedTrace : this.mObtainedTrace;
                        listener.onUnclosedReferenceFinalized(this, cause);
                    } else {
                        FLog.w(TAG, "Finalized without closing: %x %x (type = %s)", Integer.valueOf(System.identityHashCode(this)), Integer.valueOf(System.identityHashCode(this.mSharedReference)), this.mSharedReference.get().getClass().getSimpleName());
                    }
                    close();
                }
            }
        } finally {
            super.finalize();
        }
    }

    @VisibleForTesting
    public synchronized SharedReference<T> getUnderlyingReferenceTestOnly() {
        return this.mSharedReference;
    }

    public synchronized int getValueHash() {
        return isValid() ? System.identityHashCode(this.mSharedReference.get()) : 0;
    }

    public static boolean isValid(@Nullable CloseableReference<?> ref) {
        return ref != null && ref.isValid();
    }

    @Nullable
    public static <T> CloseableReference<T> cloneOrNull(@Nullable CloseableReference<T> ref) {
        if (ref != null) {
            return ref.cloneOrNull();
        }
        return null;
    }

    public static <T> List<CloseableReference<T>> cloneOrNull(Collection<CloseableReference<T>> refs) {
        if (refs == null) {
            return null;
        }
        List<CloseableReference<T>> ret = new ArrayList<>(refs.size());
        for (CloseableReference<T> ref : refs) {
            ret.add(cloneOrNull(ref));
        }
        return ret;
    }

    public static void closeSafely(@Nullable CloseableReference<?> ref) {
        if (ref != null) {
            ref.close();
        }
    }

    public static void closeSafely(@Nullable Iterable<? extends CloseableReference<?>> references) {
        if (references != null) {
            for (CloseableReference<?> ref : references) {
                closeSafely(ref);
            }
        }
    }

    public static void setUnclosedReferenceListener(UnclosedReferenceListener unclosedReferenceListener) {
        sUnclosedReferenceListener = unclosedReferenceListener;
    }

    @Nullable
    private static Throwable getTraceOrNull() {
        if (sUnclosedReferenceListener != null) {
            return new Throwable();
        }
        return null;
    }
}
