package com.vkontakte.android.api.users;

import com.facebook.GraphRequest;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.Parser;
import io.sentry.DefaultSentryClientFactory;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class UsersGetNearby extends ListAPIRequest<UserProfile> {
    public UsersGetNearby(double lat, double lon, int accuracy, int radius, int timeout) {
        super("users.getNearby", new Parser<UserProfile>() { // from class: com.vkontakte.android.api.users.UsersGetNearby.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public UserProfile mo821parse(JSONObject o) throws JSONException {
                UserProfile p = new UserProfile(o);
                if (o.optInt("common_count") > 0) {
                    p.university = VKApplication.context.getResources().getQuantityString(R.plurals.num_mutual_friends_req, o.optInt("common_count"), Integer.valueOf(o.optInt("common_count")));
                } else {
                    p.university = "";
                }
                return p;
            }
        });
        param("latitude", lat + "").param("longitude", lon + "");
        param("accuracy", accuracy);
        param("radius", radius);
        param(DefaultSentryClientFactory.TIMEOUT_OPTION, timeout);
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,common_count,is_friend");
    }
}
