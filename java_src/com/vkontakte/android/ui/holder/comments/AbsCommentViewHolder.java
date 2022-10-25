package com.vkontakte.android.ui.holder.comments;

import android.support.annotation.LayoutRes;
import android.view.ViewGroup;
import com.vkontakte.android.Comment;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import com.vkontakte.android.ui.util.HightlightHelper;
/* loaded from: classes3.dex */
public abstract class AbsCommentViewHolder<T extends Comment> extends RecyclerHolder<T> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public AbsCommentViewHolder(@LayoutRes int layoutRes, ViewGroup parent) {
        super(layoutRes, parent);
    }

    public void highlight() {
        HightlightHelper.highlight(this.itemView);
    }
}
