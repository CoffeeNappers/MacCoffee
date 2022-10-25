package com.vkontakte.android.api.masks;

import com.vk.masks.model.Mask;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.VKList;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class MasksResponse {
    public final ArrayList<Group> groups;
    public final VKList<Mask> masks;
    public final ArrayList<UserProfile> profiles;

    public MasksResponse(VKList<Mask> masks) {
        this.masks = masks;
        this.profiles = new ArrayList<>();
        this.groups = new ArrayList<>();
    }

    public MasksResponse(JSONObject jo) throws JSONException {
        this.profiles = parseJsonArray(jo.optJSONArray("profiles"), new Parser<UserProfile>() { // from class: com.vkontakte.android.api.masks.MasksResponse.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public UserProfile mo821parse(JSONObject o) throws JSONException {
                return new UserProfile(o);
            }
        });
        this.groups = parseJsonArray(jo.optJSONArray("groups"), new Parser<Group>() { // from class: com.vkontakte.android.api.masks.MasksResponse.2
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public Group mo821parse(JSONObject o) throws JSONException {
                return new Group(o);
            }
        });
        this.masks = new VKList<>(jo, new Parser<Mask>() { // from class: com.vkontakte.android.api.masks.MasksResponse.3
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public Mask mo821parse(JSONObject o) throws JSONException {
                Mask m = new Mask(o);
                if (m.ownerId < 0) {
                    m.ownerGroup = MasksResponse.findGroup(m.ownerId, MasksResponse.this.groups);
                } else {
                    m.ownerProfile = MasksResponse.findUserProfile(m.ownerId, MasksResponse.this.profiles);
                }
                return m;
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static Group findGroup(int groupId, ArrayList<Group> groups) {
        for (int i = 0; i < groups.size(); i++) {
            if ((-groups.get(i).id) == groupId) {
                return groups.get(i);
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static UserProfile findUserProfile(int userId, ArrayList<UserProfile> profiles) {
        for (int i = 0; i < profiles.size(); i++) {
            if (profiles.get(i).uid == userId) {
                return profiles.get(i);
            }
        }
        return null;
    }

    private static <T> ArrayList<T> parseJsonArray(JSONArray jo, Parser<T> parser) throws JSONException {
        if (jo == null) {
            return new ArrayList<>();
        }
        ArrayList<T> res = new ArrayList<>(jo.length());
        for (int i = 0; i < jo.length(); i++) {
            res.add(parser.mo821parse(jo.getJSONObject(i)));
        }
        return res;
    }
}
