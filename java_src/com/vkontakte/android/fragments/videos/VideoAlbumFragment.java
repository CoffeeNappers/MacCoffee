package com.vkontakte.android.fragments.videos;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v4.content.LocalBroadcastManager;
import android.view.View;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.vkontakte.android.R;
import com.vkontakte.android.VKAlertDialog;
import com.vkontakte.android.api.ResultlessCallback;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGet;
import com.vkontakte.android.api.video.VideoRemoveFromAlbum;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.functions.Functions;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.navigation.Navigator;
/* loaded from: classes3.dex */
public class VideoAlbumFragment extends AbsVideoListFragment {
    int mAlbumId = 0;
    BroadcastReceiver mReceiver = new BroadcastReceiver() { // from class: com.vkontakte.android.fragments.videos.VideoAlbumFragment.1
        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            char c = 65535;
            switch (action.hashCode()) {
                case -1872527792:
                    if (action.equals(Videos.ACTION_VIDEO_MOVED)) {
                        c = 0;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    VideoFile video = Videos.extractVideo(intent);
                    int targetId = intent.getIntExtra("target_id", 0);
                    int[] add = intent.getIntArrayExtra(ProductAction.ACTION_ADD);
                    int[] remove = intent.getIntArrayExtra(ProductAction.ACTION_REMOVE);
                    if (targetId == VideoAlbumFragment.this.getOwnerID()) {
                        if (Functions.contains(remove, VideoAlbumFragment.this.mAlbumId)) {
                            VideoAlbumFragment.this.removeItem(video.oid, video.vid);
                        }
                        if (Functions.contains(add, VideoAlbumFragment.this.mAlbumId)) {
                            VideoAlbumFragment.this.prepend(video);
                            return;
                        }
                        return;
                    }
                    return;
                default:
                    return;
            }
        }
    };
    String mTitle;

    public static Navigator newInstance(VideoAlbum album, boolean select) {
        Bundle args = new Bundle();
        args.putInt("album_id", album.id);
        args.putString("title", album.title);
        args.putInt(ArgKeys.UID, album.ownerID);
        args.putBoolean(ArgKeys.SELECT, select);
        return new Navigator(VideoAlbumFragment.class, args);
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        if (getArguments() != null) {
            this.mAlbumId = getArguments().getInt("album_id", 0);
        }
        if (getArguments() != null && getArguments().containsKey("title")) {
            this.mTitle = getArguments().getString("title");
        }
        LocalBroadcastManager.getInstance(getActivity()).registerReceiver(this.mReceiver, new IntentFilter(Videos.ACTION_VIDEO_MOVED));
    }

    @Override // com.vkontakte.android.fragments.base.GridFragment, com.vkontakte.android.fragments.VKRecyclerFragment, me.grishka.appkit.fragments.AppKitFragment, android.app.Fragment
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        setTitle(this.mTitle);
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment, me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        LocalBroadcastManager.getInstance(getActivity()).unregisterReceiver(this.mReceiver);
        super.onDestroy();
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    @NonNull
    protected VKAPIRequest<VKList<VideoFile>> getRequest(int offset, int count) {
        return VideoGet.get(getOwnerID(), this.mAlbumId, offset, count);
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    void showDeleteDialog(VideoFile video) {
        new VKAlertDialog.Builder(getActivity()).setMessage(R.string.delete_video_confirm_album).setTitle(R.string.delete_video).setPositiveButton(R.string.yes, VideoAlbumFragment$$Lambda$1.lambdaFactory$(this, video)).setNegativeButton(R.string.no, (DialogInterface.OnClickListener) null).show();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$showDeleteDialog$0(VideoFile video, DialogInterface dialog, int which) {
        deleteVideo(video);
    }

    @Override // com.vkontakte.android.fragments.videos.AbsVideoListFragment
    void deleteVideo(final VideoFile video) {
        new VideoRemoveFromAlbum(video.oid, video.vid, getOwnerID(), this.mAlbumId).setCallback(new ResultlessCallback(getActivity()) { // from class: com.vkontakte.android.fragments.videos.VideoAlbumFragment.2
            @Override // com.vkontakte.android.api.ResultlessCallback
            public void success() {
                VideoAlbumFragment.this.removeItem(video.oid, video.vid);
            }
        }).wrapProgress(getActivity()).exec((Context) getActivity());
    }
}
