package com.vk.attachpicker.imageeditor.json;

import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FiltersController {
    public static ArrayList<ApiFilterWrapper> filters() {
        try {
            JSONArray ja = new JSONObject(DefaultFilters.DEFAULT_FILTERS_JSON).optJSONObject(ServerKeys.RESPONSE).optJSONObject(ShareConstants.WEB_DIALOG_PARAM_FILTERS).optJSONArray(ServerKeys.ITEMS);
            ArrayList<ApiFilterWrapper> res = new ArrayList<>(ja.length());
            for (int i = 0; i < ja.length(); i++) {
                ApiFilterWrapper wrapper = new ApiFilterWrapper(ja.optJSONObject(i));
                if (wrapper.v == 2) {
                    res.add(wrapper);
                }
            }
            return res;
        } catch (Exception e) {
            return new ArrayList<>();
        }
    }
}
