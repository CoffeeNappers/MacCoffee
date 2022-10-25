package com.vk.sharing.action;

import android.support.annotation.NonNull;
import com.vk.music.dto.Playlist;
import com.vk.sharing.action.ActionsInfo;
import com.vkontakte.android.NewsComment;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.Good;
/* loaded from: classes2.dex */
public final class Actions {
    @NonNull
    public static ActionsInfo createInfo(@NonNull NewsEntry entry) {
        boolean z = false;
        if (entry.flag(512)) {
            return createInfoExcludeRepost();
        }
        boolean canRepost = entry.flag(1);
        boolean isCurrentUserPost = VKAccountManager.isCurrentUser(entry.userID);
        ActionsInfo.Builder postUserWall = new ActionsInfo.Builder().postUserWall(canRepost && !isCurrentUserPost);
        if (canRepost || isCurrentUserPost) {
            z = true;
        }
        return postUserWall.postGroupWall(z).build();
    }

    @NonNull
    public static ActionsInfo createInfo(@NonNull NewsEntry entry, @NonNull NewsComment comment) {
        if (entry.flag(512)) {
            return createInfoExcludeRepost();
        }
        boolean canRepost = entry.flag(1);
        return new ActionsInfo.Builder().postUserWall(canRepost).postGroupWall(canRepost).build();
    }

    @NonNull
    public static ActionsInfo createInfo(@NonNull Photo photo) {
        return new ActionsInfo.Builder().postUserWall(photo.canRepost && !VKAccountManager.isCurrentUser(photo.ownerID)).postGroupWall(photo.canRepost).build();
    }

    @NonNull
    public static ActionsInfo createInfo(@NonNull VideoFile file) {
        return new ActionsInfo.Builder().postUserWall(file.canRepost && !VKAccountManager.isCurrentUser(file.oid)).postGroupWall(file.canRepost).build();
    }

    @NonNull
    public static ActionsInfo createInfo(@NonNull Playlist playlist) {
        return new ActionsInfo.Builder().build();
    }

    @NonNull
    public static ActionsInfo createInfo(@NonNull MusicTrack track) {
        return new ActionsInfo.Builder().copyLink(false).build();
    }

    @NonNull
    public static ActionsInfo createInfo(@NonNull Good good) {
        return new ActionsInfo.Builder().postUserWall(good.can_repost && !VKAccountManager.isCurrentUser(good.owner_id)).postGroupWall(good.can_repost).build();
    }

    @NonNull
    public static ActionsInfo createInfoExcludeRepost() {
        return new ActionsInfo.Builder().postUserWall(false).postGroupWall(false).build();
    }

    @NonNull
    public static ActionsInfo createInfoDialogsShareOnly(String comment) {
        return new ActionsInfo.Builder().disableAllActions().predefineComment(comment).build();
    }

    private Actions() {
    }
}
