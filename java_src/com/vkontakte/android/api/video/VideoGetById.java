package com.vkontakte.android.api.video;

import com.facebook.GraphRequest;
import com.vkontakte.android.Log;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.api.Group;
import com.vkontakte.android.api.VKAPIRequest;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.data.ServerKeys;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class VideoGetById extends VKAPIRequest<VideoFile> {
    final int oid;
    private long seekToMs;

    public VideoGetById(int oid, int vid, String accessKey) {
        super("execute.getVideoById");
        this.oid = oid;
        param("videos", oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + vid);
        param("oowner_id", oid);
        param("extended", 1);
        param(GraphRequest.FIELDS_PARAM, "first_name,last_name,photo_50,photo_100,photo_200,name");
        if (accessKey != null) {
            param("access_key", accessKey);
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.vkontakte.android.api.VKAPIRequest
    /* renamed from: parse */
    public VideoFile mo1093parse(JSONObject o) {
        try {
            JSONObject response = o.getJSONObject(ServerKeys.RESPONSE);
            JSONObject owner = response.getJSONObject("owner");
            VideoFile video = new VideoFile(response.getJSONObject("video"));
            if (this.oid > 0) {
                UserProfile profile = new UserProfile(owner);
                video.ownerName = profile.fullName;
                video.ownerPhoto = profile.photo;
            } else {
                Group group = new Group(owner);
                video.ownerName = group.name;
                video.ownerPhoto = group.photo;
            }
            if (this.seekToMs > 0 && this.seekToMs < video.duration * 1000) {
                video.seekToMs = this.seekToMs;
                return video;
            }
            return video;
        } catch (Exception x) {
            Log.w("vk", x);
            return null;
        }
    }

    public void setSeekTo(long seekToMs) {
        this.seekToMs = seekToMs;
    }
}
