package com.vkontakte.android.api.wall;

import android.text.TextUtils;
import android.util.SparseArray;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsComment;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.ArrayList;
import java.util.Collections;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class WallGetComments extends VKAPIRequest<Result> {
    boolean needToReverseComments;
    int type;

    /* loaded from: classes2.dex */
    public static class Result {
        public boolean canComment;
        public boolean canLike;
        public boolean canRepost;
        public VKList<NewsComment> comments;
        public boolean liked;
        public JSONArray likes;
        public boolean reposted;
        public int totalLikes;
        public int totalReposts;
        public int totalViews;
    }

    public WallGetComments(int ownerID, int postID, int offset, int count, int type, boolean needLikes, String accessKey, boolean desc, String trackCode) {
        super("execute.getCommentsNew");
        param("owner_id", ownerID);
        param(FirebaseAnalytics.Param.ITEM_ID, postID);
        param("offset", offset);
        param(ServerKeys.COUNT, count);
        switch (type) {
            case 1:
                param(ServerKeys.TYPE, "photo");
                break;
            case 2:
                param(ServerKeys.TYPE, "video");
                break;
            case 12:
                param(ServerKeys.TYPE, "post_ads");
                break;
            default:
                param(ServerKeys.TYPE, ArgKeys.POST);
                break;
        }
        if (needLikes) {
            param("need_likes", 1);
        }
        if (accessKey != null) {
            param("access_key", accessKey);
        }
        param("sort", desc ? "desc" : "asc");
        if (!TextUtils.isEmpty(trackCode)) {
            param("track_code", trackCode);
        }
        this.needToReverseComments = desc;
        param("func_v", 4);
        this.type = type;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Result mo1093parse(JSONObject o) {
        try {
            final SparseArray<String> names = new SparseArray<>();
            final SparseArray<String> names_dat = new SparseArray<>();
            final SparseArray<String> photos = new SparseArray<>();
            final ArrayList<Integer> verifiedList = new ArrayList<>();
            JSONObject resp = o.getJSONObject(ServerKeys.RESPONSE);
            JSONObject jcc = resp.optJSONObject("c");
            JSONArray jprofiles = resp.optJSONArray("p1");
            JSONArray uids_dat = resp.optJSONArray("p2u");
            JSONArray ndat = resp.optJSONArray("p2n");
            JSONArray groups = resp.optJSONArray("groups");
            Result r = new Result();
            r.totalLikes = resp.optInt("likes_count", -1);
            r.totalViews = resp.optInt(ServerKeys.VIEWS_COUNT, -1);
            r.totalReposts = resp.optInt("reposts_count", -1);
            r.liked = resp.optInt("liked", 0) == 1;
            r.reposted = resp.optInt("reposted", 0) == 1;
            r.likes = resp.optJSONArray(ServerKeys.LIKES);
            r.canLike = resp.optInt("can_like", 1) == 1;
            r.canRepost = resp.optInt(ServerKeys.CAN_REPOST, 1) == 1;
            if (jcc == null) {
                r.comments = new VKList<>();
                r.canComment = false;
                return r;
            }
            if (jprofiles != null) {
                for (int i = 0; i < jprofiles.length(); i++) {
                    if (jprofiles.getJSONObject(i).optInt("verified", 0) == 1) {
                        verifiedList.add(Integer.valueOf(jprofiles.getJSONObject(i).getInt("id")));
                    }
                    names.put(jprofiles.getJSONObject(i).getInt("id"), jprofiles.getJSONObject(i).getString("first_name") + ' ' + jprofiles.getJSONObject(i).getString("last_name"));
                    photos.put(jprofiles.getJSONObject(i).getInt("id"), jprofiles.getJSONObject(i).getString(Global.displayDensity > 1.0f ? "photo_medium_rec" : "photo_rec"));
                }
            }
            if (groups != null) {
                for (int i2 = 0; i2 < groups.length(); i2++) {
                    if (groups.getJSONObject(i2).optInt("verified", 0) == 1) {
                        verifiedList.add(Integer.valueOf(-groups.getJSONObject(i2).getInt("id")));
                    }
                    names.put(-groups.getJSONObject(i2).getInt("id"), groups.getJSONObject(i2).getString("name"));
                    photos.put(-groups.getJSONObject(i2).getInt("id"), groups.getJSONObject(i2).getString(Global.displayDensity > 1.0f ? "photo_100" : "photo_50"));
                }
            }
            if (ndat != null) {
                for (int i3 = 0; i3 < ndat.length(); i3++) {
                    names_dat.put(uids_dat.getInt(i3), ndat.getString(i3));
                }
            }
            r.comments = new VKList<>(jcc, new Parser<NewsComment>() { // from class: com.vkontakte.android.api.wall.WallGetComments.1
                /* JADX WARN: Can't rename method to resolve collision */
                @Override // com.vkontakte.android.data.Parser
                /* renamed from: parse */
                public NewsComment mo821parse(JSONObject o2) throws JSONException {
                    return new NewsComment(o2, names, photos, names_dat, verifiedList);
                }
            });
            if (this.needToReverseComments) {
                Collections.reverse(r.comments);
            }
            r.canComment = true;
            return r;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
