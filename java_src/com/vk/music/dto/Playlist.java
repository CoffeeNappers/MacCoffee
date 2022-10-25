package com.vk.music.dto;

import android.support.annotation.NonNull;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vkontakte.android.auth.VKAccountManager;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.utils.Serializer;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class Playlist extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Playlist> CREATOR = new Serializer.CreatorAdapter<Playlist>() { // from class: com.vk.music.dto.Playlist.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Playlist mo1087createFromSerializer(Serializer in) {
            return new Playlist(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Playlist[] mo1088newArray(int size) {
            return new Playlist[size];
        }
    };
    public static final int TYPE_ALBUM = 1;
    public static final int TYPE_PLAYLIST = 0;
    public static final int TYPE_SAVED = 2;
    public String accessKey;
    public List<Artist> artists;
    public int audioCount;
    public long createTime;
    public String description;
    public PlaylistLink followed;
    public int followersCount;
    public boolean following;
    public List<Genre> genres;
    public int id;
    public int listeningsCount;
    public PlaylistLink original;
    public int ownerId;
    public Thumb photo;
    public List<Thumb> thumbs;
    public String title;
    public int type;
    public long updateTime;
    public int year;

    @Retention(RetentionPolicy.SOURCE)
    /* loaded from: classes.dex */
    public @interface Type {
    }

    public Playlist(String title, int ownerId, int type) {
        this.title = title;
        this.ownerId = ownerId;
        this.type = type;
    }

    public Playlist(@NonNull JSONObject jPlaylist) {
        JSONArray jThumb;
        int length;
        JSONArray jArtists;
        int length2;
        JSONArray jGenres;
        int length3;
        int i = 1;
        this.id = jPlaylist.optInt("id");
        this.ownerId = jPlaylist.optInt("owner_id");
        this.type = jPlaylist.optInt(ServerKeys.TYPE) != 1 ? 0 : i;
        if (jPlaylist.has("original")) {
            this.original = new PlaylistLink(jPlaylist.optJSONObject("original"));
        }
        if (jPlaylist.has("followed")) {
            this.followed = new PlaylistLink(jPlaylist.optJSONObject("followed"));
        }
        this.title = jPlaylist.optString("title");
        this.description = jPlaylist.optString("description");
        this.year = jPlaylist.optInt("year");
        if (jPlaylist.has("photo")) {
            this.photo = new Thumb(jPlaylist.optJSONObject("photo"));
        }
        if (jPlaylist.has("genres") && (length3 = (jGenres = jPlaylist.optJSONArray("genres")).length()) > 0) {
            this.genres = new ArrayList(length3);
            for (int i2 = 0; i2 < length3; i2++) {
                this.genres.add(new Genre(jGenres.optJSONObject(i2)));
            }
        }
        if (jPlaylist.has("artists") && (length2 = (jArtists = jPlaylist.optJSONArray("artists")).length()) > 0) {
            this.artists = new ArrayList(length2);
            for (int i3 = 0; i3 < length2; i3++) {
                this.artists.add(new Artist(jArtists.optJSONObject(i3)));
            }
        }
        if (jPlaylist.has(AttachmentInfo.DATA_THUMBS) && (length = (jThumb = jPlaylist.optJSONArray(AttachmentInfo.DATA_THUMBS)).length()) > 0) {
            this.thumbs = new ArrayList(length);
            for (int i4 = 0; i4 < length; i4++) {
                this.thumbs.add(new Thumb(jThumb.optJSONObject(i4)));
            }
        }
        this.following = jPlaylist.optBoolean("is_following");
        this.listeningsCount = jPlaylist.optInt("plays");
        this.followersCount = jPlaylist.optInt("followers");
        this.audioCount = jPlaylist.optInt(ServerKeys.COUNT);
        this.createTime = jPlaylist.optLong("create_time");
        this.updateTime = jPlaylist.optLong("update_time");
        this.accessKey = jPlaylist.optString("access_key");
    }

    public Playlist(Playlist playlist) {
        this.id = playlist.id;
        this.ownerId = playlist.ownerId;
        this.type = playlist.type;
        this.original = playlist.original;
        this.followed = playlist.followed;
        this.title = playlist.title;
        this.description = playlist.description;
        this.year = playlist.year;
        this.photo = playlist.photo;
        this.genres = playlist.genres;
        this.artists = playlist.artists;
        this.thumbs = playlist.thumbs;
        this.following = playlist.following;
        this.listeningsCount = playlist.listeningsCount;
        this.followersCount = playlist.followersCount;
        this.audioCount = playlist.audioCount;
        this.createTime = playlist.createTime;
        this.updateTime = playlist.updateTime;
        this.accessKey = playlist.accessKey;
    }

    private Playlist(Serializer in) {
        this.id = in.readInt();
        this.ownerId = in.readInt();
        switch (in.readByte()) {
            case 0:
                this.type = 0;
                break;
            case 1:
            default:
                this.type = 1;
                break;
            case 2:
                this.type = 2;
                break;
        }
        this.original = (PlaylistLink) in.readSerializable(PlaylistLink.class.getClassLoader());
        this.followed = (PlaylistLink) in.readSerializable(PlaylistLink.class.getClassLoader());
        this.title = in.readString();
        this.description = in.readString();
        this.year = in.readInt();
        this.photo = (Thumb) in.readSerializable(Thumb.class.getClassLoader());
        this.genres = in.createTypedArrayList(Genre.CREATOR);
        this.artists = in.createTypedArrayList(Artist.CREATOR);
        this.thumbs = in.createTypedArrayList(Thumb.CREATOR);
        this.following = in.readByte() == 1;
        this.listeningsCount = in.readInt();
        this.followersCount = in.readInt();
        this.audioCount = in.readInt();
        this.createTime = in.readLong();
        this.updateTime = in.readLong();
        this.accessKey = in.readString();
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeInt(this.ownerId);
        s.writeByte((byte) this.type);
        s.writeSerializable(this.original);
        s.writeSerializable(this.followed);
        s.writeString(this.title);
        s.writeString(this.description);
        s.writeInt(this.year);
        s.writeSerializable(this.photo);
        s.writeTypedList(this.genres);
        s.writeTypedList(this.artists);
        s.writeTypedList(this.thumbs);
        s.writeByte((byte) (this.following ? 1 : 0));
        s.writeInt(this.listeningsCount);
        s.writeInt(this.followersCount);
        s.writeInt(this.audioCount);
        s.writeLong(this.createTime);
        s.writeLong(this.updateTime);
        s.writeString(this.accessKey);
    }

    @NonNull
    public Playlist getOriginalPlaylist() {
        if (this.original != null) {
            Playlist original = new Playlist(this);
            original.id = this.original.id;
            original.ownerId = this.original.ownerId;
            original.accessKey = this.original.accessKey;
            original.original = null;
            if (VKAccountManager.isCurrentUser(this.ownerId)) {
                original.following = true;
                original.followed = new PlaylistLink(this.id, this.ownerId);
            }
            return original;
        }
        return this;
    }

    public boolean equals(Object o) {
        if (this == o) {
            return true;
        }
        if (o == null || getClass() != o.getClass()) {
            return false;
        }
        Playlist playlist = (Playlist) o;
        return this.id == playlist.id;
    }

    public int hashCode() {
        return this.id;
    }

    public String toString() {
        return "Playlist{id=" + this.id + ", title='" + this.title + "', audioCount=" + this.audioCount + ", ownerId=" + this.ownerId + '}';
    }

    public long getPid() {
        return (this.ownerId << 32) | (this.id & 1048575);
    }
}
