package com.vkontakte.android.api.photos;

import com.facebook.appevents.AppEventsConstants;
import com.vkontakte.android.Log;
import com.vkontakte.android.api.PhotoAlbum;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.data.ServerKeys;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotosCreateAlbum extends VKAPIRequest<PhotoAlbum> {
    private PhotosCreateAlbum(String title, String descr, int owner_id) {
        super("photos.createAlbum");
        param("title", title);
        param("description", descr);
        if (owner_id < 0) {
            param("group_id", Math.abs(owner_id));
        }
    }

    public PhotosCreateAlbum(String title, String descr, String privacy, String privacyComment, int owner_id) {
        this(title, descr, owner_id);
        param(ServerKeys.PRIVACY_VIEW, privacy);
        param(ServerKeys.PRIVACY_COMMENT, privacyComment);
    }

    public PhotosCreateAlbum(String title, String descr, boolean uploadByAdminsOnly, boolean commentsDisabled, int owner_id) {
        this(title, descr, owner_id);
        param(ServerKeys.UPLOAD_BY_ADMINS_ONLY, uploadByAdminsOnly ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
        param(ServerKeys.COMMENTS_DISABLED, commentsDisabled ? AppEventsConstants.EVENT_PARAM_VALUE_YES : AppEventsConstants.EVENT_PARAM_VALUE_NO);
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public PhotoAlbum mo1093parse(JSONObject o) {
        try {
            return new PhotoAlbum(o.getJSONObject(ServerKeys.RESPONSE));
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }
}
