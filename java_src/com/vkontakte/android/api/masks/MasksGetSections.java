package com.vkontakte.android.api.masks;

import com.vk.masks.model.MaskSection;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksGetSections extends VKAPIRequest<ArrayList<MaskSection>> {
    public MasksGetSections() {
        super("masks.getSections");
    }

    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse  reason: collision with other method in class */
    public ArrayList<MaskSection> mo1093parse(JSONObject o) throws Exception {
        return parseMasksGetSections(o.getJSONObject(ServerKeys.RESPONSE));
    }

    public static ArrayList<MaskSection> parseMasksGetSections(JSONObject o) throws Exception {
        JSONArray items = o.getJSONArray(ServerKeys.ITEMS);
        ArrayList<MaskSection> sections = new ArrayList<>(items.length());
        for (int i = 0; i < items.length(); i++) {
            sections.add(new MaskSection(items.getJSONObject(i)));
        }
        return sections;
    }
}
