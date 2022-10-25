package com.vk.sharing.attachment;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vk.core.util.CollectionUtils;
import com.vk.music.dto.Playlist;
import com.vk.music.dto.Thumb;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vk.stories.model.StoryEntry;
import com.vk.webapp.ReportAppInputData;
import com.vkontakte.android.NewsComment;
import com.vkontakte.android.NewsEntry;
import com.vkontakte.android.Photo;
import com.vkontakte.android.R;
import com.vkontakte.android.api.Document;
import com.vkontakte.android.api.VideoFile;
import com.vkontakte.android.attachments.Attachment;
import com.vkontakte.android.attachments.AudioAttachment;
import com.vkontakte.android.attachments.MarketAttachment;
import com.vkontakte.android.attachments.PhotoAttachment;
import com.vkontakte.android.attachments.VideoAttachment;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.Good;
import com.vkontakte.android.statistics.Statistic;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import java.util.ArrayList;
import java.util.Iterator;
/* loaded from: classes2.dex */
public final class Attachments {
    private static final String VK_HOST = "https://vk.com/";

    private Attachments() {
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull NewsEntry entry, @NonNull String ref) {
        switch (entry.type) {
            case 1:
                return createInfo(new Photo((PhotoAttachment) entry.attachments.get(0)), ref);
            case 2:
                return createInfo(((VideoAttachment) entry.attachments.get(0)).video, ref);
            case 10:
                return createInfo(((AudioAttachment) entry.attachments.get(0)).musicTrack, ref);
            case 12:
                ArrayList<Statistic> stats = new ArrayList<>();
                if (entry.attachments != null) {
                    Iterator<Attachment> it = entry.attachments.iterator();
                    while (it.hasNext()) {
                        Attachment attachment = it.next();
                        if (attachment instanceof Statistic) {
                            stats.add((Statistic) attachment);
                        }
                    }
                }
                return prepareInfoBuilder(2, ref, entry.ownerID, entry.postID, null).put(AttachmentInfo.DATA_AUTHOR_NAME, entry.userName).put(AttachmentInfo.DATA_AUTHOR_PHOTO_URL, entry.userPhotoURL).put(AttachmentInfo.DATA_STATS, stats).put(AttachmentInfo.DATA_TRACK_CODE, entry.getTrackCode()).build();
            case 18:
                return createInfo(((MarketAttachment) entry.attachments.get(0)).good, ref);
            default:
                return prepareInfoBuilder(1, ref, entry.ownerID, entry.postID, null).put(AttachmentInfo.DATA_AUTHOR_NAME, entry.userName).put(AttachmentInfo.DATA_AUTHOR_PHOTO_URL, entry.userPhotoURL).put(AttachmentInfo.DATA_TRACK_CODE, entry.getTrackCode()).build();
        }
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull NewsEntry entry, @NonNull NewsComment comment, @NonNull String ref) {
        return prepareInfoBuilder(3, ref, entry.ownerID, comment.cid, null).put("postId", entry.postID).put(AttachmentInfo.DATA_AUTHOR_NAME, comment.userName).put(AttachmentInfo.DATA_AUTHOR_PHOTO_URL, comment.userPhoto).put(AttachmentInfo.DATA_TRACK_CODE, entry.getTrackCode()).build();
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull MusicTrack track, @NonNull String ref) {
        return prepareInfoBuilder(4, ref, track.oid, track.aid, track.accessKey).put(AttachmentInfo.DATA_THUMB, track.getThumb()).put("title", track.title).put("artist", track.artist).build();
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull Photo photo, @NonNull String ref) {
        String thumbUrl;
        if (photo.thumbURL != null) {
            thumbUrl = photo.thumbURL;
        } else {
            thumbUrl = photo.getImage('m').url;
        }
        return prepareInfoBuilder(5, ref, photo.ownerID, photo.id, photo.accessKey).put(AttachmentInfo.DATA_THUMB_URL, thumbUrl).build();
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull VideoFile video, @NonNull String ref) {
        return prepareInfoBuilder(6, ref, video.oid, video.vid, video.accessKey).put(AttachmentInfo.DATA_THUMB_URL, video.urlThumb).put("duration", video.duration).build();
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull Document document, @NonNull String ref) {
        return prepareInfoBuilder(8, ref, document.oid, document.did, document.access_key).put(AttachmentInfo.DATA_THUMB_URL, document.thumb).put(AttachmentInfo.DATA_EXTENSION, document.ext).put("size", document.size).build();
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull Good good, @NonNull String ref) {
        return prepareInfoBuilder(7, ref, good.owner_id, good.id, null).put(AttachmentInfo.DATA_THUMB_URL, good.thumb_photo).put("title", good.title).put(AttachmentInfo.DATA_PRICE, good.price_text).build();
    }

    @NonNull
    public static AttachmentInfo createInfo(@Nullable String name, @Nullable String photo, @NonNull StoryEntry story, @NonNull String ref) {
        return prepareInfoBuilder(9, ref, story.ownerId, story.id, story.accessKey).put(AttachmentInfo.DATA_AUTHOR_NAME, name).put(AttachmentInfo.DATA_AUTHOR_PHOTO_URL, photo).build();
    }

    @NonNull
    public static AttachmentInfo createInfo(@NonNull Playlist playlist, @NonNull String ref) {
        ArrayList<Thumb> thumbs;
        if (playlist.photo != null) {
            thumbs = CollectionUtils.arrayOf(playlist.photo);
        } else if (playlist.thumbs != null) {
            thumbs = CollectionUtils.arrayOf(playlist.thumbs);
        } else {
            thumbs = null;
        }
        return prepareInfoBuilder(10, ref, playlist.ownerId, playlist.id, playlist.accessKey).put(AttachmentInfo.DATA_THUMBS, thumbs).put("title", playlist.title).build();
    }

    @NonNull
    private static AttachmentInfo.Builder prepareInfoBuilder(int type, @NonNull String ref, int ownerId, int mediaId, String accessKey) {
        AttachmentInfo.Builder info = new AttachmentInfo.Builder(type, ref).ownerId(ownerId).mediaId(mediaId);
        if (!TextUtils.isEmpty(accessKey)) {
            info.accessKey(accessKey);
        }
        return info;
    }

    @NonNull
    public static String createLink(@NonNull AttachmentInfo info) {
        StringBuilder sb = new StringBuilder(VK_HOST);
        switch (info.getType()) {
            case 1:
                sb.append(ReportAppInputData.REPORT_TYPE_WALL).append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 2:
                sb.append(ReportAppInputData.REPORT_TYPE_WALL).append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 3:
                sb.append(ReportAppInputData.REPORT_TYPE_WALL).append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getData().getInt("postId")).append("?reply=").append(info.getMediaId());
                break;
            case 4:
                sb.append(MimeTypes.BASE_TYPE_AUDIO).append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 5:
                sb.append("photo").append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 6:
                sb.append("video").append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 7:
                sb.append(ReportAppInputData.REPORT_TYPE_MARKET).append(info.getOwnerId()).append("?w=product").append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 8:
                sb.append("doc").append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 9:
                sb.append("story").append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            case 10:
                sb.append("playlist").append(info.getOwnerId()).append(EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR).append(info.getMediaId());
                break;
            default:
                throw new IllegalArgumentException("Unsupported type:" + info.getType());
        }
        return sb.toString();
    }

    @NonNull
    public static String toString(AttachmentInfo info) {
        String type;
        if (info == null) {
            return "";
        }
        switch (info.getType()) {
            case 1:
                type = ReportAppInputData.REPORT_TYPE_WALL;
                break;
            case 2:
                type = "wall_ads";
                break;
            case 3:
                type = ReportAppInputData.REPORT_TYPE_WALL;
                break;
            case 4:
                type = MimeTypes.BASE_TYPE_AUDIO;
                break;
            case 5:
                type = "photo";
                break;
            case 6:
                type = "video";
                break;
            case 7:
                type = ReportAppInputData.REPORT_TYPE_MARKET;
                break;
            case 8:
                type = "doc";
                break;
            case 9:
                type = "story";
                break;
            case 10:
                type = "audio_playlist";
                break;
            default:
                throw new IllegalArgumentException("Unsupported type:" + info.getType());
        }
        return type + defaultStringRepresentation(info);
    }

    @NonNull
    public static AttachmentViewHolder createViewHolder(@NonNull AttachmentInfo info) {
        switch (info.getType()) {
            case 1:
                return new AuthorAttachmentViewHolder(info.getData(), R.string.sharing_post_attachment_preview_label);
            case 2:
                return new AuthorAttachmentViewHolder(info.getData(), R.string.sharing_ads_post_attachment_preview_label);
            case 3:
                return new AuthorAttachmentViewHolder(info.getData(), R.string.sharing_post_comment_attachment_preview_label);
            case 4:
                return new AudioAttachmentViewHolder(info.getData());
            case 5:
                return new PhotoAttachmentViewHolder(info.getData());
            case 6:
                return new VideoAttachmentViewHolder(info.getData());
            case 7:
                return new MarketAttachmentViewHolder(info.getData());
            case 8:
                return new DocumentAttachmentViewHolder(info.getData());
            case 9:
                return new AuthorAttachmentViewHolder(info.getData(), R.string.sharing_story_attachment_preview_label);
            case 10:
                return new PlaylistAttachmentViewHolder(info.getData());
            default:
                throw new IllegalArgumentException("Unsupported type:" + info.getType());
        }
    }

    private static String defaultStringRepresentation(AttachmentInfo info) {
        return info.getOwnerId() + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + info.getMediaId() + (info.getAccessKey() != null ? EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + info.getAccessKey() : "");
    }
}
