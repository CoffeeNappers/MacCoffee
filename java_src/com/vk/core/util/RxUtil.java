package com.vk.core.util;

import io.reactivex.Observable;
/* loaded from: classes2.dex */
public class RxUtil {
    public static <T> T blockingGetWithNull(Observable<T> observable) {
        try {
            return observable.blockingFirst();
        } catch (Throwable th) {
            return null;
        }
    }
}
