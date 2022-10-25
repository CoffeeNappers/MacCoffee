package com.vk.sharing.attachment;

import android.content.Context;
import android.content.res.Resources;
import android.graphics.drawable.ColorDrawable;
import android.net.Uri;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.content.ContextCompat;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vk.imageloader.ImageSize;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.Font;
/* JADX INFO: Access modifiers changed from: package-private */
/* compiled from: AttachmentViewHolder.java */
/* loaded from: classes2.dex */
public final class DocumentAttachmentViewHolder extends DataViewHolder {
    @Nullable
    private VKImageView imageView;
    @Nullable
    private TextView textView;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DocumentAttachmentViewHolder(@Nullable Bundle data) {
        super(data);
    }

    @Override // com.vk.sharing.attachment.DataViewHolder
    @NonNull
    public View createView(@NonNull Context context, @NonNull ViewGroup parent) {
        FrameLayout container = new FrameLayout(context);
        FrameLayout subContainer = new FrameLayout(context);
        this.imageView = new VKImageView(context);
        this.imageView.setPlaceholderImage(new ColorDrawable(ContextCompat.getColor(context, R.color.pale_grey)));
        subContainer.addView(this.imageView, new FrameLayout.LayoutParams(Screen.dp(96), Screen.dp(72)));
        this.textView = new TextView(context);
        this.textView.setTypeface(Font.Medium.typeface);
        this.textView.setTextSize(1, 12.0f);
        this.textView.setTextColor(-1);
        this.textView.setIncludeFontPadding(false);
        int padding = Screen.dp(4);
        this.textView.setPadding(padding, padding, padding, padding);
        this.textView.setBackgroundResource(R.drawable.bg_doc_label);
        subContainer.addView(this.textView, new FrameLayout.LayoutParams(-2, -2, 81));
        container.addView(subContainer, new FrameLayout.LayoutParams(-2, -2));
        return container;
    }

    @Override // com.vk.sharing.attachment.AttachmentViewHolder
    public void bind(@NonNull Bundle data) {
        if (this.imageView != null) {
            this.imageView.load(Uri.parse(data.getString(AttachmentInfo.DATA_THUMB_URL)), ImageSize.SMALL);
        }
        if (this.textView != null) {
            this.textView.setText(format(data.getString(AttachmentInfo.DATA_EXTENSION), data.getInt("size"), this.textView.getResources()));
        }
    }

    @NonNull
    private static String format(@Nullable String extension, int size, @NonNull Resources res) {
        if (extension != null) {
            if (size > 0) {
                return extension.toUpperCase() + ", " + Global.langFileSize(size, res);
            }
            return extension.toUpperCase();
        } else if (size > 0) {
            return Global.langFileSize(size, res);
        } else {
            return "";
        }
    }
}
