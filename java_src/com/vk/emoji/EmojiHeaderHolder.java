package com.vk.emoji;

import android.content.Context;
import android.graphics.Typeface;
import android.os.Build;
import android.view.View;
import android.widget.TextView;
/* loaded from: classes2.dex */
final class EmojiHeaderHolder extends EmojiHolder {
    private TextView textView;

    public EmojiHeaderHolder(final Context context, Typeface headersTypeface) {
        super(new TextView(context) { // from class: com.vk.emoji.EmojiHeaderHolder.1
            @Override // android.widget.TextView, android.view.View
            protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
                int height = (int) context.getResources().getDimension(R.dimen.emoji_keyboard_header_height);
                super.onMeasure(widthMeasureSpec, View.MeasureSpec.makeMeasureSpec(height, 1073741824));
            }
        });
        this.textView = (TextView) this.itemView;
        if (Build.VERSION.SDK_INT >= 21) {
            this.textView.setLetterSpacing(0.05f);
        }
        this.textView.setPadding((int) Utils.convertDpToPixel(12.0f, context), 0, 0, (int) Utils.convertDpToPixel(5.0f, context));
        this.textView.setTextSize(12.0f);
        this.textView.setAllCaps(true);
        this.textView.setTextColor(-7301991);
        this.textView.setGravity(83);
        if (headersTypeface != null) {
            this.textView.setTypeface(headersTypeface);
        } else {
            this.textView.setTypeface(null, 1);
        }
    }

    public void update(String emojiCategoryName) {
        this.textView.setText(emojiCategoryName);
    }
}
