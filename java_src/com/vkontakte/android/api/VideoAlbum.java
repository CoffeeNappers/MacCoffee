package com.vkontakte.android.api;

import android.os.Parcel;
import android.os.Parcelable;
import com.facebook.share.internal.ShareConstants;
import com.vkontakte.android.SystemUtils;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoAlbum implements Parcelable {
    public static final int ALBUM_ID_BOOKMARKS = -1002;
    public static final int ALBUM_ID_SYS_ADDED = -2;
    public static final int ALBUM_ID_SYS_UPLOADED = -1;
    public static final int ALBUM_ID_TAGGED = -1001;
    public static final Parcelable.Creator<VideoAlbum> CREATOR = new Parcelable.Creator<VideoAlbum>() { // from class: com.vkontakte.android.api.VideoAlbum.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public VideoAlbum mo582createFromParcel(Parcel source) {
            return new VideoAlbum(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public VideoAlbum[] mo583newArray(int size) {
            return new VideoAlbum[size];
        }
    };
    public int count;
    public int id;
    public int lastUpdated;
    public int ownerID;
    public String photoBig;
    public String photoSmall;
    public List<PrivacySetting.PrivacyRule> privacy;
    public String title;

    public VideoAlbum() {
        this.privacy = new ArrayList();
    }

    public VideoAlbum(JSONObject o) throws JSONException {
        this.privacy = new ArrayList();
        this.id = o.getInt("id");
        this.title = o.getString("title");
        this.count = o.optInt(ServerKeys.COUNT);
        this.ownerID = o.getInt("owner_id");
        this.photoBig = o.optString("photo_320");
        this.photoSmall = o.optString("photo_160");
        this.lastUpdated = o.optInt(ServerKeys.UPDATE_TIME);
        if (o.has(ShareConstants.WEB_DIALOG_PARAM_PRIVACY)) {
            JSONArray privacy = o.getJSONArray(ShareConstants.WEB_DIALOG_PARAM_PRIVACY);
            this.privacy = PrivacySetting.parseApiValue(privacy);
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.id);
        dest.writeString(this.title);
        dest.writeInt(this.count);
        dest.writeInt(this.ownerID);
        dest.writeString(this.photoBig);
        dest.writeString(this.photoSmall);
        dest.writeInt(this.lastUpdated);
        SystemUtils.writeParcelableList(dest, this.privacy);
    }

    protected VideoAlbum(Parcel in) {
        this.privacy = new ArrayList();
        this.id = in.readInt();
        this.title = in.readString();
        this.count = in.readInt();
        this.ownerID = in.readInt();
        this.photoBig = in.readString();
        this.photoSmall = in.readString();
        this.lastUpdated = in.readInt();
        SystemUtils.readParcelableList(in, this.privacy, PrivacySetting.PrivacyRule.class);
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        VideoAlbum album = (VideoAlbum) o;
        return this.id == album.id && this.ownerID == album.ownerID;
    }

    public int hashCode() {
        int result = this.id;
        return (result * 31) + this.ownerID;
    }
}
