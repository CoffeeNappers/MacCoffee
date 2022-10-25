package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.View;
import android.widget.FrameLayout;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AttachmentViewHolder;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.media.AutoPlay;
import com.vkontakte.android.ui.FlowLayout;
import java.util.ArrayList;
import java.util.Iterator;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class AttachContainerPostDisplayItem extends PostDisplayItem {
    public ArrayList<Attachment> atts;
    private boolean fromList;
    private boolean sidePadding;

    public AttachContainerPostDisplayItem(NewsEntry entry, ArrayList<Attachment> _atts, boolean list, boolean sidePadding) {
        super(entry);
        this.atts = new ArrayList<>();
        this.atts.addAll(_atts);
        this.fromList = list;
        this.sidePadding = sidePadding;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 9;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        int count = 0;
        Iterator<Attachment> it = this.atts.iterator();
        while (it.hasNext()) {
            Attachment att = it.next();
            if (att instanceof ImageAttachment) {
                count++;
            }
        }
        return count;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        int count = 0;
        for (int i = 0; i < this.atts.size(); i++) {
            Attachment att = this.atts.get(i);
            if (att instanceof ImageAttachment) {
                if (count == image) {
                    return ((ImageAttachment) att).getImageURL();
                }
                count++;
            }
        }
        return null;
    }

    public static View createView(Context context) {
        View view = new FrameLayout(context);
        FlowLayout fl = new FlowLayout(context);
        ((FrameLayout) view).addView(fl);
        ViewHolder holder = new ViewHolder();
        holder.flowLayout = fl;
        view.setTag(holder);
        return view;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        for (int i = 0; i < holder.flowLayout.getChildCount(); i++) {
            View att = holder.flowLayout.getChildAt(i);
            Object tag = att.getTag();
            if ((tag instanceof String) || (tag instanceof AttachmentViewHolder)) {
                Attachment.reuseView(att, att.getTag().toString());
            }
        }
        holder.flowLayout.removeAllViews();
        if (this.sidePadding) {
            view.setPadding(view.getResources().getDimensionPixelOffset(R.dimen.post_side_padding), V.dp(8.0f), view.getResources().getDimensionPixelOffset(R.dimen.post_side_padding), V.dp(8.0f));
        } else {
            view.setPadding(0, V.dp(8.0f), 0, 0);
        }
        for (int i2 = 0; i2 < this.atts.size(); i2++) {
            Attachment att2 = this.atts.get(i2);
            FlowLayout.LayoutParams lp = att2.overrideLayoutParams();
            View addingView = this.fromList ? att2.getViewForList(view.getContext(), null) : att2.getFullView(view.getContext());
            if (lp != null) {
                holder.flowLayout.addView(addingView, lp);
            } else {
                holder.flowLayout.addView(addingView);
            }
            if (att2 instanceof ImageAttachment) {
                ((ImageAttachment) att2).bind(addingView);
            }
        }
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public AutoPlay getAutoPlayItem() {
        if (this.atts.size() == 1) {
            Attachment att = this.atts.get(0);
            if ((att instanceof AutoPlay) && ((AutoPlay) att).canAutoPlay()) {
                return (AutoPlay) att;
            }
            return null;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        FlowLayout flowLayout;

        private ViewHolder() {
        }
    }
}
