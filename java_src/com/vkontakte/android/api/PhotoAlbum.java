package com.vkontakte.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import com.vkontakte.android.Log;
import com.vkontakte.android.R;
import com.vkontakte.android.SystemUtils;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class PhotoAlbum implements Parcelable {
    public static final Parcelable.Creator<PhotoAlbum> CREATOR = new Parcelable.Creator<PhotoAlbum>() { // from class: com.vkontakte.android.api.PhotoAlbum.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public PhotoAlbum mo579createFromParcel(Parcel in) {
            return new PhotoAlbum(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public PhotoAlbum[] mo580newArray(int size) {
            return new PhotoAlbum[size];
        }
    };
    public boolean canUpload;
    public boolean commentsDisabled;
    public int created;
    public String descr;
    public int id;
    public int numPhotos;
    public int oid;
    public List<PrivacySetting.PrivacyRule> privacy = new ArrayList();
    public List<PrivacySetting.PrivacyRule> privacyComment = new ArrayList();
    public boolean thumbIsLast;
    public String thumbURL;
    public String title;
    public String type;
    public int updated;
    public boolean uploadByAdminsOnly;

    public PhotoAlbum() {
    }

    public PhotoAlbum(JSONObject ja) {
        boolean z = true;
        try {
            this.created = ja.optInt(ServerKeys.CREATED);
            this.updated = ja.optInt(ServerKeys.UPDATED);
            this.title = ja.getString("title");
            if (this.title.length() == 0) {
                this.title = VKApplication.context.getResources().getString(R.string.album_unnamed);
            }
            this.descr = ja.optString("description", "");
            this.id = ja.getInt("id");
            this.oid = ja.getInt("owner_id");
            this.numPhotos = ja.getInt("size");
            this.uploadByAdminsOnly = ja.optInt(ServerKeys.UPLOAD_BY_ADMINS_ONLY, 0) == 1;
            this.commentsDisabled = ja.optInt(ServerKeys.COMMENTS_DISABLED, 0) == 1;
            this.thumbIsLast = ja.optInt(ServerKeys.THUMB_IS_LAST, 0) != 1 ? false : z;
            JSONArray jpriv = ja.optJSONArray(ServerKeys.PRIVACY_VIEW);
            if (jpriv != null) {
                this.privacy.addAll(PrivacySetting.parseApiValue(jpriv));
            }
            JSONArray jprivc = ja.optJSONArray(ServerKeys.PRIVACY_COMMENT);
            if (jprivc != null) {
                this.privacyComment.addAll(PrivacySetting.parseApiValue(jprivc));
            }
            this.thumbURL = ja.optString(ServerKeys.THUMB_SRC);
            this.type = ja.optString(ServerKeys.TYPE);
        } catch (Exception x) {
            Log.w("vk", "Error parsing photo album", x);
        }
    }

    public PhotoAlbum(Parcel p) {
        boolean z = true;
        this.id = p.readInt();
        this.oid = p.readInt();
        this.updated = p.readInt();
        this.created = p.readInt();
        this.numPhotos = p.readInt();
        this.title = p.readString();
        this.descr = p.readString();
        SystemUtils.readParcelableList(p, this.privacy, PrivacySetting.PrivacyRule.class);
        SystemUtils.readParcelableList(p, this.privacyComment, PrivacySetting.PrivacyRule.class);
        this.thumbURL = p.readString();
        this.canUpload = p.readInt() == 1;
        this.uploadByAdminsOnly = p.readInt() == 1;
        this.commentsDisabled = p.readInt() == 1;
        this.thumbIsLast = p.readInt() != 1 ? false : z;
        this.type = p.readString();
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel p, int arg1) {
        int i = 1;
        p.writeInt(this.id);
        p.writeInt(this.oid);
        p.writeInt(this.updated);
        p.writeInt(this.created);
        p.writeInt(this.numPhotos);
        p.writeString(this.title);
        p.writeString(this.descr);
        SystemUtils.writeParcelableList(p, this.privacy);
        SystemUtils.writeParcelableList(p, this.privacyComment);
        p.writeString(this.thumbURL);
        p.writeInt(this.canUpload ? 1 : 0);
        p.writeInt(this.uploadByAdminsOnly ? 1 : 0);
        p.writeInt(this.commentsDisabled ? 1 : 0);
        if (!this.thumbIsLast) {
            i = 0;
        }
        p.writeInt(i);
        p.writeString(this.type);
    }
}
