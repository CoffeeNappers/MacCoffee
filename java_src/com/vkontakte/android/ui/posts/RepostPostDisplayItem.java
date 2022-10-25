package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.Drawable;
import android.net.Uri;
import android.text.Spannable;
import android.text.SpannableStringBuilder;
import android.text.style.ImageSpan;
import android.view.View;
import android.widget.TextView;
import com.fasterxml.jackson.core.util.MinimalPrettyPrinter;
import com.vk.imageloader.view.VKImageView;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.TimeUtils;
import com.vkontakte.android.api.Callback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.fragments.PostViewFragment;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import org.json.JSONObject;
/* loaded from: classes3.dex */
public class RepostPostDisplayItem extends PostDisplayItem {
    private View.OnClickListener clickListener;
    public int origID;
    private NewsEntry post;
    public int repostType;
    public int time;
    public int uid;
    public String userName;
    public String userPhoto;

    public RepostPostDisplayItem(NewsEntry entry, String _userName, String _userPhoto, int _uid, int _time, int _origID, int _repostType, NewsEntry _post) {
        super(entry);
        this.clickListener = new View.OnClickListener() { // from class: com.vkontakte.android.ui.posts.RepostPostDisplayItem.1
            @Override // android.view.View.OnClickListener
            public void onClick(final View v) {
                if (RepostPostDisplayItem.this.repostType == 1) {
                    new VKAPIRequest("photos.getById").param("photos", RepostPostDisplayItem.this.uid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + RepostPostDisplayItem.this.origID).param("extended", 1).param(ServerKeys.PHOTO_SIZES, 1).setCallback(new Callback<JSONObject>() { // from class: com.vkontakte.android.ui.posts.RepostPostDisplayItem.1.1
                        @Override // com.vkontakte.android.api.Callback
                        public void success(JSONObject result) {
                            try {
                                JSONObject jp = result.getJSONArray(ServerKeys.RESPONSE).getJSONObject(0);
                                new PostViewFragment.Builder(RepostPostDisplayItem.getPhotoAsPost(new Photo(jp), RepostPostDisplayItem.this.userName, RepostPostDisplayItem.this.userPhoto)).scrollToFirstComment().loadFromBeginning().go(v.getContext());
                            } catch (Exception e) {
                                Log.e("vk", "parse photo error", e);
                                startIntent(v.getContext(), "photo", RepostPostDisplayItem.this.uid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + RepostPostDisplayItem.this.origID);
                            }
                        }

                        @Override // com.vkontakte.android.api.Callback
                        public void fail(VKAPIRequest.VKErrorResponse error) {
                            startIntent(v.getContext(), "photo", RepostPostDisplayItem.this.uid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + RepostPostDisplayItem.this.origID);
                        }
                    }).wrapProgress(v.getContext()).exec();
                } else if (RepostPostDisplayItem.this.repostType == 2) {
                    startIntent(v.getContext(), "id", String.valueOf(RepostPostDisplayItem.this.uid));
                } else {
                    startIntent(v.getContext(), ReportAppInputData.REPORT_TYPE_WALL, RepostPostDisplayItem.this.uid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + RepostPostDisplayItem.this.origID);
                }
            }

            /* JADX INFO: Access modifiers changed from: private */
            public void startIntent(Context context, String type, String id) {
                Intent intent = new Intent("android.intent.action.VIEW", Uri.parse("vkontakte://vk.com/" + type + id));
                intent.putExtra("no_browser", true);
                context.startActivity(intent);
            }
        };
        this.userName = _userName;
        this.userPhoto = _userPhoto;
        this.uid = _uid;
        this.time = _time;
        this.origID = _origID;
        this.repostType = _repostType;
        this.post = _post;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 3;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 1;
    }

    public static View createView(Context context) {
        View view = View.inflate(context, R.layout.news_item_repost, null);
        ViewHolder holder = new ViewHolder();
        holder.name = (TextView) view.findViewById(R.id.post_retweet_name);
        holder.time = (TextView) view.findViewById(R.id.post_retweet_time);
        holder.photo = (VKImageView) view.findViewById(R.id.post_retweet_photo);
        holder.button = view.findViewById(R.id.post_repost_open_btn);
        view.setTag(holder);
        return view;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        ViewHolder holder = (ViewHolder) view.getTag();
        holder.name.setText(this.userName);
        holder.button.setOnClickListener(this.clickListener);
        holder.photo.load(getImageURL(0));
        holder.photo.setPlaceholderImage(this.uid > 0 ? R.drawable.placeholder_user_72dp : R.drawable.placeholder_group_72dp);
        String type = null;
        if (this.repostType == 1) {
            type = ", " + view.getResources().getString(R.string.photo).toLowerCase();
        }
        if (this.repostType == 2) {
            type = ", " + view.getResources().getString(R.string.video).toLowerCase();
        }
        if (this.repostType == 5) {
            type = MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR + view.getResources().getString(R.string.ntf_to_post);
        }
        StringBuilder append = new StringBuilder().append(TimeUtils.langDateRelative(this.time, view.getResources()));
        if (type == null) {
            type = "";
        }
        CharSequence infoHtml = append.append(type).toString();
        int platformIconResId = this.post == null ? 0 : this.post.getPlatformIconResource();
        if (this.post != null && platformIconResId != 0 && this.repostType != 5) {
            SpannableStringBuilder bldr = new SpannableStringBuilder(infoHtml);
            Spannable sp = Spannable.Factory.getInstance().newSpannable("F");
            Drawable d = view.getResources().getDrawable(platformIconResId);
            d.setBounds(0, 0, d.getIntrinsicWidth(), d.getIntrinsicHeight());
            sp.setSpan(new ImageSpan(d, 0), 0, 1, 0);
            bldr.append((CharSequence) MinimalPrettyPrinter.DEFAULT_ROOT_VALUE_SEPARATOR);
            bldr.append((CharSequence) sp);
            infoHtml = bldr;
        }
        holder.time.setText(infoHtml);
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return this.userPhoto;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static NewsEntry getPhotoAsPost(Photo photo, String userName, String userPhoto) {
        NewsEntry e = new NewsEntry();
        e.type = 1;
        e.postID = photo.id;
        e.ownerID = photo.ownerID;
        e.userID = photo.userID;
        e.attachments.add(new PhotoAttachment(photo));
        e.time = photo.date;
        e.numLikes = photo.nLikes;
        e.numRetweets = photo.nReposts;
        e.numComments = photo.nComments;
        e.userName = userName;
        e.userPhotoURL = userPhoto;
        if (photo.lat != -9000.0d && photo.lon != -9000.0d) {
            GeoAttachment geo = new GeoAttachment(photo.lat, photo.lon, "", photo.geoAddress, -9000, null, 0);
            e.attachments.add(geo);
        }
        e.flag(8, photo.isLiked);
        e.flag(2, photo.canComment);
        return e;
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public static class ViewHolder {
        View button;
        TextView name;
        VKImageView photo;
        TextView time;

        private ViewHolder() {
        }
    }
}
