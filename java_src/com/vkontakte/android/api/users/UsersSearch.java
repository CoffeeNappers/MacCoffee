package com.vkontakte.android.api.users;

import android.os.Bundle;
import android.text.TextUtils;
import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.ListAPIRequest;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.AuthCheckFragment;
import com.vkontakte.android.fragments.money.MoneyTransfersFragment;
import com.vkontakte.android.utils.Serializer;
import java.util.Set;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class UsersSearch extends VKAPIRequest<VKList<SearchProfile>> {
    public UsersSearch(String query, int offset, int count) {
        super("execute");
        String code = "var s=API.users.search({q:\"" + query.replace("\"", "\\\"") + "\",offset:" + offset + ",count:" + count + ",fields:\"photo_100,photo_50,photo_200,online\"});";
        boolean pID = false;
        boolean pDomain = false;
        if (offset == 0) {
            int iv = intval(query);
            if (iv > 0) {
                pID = true;
                code = code + "var p_id=API.users.get({user_ids:" + iv + ",fields:\"photo_100,photo_50,photo_200,online\"});";
            }
            if (!isInt(query) && isDomain(query) && !query.toLowerCase().equals("id" + iv)) {
                pDomain = true;
                code = code + "var p_domain=API.users.get({user_ids:\"" + query + "\",fields:\"photo_100,photo_50,photo_200,online\"});";
            }
        }
        String code2 = code + "return s";
        code2 = pID ? code2 + "+{p_id:p_id[0]}" : code2;
        param(AuthCheckFragment.KEY_CODE, (pDomain ? code2 + "+{p_domain:p_domain[0]}" : code2) + ";");
    }

    public UsersSearch(String query, Bundle xargs, int offset, int count) {
        super("users.search");
        param(GraphRequest.FIELDS_PARAM, "photo_100,photo_50,photo_200,online,education,city,country,common_count,verified,is_friend");
        param(MoneyTransfersFragment.FILTER_ARGUMENT, "mutual");
        param("q", query);
        param("offset", offset).param(ServerKeys.COUNT, count);
        if (xargs != null) {
            Set<String> keys = xargs.keySet();
            for (String key : keys) {
                param(key, xargs.get(key).toString());
            }
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VKList<SearchProfile> mo1093parse(JSONObject o) {
        try {
            JSONObject pID = o.getJSONObject(ServerKeys.RESPONSE).optJSONObject("p_id");
            JSONObject pDomain = o.getJSONObject(ServerKeys.RESPONSE).optJSONObject("p_domain");
            VKList<SearchProfile> r = new VKList<>(o.getJSONObject(ServerKeys.RESPONSE), SearchProfile.class);
            if (pID != null) {
                r.add(0, new SearchProfile(pID));
                r.setTotal(r.total() + 1);
            }
            if (pDomain != null) {
                r.add(0, new SearchProfile(pDomain));
                r.setTotal(r.total() + 1);
                return r;
            }
            return r;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    private int intval(String s) {
        String is = "";
        for (int i = 0; i < s.length(); i++) {
            if (Character.isDigit(s.charAt(i))) {
                is = is + s.charAt(i);
            }
        }
        if (is.length() == 0) {
            return 0;
        }
        try {
            return Integer.parseInt(is);
        } catch (Exception e) {
            return 0;
        }
    }

    private boolean isInt(String s) {
        return (intval(s) + "").equals(s);
    }

    private boolean isDomain(String s) {
        return s.matches("[A-Za-z0-9_\\.]{3,}");
    }

    /* loaded from: classes2.dex */
    public static class SimpleSearch extends ListAPIRequest<SearchProfile> {
        public SimpleSearch(String query, int offset, int count) {
            super("users.search", SearchProfile.class);
            param("q", query.replace("\"", "\\\""));
            param("offset", offset);
            param(ServerKeys.COUNT, count);
            param(GraphRequest.FIELDS_PARAM, "photo_50,photo_100,photo_200");
        }
    }

    /* loaded from: classes2.dex */
    public static class SimpleGroupSearch extends SimpleSearch {
        public SimpleGroupSearch(String query, String fromList, int groupId, int offset, int count) {
            super(query, offset, count);
            param("group_id", groupId);
            if (!TextUtils.isEmpty(fromList)) {
                param("from_list", fromList);
            }
        }
    }

    /* loaded from: classes2.dex */
    public static class SearchProfile extends UserProfile {
        public static final Serializer.Creator<SearchProfile> CREATOR = new Serializer.CreatorAdapter<SearchProfile>() { // from class: com.vkontakte.android.api.users.UsersSearch.SearchProfile.1
            @Override // com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: createFromSerializer */
            public SearchProfile mo1087createFromSerializer(Serializer in) {
                return new SearchProfile(in);
            }

            @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
            /* renamed from: newArray */
            public SearchProfile[] mo1088newArray(int size) {
                return new SearchProfile[size];
            }
        };
        public int commonCount;
        public String commonCountStr;

        public SearchProfile() {
        }

        public SearchProfile(JSONObject o) throws JSONException {
            super(o);
            this.commonCount = o.optInt("common_count", 0);
            this.verified = o.optInt("verified", 0) == 1;
            if (this.commonCount > 0) {
                this.commonCountStr = VKApplication.context.getResources().getQuantityString(R.plurals.num_mutual_friends_req, this.commonCount, Integer.valueOf(this.commonCount));
            }
        }

        @Override // com.vkontakte.android.UserProfile, com.vkontakte.android.utils.Serializer.Serializable
        public void serializeTo(Serializer dest) {
            super.serializeTo(dest);
            dest.writeInt(this.commonCount);
            dest.writeString(this.commonCountStr);
        }

        protected SearchProfile(Serializer in) {
            super(in);
            this.commonCount = in.readInt();
            this.commonCountStr = in.readString();
        }
    }
}
