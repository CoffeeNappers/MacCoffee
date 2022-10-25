package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ImageAttachment;
/* loaded from: classes3.dex */
public class CommonAttachmentPostDisplayItem extends PostDisplayItem {
    public Attachment att;

    public CommonAttachmentPostDisplayItem(NewsEntry e, Attachment _att) {
        super(e);
        this.att = _att;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 7;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return this.att instanceof ImageAttachment ? 1 : 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        if (this.att instanceof ImageAttachment) {
            return ((ImageAttachment) this.att).getImageURL();
        }
        return null;
    }

    public static View createView(Context context) {
        return new FrameLayout(context);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        Context context = view.getContext();
        View attachView = null;
        if (((ViewGroup) view).getChildCount() > 0) {
            attachView = ((FrameLayout) view).getChildAt(0);
        }
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -2, 17);
        int dimensionPixelOffset = view.getResources().getDimensionPixelOffset(R.dimen.post_side_padding);
        lp.rightMargin = dimensionPixelOffset;
        lp.leftMargin = dimensionPixelOffset;
        View av = this.att.getViewForList(context, attachView);
        if (attachView == null) {
            av.setLayoutParams(lp);
            ((FrameLayout) view).addView(av);
        }
        if (attachView != null && (this.att instanceof ImageAttachment)) {
            ((ImageAttachment) this.att).bind(attachView);
        }
    }
}
