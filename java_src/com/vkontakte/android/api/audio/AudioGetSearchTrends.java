package com.vkontakte.android.api.audio;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import java.lang.ref.WeakReference;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioGetSearchTrends extends VKAPIRequest<VKList<String>> {
    private static WeakReference<Parser<String>> parserRef;

    public AudioGetSearchTrends(int count) {
        this(count, 0);
    }

    public AudioGetSearchTrends(int count, int offset) {
        super("audio.getSearchTrends");
        param(ServerKeys.COUNT, count);
        param("offset", offset);
        param("need_queries", AppEventsConstants.EVENT_PARAM_VALUE_YES);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<String> mo1093parse(JSONObject r) throws Exception {
        Parser<String> parser = parserRef != null ? parserRef.get() : null;
        if (parser == null) {
            parser = new Parser<String>() { // from class: com.vkontakte.android.api.audio.AudioGetSearchTrends.1
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse  reason: collision with other method in class */
                public String mo821parse(JSONObject o) throws JSONException {
                    return o.getString("name");
                }
            };
            parserRef = new WeakReference<>(parser);
        }
        return new VKList<>(r.getJSONObject(ServerKeys.RESPONSE), parser);
    }
}
