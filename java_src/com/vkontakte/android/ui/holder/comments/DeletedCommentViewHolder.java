package com.vkontakte.android.ui.holder.comments;

import android.support.annotation.NonNull;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import android.widget.TextView;
import com.vk.core.util.Screen;
import com.vkontakte.android.Comment;
import com.vkontakte.android.R;
import com.vkontakte.android.auth.VKAccountManager;
/* loaded from: classes3.dex */
public class DeletedCommentViewHolder<T extends Comment> extends AbsCommentViewHolder<T> implements View.OnClickListener {
    private TextView block;
    @NonNull
    private final DeletedCommentViewHolderListener<T> holderListener;
    private TextView report;
    private TextView restore;

    /* loaded from: classes3.dex */
    public interface DeletedCommentViewHolderListener<T extends Comment> {
        void banUser(T t);

        boolean canBanUsers();

        void reportComment(T t);

        void restoreComment(int i);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public /* bridge */ /* synthetic */ void onBind(Object obj) {
        onBind((DeletedCommentViewHolder<T>) ((Comment) obj));
    }

    public DeletedCommentViewHolder(ViewGroup parent, @NonNull DeletedCommentViewHolderListener<T> holderListener) {
        super(R.layout.deleted_comment, parent);
        this.holderListener = holderListener;
        TextView textView = (TextView) $(R.id.comment_restore_btn);
        this.restore = textView;
        textView.setOnClickListener(this);
        TextView textView2 = (TextView) $(R.id.comment_block_btn);
        this.block = textView2;
        textView2.setOnClickListener(this);
        TextView textView3 = (TextView) $(R.id.comment_report_btn);
        this.report = textView3;
        textView3.setOnClickListener(this);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.comment_restore_btn /* 2131755640 */:
                this.holderListener.restoreComment(((Comment) getItem()).getId());
                return;
            case R.id.comment_report_btn /* 2131755641 */:
                this.holderListener.reportComment((Comment) getItem());
                return;
            case R.id.comment_block_btn /* 2131755642 */:
                this.holderListener.banUser((Comment) getItem());
                return;
            default:
                return;
        }
    }

    public void onBind(T comment) {
        boolean canBan = this.holderListener.canBanUsers() && comment.getUid() > 0 && !VKAccountManager.isCurrentUser(comment.getUid());
        boolean canReport = !VKAccountManager.isCurrentUser(comment.getUid());
        ((LinearLayout) this.itemView).setOrientation((Screen.isTablet(getContext()) || (!canBan && !canReport)) ? 0 : 1);
        this.block.setVisibility(canBan ? 0 : 8);
        this.report.setVisibility(canReport ? 0 : 8);
        if (comment.isReported()) {
            this.restore.setVisibility(8);
            this.report.setEnabled(false);
            this.report.setText(R.string.report_sent);
        } else {
            this.report.setEnabled(true);
            this.report.setText(R.string.report_content);
        }
        if (comment.isBanned()) {
            this.block.setEnabled(false);
            this.block.setText(R.string.user_blocked);
            return;
        }
        this.block.setEnabled(true);
        this.block.setText(R.string.block_user_long);
    }
}
