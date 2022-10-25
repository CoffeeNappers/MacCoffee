package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
/* loaded from: classes3.dex */
public final class PushStatusApiResponse extends ClientApiResponseBase {
    private FetcherInfo fetcher_info;

    @Nullable
    public final FetcherInfo getFetcherInfo() {
        return this.fetcher_info;
    }

    @Override // ru.mail.libverify.requests.response.ClientApiResponseBase
    public final String toString() {
        return "PushStatusApiResponse{fetcher_info=" + this.fetcher_info + '}';
    }
}
