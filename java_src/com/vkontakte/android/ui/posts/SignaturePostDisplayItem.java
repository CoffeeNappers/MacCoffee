package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.attachments.Attachment;
/* loaded from: classes3.dex */
public class SignaturePostDisplayItem extends PostDisplayItem {
    public Attachment att;

    public SignaturePostDisplayItem(NewsEntry entry, Attachment _att) {
        super(entry);
        this.att = _att;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 8;
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

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        View attachView = null;
        if (((ViewGroup) view).getChildCount() > 0) {
            attachView = ((FrameLayout) view).getChildAt(0);
        }
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -2, 17);
        View av = this.att.getViewForList(view.getContext(), attachView);
        if (attachView == null) {
            av.setLayoutParams(lp);
            ((FrameLayout) view).addView(av);
        }
    }
}
