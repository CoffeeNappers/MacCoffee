package com.vk.webapp;

import android.net.Uri;
import com.vkontakte.android.auth.VKAccountManager;
/* loaded from: classes2.dex */
public class ReportAppInputData {
    private static final String ACCESS_TOKEN_KEY = "access_token";
    private static final String AD_DATA_KEY = "ad_data";
    private static final String APP_ID_KEY = "app_id";
    private static final String ITEM_ID_KEY = "item_id";
    private static final String OWNER_ID_KEY = "owner_id";
    private static final String PAGE_KEY = "page";
    private static final String PAGE_VALUE = "reports";
    private static final String REF_KEY = "ref";
    public static final String REPORT_TYPE_AD = "ad";
    public static final String REPORT_TYPE_APP = "app";
    private static final String REPORT_TYPE_KEY = "report_type";
    public static final String REPORT_TYPE_MARKET = "market";
    public static final String REPORT_TYPE_MARKET_COMMENT = "market_comment";
    public static final String REPORT_TYPE_PHOTO = "photo";
    public static final String REPORT_TYPE_PHOTO_COMMENT = "photo_comment";
    public static final String REPORT_TYPE_VIDEO = "video";
    public static final String REPORT_TYPE_VIDEO_COMMENT = "video_comment";
    public static final String REPORT_TYPE_WALL = "wall";
    public static final String REPORT_TYPE_WALL_COMMENT = "wall_comment";

    public static String getSPAUriForMainContentTypes(String reportType, int ownerId, int itemId, String ref) {
        return getUriBuilder().appendQueryParameter(REPORT_TYPE_KEY, reportType).appendQueryParameter("owner_id", Integer.toString(ownerId)).appendQueryParameter("item_id", Integer.toString(itemId)).appendQueryParameter(REF_KEY, ref).build().toString();
    }

    public static String getSPAUriForAd(String adData, String ref) {
        Uri.Builder b = getUriBuilder().appendQueryParameter(REPORT_TYPE_KEY, REPORT_TYPE_AD).appendQueryParameter(AD_DATA_KEY, adData);
        if (ref != null && !ref.isEmpty()) {
            b.appendQueryParameter(REF_KEY, ref);
        }
        return b.build().toString();
    }

    public static String getSPAUriForApp(int ownerId, int appId) {
        return getUriBuilder().appendQueryParameter(REPORT_TYPE_KEY, "app").appendQueryParameter("owner_id", Integer.toString(ownerId)).appendQueryParameter("app_id", Integer.toString(appId)).build().toString();
    }

    public static Uri.Builder getUriBuilder() {
        return Uri.parse(VKUIWebContainerFragment.getSPAUri()).buildUpon().appendQueryParameter(PAGE_KEY, PAGE_VALUE).appendQueryParameter("access_token", VKAccountManager.getCurrent().getAccessToken());
    }
}
