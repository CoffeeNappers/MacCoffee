package com.vkontakte.android.ui.holder.commons;

import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.R;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.ui.holder.RecyclerHolderRef;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class PreferenceSummaryHolder extends RecyclerHolderRef<Ref> implements UsableRecyclerView.Clickable {
    public final TextView textSummary;
    public final TextView textTitle;

    /* loaded from: classes3.dex */
    public static class Ref extends RecyclerHolderRef.Ref<PreferenceSummaryHolder> {
        private final int itemId;
        private final View.OnClickListener onClickListener;
        private Object summary = null;
        private Object title;

        public Ref(View.OnClickListener onClickListener, int itemId, Object title) {
            this.title = null;
            this.onClickListener = onClickListener;
            this.itemId = itemId;
            this.title = title;
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.ui.holder.RecyclerHolderRef.Ref
        public void bind(@NonNull PreferenceSummaryHolder holder) {
            holder.itemView.setId(this.itemId);
            ViewUtils.setText(holder.textTitle, this.title, false);
            ViewUtils.setText(holder.textSummary, this.summary, true);
        }

        public Ref setTitle(Object title) {
            this.title = title;
            PreferenceSummaryHolder holder = getHolder();
            if (holder != null) {
                ViewUtils.setText(holder.textTitle, title, false);
            }
            return this;
        }

        public Ref setSummary(Object summary) {
            this.summary = summary;
            PreferenceSummaryHolder holder = getHolder();
            if (holder != null) {
                ViewUtils.setText(holder.textSummary, summary, true);
            }
            return this;
        }

        public Object getTitle() {
            return this.title;
        }

        public Object getSummary() {
            return this.summary;
        }
    }

    public PreferenceSummaryHolder(ViewGroup parent) {
        super((int) R.layout.summary_preference, parent);
        this.textTitle = (TextView) $(16908308);
        this.textSummary = (TextView) $(16908309);
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (((Ref) getItem()).onClickListener != null) {
            ((Ref) getItem()).onClickListener.onClick(this.itemView);
        }
    }
}
