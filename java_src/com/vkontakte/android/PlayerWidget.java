package com.vkontakte.android;

import android.app.PendingIntent;
import android.appwidget.AppWidgetManager;
import android.appwidget.AppWidgetProvider;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.graphics.Bitmap;
import android.graphics.BitmapShader;
import android.graphics.Canvas;
import android.graphics.Matrix;
import android.graphics.Paint;
import android.graphics.RectF;
import android.graphics.Shader;
import android.os.Build;
import android.text.TextUtils;
import android.widget.RemoteViews;
import com.vk.imageloader.VKImageLoader;
import com.vk.music.fragment.MusicFragment;
import com.vkontakte.android.audio.AudioFacade;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.audio.PlayerAction;
import com.vkontakte.android.audio.player.PlayerState;
import com.vkontakte.android.audio.player.TrackInfo;
import me.grishka.appkit.utils.V;
/* loaded from: classes2.dex */
public class PlayerWidget extends AppWidgetProvider {
    private static PendingIntent pending(Context ctx, Intent intent) {
        return PendingIntent.getService(ctx, 0, intent, 1073741824);
    }

    @Override // android.appwidget.AppWidgetProvider
    public void onUpdate(Context ctx, AppWidgetManager appWidgetManager, int[] appWidgetIds) {
        update(ctx, appWidgetManager, appWidgetIds);
    }

    public static void update(Context ctx, AppWidgetManager awm, int[] appWidgetIds) {
        RemoteViews remoteViews = new RemoteViews(ctx.getPackageName(), (int) R.layout.widget_player);
        PendingIntent nullIntent = Build.VERSION.SDK_INT < 16 ? PendingIntent.getActivity(ctx, 0, new Intent(), 268435456) : null;
        TrackInfo ti = AudioFacade.getCurrentTrackInfo();
        remoteViews.setOnClickPendingIntent(R.id.w_player_play_pause, (ti == null || ti.hasAction(PlayerAction.playPause)) ? pending(ctx, AudioFacade.getToggleResumePauseIntent(ctx)) : nullIntent);
        remoteViews.setOnClickPendingIntent(R.id.w_player_next, (ti == null || ti.hasAction(PlayerAction.changeTrack, PlayerAction.skipAd)) ? pending(ctx, AudioFacade.getNextIntent(ctx)) : nullIntent);
        if (ti == null || ti.hasAction(PlayerAction.changeTrack)) {
            nullIntent = pending(ctx, AudioFacade.getPrevIntent(ctx));
        }
        remoteViews.setOnClickPendingIntent(R.id.w_player_prev, nullIntent);
        PendingIntent pendingShowPlayer = pending(ctx, AudioFacade.getShowPlayerIntent(ctx));
        Intent openApp = new MusicFragment.Builder().intent(ctx);
        openApp.setAction("fdsafsafdsafs");
        PendingIntent appPending = PendingIntent.getActivity(ctx, 0, openApp, 0);
        MusicTrack f = ti == null ? null : ti.getTrack();
        if (AudioFacade.getPlayerState() != PlayerState.IDLE && f != null) {
            remoteViews.setOnClickPendingIntent(R.id.w_player_artist, pendingShowPlayer);
            remoteViews.setTextViewText(R.id.w_player_artist, ti.getTitle() + (TextUtils.isEmpty(ti.getSubTitle()) ? "" : " - " + ti.getSubTitle()));
            String url = f.getThumbUrl(170);
            if (TextUtils.isEmpty(url)) {
                notAvailable(remoteViews);
            } else {
                Bitmap bitmap = VKImageLoader.getBitmapFromMemoryCache(url);
                if (bitmap == null) {
                    notAvailable(remoteViews);
                } else {
                    onImageLoaded(bitmap, remoteViews);
                }
            }
            remoteViews.setImageViewResource(R.id.w_player_play_pause, AudioFacade.getPlayerState().isPlayState() ? R.drawable.ic_pause_36dp : R.drawable.ic_play_36dp);
            remoteViews.setViewVisibility(R.id.w_player_btns_wrap, 0);
            remoteViews.setViewVisibility(R.id.w_player_artist, 0);
            remoteViews.setViewVisibility(R.id.w_player_placeholder, 8);
        } else {
            remoteViews.setViewVisibility(R.id.w_player_artist, 8);
            remoteViews.setViewVisibility(R.id.w_player_placeholder, 0);
            remoteViews.setViewVisibility(R.id.w_player_btns_wrap, 8);
            remoteViews.setViewVisibility(R.id.w_player_cover, 8);
            remoteViews.setViewVisibility(R.id.w_player_cover_placeholder, 0);
            remoteViews.setImageViewResource(R.id.w_player_bg, R.drawable.transparent);
            remoteViews.setOnClickPendingIntent(R.id.w_player_placeholder, appPending);
        }
        if (appWidgetIds == null) {
            awm.updateAppWidget(new ComponentName(ctx, PlayerWidget.class), remoteViews);
            return;
        }
        for (int id : appWidgetIds) {
            awm.updateAppWidget(id, remoteViews);
        }
    }

    public static void onImageLoaded(Bitmap cover, RemoteViews remoteViews) {
        Bitmap cv = Bitmap.createBitmap(V.dp(72.0f), V.dp(72.0f), Bitmap.Config.ARGB_8888);
        Canvas c = new Canvas(cv);
        Paint paint = new Paint(3);
        BitmapShader shader = new BitmapShader(cover, Shader.TileMode.CLAMP, Shader.TileMode.CLAMP);
        Matrix matrix = new Matrix();
        matrix.setRectToRect(new RectF(0.0f, 0.0f, cover.getWidth(), cover.getHeight()), new RectF(0.0f, 0.0f, c.getWidth(), c.getHeight()), Matrix.ScaleToFit.FILL);
        shader.setLocalMatrix(matrix);
        paint.setShader(shader);
        c.drawRoundRect(new RectF(0.0f, 0.0f, c.getWidth() + V.dp(10.0f), c.getHeight()), V.dp(2.0f), V.dp(2.0f), paint);
        remoteViews.setImageViewBitmap(R.id.w_player_cover, cv);
        remoteViews.setViewVisibility(R.id.w_player_cover, 0);
        remoteViews.setViewVisibility(R.id.w_player_cover_placeholder, 8);
    }

    public static void notAvailable(RemoteViews remoteViews) {
        remoteViews.setViewVisibility(R.id.w_player_cover, 8);
        remoteViews.setViewVisibility(R.id.w_player_cover_placeholder, 0);
    }
}
