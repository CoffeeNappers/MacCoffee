package com.vkontakte.android.api.apps;

import android.text.TextUtils;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.AuthCheckFragment;
import java.util.ArrayList;
import java.util.Iterator;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsSendRequest extends ResultlessAPIRequest {
    private AppsSendRequest(String code) {
        super("execute");
        param(AuthCheckFragment.KEY_CODE, code);
    }

    private AppsSendRequest(int appId, int userTo, String message, String requestKey) {
        super("apps.sendRequest");
        param("app_id", appId);
        param("user_id", userTo);
        if (!TextUtils.isEmpty(message)) {
            param("text", message);
        }
        if (!TextUtils.isEmpty(requestKey)) {
            param("key", requestKey);
        }
        param(ServerKeys.TYPE, ShareConstants.WEB_DIALOG_RESULT_PARAM_REQUEST_ID);
    }

    public static AppsSendRequest createAppInviteRequest(int appId, ArrayList<Integer> userIds) {
        String executeStr = "";
        Iterator<Integer> it = userIds.iterator();
        while (it.hasNext()) {
            int userId = it.next().intValue();
            executeStr = executeStr + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + String.format("API.apps.sendRequest({app_id:%1$d, user_id:%2$d, type:\"invite\"});", Integer.valueOf(appId), Integer.valueOf(userId));
        }
        return new AppsSendRequest(executeStr);
    }

    public static AppsSendRequest createAppRequestRequest(int appId, int userTo, String message, String requestKey) {
        return new AppsSendRequest(appId, userTo, message, requestKey);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.ResultlessAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Boolean mo1093parse(JSONObject r) {
        return super.mo1093parse(r);
    }
}
