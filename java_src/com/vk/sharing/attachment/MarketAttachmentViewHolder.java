package com.vk.sharing.attachment;

import android.content.Context;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.text.TextUtils;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.Font;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AttachmentViewHolder.java */
/* loaded from: classes2.dex */
public final class MarketAttachmentViewHolder extends DataViewHolder {
    @Nullable
    private VKImageView imageView;
    @Nullable
    private TextView priceView;
    @Nullable
    private TextView titleView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public MarketAttachmentViewHolder(@Nullable Bundle data) {
        super(data);
    }

    @Override // com.vk.sharing.attachment.DataViewHolder
    @NonNull
    View createView(@NonNull Context context, @NonNull ViewGroup parent) {
        FrameLayout container = new FrameLayout(context);
        int itemWidth = Screen.dp(96);
        int itemHeight = Screen.dp(72);
        FrameLayout subContainer = new FrameLayout(context);
        this.imageView = new VKImageView(context);
        this.imageView.setPlaceholderImage(new ColorDrawable(ContextCompat.getColor(context, R.color.pale_grey)));
        subContainer.addView(this.imageView, new FrameLayout.LayoutParams(-1, -1));
        FrameLayout dimContainer = new FrameLayout(context);
        dimContainer.setBackgroundResource(R.drawable.bg_doc_label);
        int padding = Screen.dp(4);
        dimContainer.setPadding(padding, padding, padding, padding);
        subContainer.addView(dimContainer, new FrameLayout.LayoutParams(-1, -1));
        LinearLayout textContainer = new LinearLayout(context);
        textContainer.setOrientation(1);
        this.titleView = new TextView(context);
        this.titleView.setTypeface(Font.Regular.typeface);
        this.titleView.setTextSize(1, 12.0f);
        this.titleView.setTextColor(-1);
        this.titleView.setIncludeFontPadding(false);
        this.titleView.setMaxLines(2);
        this.titleView.setEllipsize(TextUtils.TruncateAt.END);
        this.titleView.setGravity(1);
        textContainer.addView(this.titleView, new LinearLayout.LayoutParams(-1, -2));
        this.priceView = new TextView(context);
        this.priceView.setTypeface(Font.Medium.typeface);
        this.priceView.setTextSize(1, 12.0f);
        this.priceView.setTextColor(-1);
        this.priceView.setIncludeFontPadding(false);
        this.priceView.setMaxLines(1);
        this.priceView.setEllipsize(TextUtils.TruncateAt.END);
        this.priceView.setGravity(1);
        textContainer.addView(this.priceView, new LinearLayout.LayoutParams(-1, -2));
        dimContainer.addView(textContainer, new FrameLayout.LayoutParams(-1, -2, 17));
        container.addView(subContainer, new FrameLayout.LayoutParams(itemWidth, itemHeight));
        return container;
    }

    @Override // com.vk.sharing.attachment.AttachmentViewHolder
    public void bind(@NonNull Bundle data) {
        if (this.imageView != null) {
            this.imageView.load(data.getString(AttachmentInfo.DATA_THUMB_URL));
        }
        if (this.titleView != null) {
            this.titleView.setText(data.getString("title"));
        }
        if (this.priceView != null) {
            this.priceView.setText(data.getString(AttachmentInfo.DATA_PRICE));
        }
    }
}
