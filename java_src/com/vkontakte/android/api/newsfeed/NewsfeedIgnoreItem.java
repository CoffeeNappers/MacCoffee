package com.vkontakte.android.api.newsfeed;

import android.text.TextUtils;
import com.google.android.exoplayer2.util.MimeTypes;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class NewsfeedIgnoreItem extends ResultlessAPIRequest {
    public NewsfeedIgnoreItem(NewsEntry e, String refer) {
        super("newsfeed.ignoreItem");
        param("owner_id", e.ownerID);
        param(FirebaseAnalytics.Param.ITEM_ID, e.postID);
        if (e.hasTrackCode()) {
            param("track_code", e.getTrackCode());
        }
        if (!TextUtils.isEmpty(refer)) {
            param("ref", refer);
        }
        if (e.flag(256)) {
            param(ServerKeys.TYPE, "profilephoto");
            return;
        }
        switch (e.type) {
            case 1:
                param(ServerKeys.TYPE, "photo");
                return;
            case 2:
                param(ServerKeys.TYPE, "video");
                return;
            case 7:
                param(ServerKeys.TYPE, "tag");
                return;
            case 10:
                param(ServerKeys.TYPE, MimeTypes.BASE_TYPE_AUDIO);
                return;
            default:
                param(ServerKeys.TYPE, ReportAppInputData.REPORT_TYPE_WALL);
                return;
        }
    }

    public static boolean canIgnore(NewsEntry e) {
        return e.flag(256) || e.type == 0 || e.type == 7 || e.type == 1 || e.type == 2 || e.type == 10;
    }
}
