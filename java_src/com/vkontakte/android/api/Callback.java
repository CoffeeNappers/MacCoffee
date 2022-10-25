package com.vkontakte.android.api;

import com.vkontakte.android.api.VKAPIRequest;
/* loaded from: classes.dex */
public interface Callback<R> {
    void fail(VKAPIRequest.VKErrorResponse vKErrorResponse);

    void success(R r);
}
