package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
import com.google.firebase.analytics.FirebaseAnalytics;
import com.vkontakte.android.Global;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.fragments.LikesListFragment;
import com.vkontakte.android.navigation.Navigate;
import com.vkontakte.android.ui.PhotoStripView;
import me.grishka.appkit.utils.V;
/* loaded from: classes3.dex */
public class ActivityLikesDisplayItem extends PostDisplayItem implements View.OnClickListener {
    private static final int MAX_STRIP_PHOTOS = 3;
    private final NewsEntry newsEntry;

    public ActivityLikesDisplayItem(NewsEntry newsEntry) {
        super(newsEntry);
        this.newsEntry = newsEntry;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 18;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return Math.min(this.newsEntry.activity.photos.size(), 3);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return this.newsEntry.activity.photos.get(image);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        holder.photos.setPadding(V.dp(2.0f));
        holder.photos.setOverlapOffset(0.8f);
        holder.photos.setCount(getImageCount());
        holder.text.setText(Global.replaceEmoji(LinkParser.stripMentions(this.newsEntry.activity.likesText)));
        holder.content.setOnClickListener(this);
        holder.photos.load(this.newsEntry.activity.photos, getImageCount());
    }

    @Override // android.view.View.OnClickListener
    public void onClick(View view) {
        Bundle args = new Bundle();
        args.putCharSequence("title", view.getResources().getString(R.string.liked));
        args.putInt("ltype", this.newsEntry.type);
        args.putInt(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_OID, this.newsEntry.ownerID);
        args.putInt(FirebaseAnalytics.Param.ITEM_ID, this.newsEntry.postID);
        args.putInt("tab", 1);
        Navigate.to(LikesListFragment.class, args, view.getContext());
    }

    public static View createView(Context context) {
        View view = View.inflate(context, R.layout.post_activity_likes, null);
        ViewHolder holder = new ViewHolder();
        holder.photos = (PhotoStripView) view.findViewById(R.id.photos);
        holder.text = (TextView) view.findViewById(R.id.text);
        holder.content = view;
        view.setTag(holder);
        return view;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        private View content;
        private PhotoStripView photos;
        private TextView text;

        private ViewHolder() {
        }
    }
}
