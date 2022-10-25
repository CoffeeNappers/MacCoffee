package com.vkontakte.android.api.external;

import android.os.Bundle;
import com.facebook.share.internal.ShareConstants;
import com.vk.core.network.Network;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.JSONTokener;
/* loaded from: classes2.dex */
public class GmailGetContacts extends VKAPIRequest<List<UserProfile>> {
    private String account;
    Callback callback;
    private String token;

    public GmailGetContacts(String _token, String _account) {
        super("__gmailGetContacts");
        this.token = _token;
        this.account = _account;
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    public JSONObject doExec() {
        try {
            byte[] data = Network.getURL("https://www.google.com/m8/feeds/contacts/" + this.account + "/full?v=3.0&alt=json&max-results=1000&access_token=" + this.token);
            String s = new String(data, "UTF-8");
            return (JSONObject) new JSONTokener(s).nextValue();
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public List<UserProfile> mo1093parse(JSONObject o) {
        try {
            ArrayList<UserProfile> result = new ArrayList<>();
            JSONArray jusers = o.getJSONObject("feed").getJSONArray("entry");
            for (int i = 0; i < jusers.length(); i++) {
                JSONObject ju = jusers.getJSONObject(i);
                if (ju.has("gd$email")) {
                    UserProfile p = new UserProfile();
                    p.extra = new Bundle();
                    p.extra.putString("external_id", ju.getJSONArray("gd$email").getJSONObject(0).getString("address"));
                    if (ju.has("gd$name")) {
                        JSONObject name = ju.getJSONObject("gd$name");
                        p.firstName = name.has("gd$givenName") ? name.getJSONObject("gd$givenName").getString("$t") : "";
                        p.lastName = name.has("gd$familyName") ? name.getJSONObject("gd$familyName").getString("$t") : "";
                        p.fullName = name.getJSONObject("gd$fullName").getString("$t");
                    } else {
                        p.fullName = p.extra.getString("external_id");
                    }
                    String photo = null;
                    JSONArray links = ju.getJSONArray("link");
                    int j = 0;
                    while (true) {
                        if (j >= links.length()) {
                            break;
                        }
                        JSONObject link = links.getJSONObject(j);
                        if (!link.getString(ServerKeys.TYPE).equals("image/*") || !link.getString("rel").endsWith("#photo")) {
                            j++;
                        } else {
                            photo = link.getString(ShareConstants.WEB_DIALOG_PARAM_HREF) + "&access_token=" + this.token;
                            break;
                        }
                    }
                    p.photo = photo;
                    p.university = p.extra.getString("external_id");
                    result.add(p);
                }
            }
            return result;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
