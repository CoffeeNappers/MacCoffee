package com.vk.music.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import com.vk.core.util.Resourcer;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
/* loaded from: classes2.dex */
public final class CommunityImageView extends VKImageView {
    private boolean verified;
    private Drawable verifiedDrawable;

    public CommunityImageView(Context context) {
        super(context);
        init();
    }

    public CommunityImageView(Context context, AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public CommunityImageView(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
        init();
    }

    private void init() {
        this.verifiedDrawable = Resourcer.of(getContext()).drawable(R.drawable.ic_verified_20dp);
    }

    @Override // android.view.View
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        super.onSizeChanged(w, h, oldw, oldh);
        this.verifiedDrawable.setBounds(w - this.verifiedDrawable.getIntrinsicWidth(), h - this.verifiedDrawable.getIntrinsicHeight(), w, h);
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        if (this.verified) {
            this.verifiedDrawable.draw(canvas);
        }
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }
}
