package com.vkontakte.android.utils;

import android.content.ActivityNotFoundException;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import android.widget.Toast;
import com.facebook.share.internal.ShareConstants;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.PackageAddedReceiver;
import com.vkontakte.android.R;
import com.vkontakte.android.api.ButtonAction;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.groups.GroupsJoin;
import com.vkontakte.android.attachments.PrettyCardAttachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.data.Analytics;
import com.vkontakte.android.data.PostInteract;
import com.vkontakte.android.data.UserNotification;
import com.vkontakte.android.statistics.Statistic;
import com.vkontakte.android.statistics.StatisticUrl;
import java.util.List;
/* loaded from: classes3.dex */
public final class AdsUtil {
    private AdsUtil() {
    }

    public static void onAdsPostClick(Context context, ShitAttachment ad) {
        trackClicks(ad.getStatisticByType("click"), ad.deepLink, ad.installed);
        if (TextUtils.isEmpty(ad.appPackage) || !ad.installed) {
            processClickWithoutApp(context, ad.data, ad.linkTarget, ad.link);
        } else {
            processClickWithApp(context, ad.data, ad.getStatisticByType(Statistic.TYPE_DEEP_LINK), ad.appPackage, ad.deepLink, ad.link, ad.installed);
        }
    }

    public static void trackImpression(ShitAttachment att) {
        Analytics.trackImpression(att.dataImpression);
        for (StatisticUrl url : att.getStatisticByType(Statistic.TYPE_IMPRESSION)) {
            Analytics.trackExternal(url);
        }
    }

    public static void trackClicks(List<StatisticUrl> statClickURLs, String deepLink, boolean installed) {
        if (!installed || TextUtils.isEmpty(deepLink)) {
            for (StatisticUrl url : statClickURLs) {
                Analytics.trackExternal(url);
            }
        }
    }

    public static void processClickWithoutApp(Context context, String adData, int linkTarget, String link) {
        if (LinkUtils.MARKET.equals(Uri.parse(link).getHost())) {
            Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(link));
            intent.setPackage("com.android.vending");
            context.startActivity(intent);
        } else if (linkTarget == 1) {
            LinkUtils.processInternalHiddenLink(context, link);
        } else if (linkTarget == 2) {
            LinkUtils.processInternalLink(context, link);
        } else {
            LinkUtils.processExternalLink(context, link);
        }
        Analytics.track("ads/click_open_link_url").addParam("ad_data", adData).addParam("ads_device_id", Analytics.getDeviceID()).sendNow();
    }

    public static void processClickWithApp(Context context, String adData, List<StatisticUrl> statDeepLink, String appPackage, String deepLink, String link, boolean installed) {
        if (installed) {
            if (TextUtils.isEmpty(deepLink)) {
                context.startActivity(context.getPackageManager().getLaunchIntentForPackage(appPackage));
            } else {
                context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(deepLink)).setPackage(appPackage));
                for (StatisticUrl url : statDeepLink) {
                    Analytics.trackExternal(url);
                }
            }
            Analytics.track("ads/click_open_app").addParam("ad_data", adData).addParam("ads_device_id", Analytics.getDeviceID()).sendNow();
            return;
        }
        try {
            context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=" + appPackage)));
            context.getSharedPreferences("pending_installs", 0).edit().putString(appPackage, ((System.currentTimeMillis() / 1000) + 86400) + "~" + adData).apply();
            Analytics.track("ads/click_install_app").addParam("ad_data", adData).addParam("ads_device_id", Analytics.getDeviceID()).sendNow();
            context.getPackageManager().setComponentEnabledSetting(new ComponentName(context, PackageAddedReceiver.class), 1, 1);
        } catch (ActivityNotFoundException e) {
            context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(link)));
            Analytics.track("ads/click_open_link_url").addParam("ad_data", adData).addParam("ads_device_id", Analytics.getDeviceID()).addParam("no_google_play", 1).sendNow();
        }
    }

    public static void onPrettyCardClick(Context context, PrettyCardAttachment.Card card) {
        LinkUtils.processLink(context, card.linkUrl, card.linkUrlTarget);
    }

    public static void onActionButtonClick(Context context, ButtonAction buttonAction, @Nullable PostInteract postInteract) {
        String valueOf = String.valueOf(buttonAction.type);
        char c = 65535;
        switch (valueOf.hashCode()) {
            case -504306182:
                if (valueOf.equals(UserNotification.BUTTON_ACTION_OPEN_URL)) {
                    c = 1;
                    break;
                }
                break;
            case 2133225047:
                if (valueOf.equals("join_group_and_open_url")) {
                    c = 0;
                    break;
                }
                break;
        }
        switch (c) {
            case 0:
                joinGroup(context, buttonAction.group_id, buttonAction, postInteract);
                return;
            case 1:
                processButtonActionLink(context, buttonAction);
                return;
            default:
                return;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static void processButtonActionLink(Context ctx, ButtonAction buttonAction) {
        LinkUtils.processLink(ctx, buttonAction.url, buttonAction.target);
    }

    private static void joinGroup(final Context context, int groupId, final ButtonAction buttonAction, @Nullable PostInteract postInteract) {
        String source = formSourceString(postInteract);
        GroupsJoin join = GroupsJoin.createGroupsJoinAndSendAllStats(groupId, false);
        if (source != null) {
            join.param(ShareConstants.FEED_SOURCE_PARAM, source);
        }
        join.setCallback(new ResultlessCallback(null) { // from class: com.vkontakte.android.utils.AdsUtil.1
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                AdsUtil.processButtonActionLink(context, buttonAction);
            }

            @Override // com.vkontakte.android.api.SimpleCallback, com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                Toast.makeText(context, (int) R.string.error, 0).show();
            }
        }).wrapProgress(context).exec(context);
    }

    private static String formSourceString(@Nullable PostInteract postInteract) {
        if (postInteract == null || TextUtils.isEmpty(postInteract.getPostIdStr())) {
            return null;
        }
        return ReportAppInputData.REPORT_TYPE_WALL + postInteract.getPostIdStr();
    }
}
