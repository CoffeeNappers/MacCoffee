package com.vkontakte.android.api.users;

import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class UsersGetSubscriptions extends ListAPIRequest<UserProfile> {
    public UsersGetSubscriptions(int uid, int offset, int count) {
        super("users.getSubscriptions", new Parser<UserProfile>() { // from class: com.vkontakte.android.api.users.UsersGetSubscriptions.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public UserProfile mo821parse(JSONObject ju) throws JSONException {
                if (!ju.has(ServerKeys.TYPE) || (!"page".equals(ju.getString(ServerKeys.TYPE)) && !"group".equals(ju.getString(ServerKeys.TYPE)) && !"event".equals(ju.getString(ServerKeys.TYPE)))) {
                    return new UserProfile(ju);
                }
                UserProfile u = new UserProfile(ju);
                u.uid = -u.uid;
                u.fullName = ju.getString("name");
                return u;
            }
        });
        param("user_id", uid).param("offset", offset).param(ServerKeys.COUNT, count);
        param("extended", 1);
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,photo_200,online");
    }
}
