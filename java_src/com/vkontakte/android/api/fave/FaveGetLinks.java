package com.vkontakte.android.api.fave;

import android.os.Bundle;
import com.facebook.common.util.UriUtil;
import com.vk.core.util.Screen;
import com.vkontakte.android.Global;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FaveGetLinks extends ListAPIRequest<UserProfile> {
    private static int ID_COUNT = 0;

    static /* synthetic */ int access$008() {
        int i = ID_COUNT;
        ID_COUNT = i + 1;
        return i;
    }

    public FaveGetLinks(int offset, int count) {
        super("fave.getLinks", new Parser<UserProfile>() { // from class: com.vkontakte.android.api.fave.FaveGetLinks.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public UserProfile mo821parse(JSONObject p) throws JSONException {
                String str;
                UserProfile profile = new UserProfile();
                profile.firstName = p.getString("description");
                profile.lastName = p.getString("url");
                if (!profile.lastName.startsWith(UriUtil.HTTP_SCHEME)) {
                    profile.lastName = "http://vk.com" + profile.lastName;
                }
                profile.fullName = p.getString("title");
                if (Global.displayDensity >= 2.0f || Screen.isTablet()) {
                    str = "photo_200";
                } else {
                    str = Global.displayDensity > 1.0f ? "photo_100" : "photo_50";
                }
                profile.photo = p.optString(str, p.optString("photo_100"));
                profile.extra = new Bundle();
                profile.extra.putString("id", p.getString("id"));
                profile.uid = FaveGetLinks.access$008();
                return profile;
            }
        });
        param("offset", offset).param(ServerKeys.COUNT, count);
    }
}
