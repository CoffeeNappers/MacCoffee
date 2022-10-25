package com.vkontakte.android.api.video;

import android.text.TextUtils;
import com.facebook.internal.FacebookRequestErrorClassification;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.Range;
import java.util.Set;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoViewSegments extends VKAPIRequest<Integer> {
    public VideoViewSegments(Set<Range> ranges, int ownerId, int videoId, String referrer, int searchPos) {
        super("video.viewSegments");
        param("owner_id", ownerId);
        param("video_id", videoId);
        param("module", convertReferrerToModule(referrer, ownerId));
        if (searchPos > 0) {
            param("search_pos", searchPos);
        }
        StringBuilder builder = new StringBuilder();
        for (Range range : ranges) {
            if (builder.length() > 0) {
                builder.append(',');
            }
            builder.append(range);
        }
        param("ranges", builder.toString());
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public Integer mo1093parse(JSONObject o) {
        try {
            return Integer.valueOf(o.getInt(ServerKeys.RESPONSE));
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    private static String convertReferrerToModule(String referrer, int ownerId) {
        if (TextUtils.isEmpty(referrer)) {
            return FacebookRequestErrorClassification.KEY_OTHER;
        }
        if (referrer.startsWith(FirebaseAnalytics.Event.SEARCH)) {
            return FirebaseAnalytics.Event.SEARCH;
        }
        if (referrer.startsWith(ReportAppInputData.REPORT_TYPE_WALL)) {
            return ReportAppInputData.REPORT_TYPE_WALL;
        }
        if (referrer.equals("fave")) {
            return "fave";
        }
        if (referrer.equals("news")) {
            return "feed";
        }
        if (referrer.startsWith("club") || referrer.equals("videos_group")) {
            return "group";
        }
        if (referrer.equals("videos_user")) {
            return ownerId == VKAccountManager.getCurrent().getUid() ? "videos" : "profile";
        } else if (referrer.equals("messages")) {
            return "im";
        } else {
            if (referrer.equals("comments")) {
                return "pages";
            }
            return FacebookRequestErrorClassification.KEY_OTHER;
        }
    }
}
