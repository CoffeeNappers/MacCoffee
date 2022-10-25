package ru.mail.libverify.requests.response;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import java.util.List;
import ru.mail.libverify.gcm.ServerInfo;
import ru.mail.libverify.requests.response.ClientApiResponseBase;
import ru.mail.libverify.utils.Gsonable;
/* loaded from: classes3.dex */
public final class FetchDataResponse extends ClientApiResponseBase {
    private final List<ResponseItem> items;

    /* loaded from: classes3.dex */
    public static class ResponseItem implements Gsonable {
        private FetcherInfo fetcher_info;
        private String key;
        private String message;
        private ServerInfo server_info;
        private ClientApiResponseBase.Status status;

        @Nullable
        public FetcherInfo getFetcherInfo() {
            return this.fetcher_info;
        }

        @Nullable
        public String getKey() {
            return this.key;
        }

        @Nullable
        public String getMessage() {
            return this.message;
        }

        @Nullable
        public ServerInfo getServerInfo() {
            return this.server_info;
        }
    }

    public FetchDataResponse(@NonNull List<ResponseItem> list) {
        this.items = list;
    }

    @NonNull
    public final List<ResponseItem> getItems() {
        return this.items;
    }

    @Override // ru.mail.libverify.requests.response.ClientApiResponseBase
    public final ClientApiResponseBase.Status getStatus() {
        for (ResponseItem responseItem : this.items) {
            if (responseItem != null && responseItem.status != ClientApiResponseBase.Status.OK) {
                return responseItem.status;
            }
        }
        return ClientApiResponseBase.Status.OK;
    }
}
