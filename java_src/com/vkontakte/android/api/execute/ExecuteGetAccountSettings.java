package com.vkontakte.android.api.execute;

import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.SignupPhoneFragment;
import java.io.Serializable;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class ExecuteGetAccountSettings extends VKAPIRequest<Result> {

    /* loaded from: classes2.dex */
    public static class Result implements Serializable {
        public String domain;
        public String email;
        public String emailLink;
        public int newsBannedCount;
        public boolean noWallReplies;
        public boolean ownPostsDefault;
        public String phone;
        public String phoneLink;
    }

    public ExecuteGetAccountSettings() {
        super("execute.getAccountSettings");
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject r) throws Exception {
        boolean z = true;
        JSONObject r2 = r.getJSONObject(ServerKeys.RESPONSE);
        Result res = new Result();
        res.email = r2.getString("email");
        res.emailLink = r2.getString("change_email_url");
        res.phone = r2.getString(SignupPhoneFragment.KEY_PHONE);
        res.phoneLink = r2.getString("change_phone_url");
        res.ownPostsDefault = r2.getInt("own_posts_default") == 1;
        if (r2.getInt("no_wall_replies") != 1) {
            z = false;
        }
        res.noWallReplies = z;
        res.newsBannedCount = r2.getInt("news_banned_count");
        res.domain = r2.getString("domain");
        return res;
    }
}
