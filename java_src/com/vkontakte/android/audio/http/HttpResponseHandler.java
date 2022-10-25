package com.vkontakte.android.audio.http;

import android.content.Context;
import okhttp3.Response;
/* loaded from: classes2.dex */
public interface HttpResponseHandler<T> {
    /* renamed from: handleResponse */
    T mo941handleResponse(Context context, Response response) throws Exception;
}
