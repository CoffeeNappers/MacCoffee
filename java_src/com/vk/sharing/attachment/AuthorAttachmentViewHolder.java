package com.vk.sharing.attachment;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.annotation.StringRes;
import android.support.v4.content.ContextCompat;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKCircleImageView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.Font;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AttachmentViewHolder.java */
/* loaded from: classes2.dex */
public class AuthorAttachmentViewHolder extends DataViewHolder {
    @Nullable
    private VKImageView imageView;
    @StringRes
    private final int label;
    @Nullable
    private TextView textView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AuthorAttachmentViewHolder(@Nullable Bundle data, @StringRes int label) {
        super(data);
        this.label = label;
    }

    @Override // com.vk.sharing.attachment.DataViewHolder
    @NonNull
    public final View createView(@NonNull Context context, @NonNull ViewGroup parent) {
        FrameLayout container = new FrameLayout(context);
        this.imageView = new VKCircleImageView(context);
        this.imageView.setPlaceholderImage(R.drawable.placeholder_user_48dp);
        int imageSize = Screen.dp(48);
        container.addView(this.imageView, new FrameLayout.LayoutParams(imageSize, imageSize));
        int textMarginLeft = Screen.dp(60);
        this.textView = new TextView(context);
        this.textView.setTypeface(Font.Medium.typeface);
        this.textView.setTextSize(1, 15.0f);
        this.textView.setTextColor(ContextCompat.getColor(context, R.color.muted_blue));
        this.textView.setIncludeFontPadding(false);
        this.textView.setMaxLines(1);
        this.textView.setEllipsize(TextUtils.TruncateAt.END);
        this.textView.setCompoundDrawablePadding(Screen.dp(6));
        this.textView.setCompoundDrawablesWithIntrinsicBounds(ContextCompat.getDrawable(context, R.drawable.bmp_repost_10dp_blue_alpha), (Drawable) null, (Drawable) null, (Drawable) null);
        this.textView.setGravity(16);
        FrameLayout.LayoutParams layoutParams = new FrameLayout.LayoutParams(-1, Screen.dp(20));
        layoutParams.setMargins(textMarginLeft, Screen.dp(4), 0, 0);
        container.addView(this.textView, layoutParams);
        TextView labelView = new TextView(context);
        labelView.setText(this.label);
        labelView.setTypeface(Font.Medium.typeface);
        labelView.setTextSize(1, 14.0f);
        labelView.setTextColor(ContextCompat.getColor(context, R.color.cool_grey));
        labelView.setIncludeFontPadding(false);
        FrameLayout.LayoutParams layoutParams2 = new FrameLayout.LayoutParams(-1, Screen.dp(20));
        layoutParams2.setMargins(textMarginLeft, Screen.dp(26), 0, 0);
        container.addView(labelView, layoutParams2);
        return container;
    }

    @Override // com.vk.sharing.attachment.AttachmentViewHolder
    public final void bind(@NonNull Bundle data) {
        if (this.imageView != null) {
            this.imageView.load(data.getString(AttachmentInfo.DATA_AUTHOR_PHOTO_URL));
        }
        if (this.textView != null) {
            this.textView.setText(data.getString(AttachmentInfo.DATA_AUTHOR_NAME));
        }
    }
}
