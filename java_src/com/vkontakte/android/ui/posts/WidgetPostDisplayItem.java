package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AttachmentViewHolder;
/* loaded from: classes3.dex */
public class WidgetPostDisplayItem extends PostDisplayItem {
    private final NewsEntry entry;

    public WidgetPostDisplayItem(NewsEntry entry) {
        super(entry);
        this.entry = entry;
        this.clickable = false;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 22;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        View attachView = null;
        if (((ViewGroup) view).getChildCount() > 0) {
            attachView = ((FrameLayout) view).getChildAt(0);
            Object tag = attachView.getTag();
            if ((tag instanceof String) || (tag instanceof AttachmentViewHolder)) {
                Attachment.reuseView(attachView, tag.toString());
            }
        }
        if (this.entry.attachments.size() > 0) {
            Attachment att = this.entry.attachments.get(0);
            View av = att.getViewForList(view.getContext(), attachView);
            if (attachView != av) {
                FrameLayout layout = (FrameLayout) view;
                layout.removeAllViews();
                layout.addView(av);
            }
        }
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }

    public static View createView(Context context) {
        return new FrameLayout(context);
    }
}
