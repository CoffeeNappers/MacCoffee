package com.vkontakte.android.api.gifts;

import android.os.Parcelable;
import android.util.SparseArray;
import com.facebook.GraphRequest;
import com.vkontakte.android.Global;
import com.vkontakte.android.api.APIException;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.api.models.GiftItem;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.Serializer;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GiftsGet extends ListAPIRequest<GiftItem> {
    public GiftsGet(int user_id, int offset, int count) {
        super("execute.getGifts", GiftItem.class);
        param("user_id", user_id);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
        param(GraphRequest.FIELDS_PARAM, (Global.displayDensity > 1.0f ? "photo_100" : "photo_50") + ",can_see_gifts,first_name_gen,online");
    }

    @Override // com.vkontakte.android.api.ListAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<GiftItem> mo1093parse(JSONObject r) {
        try {
            JSONObject r2 = r.getJSONObject(ServerKeys.RESPONSE);
            if (!r2.optBoolean("gifts", true)) {
                throw new APIException(15, "");
            }
            JSONArray profiles = r2.getJSONArray("profiles");
            SparseArray<UserProfile> users = new SparseArray<>(profiles.length());
            for (int i = 0; i < profiles.length(); i++) {
                UserProfile profile = new UserProfile(profiles.getJSONObject(i));
                users.put(profile.uid, profile);
            }
            VKList<GiftItem> gifts = new VKList<>(r2.getJSONObject("gifts"), GiftItem.class);
            Iterator it = gifts.iterator();
            while (it.hasNext()) {
                GiftItem item = (GiftItem) it.next();
                item.from = users.get(item.from_id);
            }
            return gifts;
        } catch (JSONException e) {
            throw new APIException(-2, "");
        }
    }

    /* loaded from: classes2.dex */
    public static class UserProfile extends com.vkontakte.android.UserProfile implements Parcelable {
        public static final Serializer.Creator<UserProfile> CREATOR = new Serializer.CreatorAdapter<UserProfile>() { // from class: com.vkontakte.android.api.gifts.GiftsGet.UserProfile.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public UserProfile mo1087createFromSerializer(Serializer in) {
                return new UserProfile(in);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public UserProfile[] mo1088newArray(int size) {
                return new UserProfile[size];
            }
        };
        public boolean can_see_gifts;
        public String first_name_gen;

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public UserProfile(Serializer in) {
            super(in);
            boolean z = true;
            this.can_see_gifts = in.readByte() != 1 ? false : z;
            this.first_name_gen = in.readString();
        }

        /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
        public UserProfile(JSONObject o) throws JSONException {
            super(o);
            boolean z = true;
            this.can_see_gifts = o.optInt("can_see_gifts") != 1 ? false : z;
            this.first_name_gen = o.optString("first_name_gen");
        }

        @Override // com.vkontakte.android.UserProfile, com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer p) {
            super.serializeTo(p);
            p.writeByte((byte) (this.can_see_gifts ? 1 : 0));
            p.writeString(this.first_name_gen);
        }
    }
}
