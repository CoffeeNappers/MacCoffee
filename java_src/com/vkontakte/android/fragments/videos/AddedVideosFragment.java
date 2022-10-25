package com.vkontakte.android.fragments.videos;

import android.app.Activity;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Bundle;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.support.v4.content.LocalBroadcastManager;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.api.video.VideoGet;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Friends;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.upload.Upload;
import java.util.ArrayList;
import java.util.Arrays;
/* loaded from: classes3.dex */
public class AddedVideosFragment extends VideoAlbumFragment {
    BroadcastReceiver mReceiver = new AnonymousClass1();

    public static AddedVideosFragment newInstance(int ownerId, boolean select) {
        Bundle args = new Bundle();
        args.putInt("album_id", -2);
        args.putInt(ArgKeys.UID, ownerId);
        args.putBoolean(ArgKeys.SELECT, select);
        AddedVideosFragment result = new AddedVideosFragment();
        result.setArguments(args);
        return result;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.vkontakte.android.fragments.videos.AddedVideosFragment$1  reason: invalid class name */
    /* loaded from: classes3.dex */
    public class AnonymousClass1 extends BroadcastReceiver {
        AnonymousClass1() {
        }

        @Override // android.content.BroadcastReceiver
        public void onReceive(Context context, Intent intent) {
            String action = intent.getAction();
            char c = 65535;
            switch (action.hashCode()) {
                case -1883955043:
                    if (action.equals("com.vkontakte.android.VIDEO_ADDED")) {
                        c = 0;
                        break;
                    }
                    break;
                case 1220449185:
                    if (action.equals(Upload.ACTION_UPLOAD_DONE)) {
                        c = 1;
                        break;
                    }
                    break;
            }
            switch (c) {
                case 0:
                    if (VKAccountManager.isCurrentUser(AddedVideosFragment.this.getOwnerID()) && AddedVideosFragment.this.loaded) {
                        AddedVideosFragment.this.prepend(Videos.extractVideo(intent));
                        return;
                    }
                    return;
                case 1:
                    Parcelable o = intent.getParcelableExtra("result");
                    if (o instanceof VideoFile) {
                        VideoFile video = (VideoFile) o;
                        if (video.oid != AddedVideosFragment.this.getOwnerID() || !AddedVideosFragment.this.loaded) {
                            return;
                        }
                        Friends.getUsers(Arrays.asList(Integer.valueOf(video.oid)), AddedVideosFragment$1$$Lambda$1.lambdaFactory$(this, video));
                        return;
                    }
                    return;
                default:
                    return;
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$onReceive$1(VideoFile video, ArrayList users) {
            Activity activity = AddedVideosFragment.this.getActivity();
            if (activity != null) {
                activity.runOnUiThread(AddedVideosFragment$1$$Lambda$2.lambdaFactory$(this, users, video));
            }
        }

        /* JADX INFO: Access modifiers changed from: package-private */
        public /* synthetic */ void lambda$null$0(ArrayList users, VideoFile video) {
            if (users.size() > 0) {
                video.ownerName = ((UserProfile) users.get(0)).fullName;
                video.ownerPhoto = ((UserProfile) users.get(0)).photo;
            }
            AddedVideosFragment.this.prepend(video);
        }
    }

    @Override // com.vkontakte.android.fragments.videos.VideoAlbumFragment, com.vkontakte.android.fragments.videos.AbsVideoListFragment, android.app.DialogFragment, android.app.Fragment
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        LocalBroadcastManager.getInstance(getActivity()).registerReceiver(this.mReceiver, new IntentFilter("com.vkontakte.android.VIDEO_ADDED"));
        VKApplication.context.registerReceiver(this.mReceiver, new IntentFilter(Upload.ACTION_UPLOAD_DONE), "com.vkontakte.android.permission.ACCESS_DATA", null);
    }

    @Override // com.vkontakte.android.fragments.videos.VideoAlbumFragment, com.vkontakte.android.fragments.videos.AbsVideoListFragment, me.grishka.appkit.fragments.LoaderFragment, android.app.Fragment
    public void onDestroy() {
        LocalBroadcastManager.getInstance(getActivity()).unregisterReceiver(this.mReceiver);
        VKApplication.context.unregisterReceiver(this.mReceiver);
        super.onDestroy();
    }

    @Override // com.vkontakte.android.fragments.videos.VideoAlbumFragment, com.vkontakte.android.fragments.videos.AbsVideoListFragment
    @NonNull
    protected VKAPIRequest<VKList<VideoFile>> getRequest(int offset, int count) {
        return VideoGet.getAdded(getOwnerID(), offset, count);
    }

    @Override // com.vkontakte.android.fragments.videos.VideoAlbumFragment, com.vkontakte.android.fragments.videos.AbsVideoListFragment
    void showDeleteDialog(VideoFile video) {
        showVideoFileDeleteDialog(video);
    }

    @Override // com.vkontakte.android.fragments.videos.VideoAlbumFragment, com.vkontakte.android.fragments.videos.AbsVideoListFragment
    void deleteVideo(VideoFile video) {
        deleteVideoFile(video);
    }

    public void disableRefresh() {
        setRefreshEnabled(false);
    }
}
