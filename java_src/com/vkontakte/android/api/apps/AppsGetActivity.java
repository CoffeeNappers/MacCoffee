package com.vkontakte.android.api.apps;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.GameFeedEntry;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKFromList;
import io.sentry.marshaller.json.JsonMarshaller;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGetActivity extends VKAPIRequest<VKFromList<GameFeedEntry>> {
    public AppsGetActivity(String from, int count, int app_id) {
        this(from, count);
        param("filter_app_id", app_id);
    }

    public AppsGetActivity(String from, int count) {
        super("apps.getActivity");
        param(JsonMarshaller.PLATFORM, "html5");
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,sex");
        param(ServerKeys.START_FROM, from);
        param(ServerKeys.COUNT, count);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKFromList<GameFeedEntry> mo1093parse(JSONObject o) {
        try {
            SparseArray<UserProfile> profiles = new SparseArray<>();
            SparseArray<ApiApplication> apps = new SparseArray<>();
            VKFromList<GameFeedEntry> feed = new VKFromList<>(o.getJSONObject(ServerKeys.RESPONSE).optString("next_from"));
            JSONArray profiles1 = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray("profiles");
            for (int i = 0; i < profiles1.length(); i++) {
                JSONObject jp = profiles1.getJSONObject(i);
                UserProfile p = new UserProfile();
                p.uid = jp.getInt("id");
                p.firstName = jp.getString("first_name");
                p.lastName = jp.getString("last_name");
                p.fullName = p.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + p.lastName;
                p.photo = jp.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                p.f = jp.getInt("sex") == 1;
                profiles.put(p.uid, p);
            }
            JSONArray apps1 = o.getJSONObject(ServerKeys.RESPONSE).getJSONArray("apps");
            for (int i2 = 0; i2 < apps1.length(); i2++) {
                ApiApplication app = new ApiApplication(apps1.getJSONObject(i2));
                apps.put(app.id, app);
            }
            JSONArray jfeed = APIUtils.unwrapArray(o, ServerKeys.RESPONSE).array;
            for (int i3 = 0; i3 < jfeed.length(); i3++) {
                GameFeedEntry e = new GameFeedEntry(jfeed.getJSONObject(i3), profiles, apps);
                if (e.user != null && e.app != null) {
                    feed.add(e);
                } else {
                    Log.e("vk", "NO USER");
                }
            }
            return feed;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
