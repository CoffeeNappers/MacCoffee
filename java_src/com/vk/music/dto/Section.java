package com.vk.music.dto;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import com.facebook.share.internal.ShareConstants;
import com.vk.sharing.attachment.AttachmentInfo;
import com.vkontakte.android.UserProfile;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.Parser;
import com.vkontakte.android.data.ServerKeys;
import com.vkontakte.android.data.VKList;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Section extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Section> CREATOR = new Serializer.CreatorAdapter<Section>() { // from class: com.vk.music.dto.Section.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Section mo1087createFromSerializer(Serializer in) {
            return new Section(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Section[] mo1088newArray(int size) {
            return new Section[size];
        }
    };
    public final ArrayList<MusicTrack> audios;
    public final int count;
    public final ArrayList<ExtendedPlaylist> extendedPlaylists;
    public final int id;
    public final ArrayList<Playlist> playlists;
    public final ArrayList<UserProfile> profiles;
    public final String source;
    public final String subtitle;
    public final ArrayList<Thumb> thumbs;
    public final String title;
    @NonNull
    public final Type type;

    /* loaded from: classes2.dex */
    public enum Type {
        audios,
        users,
        groups,
        owners,
        playlists,
        audios_special,
        extended_playlists,
        unknown;

        /* JADX INFO: Access modifiers changed from: private */
        @NonNull
        public static Type parseType(@Nullable String s) {
            try {
                return valueOf(s);
            } catch (Exception e) {
                return unknown;
            }
        }
    }

    public Section(@NonNull JSONObject jSection) {
        this.id = jSection.optInt("id");
        this.type = Type.parseType(jSection.optString(ServerKeys.TYPE));
        this.title = jSection.optString("title");
        this.subtitle = jSection.optString("subtitle");
        this.count = jSection.optInt(ServerKeys.COUNT);
        this.source = jSection.optString(ShareConstants.FEED_SOURCE_PARAM);
        this.playlists = Parser.parseArray(jSection, "playlists", new VKList.ReflectionParser(Playlist.class));
        this.audios = Parser.parseArray(jSection, "audios", new VKList.ReflectionParser(MusicTrack.class));
        this.thumbs = parseThumbs(jSection.optJSONArray(AttachmentInfo.DATA_THUMBS));
        this.extendedPlaylists = parseExtendedPlaylist(jSection.optJSONArray("extended_playlists"));
        switch (this.type) {
            case users:
            case groups:
            case owners:
                this.profiles = parseUserProfiles(jSection.optJSONArray(this.type.name()));
                return;
            default:
                this.profiles = null;
                return;
        }
    }

    private static ArrayList<ExtendedPlaylist> parseExtendedPlaylist(@Nullable JSONArray jArray) {
        if (jArray != null) {
            int size = jArray.length();
            ArrayList<ExtendedPlaylist> extendedPlaylists = new ArrayList<>(size);
            for (int i = 0; i < size; i++) {
                JSONObject object = jArray.optJSONObject(i);
                if (object != null) {
                    extendedPlaylists.add(new ExtendedPlaylist(object));
                }
            }
            return extendedPlaylists;
        }
        return null;
    }

    private static ArrayList<Thumb> parseThumbs(@Nullable JSONArray jArray) {
        if (jArray != null) {
            int size = jArray.length();
            ArrayList<Thumb> thumbs = new ArrayList<>(size);
            for (int i = 0; i < size; i++) {
                JSONObject object = jArray.optJSONObject(i);
                if (object != null) {
                    thumbs.add(new Thumb(object));
                }
            }
            return thumbs;
        }
        return null;
    }

    private static ArrayList<UserProfile> parseUserProfiles(JSONArray jArray) {
        if (jArray != null) {
            int size = jArray.length();
            ArrayList<UserProfile> profiles = new ArrayList<>(size);
            for (int i = 0; i < size; i++) {
                try {
                    JSONObject jItem = jArray.optJSONObject(i);
                    boolean users = "profile".equals(jItem.optString(ServerKeys.TYPE));
                    UserProfile profile = new UserProfile(jItem);
                    profile.uid = (users ? 1 : -1) * profile.uid;
                    if (profile.uid < 0) {
                        profile.fullName = jArray.optJSONObject(i).optString("name");
                    }
                    profiles.add(profile);
                } catch (Exception e) {
                    L.e(e, new Object[0]);
                }
            }
            return profiles;
        }
        return null;
    }

    private Section(Serializer in) {
        this.id = in.readInt();
        this.type = Type.parseType(in.readString());
        this.title = in.readString();
        this.subtitle = in.readString();
        this.count = in.readInt();
        this.source = in.readString();
        this.playlists = in.createTypedArrayList(Playlist.CREATOR);
        this.extendedPlaylists = in.createTypedArrayList(ExtendedPlaylist.CREATOR);
        this.audios = in.createTypedArrayList(MusicTrack.CREATOR);
        this.profiles = in.createTypedArrayList(UserProfile.CREATOR);
        this.thumbs = in.createTypedArrayList(Thumb.CREATOR);
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.id);
        s.writeString(this.type.name());
        s.writeString(this.title);
        s.writeString(this.subtitle);
        s.writeInt(this.count);
        s.writeString(this.source);
        s.writeTypedList(this.playlists);
        s.writeTypedList(this.extendedPlaylists);
        s.writeTypedList(this.audios);
        s.writeTypedList(this.profiles);
        s.writeTypedList(this.thumbs);
    }
}
