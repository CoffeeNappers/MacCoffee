package com.vkontakte.android.fragments.photos;

import android.content.Context;
import android.util.SparseArray;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.TaggedPhoto;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.photos.PhotosGetNewTags;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.fragments.PostViewFragment;
import me.grishka.appkit.api.PaginatedList;
/* loaded from: classes3.dex */
public class NewPhotoTagsFragment extends PhotoListFragment {
    private SparseArray<UserProfile> profiles;

    public NewPhotoTagsFragment() {
        super(50);
        this.profiles = new SparseArray<>();
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        new PhotosGetNewTags(offset, count).setCallback(new SimpleCallback<PhotosGetNewTags.Result>() { // from class: com.vkontakte.android.fragments.photos.NewPhotoTagsFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(PhotosGetNewTags.Result result) {
                NewPhotoTagsFragment.this.onDataLoaded((PaginatedList<Photo>) result.photos);
                NewPhotoTagsFragment.this.album.numPhotos = result.photos.size();
                for (int i = 0; i < result.profiles.size(); i++) {
                    NewPhotoTagsFragment.this.profiles.put(result.profiles.keyAt(i), result.profiles.valueAt(i));
                }
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment
    protected void openPhoto(Photo photo) {
        TaggedPhoto tp = (TaggedPhoto) photo;
        tp.user = this.profiles.get(tp.ownerID);
        NewsEntry e = new NewsEntry();
        e.type = 1;
        e.postID = tp.id;
        e.ownerID = tp.ownerID;
        e.userID = tp.userID;
        e.attachments.add(new PhotoAttachment(tp));
        e.time = tp.date;
        e.numLikes = tp.nLikes;
        e.numRetweets = tp.nReposts;
        e.numComments = tp.nComments;
        if (tp.user != null) {
            e.userName = tp.user.fullName;
            e.userPhotoURL = tp.user.photo;
        }
        if (tp.lat != -9000.0d && tp.lon != -9000.0d) {
            GeoAttachment geo = new GeoAttachment(tp.lat, tp.lon, "", tp.geoAddress, -9000, null, 0);
            e.attachments.add(geo);
        }
        e.flag(8, tp.isLiked);
        e.flag(2, tp.canComment);
        new PostViewFragment.Builder(e).setPlacerProfile(this.profiles.get(tp.tagPlacerID)).setTagId(tp.tagID).go(getActivity());
    }
}
