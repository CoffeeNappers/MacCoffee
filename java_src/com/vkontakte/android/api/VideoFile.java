package com.vkontakte.android.api;

import android.net.Uri;
import android.os.Build;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vkontakte.android.Global;
import com.vkontakte.android.Log;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.SystemUtils;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.PrivacySetting;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import io.sentry.marshaller.json.JsonMarshaller;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class VideoFile extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<VideoFile> CREATOR = new Serializer.CreatorAdapter<VideoFile>() { // from class: com.vkontakte.android.api.VideoFile.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public VideoFile mo1087createFromSerializer(Serializer in) {
            return new VideoFile(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public VideoFile[] mo1088newArray(int size) {
            return new VideoFile[size];
        }
    };
    public static final int LIVE_FAILED = 4;
    public static final int LIVE_FINISHED = 3;
    public static final int LIVE_STARTED = 2;
    public static final int LIVE_UPCOMING = 5;
    public static final int LIVE_WAITING = 1;
    public String accessKey;
    public boolean canAdd;
    public boolean canComment;
    public boolean canEdit;
    public boolean canRepost;
    public int comments;
    public boolean contentRestricted;
    public int date;
    public String descr;
    public CharSequence displayableTitle;
    public int duration;
    public String firstFrame130;
    public String firstFrame320;
    public String firstFrame800;
    private boolean flv;
    public int height;
    public boolean liked;
    public int likes;
    public boolean live;
    public int liveStatus;
    public boolean noAutoplay;
    public int oid;
    public String ownerName;
    public String ownerPhoto;
    public String platform;
    public List<PrivacySetting.PrivacyRule> privacy = new ArrayList();
    public List<PrivacySetting.PrivacyRule> privacyComment = new ArrayList();
    public boolean processing;
    public boolean repeat;
    public boolean reposted;
    public int reposts;
    public long seekToMs;
    public String title;
    public String url1080;
    public String url240;
    public String url360;
    public String url480;
    public String url720;
    public String urlBigThumb;
    public String urlEmbed;
    public String urlExternal;
    public String urlHls;
    public String urlThumb;
    public int vid;
    public int views;
    public int width;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface LiveStatus {
    }

    public VideoFile() {
    }

    public VideoFile(Serializer p) {
        boolean z = true;
        this.oid = p.readInt();
        this.vid = p.readInt();
        this.duration = p.readInt();
        this.url240 = p.readString();
        this.url360 = p.readString();
        this.url480 = p.readString();
        this.url720 = p.readString();
        this.url1080 = p.readString();
        this.urlHls = p.readString();
        this.urlExternal = p.readString();
        this.urlEmbed = p.readString();
        this.urlThumb = p.readString();
        this.urlBigThumb = p.readString();
        this.title = p.readString();
        this.descr = p.readString();
        this.platform = p.readString();
        this.date = p.readInt();
        this.views = p.readInt();
        this.ownerName = p.readString();
        this.ownerPhoto = p.readString();
        this.accessKey = p.readString();
        this.likes = p.readInt();
        this.comments = p.readInt();
        this.reposts = p.readInt();
        this.liked = p.readInt() == 1;
        this.reposted = p.readInt() == 1;
        this.live = p.readInt() == 1;
        this.repeat = p.readInt() == 1;
        this.canComment = p.readInt() == 1;
        this.canEdit = p.readInt() == 1;
        this.canRepost = p.readInt() == 1;
        this.canAdd = p.readInt() == 1;
        this.flv = p.readInt() == 1;
        this.noAutoplay = p.readInt() == 1;
        this.contentRestricted = p.readInt() == 1;
        this.processing = p.readInt() != 1 ? false : z;
        this.width = p.readInt();
        this.height = p.readInt();
        this.firstFrame130 = p.readString();
        this.firstFrame320 = p.readString();
        this.firstFrame800 = p.readString();
        this.liveStatus = p.readInt();
        SystemUtils.readSerializerSerializableList(p, this.privacy, PrivacySetting.PrivacyRule.class);
        SystemUtils.readSerializerSerializableList(p, this.privacyComment, PrivacySetting.PrivacyRule.class);
        this.seekToMs = p.readLong();
        this.displayableTitle = Global.replaceEmoji(this.title);
    }

    public VideoFile(JSONObject jv) {
        Uri uri;
        try {
            this.vid = jv.optInt("video_id", jv.optInt("id", jv.optInt("vid")));
            this.oid = jv.optInt("owner_id");
            this.title = jv.optString("title");
            this.descr = jv.optString("description");
            this.duration = jv.optInt("duration");
            this.contentRestricted = jv.optInt("content_restricted", 0) == 1;
            this.urlThumb = jv.optString("photo_130", jv.optString(AttachmentInfo.DATA_THUMB, jv.optString("image")));
            this.urlBigThumb = jv.optString("photo_800", jv.optString("photo_640", jv.optString("photo_320", jv.optString("image_medium"))));
            this.date = jv.optInt(ServerKeys.DATE);
            this.views = jv.optInt(ServerKeys.VIEWS);
            this.live = jv.optInt("live") == 1;
            JSONObject files = jv.optJSONObject("files");
            if (files != null) {
                this.url240 = files.optString("mp4_240", files.optString("src"));
                this.url360 = files.optString("mp4_360");
                this.url480 = files.optString("mp4_480");
                this.url720 = files.optString("mp4_720");
                this.url1080 = files.optString("mp4_1080");
                this.urlExternal = files.optString("external");
                this.urlHls = files.optString("hls", files.optString("live"));
                if (!TextUtils.isEmpty(this.urlHls) && (uri = Uri.parse(this.urlHls)) != null) {
                    String lastPathSegment = uri.getLastPathSegment();
                    if (!TextUtils.isEmpty(lastPathSegment)) {
                        if (lastPathSegment.endsWith(".720.mp4")) {
                            this.url720 = this.urlHls;
                            this.urlHls = null;
                        } else if (lastPathSegment.endsWith(".1080.mp4")) {
                            this.url1080 = this.urlHls;
                            this.urlHls = null;
                        } else if (lastPathSegment.endsWith(".360.mp4")) {
                            this.url360 = this.urlHls;
                            this.urlHls = null;
                        } else if (lastPathSegment.endsWith(".240.mp4")) {
                            this.url240 = this.urlHls;
                            this.urlHls = null;
                        } else if (lastPathSegment.endsWith(".480.mp4")) {
                            this.url480 = this.urlHls;
                            this.urlHls = null;
                        }
                    }
                }
                this.flv = !TextUtils.isEmpty(files.optString("flv_320", files.optString("flv_240"))) && TextUtils.isEmpty(this.urlHls) && TextUtils.isEmpty(this.url360) && TextUtils.isEmpty(this.url480) && TextUtils.isEmpty(this.url720) && TextUtils.isEmpty(this.url1080);
            } else {
                this.urlExternal = jv.optString("player");
            }
            this.platform = jv.optString(JsonMarshaller.PLATFORM);
            this.urlEmbed = jv.optString("player");
            if (jv.has(ServerKeys.LIKES)) {
                this.likes = jv.getJSONObject(ServerKeys.LIKES).optInt(ServerKeys.COUNT);
                this.liked = jv.getJSONObject(ServerKeys.LIKES).optInt(ServerKeys.USER_LIKES) == 1;
            }
            if (jv.has("reposts")) {
                this.reposts = jv.getJSONObject("reposts").optInt(ServerKeys.COUNT);
                this.reposted = jv.getJSONObject("reposts").optInt("user_reposted") == 1;
            }
            this.comments = jv.optInt("comments");
            this.repeat = jv.optInt("repeat") == 1;
            this.accessKey = jv.optString("access_key");
            JSONArray jpriv = jv.optJSONArray(ServerKeys.PRIVACY_VIEW);
            if (jpriv != null) {
                this.privacy.addAll(PrivacySetting.parseApiValue(jpriv));
            }
            JSONArray jprivc = jv.optJSONArray(ServerKeys.PRIVACY_COMMENT);
            if (jprivc != null) {
                this.privacyComment.addAll(PrivacySetting.parseApiValue(jprivc));
            }
            this.canComment = jv.optInt(ServerKeys.CAN_COMMENT) == 1;
            this.canEdit = jv.optInt("can_edit") == 1;
            this.canRepost = jv.optInt(ServerKeys.CAN_REPOST) == 1;
            this.canAdd = jv.optInt("is_private") == 0;
            this.processing = jv.optInt("processing") == 1;
            this.live = jv.optInt("live") == 1;
            this.noAutoplay = jv.optInt("no_autoplay") == 1;
            this.width = jv.optInt("width");
            this.height = jv.optInt("height");
            this.firstFrame130 = jv.optString("first_frame_130");
            this.firstFrame320 = jv.optString("first_frame_320");
            this.firstFrame800 = jv.optString("first_frame_800");
            String liveStatus = jv.optString("live_status");
            if (!TextUtils.isEmpty(liveStatus)) {
                char c = 65535;
                switch (liveStatus.hashCode()) {
                    case -1897185151:
                        if (liveStatus.equals("started")) {
                            c = 1;
                            break;
                        }
                        break;
                    case -1281977283:
                        if (liveStatus.equals("failed")) {
                            c = 3;
                            break;
                        }
                        break;
                    case -673660814:
                        if (liveStatus.equals("finished")) {
                            c = 2;
                            break;
                        }
                        break;
                    case 1116313165:
                        if (liveStatus.equals("waiting")) {
                            c = 0;
                            break;
                        }
                        break;
                    case 1306691868:
                        if (liveStatus.equals("upcoming")) {
                            c = 4;
                            break;
                        }
                        break;
                }
                switch (c) {
                    case 0:
                        this.liveStatus = 1;
                        break;
                    case 1:
                        this.liveStatus = 2;
                        break;
                    case 2:
                        this.liveStatus = 3;
                        break;
                    case 3:
                        this.liveStatus = 4;
                        break;
                    case 4:
                        this.liveStatus = 5;
                        break;
                }
            } else if (jv.optInt("upcoming") == 1) {
                this.liveStatus = 5;
            }
            this.displayableTitle = Global.replaceEmoji(this.title);
        } catch (Exception x) {
            Log.w("vk", x);
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer p) {
        int i = 1;
        p.writeInt(this.oid);
        p.writeInt(this.vid);
        p.writeInt(this.duration);
        p.writeString(this.url240);
        p.writeString(this.url360);
        p.writeString(this.url480);
        p.writeString(this.url720);
        p.writeString(this.url1080);
        p.writeString(this.urlHls);
        p.writeString(this.urlExternal);
        p.writeString(this.urlEmbed);
        p.writeString(this.urlThumb);
        p.writeString(this.urlBigThumb);
        p.writeString(this.title);
        p.writeString(this.descr);
        p.writeString(this.platform);
        p.writeInt(this.date);
        p.writeInt(this.views);
        p.writeString(this.ownerName);
        p.writeString(this.ownerPhoto);
        p.writeString(this.accessKey);
        p.writeInt(this.likes);
        p.writeInt(this.comments);
        p.writeInt(this.reposts);
        p.writeInt(this.liked ? 1 : 0);
        p.writeInt(this.reposted ? 1 : 0);
        p.writeInt(this.live ? 1 : 0);
        p.writeInt(this.repeat ? 1 : 0);
        p.writeInt(this.canComment ? 1 : 0);
        p.writeInt(this.canEdit ? 1 : 0);
        p.writeInt(this.canRepost ? 1 : 0);
        p.writeInt(this.canAdd ? 1 : 0);
        p.writeInt(this.flv ? 1 : 0);
        p.writeInt(this.noAutoplay ? 1 : 0);
        p.writeInt(this.contentRestricted ? 1 : 0);
        if (!this.processing) {
            i = 0;
        }
        p.writeInt(i);
        p.writeInt(this.width);
        p.writeInt(this.height);
        p.writeString(this.firstFrame130);
        p.writeString(this.firstFrame320);
        p.writeString(this.firstFrame800);
        p.writeInt(this.liveStatus);
        SystemUtils.writeSerializerSerializableList(p, this.privacy);
        SystemUtils.writeSerializerSerializableList(p, this.privacyComment);
        p.writeLong(this.seekToMs);
    }

    public NewsEntry convertToPost() {
        NewsEntry post = new NewsEntry();
        post.attachments.add(new VideoAttachment(this));
        int i = this.oid;
        post.ownerID = i;
        post.userID = i;
        post.postID = this.vid;
        post.type = 2;
        post.text = this.descr;
        post.time = this.date;
        post.numRetweets = this.reposts;
        post.userName = this.ownerName;
        post.userPhotoURL = this.ownerPhoto;
        if (this.canComment || this.oid == VKAccountManager.getCurrent().getUid()) {
            post.flags |= 2;
        }
        if (this.liked) {
            post.flags |= 8;
        }
        if (this.canRepost) {
            post.flags |= 1;
        }
        post.numLikes = this.likes;
        return post;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        VideoFile videoFile = (VideoFile) o;
        return this.oid == videoFile.oid && this.vid == videoFile.vid;
    }

    public int hashCode() {
        int result = this.oid;
        return (result * 31) + this.vid;
    }

    public String toString() {
        return "video" + this.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.vid + (!TextUtils.isEmpty(this.accessKey) ? EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.accessKey : "");
    }

    public boolean isHLSSupported() {
        return !TextUtils.isEmpty(this.urlHls) && Build.VERSION.SDK_INT >= 16;
    }

    public boolean isFlv() {
        return this.flv;
    }

    public boolean isExternal() {
        return TextUtils.isEmpty(this.url240) && TextUtils.isEmpty(this.url360) && TextUtils.isEmpty(this.url480) && TextUtils.isEmpty(this.url720) && TextUtils.isEmpty(this.url1080) && TextUtils.isEmpty(this.urlHls) && !TextUtils.isEmpty(this.urlExternal);
    }

    public boolean isLive() {
        return this.live && this.liveStatus != 3;
    }

    public boolean isLiveUpcoming() {
        return this.live && (this.liveStatus == 5 || this.liveStatus == 1);
    }

    public CharSequence getTitle() {
        return !TextUtils.isEmpty(this.displayableTitle) ? this.displayableTitle : this.title;
    }

    @Nullable
    public String getFirstFrame() {
        if (!TextUtils.isEmpty(this.firstFrame800)) {
            return this.firstFrame800;
        }
        if (!TextUtils.isEmpty(this.firstFrame320)) {
            return this.firstFrame320;
        }
        if (!TextUtils.isEmpty(this.firstFrame130)) {
            return this.firstFrame130;
        }
        return null;
    }
}
