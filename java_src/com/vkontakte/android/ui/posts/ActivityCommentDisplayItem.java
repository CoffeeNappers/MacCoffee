package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.fragments.PostViewFragment;
/* loaded from: classes3.dex */
public class ActivityCommentDisplayItem extends PostDisplayItem implements View.OnClickListener {
    private final NewsEntry newsEntry;
    private final String referrer;

    public ActivityCommentDisplayItem(NewsEntry newsEntry, String referrer) {
        super(newsEntry);
        this.newsEntry = newsEntry;
        this.referrer = referrer;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 19;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 1;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return this.newsEntry.activity.photos.get(0);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        String text = this.newsEntry.activity.commentText.replace('\n', ' ').trim();
        ViewHolder holder = (ViewHolder) view.getTag();
        holder.title.setText(this.newsEntry.activity.users.get(0));
        holder.text.setText(Global.replaceEmoji(LinkParser.stripMentions(text)));
        holder.content.setOnClickListener(this);
        holder.photo.load(this.newsEntry.activity.photos.get(0));
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        new PostViewFragment.Builder(this.newsEntry).setRefer(this.referrer).setComment(this.newsEntry.activity.commentID).go(view.getContext());
    }

    public static View createView(Context context) {
        View view = View.inflate(context, R.layout.post_activity_comment, null);
        ViewHolder holder = new ViewHolder();
        holder.photo = (VKImageView) view.findViewById(R.id.user_photo);
        holder.title = (TextView) view.findViewById(R.id.title);
        holder.text = (TextView) view.findViewById(R.id.text);
        holder.content = view.findViewById(R.id.content);
        view.setTag(holder);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        private View content;
        private VKImageView photo;
        private TextView text;
        private TextView title;

        private ViewHolder() {
        }
    }
}
