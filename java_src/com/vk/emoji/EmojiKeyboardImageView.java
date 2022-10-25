package com.vk.emoji;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.support.annotation.Nullable;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import java.util.HashMap;
/* loaded from: classes2.dex */
final class EmojiKeyboardImageView extends ImageView implements EmojiView {
    private static final HashMap<String, Drawable> emojiDrawableMap = new HashMap<>();

    public EmojiKeyboardImageView(Context context) {
        super(context);
        init();
    }

    public EmojiKeyboardImageView(Context context, @Nullable AttributeSet attrs) {
        super(context, attrs);
        init();
    }

    public EmojiKeyboardImageView(Context context, @Nullable AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        init();
    }

    private void init() {
        setBackgroundResource(R.drawable.emoji_white_ripple_bounded);
        setScaleType(ImageView.ScaleType.CENTER);
        setFocusable(false);
        setFocusableInTouchMode(false);
    }

    private Drawable getEmojiDrawable(String emojiCode) {
        Drawable d = emojiDrawableMap.get(emojiCode);
        if (d == null) {
            Drawable d2 = Emoji.instance(getContext()).getEmojiDrawable(emojiCode);
            emojiDrawableMap.put(emojiCode, d2);
            return d2;
        }
        return d;
    }

    @Override // android.widget.ImageView, android.view.View
    protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
        super.onMeasure(View.MeasureSpec.makeMeasureSpec((int) getResources().getDimension(R.dimen.emoji_keyboard_item_width), 1073741824), View.MeasureSpec.makeMeasureSpec((int) getResources().getDimension(R.dimen.emoji_keyboard_item_height), 1073741824));
    }

    public void setEmoji(String emojiCode) {
        setImageDrawable(getEmojiDrawable(emojiCode));
    }

    @Override // com.vk.emoji.EmojiView
    public void invalidateEmoji() {
        invalidate();
    }
}
