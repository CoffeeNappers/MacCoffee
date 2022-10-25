package com.vkontakte.android.fragments.messages;

import android.app.Activity;
import android.app.Fragment;
import android.os.Bundle;
import android.view.View;
import com.vkontakte.android.R;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.fragments.VKTabbedFragment;
import com.vkontakte.android.fragments.messages.ChatLinkAttachmentHistoryFragment;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
/* loaded from: classes2.dex */
public class ChatAttachmentHistoryFragment extends VKTabbedFragment {
    private ChatAudioAttachmentHistoryFragment audios;
    private ChatDocAttachmentHistoryFragment docs;
    private ChatLinkAttachmentHistoryFragment links;
    private ChatPhotoAttachmentHistoryFragment photos;
    private ChatVideoAttachmentHistoryFragment videos;

    /* loaded from: classes2.dex */
    public static class Builder extends Navigator {
        public Builder(int peer) {
            super(ChatAttachmentHistoryFragment.class);
            this.args.putInt("id", peer);
        }
    }

    public ChatAttachmentHistoryFragment() {
        setTabsAutoLoad(false);
    }

    @Override // me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onAttach(Activity act) {
        super.onAttach(act);
        setTitle(R.string.chat_attachments);
    }

    @Override // com.vkontakte.android.fragments.VKTabbedFragment, me.grishka.appkit.fragments.TabbedFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        List<String> titles = Arrays.asList(getResources().getStringArray(R.array.attachments_tabs));
        int peer = getArguments().getInt("id");
        this.photos = new ChatPhotoAttachmentHistoryFragment();
        Bundle args = new Bundle();
        PhotoAlbum a = new PhotoAlbum();
        a.id = -9003;
        a.oid = peer;
        a.title = getString(R.string.chat_attachments);
        a.numPhotos = 9000;
        args.putParcelable(ArgKeys.ALBUM, a);
        args.putBoolean("no_album_header", true);
        this.photos.setArguments(args);
        new Bundle().putBoolean("no_autoload", false);
        this.videos = new ChatVideoAttachmentHistoryFragment();
        Bundle args2 = new Bundle();
        args2.putInt("peer_id", peer);
        this.videos.setArguments(args2);
        this.docs = ChatDocAttachmentHistoryFragment.create(peer);
        this.links = ChatLinkAttachmentHistoryFragment.create(peer, ChatLinkAttachmentHistoryFragment.Type.link);
        this.audios = ChatAudioAttachmentHistoryFragment.create(peer);
        List<Fragment> tabs = new ArrayList<Fragment>(titles.size()) { // from class: com.vkontakte.android.fragments.messages.ChatAttachmentHistoryFragment.1
            {
                add(ChatAttachmentHistoryFragment.this.photos);
                add(ChatAttachmentHistoryFragment.this.videos);
                add(ChatAttachmentHistoryFragment.this.audios);
                add(ChatAttachmentHistoryFragment.this.docs);
                add(ChatAttachmentHistoryFragment.this.links);
            }
        };
        setTabs(tabs, titles);
    }
}
