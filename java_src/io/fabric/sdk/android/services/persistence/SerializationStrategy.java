package io.fabric.sdk.android.services.persistence;
/* loaded from: classes3.dex */
public interface SerializationStrategy<T> {
    T deserialize(String str);

    String serialize(T t);
}
