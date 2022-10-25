package com.vkontakte.android.ui.holder.messages;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ProgressBar;
import com.vkontakte.android.R;
import com.vkontakte.android.ui.holder.RecyclerHolder;
import java.lang.ref.WeakReference;
/* loaded from: classes3.dex */
public class LoadMoreHolder extends RecyclerHolder<LoaderMoreHolderData> {
    private final View loadMoreBtn;
    private final ProgressBar progressBar;

    /* loaded from: classes3.dex */
    public static class LoaderMoreHolderData {
        WeakReference<LoadMoreHolder> reference = null;
        private int loadMoreBtnVisibility = 0;
        private int progressBarVisibility = 8;
        private View.OnClickListener onClickListener = null;

        /* JADX INFO: Access modifiers changed from: private */
        public void onBindingHolder(LoadMoreHolder holder) {
            this.reference = new WeakReference<>(holder);
            syncState();
        }

        public void setVisibilityLoadMoreButton(int visibility) {
            this.loadMoreBtnVisibility = visibility;
            syncState();
        }

        public void setVisibilityProgressBar(int visibility) {
            this.progressBarVisibility = visibility;
            syncState();
        }

        public void setOnClickListenerLoadMoreButton(View.OnClickListener onClickListener) {
            this.onClickListener = onClickListener;
            syncState();
        }

        private void syncState() {
            LoadMoreHolder holder = this.reference == null ? null : this.reference.get();
            if (holder != null) {
                if (holder.loadMoreBtn.getVisibility() != this.loadMoreBtnVisibility) {
                    holder.loadMoreBtn.setVisibility(this.loadMoreBtnVisibility);
                }
                holder.loadMoreBtn.setOnClickListener(this.onClickListener);
                if (holder.progressBar.getVisibility() != this.progressBarVisibility) {
                    holder.progressBar.setVisibility(this.progressBarVisibility);
                }
            }
        }
    }

    public LoadMoreHolder(ViewGroup viewGroup) {
        super(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.messages_load_more, viewGroup, false));
        this.loadMoreBtn = $(R.id.load_more_btn);
        this.progressBar = (ProgressBar) $(R.id.load_more_progress);
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(LoaderMoreHolderData item) {
        item.onBindingHolder(this);
    }
}
