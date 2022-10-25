package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import com.vkontakte.android.AudioAttachView;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.attachments.AudioAttachment;
/* loaded from: classes3.dex */
public class AudioPostDisplayItem extends PostDisplayItem {
    public AudioAttachment att;

    public AudioPostDisplayItem(NewsEntry entry, AudioAttachment _att) {
        super(entry);
        this.att = _att;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 6;
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
        View view = new FrameLayout(context);
        return view;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        View attachView = null;
        if (((ViewGroup) view).getChildCount() > 0) {
            attachView = ((FrameLayout) view).getChildAt(0);
        }
        FrameLayout.LayoutParams lp = new FrameLayout.LayoutParams(-1, -2, 17);
        int dimensionPixelOffset = view.getContext().getResources().getDimensionPixelOffset(R.dimen.post_side_padding);
        lp.rightMargin = dimensionPixelOffset;
        lp.leftMargin = dimensionPixelOffset;
        View av = this.att.getViewForList(view.getContext(), attachView);
        ((AudioAttachView) av).playlist = this.att.playlist;
        ((AudioAttachView) av).playlistPos = this.att.playlistPos;
        ((AudioAttachView) av).setReferData(this.att.getRefer(), this.att.getPostInteract());
        if (attachView == null) {
            av.setLayoutParams(lp);
            ((FrameLayout) view).addView(av);
        }
    }
}
