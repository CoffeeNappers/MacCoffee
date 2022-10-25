package com.vkontakte.android.api.wall;

import com.facebook.GraphRequest;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.Global;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.navigation.ArgKeys;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class LikesGetList extends ListAPIRequest<UserProfile> {
    Callback callback;
    private String[] types;

    public LikesGetList(int type, int parentType, int oid, int itemID, int offset, int count, boolean friends, String filter) {
        super("likes.getList", new Parser<UserProfile>() { // from class: com.vkontakte.android.api.wall.LikesGetList.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public UserProfile mo821parse(JSONObject jp) throws JSONException {
                String str;
                if ("profile".equals(jp.optString(ServerKeys.TYPE))) {
                    return new UserProfile(jp);
                }
                UserProfile p = new UserProfile();
                p.fullName = jp.getString("name");
                if (Global.displayDensity >= 2.0f) {
                    str = "photo_200";
                } else {
                    str = Global.displayDensity > 1.0f ? "photo_100" : "photo_50";
                }
                p.photo = jp.optString(str, jp.optString("photo_100"));
                p.uid = -jp.getInt("id");
                return p;
            }
        });
        this.types = new String[]{ArgKeys.POST, "photo", "video", "note", "topic", "comment", ReportAppInputData.REPORT_TYPE_MARKET};
        if (type == 12) {
            param(ServerKeys.TYPE, "post_ads");
        } else if (type == 5) {
            String t = "";
            switch (parentType) {
                case 1:
                    t = "photo_";
                    break;
                case 2:
                    t = "video_";
                    break;
                case 4:
                    t = "topic_";
                    break;
            }
            param(ServerKeys.TYPE, t + "comment");
        } else {
            param(ServerKeys.TYPE, this.types[type]);
        }
        param("owner_id", oid).param(FirebaseAnalytics.Param.ITEM_ID, itemID).param(ServerKeys.COUNT, count).param("offset", offset).param("extended", 1).param(GraphRequest.FIELDS_PARAM, "online,photo_200,photo_100,photo_50");
        if (friends) {
            param("friends_only", 1);
        }
        if (filter != null) {
            param(MoneyTransfersFragment.FILTER_ARGUMENT, filter);
        }
    }
}
