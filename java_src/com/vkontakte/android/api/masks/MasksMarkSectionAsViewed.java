package com.vkontakte.android.api.masks;

import com.vk.masks.model.MaskSection;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksMarkSectionAsViewed extends VKAPIRequest<Response> {
    public MasksMarkSectionAsViewed(int sectionId) {
        super("execute.markMaskSectionAsViewed");
        param("section_id", sectionId);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Response mo1093parse(JSONObject r) throws Exception {
        return new Response(r);
    }

    /* loaded from: classes2.dex */
    public static class Response {
        public final int hasNewBadge;
        public final ArrayList<MaskSection> sections;

        public Response(JSONObject o) throws Exception {
            JSONObject response = o.getJSONObject(ServerKeys.RESPONSE);
            this.sections = MasksGetSections.parseMasksGetSections(response.getJSONObject("getSections"));
            this.hasNewBadge = response.getJSONObject("has_new").getInt("new_masks");
        }

        public Response(ArrayList<MaskSection> sections, int hasNewBadge) {
            this.sections = sections;
            this.hasNewBadge = hasNewBadge;
        }
    }
}
