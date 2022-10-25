package com.vkontakte.android.api.audio;

import com.facebook.GraphRequest;
import com.vk.music.dto.Section;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.VKList;
import java.util.Iterator;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class AudioGetCatalog extends ListAPIRequest<Section> {
    public AudioGetCatalog() {
        super("audio.getCatalog", Section.class);
        param(GraphRequest.FIELDS_PARAM, "first_name_gen,photo_50,photo_100,photo_200");
    }

    @Override // com.vkontakte.android.api.ListAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<Section> mo1093parse(JSONObject r) throws JSONException {
        VKList<Section> list = super.mo1093parse(r);
        Iterator<Section> iterator = list.iterator();
        while (iterator.hasNext()) {
            if (iterator.next().type == Section.Type.unknown) {
                iterator.remove();
            }
        }
        return list;
    }
}
