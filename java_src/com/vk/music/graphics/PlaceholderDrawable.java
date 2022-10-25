package com.vk.music.graphics;

import android.content.res.Resources;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.ColorFilter;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffColorFilter;
import android.graphics.drawable.BitmapDrawable;
import android.graphics.drawable.Drawable;
import android.graphics.drawable.LayerDrawable;
import android.graphics.drawable.ShapeDrawable;
import android.graphics.drawable.shapes.RectShape;
import android.graphics.drawable.shapes.Shape;
import android.support.annotation.DrawableRes;
import android.support.annotation.NonNull;
import android.support.v4.content.ContextCompat;
import com.vkontakte.android.R;
import com.vkontakte.android.VKApplication;
/* loaded from: classes2.dex */
public final class PlaceholderDrawable extends Drawable {
    static final int PLACEHOLDER_BG_COLOR = ContextCompat.getColor(VKApplication.context, R.color.music_placeholder_bg);
    static final int PLACEHOLDER_ICON_TINT_COLOR = ContextCompat.getColor(VKApplication.context, R.color.music_placeholder_icon_tint);
    private final LayerDrawable drawable;

    public PlaceholderDrawable(int size, @DrawableRes int iconRes) {
        this(size, size, iconRes);
    }

    public PlaceholderDrawable(int width, int height, @DrawableRes int iconRes) {
        Shape bgRect = new RectShape();
        bgRect.resize(width, height);
        ShapeDrawable bgDrawable = new ShapeDrawable(bgRect);
        bgDrawable.setColorFilter(new PorterDuffColorFilter(PLACEHOLDER_BG_COLOR, PorterDuff.Mode.SRC_IN));
        Resources res = VKApplication.context.getResources();
        Bitmap icon = BitmapFactory.decodeResource(res, iconRes);
        BitmapDrawable iconDrawable = new BitmapDrawable(res, icon);
        iconDrawable.setAntiAlias(true);
        iconDrawable.setColorFilter(new PorterDuffColorFilter(PLACEHOLDER_ICON_TINT_COLOR, PorterDuff.Mode.SRC_IN));
        int iconWidth = icon.getWidth();
        int iconHeight = icon.getHeight();
        int left = (width - iconWidth) / 2;
        int top = (height - iconHeight) / 2;
        iconDrawable.setBounds(left, top, left + iconWidth, top + iconHeight);
        iconDrawable.setGravity(17);
        this.drawable = new LayerDrawable(new Drawable[]{bgDrawable, iconDrawable});
    }

    @Override // android.graphics.drawable.Drawable
    public void draw(@NonNull Canvas canvas) {
        this.drawable.draw(canvas);
    }

    @Override // android.graphics.drawable.Drawable
    public void setAlpha(int alpha) {
        this.drawable.setAlpha(alpha);
    }

    @Override // android.graphics.drawable.Drawable
    public void setColorFilter(ColorFilter colorFilter) {
        this.drawable.setColorFilter(colorFilter);
    }

    @Override // android.graphics.drawable.Drawable
    public int getOpacity() {
        return this.drawable.getOpacity();
    }
}
