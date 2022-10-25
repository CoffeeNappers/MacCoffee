package com.vkontakte.android.ui.holder;

import android.content.Context;
import android.support.annotation.Nullable;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.BoardTopic;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class DiscussionHolder extends RecyclerHolder<BoardTopic> implements UsableRecyclerView.Clickable, UsableRecyclerView.LongClickable, View.OnClickListener {
    @Nullable
    final DiscussionClickable discussionClickable;
    TextView topicInfo;
    TextView topicLName;
    TextView topicLText;
    TextView topicLUpdated;
    VKImageView topicPhoto;
    TextView topicTitle;

    /* loaded from: classes3.dex */
    public interface DiscussionClickable {
        void onClick(BoardTopic boardTopic, boolean z);

        boolean onLongClick(BoardTopic boardTopic);
    }

    public DiscussionHolder(Context ctx, @Nullable DiscussionClickable discussionClickable) {
        super((int) R.layout.board_topic_row, ctx);
        this.discussionClickable = discussionClickable;
        this.topicPhoto = (VKImageView) $(R.id.board_topic_photo);
        this.topicTitle = (TextView) $(R.id.board_topic_title);
        this.topicInfo = (TextView) $(R.id.board_topic_info);
        this.topicLName = (TextView) $(R.id.board_topic_l_name);
        this.topicLText = (TextView) $(R.id.board_topic_l_text);
        this.topicLUpdated = (TextView) $(R.id.board_topic_l_updated);
        $(R.id.last_comment).setOnClickListener(this);
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.last_comment /* 2131755597 */:
                if (this.discussionClickable != null) {
                    this.discussionClickable.onClick(getItem(), true);
                    return;
                }
                return;
            default:
                return;
        }
    }

    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public void onBind(BoardTopic t) {
        if (t.updatedBy != null) {
            this.topicPhoto.load(t.updatedBy.photo);
        } else {
            this.topicPhoto.clear();
        }
        this.topicTitle.setText(t.title);
        String info = getResources().getQuantityString(R.plurals.topic_posts, t.numComments, Integer.valueOf(t.numComments));
        if ((t.flags & 1) > 0 && (t.flags & 2) > 0) {
            info = info + ", " + getResources().getString(R.string.topic_info_fixed_closed);
        } else if ((t.flags & 1) > 0) {
            info = info + ", " + getResources().getString(R.string.topic_info_closed);
        } else if ((t.flags & 2) > 0) {
            info = info + ", " + getResources().getString(R.string.topic_info_fixed);
        }
        this.topicInfo.setText(info);
        this.topicLName.setText(t.updatedBy.fullName);
        this.topicLText.setText(t.lastComment);
        this.topicLUpdated.setText(TimeUtils.langDateRelative(t.updated, getResources()));
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        if (this.discussionClickable != null) {
            this.discussionClickable.onClick(getItem(), false);
        }
    }

    @Override // me.grishka.appkit.views.UsableRecyclerView.LongClickable
    public boolean onLongClick() {
        return this.discussionClickable != null && this.discussionClickable.onLongClick(getItem());
    }
}
