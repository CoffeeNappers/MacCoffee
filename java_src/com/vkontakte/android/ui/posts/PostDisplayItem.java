package com.vkontakte.android.ui.posts;

import android.view.View;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.media.AutoPlay;
/* loaded from: classes3.dex */
public abstract class PostDisplayItem {
    public static final int TYPE_ACTIVITY_COMMENT = 19;
    public static final int TYPE_ACTIVITY_LIKES = 18;
    public static final int TYPE_AD_GOODS_BLOCK = 15;
    public static final int TYPE_ATTACH_CONTAINER = 9;
    public static final int TYPE_AUDIO_ATTACH = 6;
    public static final int TYPE_BUTTONS = 10;
    public static final int TYPE_COMMENT = 4;
    public static final int TYPE_COMMON_ATTACH = 7;
    public static final int TYPE_FOOTER = 1;
    public static final int TYPE_FRIENDS_RECOMM = 13;
    public static final int TYPE_HEADER = 0;
    public static final int TYPE_HEADER_AD = 12;
    public static final int TYPE_HEADER_RECOMMENDED = 20;
    public static final int TYPE_MARKED_AS_ADS = 21;
    public static final int TYPE_PADDING = 17;
    public static final int TYPE_REPOST = 3;
    public static final int TYPE_SHIT_BLOCK = 14;
    public static final int TYPE_SIGNATURE = 8;
    public static final int TYPE_TAG_CONFIRMATION = 16;
    public static final int TYPE_TEXT = 2;
    public static final int TYPE_THUMBS_BLOCK = 5;
    public static final int TYPE_WIDGET = 22;
    public static final int VIEW_TYPE_COUNT = 23;
    public int bgType;
    public boolean clickable = true;
    private OnBindView onBindView = null;
    public int postID;
    public int postOwnerID;
    public String trackCode;

    /* loaded from: classes3.dex */
    public interface OnBindView {
        void onBindView(View view);
    }

    public abstract int getImageCount();

    public abstract String getImageURL(int i);

    public abstract int getType();

    public abstract void onBindView(View view);

    public PostDisplayItem(int _postID, int _postOwnerID) {
        this.postID = _postID;
        this.postOwnerID = _postOwnerID;
    }

    public PostDisplayItem(NewsEntry entry) {
        this.postID = entry.postID;
        this.postOwnerID = entry.ownerID;
        this.trackCode = entry.getTrackCode();
    }

    public void setOnBindView(OnBindView onBindView) {
        this.onBindView = onBindView;
    }

    public AutoPlay getAutoPlayItem() {
        return null;
    }

    public final void bindView(View view) {
        onBindView(view);
        if (this.onBindView != null) {
            this.onBindView.onBindView(view);
        }
    }
}
