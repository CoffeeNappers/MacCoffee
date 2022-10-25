package ru.mail.libverify.requests.response;

import android.support.annotation.Nullable;
import java.util.Map;
/* loaded from: classes3.dex */
public final class AttemptApiResponse extends ClientApiResponseBase {
    private Map<String, String> app_endpoints;
    private FetcherInfo fetcher_info;
    private String token;
    private int token_expiration_time;

    public final Map<String, String> getAppEndpoints() {
        return this.app_endpoints;
    }

    @Nullable
    public final FetcherInfo getFetcherInfo() {
        return this.fetcher_info;
    }

    public final String getToken() {
        return this.token;
    }

    public final int getTokenExpirationTime() {
        return this.token_expiration_time;
    }

    @Override // ru.mail.libverify.requests.response.ClientApiResponseBase
    public final String toString() {
        return "AttemptApiResponse{base='" + super.toString() + "'token='" + this.token + "', token_expiration_time='" + this.token_expiration_time + "', fetcher_info='" + this.fetcher_info + "', app_endpoints='" + this.app_endpoints + "'}";
    }
}
