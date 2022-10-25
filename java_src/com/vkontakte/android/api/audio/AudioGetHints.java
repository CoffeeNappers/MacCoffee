package com.vkontakte.android.api.audio;

import android.support.annotation.NonNull;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import java.lang.ref.WeakReference;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class AudioGetHints extends VKAPIRequest<VKList<String>> {
    private static WeakReference<Parser<String>> parserRef;

    public AudioGetHints(@NonNull String query) {
        super("audio.getHints");
        param("q", query);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<String> mo1093parse(JSONObject r) throws Exception {
        Parser<String> parser = parserRef != null ? parserRef.get() : null;
        if (parser == null) {
            parser = new Parser<String>() { // from class: com.vkontakte.android.api.audio.AudioGetHints.1
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
