package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.Global;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.fragments.ProfileFragment;
/* loaded from: classes3.dex */
public class CommentPostDisplayItem extends PostDisplayItem {
    public int id;
    public int numComments;
    public String text;
    public int time;
    public String userName;
    public String userPhoto;

    public CommentPostDisplayItem(NewsEntry entry, String _text, String _userName, String _userPhoto, int _numComments, int _time, int _id) {
        super(entry);
        this.text = _text;
        this.userName = _userName;
        this.userPhoto = _userPhoto;
        this.numComments = _numComments;
        this.time = _time;
        this.id = _id;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 4;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 1;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return this.userPhoto;
    }

    public static View createView(Context context) {
        View view = View.inflate(context, R.layout.ncomment, null);
        ViewHolder holder = new ViewHolder();
        holder.title = (TextView) view.findViewById(R.id.ncomm_ntext);
        holder.text = (TextView) view.findViewById(R.id.ncomm_comment);
        holder.name = (TextView) view.findViewById(R.id.ncomm_user);
        holder.time = (TextView) view.findViewById(R.id.ncomm_time);
        holder.photo = (VKImageView) view.findViewById(R.id.ncomm_photo);
        view.setTag(holder);
        return view;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        holder.text.setText(Global.replaceEmoji(Global.replaceHTML(this.text).replaceAll("\\[id(\\d+)\\|([^\\]]+)\\]", "$2")));
        if (this.text.length() == 0) {
            holder.text.setVisibility(8);
        } else {
            holder.text.setVisibility(0);
        }
        holder.name.setText(this.userName);
        holder.time.setText(TimeUtils.langDateRelative(this.time, view.getResources()));
        if (this.numComments > 1) {
            holder.title.setText(view.getResources().getQuantityString(R.plurals.ncomments_last, this.numComments, Integer.valueOf(this.numComments)));
        } else {
            holder.title.setText(R.string.comments_one_comment);
        }
        holder.photo.setOnClickListener(CommentPostDisplayItem$$Lambda$1.lambdaFactory$(this));
        holder.photo.load(this.userPhoto);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$onBindView$0(View v) {
        new ProfileFragment.Builder(this.id).go(v.getContext());
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        TextView name;
        VKImageView photo;
        TextView text;
        TextView time;
        TextView title;

        private ViewHolder() {
        }
    }
}
