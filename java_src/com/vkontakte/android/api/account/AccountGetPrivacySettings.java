package com.vkontakte.android.api.account;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.PrivacySection;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.HashMap;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AccountGetPrivacySettings extends VKAPIRequest<ArrayList<PrivacySection>> {
    public AccountGetPrivacySettings() {
        super("account.getPrivacySettings");
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<PrivacySection> mo1093parse(JSONObject r) throws Exception {
        ArrayList<PrivacySection> res = new ArrayList<>();
        HashMap<String, PrivacySection> sectionsLookup = new HashMap<>();
        JSONObject r2 = r.getJSONObject(ServerKeys.RESPONSE);
        JSONArray sections = r2.getJSONArray("sections");
        for (int i = 0; i < sections.length(); i++) {
            PrivacySection s = new PrivacySection(sections.getJSONObject(i));
            res.add(s);
            sectionsLookup.put(s.key, s);
        }
        JSONArray settings = r2.getJSONArray("settings");
        for (int i2 = 0; i2 < settings.length(); i2++) {
            PrivacySetting s2 = new PrivacySetting(settings.getJSONObject(i2));
            if (sectionsLookup.containsKey(s2.sectionKey)) {
                sectionsLookup.get(s2.sectionKey).settings.add(s2);
            } else {
                Log.e("vk", "No section with key " + s2.sectionKey);
            }
        }
        return res;
    }
}
