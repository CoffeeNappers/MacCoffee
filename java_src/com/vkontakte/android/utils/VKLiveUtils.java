package com.vkontakte.android.utils;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.res.Resources;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.net.Uri;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.VKAlertFragment;
import com.vkontakte.android.fragments.VKLiveInstallBannerFragment;
import com.vkontakte.android.ui.drawables.TextDrawable;
import java.util.Locale;
/* loaded from: classes3.dex */
public final class VKLiveUtils {
    private static final String VK_LIVE_APP_PACKAGE = "com.vk.stream";

    private VKLiveUtils() {
    }

    public static Drawable createLiveDrawable(Resources resources) {
        Drawable liveBackground = resources.getDrawable(R.drawable.bg_video_live);
        TextDrawable textDrawable = new TextDrawable(resources, "LIVE", Global.scale(6.0f));
        return new LayerDrawable(new Drawable[]{liveBackground, textDrawable});
    }

    public static void startStream(Context context) {
        if (isAppInstalled(context)) {
            try {
                context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("vklive://live/?command=start_translation")));
                return;
            } catch (Exception e) {
                L.e("VK Live Utils", e);
                return;
            }
        }
        new VKAlertFragment.Builder().show(context, VKLiveInstallBannerFragment.class, R.style.VKLiveBannerAnim);
    }

    public static void goToTranslation(Context context, int videoId, int ownerId) {
        try {
            if (isAppInstalled(context)) {
                context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse(String.format(Locale.US, "vklive://live/?command=show_live&videoid=%d&ownerid=%d", Integer.valueOf(videoId), Integer.valueOf(ownerId)))));
            } else {
                openMarket(context);
            }
        } catch (Exception e) {
            L.e("VK Live Utils", e);
        }
    }

    public static void openMarket(Context context) {
        try {
            try {
                context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=com.vk.stream")));
            } catch (ActivityNotFoundException e) {
                context.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://play.google.com/store/apps/details?id=com.vk.stream")));
            }
        } catch (Exception e2) {
            L.e("VK Live Utils", e2);
        }
    }

    private static boolean isAppInstalled(Context context) {
        try {
            context.getPackageManager().getPackageInfo(VK_LIVE_APP_PACKAGE, 0);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
