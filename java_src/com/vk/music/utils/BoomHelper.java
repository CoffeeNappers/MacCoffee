package com.vk.music.utils;

import android.content.ActivityNotFoundException;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.Toast;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.money.BuyMusicSubscriptionFragment;
import com.vkontakte.android.utils.L;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public final class BoomHelper {
    private static final String BOOM_PACKAGE = "com.uma.musicvk";
    private VKAPIRequest<Boolean> setForDownloadRequest = null;

    /* loaded from: classes2.dex */
    public enum Action {
        play,
        download
    }

    /* loaded from: classes2.dex */
    public enum From {
        player,
        menu,
        cache,
        subscription
    }

    public void loadTrack(final Context ctx, @Nullable MusicTrack musicTrack, final From from) {
        if (musicTrack != null) {
            if (VKAccountManager.getCurrent().hasMusicSubscription()) {
                if (isBoomInstalled(ctx)) {
                    TrackInfo trackInfo = AudioFacade.getCurrentTrackInfo();
                    int position = trackInfo == null ? 0 : trackInfo.getPosition() / 1000;
                    openBoom(ctx, Action.download, musicTrack.getMid(), position);
                    return;
                } else if (this.setForDownloadRequest == null) {
                    this.setForDownloadRequest = new VKAPIRequest<Boolean>("audio.setForDownload") { // from class: com.vk.music.utils.BoomHelper.1
                        /* JADX WARN: Can't rename method to resolve collision */
                        @Override // com.vkontakte.android.api.VKAPIRequest
                        /* renamed from: parse */
                        public Boolean mo1093parse(JSONObject r) throws Exception {
                            try {
                                return Boolean.valueOf(r.getInt(ServerKeys.RESPONSE) != 0);
                            } catch (Exception e) {
                                L.e(e, new Object[0]);
                                return false;
                            }
                        }
                    }.param("owner_id", musicTrack.oid).param("audio_id", musicTrack.aid);
                    this.setForDownloadRequest.setCallback(new Callback<Boolean>() { // from class: com.vk.music.utils.BoomHelper.2
                        @Override // com.vkontakte.android.api.Callback
                        public void success(Boolean result) {
                            if (Boolean.TRUE.equals(result)) {
                                BoomHelper.openBoom(ctx, from);
                            }
                            BoomHelper.this.setForDownloadRequest = null;
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse error) {
                            BoomHelper.this.setForDownloadRequest = null;
                        }
                    });
                    this.setForDownloadRequest.wrapProgress(ctx).exec(ctx);
                    return;
                } else {
                    return;
                }
            }
            BuyMusicSubscriptionFragment.show(ctx);
        }
    }

    public static boolean isBoomInstalled(@NonNull Context ctx) {
        return isAppInstalled(BOOM_PACKAGE, ctx);
    }

    public static void openBoom(@NonNull Context ctx, From from) {
        switch (from) {
            case cache:
                open(BOOM_PACKAGE, ctx, "utm_source%3Dvkontakte%26utm_campaign%3Dcache");
                return;
            case player:
                open(BOOM_PACKAGE, ctx, "utm_source%3Dvkontakte%26utm_campaign%3Dplayer");
                return;
            case subscription:
                open(BOOM_PACKAGE, ctx, "utm_source%3Dvkontakte%26utm_campaign%3Dsubscription");
                return;
            case menu:
                open(BOOM_PACKAGE, ctx, "utm_source%3Dvkontakte%26utm_campaign%3Dmenu");
                return;
            default:
                return;
        }
    }

    private static void openBoom(@NonNull Context ctx, @NonNull Action action, String mid, int position) {
        StringBuilder boomLink = new StringBuilder("boom://store/").append(mid).append("?action=").append(action.name());
        if (action == Action.play) {
            boomLink.append("&position=").append(position);
        }
        boomLink.append("&from=vk");
        Intent intent = new Intent("android.intent.action.VIEW", Uri.parse(boomLink.toString()));
        ctx.startActivity(intent);
    }

    private static boolean isAppInstalled(String pkg, Context ctx) {
        PackageManager mgr = ctx.getPackageManager();
        PackageInfo info = null;
        try {
            info = mgr.getPackageInfo(pkg, 128);
        } catch (PackageManager.NameNotFoundException e) {
        }
        return info != null;
    }

    private static void open(String pkg, Context ctx, String refer) {
        if (pkg == null || pkg.length() == 0) {
            Toast.makeText(ctx, "No platform_id, can't start app!", 0).show();
            return;
        }
        try {
            PackageManager mgr = ctx.getPackageManager();
            PackageInfo info = null;
            try {
                info = mgr.getPackageInfo(pkg, 128);
            } catch (PackageManager.NameNotFoundException e) {
            }
            if (info != null) {
                Intent launcherIntent = mgr.getLaunchIntentForPackage(pkg);
                if (launcherIntent == null) {
                    Toast.makeText(ctx, "Package " + pkg + " has no launchable activities", 0).show();
                    return;
                }
                launcherIntent.putExtra("auth_user_id", VKAccountManager.getCurrent().getUid());
                ctx.startActivity(launcherIntent);
                return;
            }
            try {
                ctx.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("market://details?id=" + pkg + "&referrer=" + refer)));
            } catch (ActivityNotFoundException e2) {
                ctx.startActivity(new Intent("android.intent.action.VIEW", Uri.parse("http://play.google.com/store/apps/details?id=" + pkg + "&referrer=" + refer)));
            }
        } catch (Exception x) {
            Log.w("vk", x);
            Toast.makeText(ctx, (int) R.string.error, 0).show();
        }
    }
}
