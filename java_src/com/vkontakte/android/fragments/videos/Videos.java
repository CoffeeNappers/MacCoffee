package com.vkontakte.android.fragments.videos;

import android.content.Context;
import android.content.Intent;
import android.support.annotation.NonNull;
import android.support.v4.content.LocalBroadcastManager;
import com.google.android.gms.analytics.ecommerce.ProductAction;
import com.vkontakte.android.SystemUtils;
import com.vkontakte.android.api.VideoAlbum;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.navigation.ArgKeys;
import java.util.List;
/* loaded from: classes3.dex */
public class Videos {
    static final String ACTION_ALBUM_CREATED = "com.vkontakte.android.VIDEO_ALBUM_CREATED";
    static final String ACTION_UPLOAD_DONE = "com.vkontakte.android.UPLOAD_DONE";
    static final String ACTION_VIDEO_ADDED = "com.vkontakte.android.VIDEO_ADDED";
    public static final String ACTION_VIDEO_MOVED = "com.vkontakte.android.VIDEO_MOVED";

    private Videos() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void notifyVideoAdded(Context context, VideoFile video) {
        LocalBroadcastManager.getInstance(context).sendBroadcast(new Intent(ACTION_VIDEO_ADDED).putExtra("video", video));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void notifyVideoMoved(Context context, VideoFile video, int targetId, List<Integer> add, List<Integer> remove) {
        LocalBroadcastManager.getInstance(context).sendBroadcast(new Intent(ACTION_VIDEO_MOVED).putExtra("video", video).putExtra("target_id", targetId).putExtra(ProductAction.ACTION_ADD, SystemUtils.asIntArray(add)).putExtra(ProductAction.ACTION_REMOVE, SystemUtils.asIntArray(remove)));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void notifyAlbumCreated(Context context, VideoAlbum album) {
        LocalBroadcastManager.getInstance(context).sendBroadcast(new Intent(ACTION_ALBUM_CREATED).putExtra(ArgKeys.ALBUM, album));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VideoFile extractVideo(@NonNull Intent data) {
        return (VideoFile) data.getParcelableExtra("video");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static VideoAlbum extractAlbum(@NonNull Intent data) {
        return (VideoAlbum) data.getParcelableExtra(ArgKeys.ALBUM);
    }
}
