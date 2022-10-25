package com.vkontakte.android.api.execute;

import com.facebook.GraphRequest;
import com.facebook.share.internal.ShareConstants;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import me.grishka.appkit.api.PaginatedList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class SearchGetHints extends VKAPIRequest<EmptyPaginatedList<UserProfile>> {
    private final boolean mNeedDomain;
    private String mQuery;

    public SearchGetHints(String q, int offset, int count, boolean needDomain) {
        super("execute.searchHints");
        this.mQuery = q;
        param(ShareConstants.WEB_DIALOG_PARAM_FILTERS, "mutual_friends,correspondents");
        param("q", q);
        param(ArgKeys.LIMIT, count);
        param("offset", offset);
        param(GraphRequest.FIELDS_PARAM, "photo_rec,photo_medium_rec,online,verified,screen_name,domain");
        this.mNeedDomain = needDomain;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public EmptyPaginatedList<UserProfile> mo1093parse(JSONObject o) {
        EmptyPaginatedList<UserProfile> result = new EmptyPaginatedList<>();
        try {
            JSONArray r = o.getJSONArray(ServerKeys.RESPONSE);
            boolean foundDomain = false;
            for (int i = 0; i < r.length(); i++) {
                JSONObject item = r.getJSONObject(i);
                UserProfile profile = new UserProfile();
                String type = item.getString(ServerKeys.TYPE);
                if ("profile".equals(type)) {
                    JSONObject jp = item.getJSONObject("profile");
                    profile.uid = jp.getInt("id");
                    profile.firstName = jp.getString("first_name");
                    profile.lastName = jp.getString("last_name");
                    profile.fullName = profile.firstName + MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + profile.lastName;
                    profile.photo = jp.getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec");
                    profile.online = Global.getUserOnlineStatus(jp);
                    profile.verified = jp.optInt("verified") == 1;
                    profile.domain = jp.optString("domain");
                } else if ("group".equals(type)) {
                    JSONObject jg = item.getJSONObject("group");
                    profile.uid = -jg.getInt("id");
                    profile.fullName = jg.getString("name");
                    profile.photo = jg.getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50");
                    profile.domain = jg.optString("screen_name");
                    profile.verified = jg.optInt("verified") == 1;
                }
                if (profile.domain != null && profile.domain.equals(this.mQuery)) {
                    foundDomain = true;
                }
                profile.university = item.getString("description");
                result.add(profile);
            }
            if (this.mNeedDomain && !foundDomain) {
                try {
                    Pattern ptn = Pattern.compile("^(?:(?:http|https)://)?(?:vk\\.com|vkontakte\\.ru|new\\.vk\\.com)?/?([a-zA-Z0-9_\\.\\?=&%-]+)$");
                    Matcher matcher = ptn.matcher(this.mQuery.toLowerCase());
                    if (matcher.matches()) {
                        String link = matcher.group(1);
                        if (!link.matches("id[0-9]+") && !link.matches("club[0-9]+")) {
                            UserProfile p = new UserProfile();
                            p.fullName = VKApplication.context.getString(R.string.attach_link);
                            p.university = "vk.com/" + link;
                            result.add(0, p);
                        }
                    } else {
                        Pattern ptn2 = Pattern.compile("^@([a-zA-Z0-9_\\.-]+)$");
                        Matcher matcher2 = ptn2.matcher(this.mQuery);
                        if (matcher2.matches()) {
                            String link2 = matcher2.group(1);
                            UserProfile p2 = new UserProfile();
                            p2.fullName = VKApplication.context.getString(R.string.attach_link);
                            p2.university = "vk.com/" + link2;
                            result.add(0, p2);
                        }
                    }
                } catch (Exception x) {
                    Log.w("vk", x);
                }
            }
            UserProfile extSearchProfile = new UserProfile();
            extSearchProfile.fullName = VKApplication.context.getString(R.string.suggest_type_ext_search);
            extSearchProfile.uid = Integer.MAX_VALUE;
            extSearchProfile.university = null;
            result.add(extSearchProfile);
        } catch (Exception x2) {
            x2.printStackTrace();
        }
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes2.dex */
    public static class EmptyPaginatedList<T> extends PaginatedList<T> {
        @Override // me.grishka.appkit.api.PaginatedList
        public int total() {
            return 0;
        }
    }
}
