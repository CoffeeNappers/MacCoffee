package com.vkontakte.android.ui.posts;

import android.content.Context;
import android.content.Intent;
import android.text.Spannable;
import android.view.View;
import android.widget.TextView;
import com.vk.imageloader.view.VKImageView;
import com.vkontakte.android.LinkParser;
import com.vkontakte.android.LinkSpan;
import com.vkontakte.android.LongPollService;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.R;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.photos.PhotosConfirmTag;
import com.vkontakte.android.api.photos.PhotosRemoveTag;
import com.vkontakte.android.audio.contentprovider.AudioContentProviderConstants;
import com.vkontakte.android.ui.Font;
import com.vkontakte.android.upload.Upload;
/* loaded from: classes3.dex */
public class TagConfirmationPostDisplayItem extends PostDisplayItem {
    private Runnable onRemove;
    private UserProfile profile;
    private int tagID;

    public TagConfirmationPostDisplayItem(NewsEntry entry, UserProfile profile, int tagID, Runnable removeThisItem) {
        super(entry);
        this.profile = profile;
        this.tagID = tagID;
        this.onRemove = removeThisItem;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getType() {
        return 16;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public int getImageCount() {
        return 1;
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public void onBindView(View view) {
        Spannable ss = (Spannable) LinkParser.parseLinks(view.getContext().getString(this.profile.f ? R.string.user_tagged_you_f : R.string.user_tagged_you_m, "[id" + this.profile.uid + "|" + this.profile.fullName + "]"));
        LinkSpan[] spans = (LinkSpan[]) ss.getSpans(0, ss.length(), LinkSpan.class);
        ss.setSpan(new Font.TypefaceSpan(Font.Medium), ss.getSpanStart(spans[0]), ss.getSpanEnd(spans[0]), 0);
        ((TextView) view.findViewById(R.id.text)).setText(ss);
        view.findViewById(R.id.accept).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.posts.TagConfirmationPostDisplayItem.1
            @Override // android.view.View.OnClickListener
            public void onClick(final View v) {
                new PhotosConfirmTag(TagConfirmationPostDisplayItem.this.postOwnerID, TagConfirmationPostDisplayItem.this.postID, TagConfirmationPostDisplayItem.this.tagID).setCallback(new ResultlessCallback(v.getContext()) { // from class: com.vkontakte.android.ui.posts.TagConfirmationPostDisplayItem.1.1
                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        TagConfirmationPostDisplayItem.this.broadcastRemoval(v.getContext());
                        TagConfirmationPostDisplayItem.decreasePhotosCounter();
                    }
                }).wrapProgress(v.getContext()).exec(v.getContext());
            }
        });
        view.findViewById(R.id.reject).setOnClickListener(new View.OnClickListener() { // from class: com.vkontakte.android.ui.posts.TagConfirmationPostDisplayItem.2
            @Override // android.view.View.OnClickListener
            public void onClick(final View v) {
                new PhotosRemoveTag(TagConfirmationPostDisplayItem.this.postOwnerID, TagConfirmationPostDisplayItem.this.postID, TagConfirmationPostDisplayItem.this.tagID).setCallback(new ResultlessCallback(v.getContext()) { // from class: com.vkontakte.android.ui.posts.TagConfirmationPostDisplayItem.2.1
                    @Override // com.vkontakte.android.api.ResultlessCallback
                    public void success() {
                        TagConfirmationPostDisplayItem.this.broadcastRemoval(v.getContext());
                        TagConfirmationPostDisplayItem.decreasePhotosCounter();
                    }
                }).wrapProgress(v.getContext()).exec(v.getContext());
            }
        });
        ((VKImageView) view.findViewById(R.id.photo)).load(getImageURL(0));
    }

    static void decreasePhotosCounter() {
        LongPollService.setNumPhotosMarks(LongPollService.getNumPhotosMarks() - 1);
        LongPollService.notifyCountersChanged();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void broadcastRemoval(Context context) {
        this.onRemove.run();
        Intent intent = new Intent(Upload.ACTION_PHOTO_REMOVED);
        intent.putExtra(AudioContentProviderConstants.MUSIC_TRACK_COLUMN_AID, -9000);
        intent.putExtra("pid", this.postID);
        context.sendBroadcast(intent, "com.vkontakte.android.permission.ACCESS_DATA");
    }

    @Override // com.vkontakte.android.ui.posts.PostDisplayItem
    public String getImageURL(int image) {
        return this.profile.photo;
    }

    public static View createView(Context context) {
        return View.inflate(context, R.layout.post_item_confirm_tag, null);
    }
}
