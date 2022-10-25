package com.vkontakte.android.api.friends;

import com.facebook.GraphRequest;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import java.util.Locale;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class FriendsGetSuggestions extends ListAPIRequest<UserProfile> {
    boolean mutual;

    public FriendsGetSuggestions(boolean onlyMutual) {
        super("execute");
        this.mutual = false;
        this.mutual = onlyMutual;
        Locale locale = Locale.US;
        Object[] objArr = new Object[3];
        objArr[0] = "photo_200,photo_100,photo_50";
        objArr[1] = onlyMutual ? ",filter:\"mutual\"" : "";
        objArr[2] = Integer.valueOf(VKAccountManager.getCurrent().getUid());
        param(AuthCheckFragment.KEY_CODE, String.format(locale, "var f=API.friends.getSuggestions({fields:\"%s,education,city,country,common_count\",count:200%s}).items;return {f:f,mc:API.getProfiles({user_ids:%d,fields:\"country\"})[0].country.id};", objArr));
    }

    public FriendsGetSuggestions(boolean onlyMutual, int offset, int count) {
        super("friends.getSuggestions", new Parser<UserProfile>() { // from class: com.vkontakte.android.api.friends.FriendsGetSuggestions.1
            /* JADX WARN: Can't rename method to resolve collision */
            @Override // com.vkontakte.android.data.Parser
            /* renamed from: parse */
            public UserProfile mo821parse(JSONObject o) throws JSONException {
                UserProfile profile = new UserProfile(o);
                profile.photo = o.optString("photo_200", profile.photo);
                int common_count = o.optInt("common_count");
                if (common_count > 0) {
                    profile.university = VKApplication.context.getResources().getQuantityString(R.plurals.num_mutual_friends_req, common_count, Integer.valueOf(common_count));
                }
                return profile;
            }
        });
        this.mutual = false;
        if (onlyMutual) {
            param(MoneyTransfersFragment.FILTER_ARGUMENT, "mutual");
        }
        param(GraphRequest.FIELDS_PARAM, "education,city,country,common_count,photo_50,photo_100,photo_200");
        param("offset", offset);
        param(ServerKeys.COUNT, count);
    }

    @Override // com.vkontakte.android.api.ListAPIRequest, com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<UserProfile> mo1093parse(JSONObject r) throws JSONException {
        return new VKList<>();
    }
}
