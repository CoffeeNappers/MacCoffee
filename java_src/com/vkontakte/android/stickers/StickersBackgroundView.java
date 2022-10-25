package com.vkontakte.android.stickers;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.support.v4.view.ViewPager;
import android.view.View;
import com.facebook.drawee.drawable.ScalingUtils;
import com.vk.imageloader.view.VKMultiImageView;
import java.util.List;
/* loaded from: classes3.dex */
public class StickersBackgroundView extends VKMultiImageView implements ViewPager.PageTransformer, ViewPager.OnPageChangeListener, Drawable.Callback {
    private final int[] alphas;
    private int currentPosition;
    private Uri[] uris;

    public StickersBackgroundView(Context context, List<StickersViewPage> pages) {
        super(context);
        this.alphas = new int[3];
        addImage();
        addImage();
        addImage();
        setScaleType(ScalingUtils.ScaleType.CENTER_CROP);
        setPages(pages, 0);
    }

    public void setPages(List<StickersViewPage> pages, int position) {
        this.uris = new Uri[pages.size()];
        this.currentPosition = position;
        for (int i = 0; i < pages.size(); i++) {
            StickersViewPage page = pages.get(i);
            if (page != null && page.getServerBackgroundURL() != null) {
                this.uris[i] = Uri.parse(page.getServerBackgroundURL());
            }
        }
        invalidate();
    }

    @Override // android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        for (int i = 0; i < 3; i++) {
            this.draweeHolder.get(i).getTopLevelDrawable().setBounds(0, 0, canvas.getWidth(), canvas.getHeight());
            this.draweeHolder.get(i).getTopLevelDrawable().setAlpha(this.alphas[i]);
            this.draweeHolder.get(i).getTopLevelDrawable().draw(canvas);
        }
    }

    @Override // android.support.v4.view.ViewPager.PageTransformer
    public void transformPage(View view, float position) {
        int index = ((Integer) view.getTag()).intValue();
        if (index < this.currentPosition) {
            this.alphas[0] = getPageAlpha(position);
        } else if (index == this.currentPosition) {
            this.alphas[1] = getPageAlpha(position);
        } else {
            this.alphas[2] = getPageAlpha(position);
        }
        invalidate();
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrolled(int position, float positionOffset, int positionOffsetPixels) {
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageSelected(int position) {
        this.currentPosition = position;
        if (position > 0) {
            load(0, this.uris[position - 1]);
        }
        if (position < this.uris.length) {
            load(1, this.uris[position]);
        }
        if (position < this.uris.length - 1) {
            load(2, this.uris[position + 1]);
        }
        this.alphas[0] = 0;
        this.alphas[1] = 255;
        this.alphas[2] = 0;
        invalidate();
    }

    @Override // android.support.v4.view.ViewPager.OnPageChangeListener
    public void onPageScrollStateChanged(int state) {
    }

    private static int getPageAlpha(float position) {
        if (position <= -1.0f || position >= 1.0f) {
            return 0;
        }
        if (position == 0.0f) {
            return 255;
        }
        return (int) (255.0f - Math.abs(position * 255.0f));
    }
}
