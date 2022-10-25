package com.vkontakte.android.fragments.photos;

import android.content.Context;
import android.content.Intent;
import android.graphics.Rect;
import android.os.Bundle;
import android.util.SparseArray;
import android.view.LayoutInflater;
import android.view.ViewGroup;
import android.widget.TextView;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.PhotoViewer;
import com.vkontakte.android.R;
import com.vkontakte.android.TaggedPhoto;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.photos.PhotosGetUserPhotosAndNewTags;
import com.vkontakte.android.attachments.GeoAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.fragments.PostViewFragment;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
import com.vkontakte.android.fragments.photos.SectionedPhotoListFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigate;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import me.grishka.appkit.api.PaginatedList;
import me.grishka.appkit.views.UsableRecyclerView;
/* loaded from: classes3.dex */
public class PhotosOfMeFragment extends SectionedPhotoListFragment {
    private SectionedPhotoListFragment.Section allPhotos;
    private int newCount;
    private ArrayList<TaggedPhoto> newTags = new ArrayList<>();
    private SparseArray<UserProfile> profiles = new SparseArray<>();
    private SectionedPhotoListFragment.Section newPhotos = new SectionedPhotoListFragment.Section();

    public PhotosOfMeFragment() {
        this.newPhotos.title = VKApplication.context.getString(R.string.new_tags);
        this.newPhotos.headerAdapter = new SectionedPhotoListFragment.SectionHeaderAdapter(this.newPhotos.title);
        this.newPhotos.start = 0;
        this.newPhotos.adapter = new PhotoListFragment.PhotoAdapter(0, 0);
        this.allPhotos = new SectionedPhotoListFragment.Section();
        this.allPhotos.title = VKApplication.context.getString(R.string.user_photos_title_me);
        this.allPhotos.headerAdapter = new SectionedPhotoListFragment.SectionHeaderAdapter(this.allPhotos.title);
        this.allPhotos.start = 0;
        this.allPhotos.adapter = new PhotoListFragment.PhotoAdapter(0, Integer.MAX_VALUE);
        this.sections.add(this.newPhotos);
        this.sections.add(this.allPhotos);
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (!this.refreshing) {
            offset -= this.newTags.size();
        }
        this.currentRequest = new PhotosGetUserPhotosAndNewTags(Math.max(0, offset), count).setCallback(new SimpleCallback<PhotosGetUserPhotosAndNewTags.Result>(this) { // from class: com.vkontakte.android.fragments.photos.PhotosOfMeFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(PhotosGetUserPhotosAndNewTags.Result result) {
                PhotosOfMeFragment.this.album.numPhotos = result.photos.total();
                boolean needUpdateTags = (PhotosOfMeFragment.this.data.size() == 0) | PhotosOfMeFragment.this.refreshing;
                if (needUpdateTags) {
                    PhotosOfMeFragment.this.newCount = result.newTags.total();
                    if (needUpdateTags) {
                        PhotosOfMeFragment.this.newTags.clear();
                    }
                    PhotosOfMeFragment.this.newTags.addAll(result.newTags);
                    for (int i = 0; i < result.profiles.size(); i++) {
                        PhotosOfMeFragment.this.profiles.put(result.profiles.keyAt(i), result.profiles.valueAt(i));
                    }
                }
                PhotosOfMeFragment.this.onDataLoaded((PaginatedList<Photo>) result.photos);
                if (needUpdateTags) {
                    PhotosOfMeFragment.this.data.addAll(0, PhotosOfMeFragment.this.newTags);
                }
                PhotosOfMeFragment.this.allPhotos.adapter = new PhotoListFragment.PhotoAdapter(PhotosOfMeFragment.this.newTags.size(), Integer.MAX_VALUE);
                PhotosOfMeFragment.this.newPhotos.adapter = new PhotoListFragment.PhotoAdapter(0, PhotosOfMeFragment.this.newTags.size());
                PhotosOfMeFragment.this.onAppendItems(Collections.EMPTY_LIST);
            }
        }).exec((Context) getActivity());
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.utils.Preloader.Callback
    public void onAppendItems(List<Photo> items) {
        super.onAppendItems(items);
        this.adapter.removeAllAdapters();
        if (this.showAlbumHeader) {
            this.adapter.addAdapter(new PhotoListFragment.HeaderAdapter());
        }
        if (this.newTags.size() > 0) {
            this.adapter.addAdapter(this.newPhotos.headerAdapter);
            this.adapter.addAdapter(this.newPhotos.adapter);
            if (this.newCount > this.newTags.size()) {
                this.adapter.addAdapter(new ShowAllButtonAdapter());
            }
            this.adapter.addAdapter(this.allPhotos.headerAdapter);
        }
        this.adapter.addAdapter(this.allPhotos.adapter);
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment
    protected void openPhoto(Photo photo) {
        if (getArguments().getBoolean(ArgKeys.SELECT)) {
            Intent intent = new Intent();
            intent.putExtra("photo", photo);
            getActivity().setResult(-1, intent);
            getActivity().finish();
        } else if (photo instanceof TaggedPhoto) {
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
        } else {
            this.viewer = new PhotoViewer(getActivity(), this.data.subList(this.newTags.size(), this.data.size()), this.data.indexOf(photo) - this.newTags.size(), this);
            this.viewer.setTitle(this.album.title);
            this.viewer.setDisplayTotal(this.album.numPhotos);
            this.viewer.setAlbumIDs(this.album.oid, this.album.id);
            this.viewer.show();
        }
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, com.vkontakte.android.PhotoViewer.PhotoViewerCallback
    public void getPhotoBounds(int index, Rect outRect, Rect outClip) {
        super.getPhotoBounds(this.newTags.size() + index, outRect, outClip);
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment
    protected void onPhotoRemoved() {
        refresh();
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ShowAllButtonAdapter extends UsableRecyclerView.Adapter<ShowAllButtonViewHolder> {
        private ShowAllButtonAdapter() {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        /* renamed from: onCreateViewHolder  reason: collision with other method in class */
        public ShowAllButtonViewHolder mo1206onCreateViewHolder(ViewGroup parent, int viewType) {
            return new ShowAllButtonViewHolder();
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public void onBindViewHolder(ShowAllButtonViewHolder holder, int position) {
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemCount() {
            return 1;
        }

        @Override // android.support.v7.widget.RecyclerView.Adapter
        public int getItemViewType(int position) {
            return 100500;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public class ShowAllButtonViewHolder extends UsableRecyclerView.ViewHolder implements UsableRecyclerView.Clickable {
        public ShowAllButtonViewHolder() {
            super(LayoutInflater.from(PhotosOfMeFragment.this.getActivity()).inflate(R.layout.load_more_comments, (ViewGroup) PhotosOfMeFragment.this.list, false));
            ((TextView) this.itemView.findViewById(R.id.loadmore_text)).setText(R.string.show_all);
        }

        @Override // me.grishka.appkit.views.UsableRecyclerView.Clickable
        public void onClick() {
            Bundle args = new Bundle();
            args.putParcelable(ArgKeys.ALBUM, PhotosOfMeFragment.this.album);
            args.putBoolean("no_album_header", true);
            Navigate.to(NewPhotoTagsFragment.class, args, PhotosOfMeFragment.this.getActivity());
        }
    }
}
