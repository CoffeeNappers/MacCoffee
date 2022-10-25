package com.vkontakte.android.audio;

import android.app.Activity;
import android.app.Notification;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.res.Resources;
import android.content.res.TypedArray;
import android.database.sqlite.SQLiteDatabase;
import android.graphics.Bitmap;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.widget.RemoteViews;
import com.vkontakte.android.AudioPlayerActivity;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.audio.AudioGetUrlForPlay;
import com.vkontakte.android.audio.player.Player;
import com.vkontakte.android.audio.player.PlayerTrack;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.data.db.Database;
import com.vkontakte.android.utils.L;
import io.fabric.sdk.android.services.common.AbstractSpiCall;
import java.io.File;
/* loaded from: classes2.dex */
public class MusicApp {
    private static Handler statsHandler = null;
    private static UpdateBroadcastSender updateBroadcastSender = null;

    public static Context getInstance() {
        return VKApplication.context;
    }

    public static SQLiteDatabase getWritableDatabase() {
        return Database.getInst(VKApplication.context).getWritableDatabase();
    }

    public static Class<? extends Activity> getAudioPlayerActivityClass() {
        return AudioPlayerActivity.class;
    }

    public static String getActualLink(String mid) throws Exception {
        return getActualLink(mid, null);
    }

    public static String getActualLink(String mid, MusicTrack musicTrack) throws Exception {
        final Object[] result = {null, null};
        new AudioGetUrlForPlay(mid).setCallback(new Callback<MusicTrack>() { // from class: com.vkontakte.android.audio.MusicApp.1
            @Override // com.vkontakte.android.api.Callback
            public void success(MusicTrack res) {
                result[0] = res;
            }

            @Override // com.vkontakte.android.api.Callback
            public void fail(VKAPIRequest.VKErrorResponse error) {
                result[1] = error;
            }
        }).execSync();
        if (result[1] instanceof Exception) {
            throw ((Exception) result[1]);
        }
        MusicTrack track = (MusicTrack) result[0];
        if (musicTrack != null) {
            musicTrack.setRestrictionType(track.getRestrictionType());
        }
        return track.url;
    }

    private static PendingIntent pending(Context ctx, Intent intent) {
        return PendingIntent.getService(ctx, 0, intent, 268435456);
    }

    private static boolean isNotificationColorLight(Context ctx) {
        if (Build.VERSION.SDK_INT < 21) {
            return true;
        }
        TypedArray ta = ctx.obtainStyledAttributes(16974339, new int[]{16842904});
        int color = ta.getColor(0, 0);
        ta.recycle();
        return (((color & 255) + ((color >> 8) & 255)) + ((color >> 16) & 255)) / 3 > 128;
    }

    private static boolean isFlymeOrMIUI(Context ctx) {
        if (new File("/system/framework/flyme-framework.jar").exists()) {
            return !isNotificationColorLight(ctx);
        }
        try {
            PackageInfo info = ctx.getPackageManager().getPackageInfo("com.miui.core", 0);
            if ((info.applicationInfo.flags & 1) == 1) {
                if (!isNotificationColorLight(ctx)) {
                    return true;
                }
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    public static Notification createNotification(Context ctx, @NonNull Player player, @Nullable Bitmap cover) {
        String title;
        String artist;
        Notification notification = new Notification.Builder(ctx).setSmallIcon(player.getState().isPlayState() ? R.drawable.ic_stat_notify_play : R.drawable.ic_stat_notify_pause).getNotification();
        notification.flags |= 34;
        notification.contentIntent = pending(ctx, AudioFacade.getShowPlayerIntent(ctx));
        notification.priority = 2;
        if (Build.VERSION.SDK_INT >= 21) {
            notification.visibility = 1;
        }
        TrackInfo trackInfo = player.getTrackInfo();
        PendingIntent nullIntent = Build.VERSION.SDK_INT < 16 ? PendingIntent.getActivity(ctx, 0, new Intent(), 268435456) : null;
        PendingIntent pendingPlaypause = (trackInfo == null || trackInfo.hasAction(PlayerAction.playPause)) ? pending(ctx, AudioFacade.getToggleResumePauseIntent(ctx)) : nullIntent;
        PendingIntent pendingNext = (trackInfo == null || trackInfo.hasAction(PlayerAction.changeTrack, PlayerAction.skipAd)) ? pending(ctx, AudioFacade.getNextIntent(ctx)) : nullIntent;
        PendingIntent pendingPrev = (trackInfo == null || trackInfo.hasAction(PlayerAction.changeTrack)) ? pending(ctx, AudioFacade.getPrevIntent(ctx)) : nullIntent;
        PendingIntent pendingStop = pending(ctx, AudioFacade.getStopIntent(ctx));
        if (trackInfo != null && trackInfo.hasTrack()) {
            title = trackInfo.getTitle();
            artist = trackInfo.getSubTitle();
        } else {
            title = null;
            artist = null;
        }
        RemoteViews views = new RemoteViews(ctx.getPackageName(), (int) R.layout.audio_notification);
        views.setTextViewText(R.id.title, title);
        views.setTextViewText(R.id.content, artist);
        views.setImageViewResource(R.id.cover, R.drawable.aplayer_cover_placeholder);
        views.setImageViewResource(R.id.playpause, player.getState().isPlayState() ? R.drawable.ic_pause_24dp : R.drawable.ic_play_24dp);
        views.setOnClickPendingIntent(R.id.playpause, pendingPlaypause);
        views.setInt(R.id.next, "setAlpha", pendingNext == nullIntent ? 76 : 255);
        views.setViewVisibility(R.id.next, pendingNext == nullIntent ? 4 : 0);
        views.setOnClickPendingIntent(R.id.next, pendingNext);
        views.setOnClickPendingIntent(R.id.stop, pendingStop);
        views.setInt(R.id.prev, "setAlpha", pendingPrev == nullIntent ? 76 : 255);
        views.setViewVisibility(R.id.prev, pendingPrev == nullIntent ? 4 : 0);
        views.setOnClickPendingIntent(R.id.prev, pendingPrev);
        int bgRes = 0;
        if (Build.VERSION.SDK_INT < 21) {
            bgRes = Resources.getSystem().getIdentifier("notification_bg", "drawable", AbstractSpiCall.ANDROID_CLIENT_TYPE);
        } else {
            notification.deleteIntent = pendingStop;
            if (player.getState().isPlayState()) {
                notification.flags |= 34;
            } else {
                notification.flags &= -35;
            }
        }
        if (isFlymeOrMIUI(ctx)) {
            views.setInt(R.id.notification_root, "setBackgroundColor", -1);
        } else if (bgRes != 0) {
            views.setInt(R.id.notification_root, "setBackgroundResource", bgRes);
        }
        notification.contentView = views;
        RemoteViews xviews = new RemoteViews(ctx.getPackageName(), (int) R.layout.audio_notification_expanded);
        xviews.setTextViewText(R.id.title, title);
        xviews.setTextViewText(R.id.content, artist);
        xviews.setImageViewResource(R.id.cover, R.drawable.aplayer_cover_placeholder);
        xviews.setImageViewResource(R.id.playpause, player.getState().isPlayState() ? R.drawable.ic_pause_24dp : R.drawable.ic_play_24dp);
        xviews.setOnClickPendingIntent(R.id.playpause, pendingPlaypause);
        xviews.setInt(R.id.next, "setAlpha", pendingNext == nullIntent ? 76 : 255);
        xviews.setOnClickPendingIntent(R.id.next, pendingNext);
        xviews.setInt(R.id.prev, "setAlpha", pendingPrev == nullIntent ? 76 : 255);
        xviews.setOnClickPendingIntent(R.id.prev, pendingPrev);
        xviews.setOnClickPendingIntent(R.id.stop, pendingStop);
        if (isFlymeOrMIUI(ctx)) {
            xviews.setInt(R.id.notification_root, "setBackgroundColor", -1);
        } else if (bgRes != 0) {
            xviews.setInt(R.id.notification_root, "setBackgroundResource", bgRes);
        }
        notification.bigContentView = xviews;
        if (cover != null) {
            Bitmap cover2 = Bitmap.createScaledBitmap(cover, Global.scale(130.0f), Global.scale(130.0f), true);
            notification.contentView.setImageViewBitmap(R.id.cover, cover2);
            notification.bigContentView.setImageViewBitmap(R.id.cover, cover2);
        }
        return notification;
    }

    public static void sendBroadcast(PlayerTrack file) {
        synchronized (MusicApp.class) {
            if (statsHandler == null) {
                statsHandler = new Handler(Looper.getMainLooper());
            }
            if (updateBroadcastSender != null) {
                statsHandler.removeCallbacks(updateBroadcastSender);
            }
            updateBroadcastSender = new UpdateBroadcastSender(file);
            statsHandler.postDelayed(updateBroadcastSender, 2000L);
        }
    }

    /* loaded from: classes2.dex */
    private static class UpdateBroadcastSender implements Runnable {
        final MusicTrack f;

        UpdateBroadcastSender(MusicTrack f) {
            this.f = f;
        }

        @Override // java.lang.Runnable
        public void run() {
            try {
                MusicTrack currentFile = AudioFacade.getCurrentTrack();
                if (currentFile != null && this.f.oid == currentFile.oid && this.f.aid == currentFile.aid) {
                    AudioFacade.updateBroadcast();
                }
            } catch (Exception e) {
                L.e(e, new Object[0]);
            }
        }
    }
}
