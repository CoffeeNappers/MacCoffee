package com.vk.stories.model;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.vk.stories.StoriesController;
import com.vkontakte.android.Photo;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.io.File;
import java.util.ArrayList;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class StoryEntry implements Parcelable {
    public static final Parcelable.Creator<StoryEntry> CREATOR = new Parcelable.Creator<StoryEntry>() { // from class: com.vk.stories.model.StoryEntry.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public StoryEntry mo538createFromParcel(Parcel source) {
            return new StoryEntry(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public StoryEntry[] mo539newArray(int size) {
            return new StoryEntry[size];
        }
    };
    public String accessKey;
    public boolean canComment;
    public boolean canShare;
    public long date;
    public boolean expired;
    private File fullFile;
    public int id;
    public boolean isPrivate;
    public boolean isPromo;
    public boolean local;
    private File localPreview;
    public String openUrl;
    public int ownerId;
    public String ownerName;
    public String ownerPhoto;
    public Photo photo;
    public String preview;
    public boolean seen;
    public String type;
    public VideoFile video;
    public int viewsCount;

    public StoryEntry(JSONObject jsonObject) {
        boolean z = true;
        this.local = false;
        this.id = jsonObject.optInt("id");
        this.ownerId = jsonObject.optInt("owner_id");
        this.type = jsonObject.optString(ServerKeys.TYPE);
        this.preview = jsonObject.optString("preview");
        if (!TextUtils.isEmpty(this.preview)) {
            this.preview = "data:mime/type;base64," + this.preview;
        } else {
            this.preview = null;
        }
        this.date = jsonObject.optLong(ServerKeys.DATE);
        this.seen = jsonObject.optInt("seen") > 0;
        this.viewsCount = jsonObject.optInt(ServerKeys.VIEWS);
        this.expired = jsonObject.optInt("expired") > 0;
        JSONObject photoJson = jsonObject.optJSONObject("photo");
        if (photoJson != null) {
            this.photo = new Photo(photoJson);
        } else {
            this.photo = null;
        }
        JSONObject videoJson = jsonObject.optJSONObject("video");
        if (videoJson != null) {
            this.video = new VideoFile(videoJson);
        } else {
            this.video = null;
        }
        this.accessKey = jsonObject.optString("access_key");
        this.isPrivate = jsonObject.optInt("is_private") > 0;
        this.canShare = jsonObject.optInt("can_share") > 0;
        this.canComment = jsonObject.optInt(ServerKeys.CAN_COMMENT) > 0;
        this.isPromo = jsonObject.optInt("is_promo") <= 0 ? false : z;
        this.openUrl = jsonObject.optString("url");
        this.ownerPhoto = jsonObject.optString("owner_photo");
        this.ownerName = jsonObject.optString("owner_name");
    }

    public StoryEntry(StoriesController.StoryUpload upload) {
        this.local = true;
        this.id = upload.localId();
        this.ownerId = VKAccountManager.getCurrent().getUid();
        this.type = upload.type();
        this.date = upload.date();
        this.photo = null;
        this.video = null;
        this.localPreview = upload.previewFile();
        this.fullFile = upload.fullFile();
        this.canShare = true;
        this.canComment = true;
        this.isPromo = false;
        this.openUrl = null;
        this.ownerPhoto = null;
        this.ownerName = null;
    }

    public void setFullFile(File fullFile) {
        this.fullFile = fullFile;
    }

    public void setStory(StoryEntry s) {
        this.local = s.local;
        this.id = s.id;
        this.ownerId = s.ownerId;
        this.type = s.type;
        this.date = s.date;
        this.seen = s.seen;
        this.viewsCount = s.viewsCount;
        this.expired = s.expired;
        this.preview = s.preview;
        this.photo = s.photo;
        this.video = s.video;
        this.accessKey = s.accessKey;
        this.isPrivate = s.isPrivate;
        this.canShare = s.canShare;
        this.canComment = s.canComment;
        this.isPromo = s.isPromo;
        this.openUrl = s.openUrl;
        this.ownerPhoto = s.ownerPhoto;
        this.ownerName = s.ownerName;
    }

    public String stringId() {
        return !TextUtils.isEmpty(this.accessKey) ? this.ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.id + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.accessKey : this.ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.id;
    }

    public boolean isMyStory() {
        return this.ownerId == VKAccountManager.getCurrent().getUid();
    }

    public boolean isPhotoStory() {
        return "photo".equals(this.type);
    }

    public boolean isVideoStory() {
        return "video".equals(this.type);
    }

    public String getImageSmall(boolean realPreview) {
        if (this.localPreview != null) {
            return getLocalPreviewPath();
        }
        if (!realPreview && !TextUtils.isEmpty(this.preview)) {
            return this.preview;
        }
        if (this.photo != null) {
            ArrayList<Photo.Image> sizes = this.photo.sizes;
            String res = photoSizeByName(sizes, 'j');
            if (res == null) {
                String res2 = photoSizeByName(sizes, 'x');
                if (res2 == null) {
                    if (sizes.size() <= 0) {
                        return null;
                    }
                    return sizes.get(0).url;
                }
                return res2;
            }
            return res;
        } else if (this.video == null) {
            return null;
        } else {
            if (this.video.firstFrame320 != null) {
                return this.video.firstFrame320;
            }
            if (this.video.firstFrame130 != null) {
                return this.video.firstFrame130;
            }
            if (this.video.firstFrame800 == null) {
                return null;
            }
            return this.video.firstFrame800;
        }
    }

    public String getImageBig() {
        return this.localPreview != null ? getLocalPreviewPath() : getServerImageUrl();
    }

    public boolean localVideoPath() {
        return this.fullFile != null;
    }

    public String getVideoUrl() {
        return this.fullFile != null ? getLocalFullFilePath() : getServerVideoUrl();
    }

    public String getServerImageUrl() {
        if (this.photo != null) {
            ArrayList<Photo.Image> sizes = this.photo.sizes;
            String res = photoSizeByName(sizes, 'w');
            if (res == null) {
                String res2 = photoSizeByName(sizes, 'z');
                if (res2 == null) {
                    String res3 = photoSizeByName(sizes, 'y');
                    if (res3 == null) {
                        String res4 = photoSizeByName(sizes, 'x');
                        if (res4 == null) {
                            String res5 = photoSizeByName(sizes, 'j');
                            if (res5 == null) {
                                if (sizes.size() <= 0) {
                                    return null;
                                }
                                String res6 = sizes.get(0).url;
                                return res6;
                            }
                            return res5;
                        }
                        return res4;
                    }
                    return res3;
                }
                return res2;
            }
            return res;
        } else if (this.video != null) {
            if (!TextUtils.isEmpty(this.video.firstFrame800)) {
                String res7 = this.video.firstFrame800;
                return res7;
            } else if (!TextUtils.isEmpty(this.video.firstFrame320)) {
                String res8 = this.video.firstFrame320;
                return res8;
            } else if (TextUtils.isEmpty(this.video.firstFrame130)) {
                return null;
            } else {
                String res9 = this.video.firstFrame130;
                return res9;
            }
        } else if (TextUtils.isEmpty(this.preview)) {
            return null;
        } else {
            String res10 = this.preview;
            return res10;
        }
    }

    public String getServerVideoUrl() {
        if (this.video != null) {
            if (!TextUtils.isEmpty(this.video.url1080)) {
                return this.video.url1080;
            }
            if (!TextUtils.isEmpty(this.video.url720)) {
                return this.video.url720;
            }
            if (!TextUtils.isEmpty(this.video.url480)) {
                return this.video.url480;
            }
            if (!TextUtils.isEmpty(this.video.url360)) {
                return this.video.url360;
            }
            if (TextUtils.isEmpty(this.video.url240)) {
                return null;
            }
            return this.video.url240;
        }
        return null;
    }

    public String link() {
        return "https://vk.com/story" + this.ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.id;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        StoryEntry that = (StoryEntry) o;
        return this.id == that.id && this.ownerId == that.ownerId;
    }

    public int hashCode() {
        int result = this.id ^ (this.id >>> 32);
        return (result * 31) + this.ownerId;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        byte b = 1;
        dest.writeByte(this.local ? (byte) 1 : (byte) 0);
        dest.writeInt(this.id);
        dest.writeInt(this.ownerId);
        dest.writeString(this.type);
        dest.writeLong(this.date);
        dest.writeByte(this.seen ? (byte) 1 : (byte) 0);
        dest.writeByte(this.expired ? (byte) 1 : (byte) 0);
        dest.writeString(this.preview);
        dest.writeInt(this.viewsCount);
        dest.writeParcelable(this.photo, flags);
        dest.writeParcelable(this.video, flags);
        dest.writeSerializable(this.localPreview);
        dest.writeString(this.accessKey);
        dest.writeByte(this.isPrivate ? (byte) 1 : (byte) 0);
        dest.writeByte(this.canShare ? (byte) 1 : (byte) 0);
        dest.writeByte(this.canComment ? (byte) 1 : (byte) 0);
        if (!this.isPromo) {
            b = 0;
        }
        dest.writeByte(b);
        dest.writeString(this.openUrl);
        dest.writeString(this.ownerPhoto);
        dest.writeString(this.ownerName);
    }

    protected StoryEntry(Parcel in) {
        boolean z = true;
        this.local = in.readByte() != 0;
        this.id = in.readInt();
        this.ownerId = in.readInt();
        this.type = in.readString();
        this.date = in.readLong();
        this.seen = in.readByte() != 0;
        this.expired = in.readByte() != 0;
        this.preview = in.readString();
        this.viewsCount = in.readInt();
        this.photo = (Photo) in.readParcelable(Photo.class.getClassLoader());
        this.video = (VideoFile) in.readParcelable(VideoFile.class.getClassLoader());
        this.localPreview = (File) in.readSerializable();
        this.accessKey = in.readString();
        this.isPrivate = in.readByte() != 0;
        this.canShare = in.readByte() != 0;
        this.canComment = in.readByte() != 0;
        this.isPromo = in.readByte() == 0 ? false : z;
        this.openUrl = in.readString();
        this.ownerPhoto = in.readString();
        this.ownerName = in.readString();
    }

    private String getLocalPreviewPath() {
        if (this.localPreview != null) {
            return "file://" + this.localPreview.getAbsolutePath();
        }
        return null;
    }

    private String getLocalFullFilePath() {
        if (this.fullFile != null) {
            return "file://" + this.fullFile.getAbsolutePath();
        }
        return null;
    }

    private static String photoSizeByName(ArrayList<Photo.Image> sizes, char c) {
        for (int i = 0; i < sizes.size(); i++) {
            Photo.Image image = sizes.get(i);
            if (image.type == c) {
                return image.url;
            }
        }
        return null;
    }
}
