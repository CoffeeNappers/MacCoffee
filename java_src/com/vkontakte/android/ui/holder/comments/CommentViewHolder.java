package com.vkontakte.android.ui.holder.comments;

import android.graphics.drawable.Drawable;
import android.preference.PreferenceManager;
import android.support.annotation.NonNull;
import android.text.SpannableStringBuilder;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import com.facebook.appevents.AppEventsConstants;
import com.google.android.exoplayer2.text.ttml.TtmlNode;
import com.vk.core.util.Screen;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Comment;
import com.vkontakte.android.NewsItemView;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.ViewUtils;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.ImageAttachment;
import com.vkontakte.android.attachments.StickerAttachment;
import com.vkontakte.android.fragments.ProfileFragment;
import com.vkontakte.android.ui.drawable.RecoloredDrawable;
import com.vkontakte.android.ui.drawables.CenteredImageSpan;
import java.util.ArrayList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class CommentViewHolder<T extends Comment> extends AbsCommentViewHolder<T> implements UsableRecyclerView.Clickable, View.OnClickListener {
    private ViewGroup attachContainer;
    private TextView date;
    @NonNull
    private final CommentViewHolderListener<T> holderListener;
    private TextView likes;
    private TextView name;
    private VKImageView photo;
    private ImageView reply;
    private TextView text;

    /* loaded from: classes3.dex */
    public interface CommentViewHolderListener<T extends Comment> extends StickerAttachment.Callback {
        void likeComment(T t);

        void replyToComment(T t);

        void showCommentActions(T t);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.holder.RecyclerHolder
    public /* bridge */ /* synthetic */ void onBind(Object obj) {
        onBind((CommentViewHolder<T>) ((Comment) obj));
    }

    public CommentViewHolder(ViewGroup parent, CommentViewHolderListener<T> holderListener) {
        super(R.layout.wall_comment, parent);
        this.holderListener = holderListener;
        VKImageView vKImageView = (VKImageView) $(R.id.poster_photo);
        this.photo = vKImageView;
        vKImageView.setOnClickListener(this);
        int k = Integer.parseInt(PreferenceManager.getDefaultSharedPreferences(getContext()).getString(TtmlNode.ATTR_TTS_FONT_SIZE, AppEventsConstants.EVENT_PARAM_VALUE_NO));
        this.text = (TextView) $(R.id.post_view);
        this.text.setTextSize(1, 16.0f + (k * 2.0f));
        this.name = (TextView) $(R.id.poster_name_view);
        TextView textView = (TextView) $(R.id.post_likes);
        this.likes = textView;
        textView.setOnClickListener(this);
        this.date = (TextView) $(R.id.post_info_view);
        this.attachContainer = (ViewGroup) $(R.id.post_attach_container);
        ImageView imageView = (ImageView) $(R.id.comment_reply);
        this.reply = imageView;
        imageView.setOnClickListener(this);
    }

    public CommentViewHolder<T> setCanReply(boolean canReply) {
        ViewUtils.setVisibility(this.reply, canReply ? 0 : 8);
        return this;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.view.View.OnClickListener
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.post_likes /* 2131756034 */:
                this.holderListener.likeComment((Comment) getItem());
                return;
            case R.id.poster_photo /* 2131756446 */:
                new ProfileFragment.Builder(((Comment) getItem()).getUid()).go(getContext());
                return;
            case R.id.comment_reply /* 2131756448 */:
                this.holderListener.replyToComment((Comment) getItem());
                return;
            default:
                return;
        }
    }

    private boolean canShowLongDate() {
        return Screen.isTablet(getContext()) || getResources().getDisplayMetrics().widthPixels > getResources().getDisplayMetrics().heightPixels;
    }

    public void onBind(T comment) {
        Drawable drawable;
        boolean z = true;
        if (this.itemView.getTag(R.id.tag_comment_highlight) != null) {
            this.itemView.removeCallbacks((Runnable) this.itemView.getTag(R.id.tag_comment_highlight));
        }
        this.itemView.setBackgroundDrawable(null);
        this.photo.load(comment.getUserPhoto());
        this.text.setText(comment.getDisplayableText());
        SpannableStringBuilder titleSSB = new SpannableStringBuilder(comment.getUserName());
        if (comment.isAuthorVerified()) {
            titleSSB.append((char) 160);
            titleSSB.append((char) 160);
            titleSSB.setSpan(new CenteredImageSpan(getContext(), R.drawable.ic_verified), titleSSB.length() - 1, titleSSB.length(), 0);
        }
        this.name.setText(titleSSB);
        if (comment.getResponseName() != null) {
            TextView textView = this.date;
            Object[] objArr = new Object[2];
            objArr[0] = TimeUtils.langDate(comment.getTime(), !canShowLongDate());
            objArr[1] = comment.getResponseName();
            textView.setText(getString(R.string.comments_reply_format, objArr));
        } else {
            TextView textView2 = this.date;
            int time = comment.getTime();
            if (canShowLongDate()) {
                z = false;
            }
            textView2.setText(TimeUtils.langDate(time, z));
        }
        this.text.setVisibility(comment.getDisplayableText().length() > 0 ? 0 : 8);
        TextView textView3 = this.likes;
        if (comment.getNumLikes() > 0) {
            drawable = new RecoloredDrawable(getResources().getDrawable(R.drawable.ic_comment_like), getResources().getColorStateList(R.color.post_counters));
        } else {
            drawable = getResources().getDrawable(R.drawable.ic_comment_like);
        }
        textView3.setCompoundDrawablesWithIntrinsicBounds(drawable, (Drawable) null, (Drawable) null, (Drawable) null);
        this.likes.setSelected(comment.isLiked());
        this.likes.setText(comment.getNumLikes() > 0 ? comment.getNumLikes() + "" : "");
        this.attachContainer.removeAllViews();
        if (comment.getAttachments().size() > 0) {
            this.attachContainer.setVisibility(0);
            NewsItemView.addAttachments(this.attachContainer, comment.getAttachments(), null, R.id.post_attach_container);
            ArrayList<Attachment> attachments = comment.getAttachments();
            for (int i = 0; i < attachments.size(); i++) {
                Attachment att = attachments.get(i);
                if (att instanceof ImageAttachment) {
                    ((ImageAttachment) att).bind(this.attachContainer.getChildAt(i));
                }
                if (att instanceof StickerAttachment) {
                    ((StickerAttachment) att).setCallback(this.holderListener);
                }
            }
            return;
        }
        this.attachContainer.setVisibility(8);
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
    public void onClick() {
        this.holderListener.showCommentActions((Comment) getItem());
    }
}
