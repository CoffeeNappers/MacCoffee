package me.grishka.appkit.api;
/* loaded from: classes3.dex */
public interface Callback<T> {
    void onError(ErrorResponse errorResponse);

    void onSuccess(T t);
}
