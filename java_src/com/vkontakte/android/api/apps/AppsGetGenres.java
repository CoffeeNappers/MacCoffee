package com.vkontakte.android.api.apps;

import com.vkontakte.android.Log;
import com.vkontakte.android.api.APIUtils;
import com.vkontakte.android.api.JSONArrayWithCount;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.GameGenre;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import io.sentry.marshaller.json.JsonMarshaller;
import java.util.ArrayList;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AppsGetGenres extends VKAPIRequest<ArrayList<GameGenre>> {
    public AppsGetGenres() {
        super("apps.getGenres");
        param(JsonMarshaller.PLATFORM, AbstractSpiCall.ANDROID_CLIENT_TYPE);
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<GameGenre> mo1093parse(JSONObject r) throws Exception {
        try {
            ArrayList<GameGenre> genres = new ArrayList<>();
            JSONArrayWithCount array = APIUtils.unwrapArray(r, ServerKeys.RESPONSE);
            if (array == null || array.array == null) {
                return genres;
            }
            for (int i = 0; i < array.array.length(); i++) {
                genres.add(new GameGenre(array.array.getJSONObject(i)));
            }
            return genres;
        } catch (Exception e) {
            Log.w("vk", e);
            return null;
        }
    }
}
