package com.vkontakte.android;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.os.Build;
import android.text.TextUtils;
import android.widget.RemoteViews;
import com.vk.imageloader.VKImageLoader;
import com.vk.music.fragment.MusicFragment;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.PlayerAction;
import com.vkontakte.android.audio.player.LoopMode;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.TrackInfo;
import com.vkontakte.android.audio.utils.Utils;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
/* loaded from: classes2.dex */
public class PlayerBigWidget extends AppWidgetProvider {
    private static PendingIntent pending(Context ctx, Intent intent) {
        return PendingIntent.getService(ctx, 0, intent, 1073741824);
    }

    @Override // android.appwidget.AppWidgetProvider
    public void onUpdate(Context ctx, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        update(ctx, appWidgetManager, appWidgetIds);
    }

    public static void update(Context ctx, AppWidgetManager awm, int[] appWidgetIds) {
        RemoteViews rv = new RemoteViews(ctx.getPackageName(), (int) R.layout.widget_player_big);
        Intent openApp = new MusicFragment.Builder().intent(ctx);
        openApp.setAction("fdsafsafdsafs");
        PendingIntent appPending = PendingIntent.getActivity(ctx, 0, openApp, 0);
        PendingIntent nullIntent = Build.VERSION.SDK_INT < 16 ? PendingIntent.getActivity(ctx, 0, new Intent(), 268435456) : null;
        if (AudioFacade.getPlayerState() != PlayerState.IDLE) {
            TrackInfo ti = AudioFacade.getCurrentTrackInfo();
            MusicTrack f = ti == null ? null : ti.getTrack();
            if (f != null) {
                rv.setOnClickPendingIntent(R.id.w_player_play_pause, ti.hasAction(PlayerAction.playPause) ? pending(ctx, AudioFacade.getToggleResumePauseIntent(ctx)) : nullIntent);
                rv.setOnClickPendingIntent(R.id.w_player_next, ti.hasAction(PlayerAction.changeTrack, PlayerAction.skipAd) ? pending(ctx, AudioFacade.getNextIntent(ctx)) : nullIntent);
                rv.setOnClickPendingIntent(R.id.w_player_prev, ti.hasAction(PlayerAction.changeTrack) ? pending(ctx, AudioFacade.getPrevIntent(ctx)) : nullIntent);
                rv.setOnClickPendingIntent(R.id.w_player_shuffle, ti.hasAction(PlayerAction.shuffle) ? pending(ctx, AudioFacade.getToggleShuffleIntent(ctx)) : nullIntent);
                if (ti.hasAction(PlayerAction.repeat)) {
                    nullIntent = pending(ctx, AudioFacade.getToggleRepeatNoneOrTrackIntent(ctx));
                }
                rv.setOnClickPendingIntent(R.id.w_player_repeat, nullIntent);
                rv.setOnClickPendingIntent(R.id.w_player_clickbox, pending(ctx, AudioFacade.getShowPlayerIntent(ctx)));
                rv.setTextViewText(R.id.w_player_artist, ti.getSubTitle());
                rv.setTextViewText(R.id.w_player_title, ti.getTitle());
                String url = f.getThumbUrl(Utils.getMaxCoverSize());
                if (TextUtils.isEmpty(url)) {
                    notAvailable(rv);
                } else {
                    Bitmap bitmap = VKImageLoader.getBitmapFromMemoryCache(url);
                    if (bitmap == null) {
                        notAvailable(rv);
                    } else {
                        onImageLoaded(bitmap, rv);
                    }
                }
            }
            rv.setBoolean(R.id.w_player_artist, "setSingleLine", true);
            rv.setImageViewResource(R.id.w_player_play_pause, AudioFacade.getPlayerState().isPlayState() ? R.drawable.ic_pause_48dp : R.drawable.ic_play_48dp);
            if (AudioFacade.isShuffle()) {
                rv.setImageViewBitmap(R.id.w_player_shuffle, getSelectedIcon(ctx, R.drawable.ic_shuffle_24dp));
            } else {
                rv.setImageViewResource(R.id.w_player_shuffle, R.drawable.ic_shuffle_24dp);
            }
            if (AudioFacade.getLoopMode() == LoopMode.TRACK) {
                rv.setImageViewBitmap(R.id.w_player_repeat, getSelectedIcon(ctx, R.drawable.ic_repeat_24dp));
            } else {
                rv.setImageViewResource(R.id.w_player_repeat, R.drawable.ic_repeat_24dp);
            }
            rv.setViewVisibility(R.id.w_player_inactive_view, 8);
            rv.setInt(R.id.w_player_play_pause, "setBackgroundResource", R.drawable.highlight);
            rv.setInt(R.id.w_player_next, "setBackgroundResource", R.drawable.highlight);
            rv.setInt(R.id.w_player_prev, "setBackgroundResource", R.drawable.highlight);
            rv.setInt(R.id.w_player_shuffle, "setBackgroundResource", R.drawable.highlight_icon);
            rv.setInt(R.id.w_player_repeat, "setBackgroundResource", R.drawable.highlight_icon);
        } else {
            rv.setOnClickPendingIntent(R.id.w_player_clickbox, appPending);
            rv.setTextViewText(R.id.w_player_title, "");
            rv.setTextViewText(R.id.w_player_artist, "");
            rv.setInt(R.id.w_player_play_pause, "setBackgroundColor", 0);
            rv.setInt(R.id.w_player_next, "setBackgroundColor", 0);
            rv.setInt(R.id.w_player_prev, "setBackgroundColor", 0);
            rv.setInt(R.id.w_player_shuffle, "setBackgroundColor", 0);
            rv.setInt(R.id.w_player_repeat, "setBackgroundColor", 0);
            rv.setViewVisibility(R.id.w_player_cover, 8);
            rv.setViewVisibility(R.id.w_player_placeholder, 0);
            rv.setViewVisibility(R.id.w_player_inactive_view, 0);
            rv.setOnClickPendingIntent(R.id.w_player_play_pause, nullIntent);
            rv.setOnClickPendingIntent(R.id.w_player_next, nullIntent);
            rv.setOnClickPendingIntent(R.id.w_player_prev, nullIntent);
            rv.setOnClickPendingIntent(R.id.w_player_shuffle, nullIntent);
            rv.setOnClickPendingIntent(R.id.w_player_repeat, nullIntent);
        }
        if (appWidgetIds == null) {
            awm.updateAppWidget(new ComponentName(ctx, PlayerBigWidget.class), rv);
            return;
        }
        for (int id : appWidgetIds) {
            awm.updateAppWidget(id, rv);
        }
    }

    public static void onImageLoaded(Bitmap bitmap, RemoteViews rv) {
        rv.setImageViewBitmap(R.id.w_player_cover, bitmap);
        rv.setViewVisibility(R.id.w_player_cover, 0);
        rv.setViewVisibility(R.id.w_player_placeholder, 8);
    }

    public static void notAvailable(RemoteViews rv) {
        rv.setViewVisibility(R.id.w_player_cover, 8);
        rv.setViewVisibility(R.id.w_player_placeholder, 0);
    }

    private static Bitmap getSelectedIcon(Context context, int res) {
        Drawable d = context.getResources().getDrawable(res);
        RecoloredDrawable rd = new RecoloredDrawable(d, -10842164);
        Bitmap bmp = Bitmap.createBitmap(d.getIntrinsicWidth(), d.getIntrinsicHeight(), Bitmap.Config.ARGB_8888);
        rd.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
        rd.draw(new Canvas(bmp));
        return bmp;
    }
}
