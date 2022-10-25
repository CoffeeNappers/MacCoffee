package com.vkontakte.android.fragments.messages;

import android.app.Activity;
import android.content.Context;
import android.text.TextUtils;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.SimpleCallback;
import com.vkontakte.android.api.messages.MessagesGetHistoryAttachments;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.fragments.photos.PhotoListFragment;
/* loaded from: classes3.dex */
public class ChatPhotoAttachmentHistoryFragment extends PhotoListFragment {
    private String nextFrom = null;

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity activity) {
        super.onAttach(activity);
        if (!this.loaded) {
            loadData();
        } else {
            dataLoaded();
        }
    }

    @Override // com.vkontakte.android.fragments.photos.PhotoListFragment, me.grishka.appkit.fragments.BaseRecyclerFragment
    protected void doLoadData(int offset, int count) {
        if (offset == 0) {
            this.nextFrom = null;
        }
        this.currentRequest = MessagesGetHistoryAttachments.create(Photo.class, this.album.oid, this.nextFrom, count).setCallback(new SimpleCallback<VKList<Photo>>() { // from class: com.vkontakte.android.fragments.messages.ChatPhotoAttachmentHistoryFragment.1
            @Override // com.vkontakte.android.api.Callback
            public void success(VKList<Photo> result) {
                ChatPhotoAttachmentHistoryFragment.this.nextFrom = MessagesGetHistoryAttachments.nextFrom(result);
                ChatPhotoAttachmentHistoryFragment.this.onDataLoaded(result, !TextUtils.isEmpty(ChatPhotoAttachmentHistoryFragment.this.nextFrom));
                if (ChatPhotoAttachmentHistoryFragment.this.album != null && ChatPhotoAttachmentHistoryFragment.this.data != null) {
                    ChatPhotoAttachmentHistoryFragment.this.album.numPhotos = ChatPhotoAttachmentHistoryFragment.this.data.size();
                }
            }
        }).exec((Context) getActivity());
    }
}
