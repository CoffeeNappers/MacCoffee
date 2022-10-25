package com.vkontakte.android.api.apps;

import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
/* loaded from: classes2.dex */
public class AppsGetCatalog extends ListAPIRequest<ApiApplication> {
    public AppsGetCatalog(@Nullable String filter, int offset, int count, String platform) {
        super("apps.getCatalog", ApiApplication.class);
        if (filter != null && filter.equals("html5")) {
            param(JsonMarshaller.PLATFORM, "html5");
        } else {
            if (!TextUtils.isEmpty(filter)) {
                param(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
            }
            param(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        }
        if (platform != null && !platform.isEmpty()) {
            param(JsonMarshaller.PLATFORM, platform);
        }
        param("offset", offset).param(ServerKeys.COUNT, count);
        param("return_friends", 1);
    }

    public AppsGetCatalog(@Nullable String filter, int sectionId, int offset, int count, String platform) {
        super("apps.getCatalog", ApiApplication.class);
        if (!TextUtils.isEmpty(filter)) {
            param(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
        }
        if (sectionId > 0) {
            param("section_id", sectionId);
        }
        param("offset", offset).param(ServerKeys.COUNT, count);
        if (platform != null && !platform.isEmpty()) {
            param(JsonMarshaller.PLATFORM, platform);
        } else {
            param(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        }
        param("return_friends", 1);
    }
}
