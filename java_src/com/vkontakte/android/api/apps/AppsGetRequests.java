package com.vkontakte.android.api.apps;

import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ApiApplication;
import com.vkontakte.android.data.GameRequest;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGetRequests extends VKAPIRequest<List<GameRequest>> implements ServerKeys {
    public AppsGetRequests() {
        super("apps.getRequests");
        param(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,sex");
        param("group", 1);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public List<GameRequest> mo1093parse(JSONObject o) throws Exception {
        ArrayList<GameRequest> requests = new ArrayList<>();
        SparseArray<UserProfile> profiles = new SparseArray<>();
        SparseArray<ApiApplication> applications = new SparseArray<>();
        AppsGetGamesPage.parseProfiles(o, profiles, ServerKeys.RESPONSE);
        AppsGetGamesPage.parseApplications(o, applications, ServerKeys.RESPONSE);
        JSONArray requestsArray = APIUtils.unwrapArray(o, ServerKeys.RESPONSE).array;
        for (int i = 0; i < requestsArray.length(); i++) {
            requests.add(new GameRequest(requestsArray.getJSONObject(i), profiles, applications));
        }
        return requests;
    }
}
