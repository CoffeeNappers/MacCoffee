package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.text.TextUtils;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;
import com.vk.sharing.Sharing;
import com.vk.sharing.action.Actions;
import com.vk.sharing.attachment.Attachments;
import com.vkontakte.android.Global;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.wall.WallLike;
import com.vkontakte.android.attachments.DocumentAttachment;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.PollAttachment;
import com.vkontakte.android.attachments.PrettyCardAttachment;
import com.vkontakte.android.attachments.ShitAttachment;
import com.vkontakte.android.attachments.SnippetAttachment;
import com.vkontakte.android.attachments.ThumbAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.auth.VKAuth;
import com.vkontakte.android.data.Posts;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.utils.Utils;
/* loaded from: classes3.dex */
public class FooterPostDisplayItem extends PostDisplayItem {
    private View.OnClickListener commentsOnClick;
    public NewsEntry e;
    private boolean feedback;
    private View.OnClickListener likesOnClick;
    private boolean liking;
    public String referer;
    private View.OnClickListener repostsOnClick;
    private boolean showLikes;

    public FooterPostDisplayItem(NewsEntry _e, boolean _feedback, boolean likes, String _referer) {
        super(_e);
        this.e = _e;
        this.commentsOnClick = FooterPostDisplayItem$$Lambda$1.lambdaFactory$(this, _referer);
        this.likesOnClick = FooterPostDisplayItem$$Lambda$2.lambdaFactory$(this);
        this.repostsOnClick = FooterPostDisplayItem$$Lambda$3.lambdaFactory$(this);
        this.showLikes = likes;
        this.feedback = _feedback;
        this.referer = _referer;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$0(String _referer, View v) {
        new PostViewFragment.Builder(this.e).setRefer(_referer).loadFromBeginning().scrollToFirstComment().go(v.getContext());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$1(View v) {
        Posts.like(this.e, !this.e.flag(8), Utils.castToActivity(v.getContext()), this.referer);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$new$2(View v) {
        if (VKAuth.ensureLoggedIn(v.getContext())) {
            Sharing.from(v.getContext()).withAttachment(Attachments.createInfo(this.e, this.referer)).withActions(Actions.createInfo(this.e)).share();
        }
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 1;
    }

    public static View createView(Context context) {
        View view = View.inflate(context, R.layout.news_item_footer, null);
        ViewHolder holder = new ViewHolder(null);
        holder.likes = (TextView) view.findViewById(R.id.post_likes);
        holder.comments = (TextView) view.findViewById(R.id.post_comments);
        holder.reposts = (TextView) view.findViewById(R.id.post_reposts);
        holder.divider = view.findViewById(R.id.post_divider);
        view.setTag(holder);
        return view;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        if (holder.divider != null) {
            if (this.e.attachments.size() > 0 && ((this.e.attachments.get(this.e.attachments.size() - 1) instanceof ThumbAttachment) || (this.e.attachments.get(this.e.attachments.size() - 1) instanceof SnippetAttachment) || (this.e.attachments.get(this.e.attachments.size() - 1) instanceof PollAttachment) || (this.e.attachments.get(this.e.attachments.size() - 1) instanceof ShitAttachment) || (this.e.attachments.get(this.e.attachments.size() - 1) instanceof PrettyCardAttachment) || (((this.e.attachments.get(this.e.attachments.size() - 1) instanceof GeoAttachment) && ((GeoAttachment) this.e.attachments.get(this.e.attachments.size() - 1)).style == 3) || ((this.e.attachments.get(this.e.attachments.size() - 1) instanceof DocumentAttachment) && !TextUtils.isEmpty(((DocumentAttachment) this.e.attachments.get(this.e.attachments.size() - 1)).thumb))))) {
                if (!(this.e.attachments.get(this.e.attachments.size() - 1) instanceof VideoAttachment) || this.e.attachments.size() != 1) {
                    holder.divider.setVisibility(8);
                } else {
                    holder.divider.setVisibility(0);
                }
            } else {
                holder.divider.setVisibility(0);
            }
        }
        if (this.e.numComments > 0) {
            holder.comments.setText(Global.formatNumber(this.e.numComments));
            holder.comments.setCompoundDrawablePadding(Global.scale(10.0f));
        } else {
            holder.comments.setText("");
            holder.comments.setCompoundDrawablePadding(0);
        }
        holder.comments.setVisibility((this.e.numComments > 0 || this.e.flag(2)) ? 0 : 4);
        if (this.e.numLikes > 0) {
            holder.likes.setText(Global.formatNumber(this.e.numLikes));
            holder.likes.setCompoundDrawablePadding(Global.scale(10.0f));
        } else {
            holder.likes.setText("");
            holder.likes.setCompoundDrawablePadding(0);
        }
        if (this.e.numRetweets > 0) {
            holder.reposts.setText(Global.formatNumber(this.e.numRetweets));
            holder.reposts.setCompoundDrawablePadding(Global.scale(10.0f));
        } else {
            holder.reposts.setText("");
            holder.reposts.setCompoundDrawablePadding(0);
        }
        if (this.showLikes) {
            holder.likes.setVisibility(0);
            holder.reposts.setVisibility(0);
        } else {
            holder.likes.setVisibility(4);
            holder.reposts.setVisibility(4);
        }
        holder.likes.setSelected(this.e.flag(8));
        holder.reposts.setSelected(this.e.flag(4));
        view.setTag(R.id.wall_view_post, this.e);
        holder.likes.setOnClickListener(this.likesOnClick);
        holder.reposts.setOnClickListener(this.repostsOnClick);
        holder.comments.setOnClickListener(this.commentsOnClick);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 0;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return null;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        TextView comments;
        View divider;
        TextView likes;
        TextView reposts;

        private ViewHolder() {
        }

        /* synthetic */ ViewHolder(AnonymousClass1 x0) {
            this();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void like(boolean liked, View view) {
        this.e.flag(8, liked);
        if (liked) {
            this.e.numLikes++;
        } else {
            NewsEntry newsEntry = this.e;
            newsEntry.numLikes--;
        }
        bindView((View) view.getParent());
        if (!this.liking) {
            this.liking = true;
            int lOid = this.e.ownerID;
            int lPid = this.e.postID;
            WallLike.newsEntry(this.e, liked, "").setCallback(new AnonymousClass1(view, lOid, lPid, liked)).exec();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.ui.posts.FooterPostDisplayItem$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 implements Callback<WallLike.Result> {
        final /* synthetic */ int val$lOid;
        final /* synthetic */ int val$lPid;
        final /* synthetic */ boolean val$liked;
        final /* synthetic */ View val$view;

        AnonymousClass1(View view, int i, int i2, boolean z) {
            this.val$view = view;
            this.val$lOid = i;
            this.val$lPid = i2;
            this.val$liked = z;
        }

        @Override // com.vkontakte.android.api.Callback
        public void success(WallLike.Result res) {
            FooterPostDisplayItem.this.liking = false;
            NewsEntry _e = (NewsEntry) this.val$view.getTag(R.id.wall_view_post);
            if (_e != null && this.val$lOid == _e.ownerID && this.val$lPid == _e.postID) {
                FooterPostDisplayItem.this.e.numLikes = res.likes;
                if (this.val$liked) {
                    FooterPostDisplayItem.this.e.numRetweets = res.retweets;
                }
                if (FooterPostDisplayItem.this.e.flag(8) != this.val$liked) {
                    this.val$view.post(FooterPostDisplayItem$1$$Lambda$1.lambdaFactory$(this, this.val$view));
                } else {
                    this.val$view.post(FooterPostDisplayItem$1$$Lambda$2.lambdaFactory$(this, this.val$view));
                }
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$0(View view) {
            FooterPostDisplayItem.this.like(FooterPostDisplayItem.this.e.flag(8), view);
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$success$1(View view) {
            FooterPostDisplayItem.this.bindView((View) view.getParent());
        }

        @Override // com.vkontakte.android.api.Callback
        public void fail(VKAPIRequest.VKErrorResponse err) {
            if (FooterPostDisplayItem.this.e != null && this.val$lOid == FooterPostDisplayItem.this.e.ownerID && this.val$lPid == FooterPostDisplayItem.this.e.postID) {
                if (this.val$liked) {
                    NewsEntry newsEntry = FooterPostDisplayItem.this.e;
                    newsEntry.numLikes--;
                } else {
                    FooterPostDisplayItem.this.e.numLikes++;
                }
                FooterPostDisplayItem.this.e.flag(8, !this.val$liked);
                FooterPostDisplayItem.this.liking = false;
                this.val$view.post(FooterPostDisplayItem$1$$Lambda$3.lambdaFactory$(this, this.val$view));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$fail$2(View view) {
            Toast.makeText(view.getContext(), (int) R.string.error, 0).show();
            FooterPostDisplayItem.this.bindView((View) view.getParent());
        }
    }
}
