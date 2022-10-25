package com.vkontakte.android.api.photos;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.api.ResultlessAPIRequest;
import com.vkontakte.android.data.ServerKeys;
/* loaded from: classes2.dex */
public class PhotosEditAlbum extends ResultlessAPIRequest {
    private PhotosEditAlbum(int aid, String title, String descr, int owner_id) {
        super("photos.editAlbum");
        param("album_id", aid);
        param("owner_id", owner_id);
        param("title", title);
        param("description", descr);
    }

    public PhotosEditAlbum(int aid, String title, String descr, String privacy, String privacyComment, int owner_id) {
        this(aid, title, descr, owner_id);
        param(ServerKeys.PRIVACY_VIEW, privacy);
        param(ServerKeys.PRIVACY_COMMENT, privacyComment);
    }

    public PhotosEditAlbum(int aid, String title, String descr, boolean upload_by_admins_only, boolean comments_disabled, int owner_id) {
        this(aid, title, descr, owner_id);
        param(ServerKeys.UPLOAD_BY_ADMINS_ONLY, upload_by_admins_only ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param(ServerKeys.COMMENTS_DISABLED, comments_disabled ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
    }
}
