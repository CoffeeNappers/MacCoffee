package com.vkontakte.android.api.utils;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class UtilsCheckScreenName extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean isValid;
        public String reason;
        public List<String> suggestions;
    }

    public UtilsCheckScreenName(String name) {
        super("utils.checkScreenName");
        param("screen_name", name);
        param(ShareConstants.WEB_DIALOG_PARAM_SUGGESTIONS, 1);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        boolean z = true;
        JSONObject r2 = r.getJSONObject(ServerKeys.RESPONSE);
        Result res = new Result();
        if (r2.getInt("status") != 1) {
            z = false;
        }
        res.isValid = z;
        if (!res.isValid) {
            res.reason = r2.getString("reason");
            if (r2.has(ShareConstants.WEB_DIALOG_PARAM_SUGGESTIONS)) {
                res.suggestions = new ArrayList();
                JSONArray js = r2.getJSONObject(ShareConstants.WEB_DIALOG_PARAM_SUGGESTIONS).getJSONArray(ServerKeys.ITEMS);
                for (int i = 0; i < js.length(); i++) {
                    res.suggestions.add(js.getString(i));
                }
            }
        }
        return res;
    }
}
