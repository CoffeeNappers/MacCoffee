package com.facebook.internal;

import com.facebook.FacebookException;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
/* loaded from: classes.dex */
public class CollectionMapper {

    /* loaded from: classes.dex */
    public interface Collection<T> {
        Object get(T t);

        Iterator<T> keyIterator();

        void set(T t, Object obj, OnErrorListener onErrorListener);
    }

    /* loaded from: classes.dex */
    public interface OnErrorListener {
        void onError(FacebookException facebookException);
    }

    /* loaded from: classes.dex */
    public interface OnMapValueCompleteListener extends OnErrorListener {
        void onComplete(Object obj);
    }

    /* loaded from: classes.dex */
    public interface OnMapperCompleteListener extends OnErrorListener {
        void onComplete();
    }

    /* loaded from: classes.dex */
    public interface ValueMapper {
        void mapValue(Object obj, OnMapValueCompleteListener onMapValueCompleteListener);
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static <T> void iterate(final Collection<T> collection, ValueMapper valueMapper, final OnMapperCompleteListener onMapperCompleteListener) {
        final Mutable<Boolean> didReturnError = new Mutable<>(false);
        final Mutable<Integer> pendingJobCount = new Mutable<>(1);
        final OnMapperCompleteListener jobCompleteListener = new OnMapperCompleteListener() { // from class: com.facebook.internal.CollectionMapper.1
            /* JADX WARN: Type inference failed for: r0v9, types: [T, java.lang.Integer] */
            @Override // com.facebook.internal.CollectionMapper.OnMapperCompleteListener
            public void onComplete() {
                if (!((Boolean) Mutable.this.value).booleanValue()) {
                    Mutable mutable = pendingJobCount;
                    ?? valueOf = Integer.valueOf(((Integer) pendingJobCount.value).intValue() - 1);
                    mutable.value = valueOf;
                    if (valueOf.intValue() == 0) {
                        onMapperCompleteListener.onComplete();
                    }
                }
            }

            /* JADX WARN: Type inference failed for: r1v1, types: [T, java.lang.Boolean] */
            @Override // com.facebook.internal.CollectionMapper.OnErrorListener
            public void onError(FacebookException exception) {
                if (!((Boolean) Mutable.this.value).booleanValue()) {
                    Mutable.this.value = true;
                    onMapperCompleteListener.onError(exception);
                }
            }
        };
        Iterator<T> keyIterator = collection.keyIterator();
        List<T> keys = new LinkedList<>();
        while (keyIterator.hasNext()) {
            keys.add(keyIterator.next());
        }
        for (final T key : keys) {
            Object value = collection.get(key);
            OnMapValueCompleteListener onMapValueCompleteListener = new OnMapValueCompleteListener() { // from class: com.facebook.internal.CollectionMapper.2
                @Override // com.facebook.internal.CollectionMapper.OnMapValueCompleteListener
                public void onComplete(Object mappedValue) {
                    Collection.this.set(key, mappedValue, jobCompleteListener);
                    jobCompleteListener.onComplete();
                }

                @Override // com.facebook.internal.CollectionMapper.OnErrorListener
                public void onError(FacebookException exception) {
                    jobCompleteListener.onError(exception);
                }
            };
            Integer num = (Integer) pendingJobCount.value;
            pendingJobCount.value = (T) Integer.valueOf(((Integer) pendingJobCount.value).intValue() + 1);
            valueMapper.mapValue(value, onMapValueCompleteListener);
        }
        jobCompleteListener.onComplete();
    }

    private CollectionMapper() {
    }
}
