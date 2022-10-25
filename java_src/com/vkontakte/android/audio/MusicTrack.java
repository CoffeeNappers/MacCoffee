package com.vkontakte.android.audio;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.vk.music.dto.AlbumLink;
import com.vk.music.dto.Thumb;
import com.vkontakte.android.audio.database.DataObject;
import com.vkontakte.android.audio.database.DataProvider;
import com.vkontakte.android.data.db.Database;
import com.vkontakte.android.data.db.Table;
import com.vkontakte.android.navigation.ArgKeys;
import com.vkontakte.android.utils.L;
import com.vkontakte.android.utils.Serializer;
import io.fabric.sdk.android.services.events.EventsFilesManager;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class MusicTrack extends DataObject<MusicTrack> implements Parcelable, Serializer.Serializable {
    private static final String COLUMN_AID = "aid";
    private static final String COLUMN_ARTIST = "artist";
    private static final String COLUMN_DURATION = "duration";
    private static final String COLUMN_LYRICS_ID = "lyrics_id";
    private static final String COLUMN_LYRICS_TEXT = "lyrics_text";
    private static final String COLUMN_OID = "oid";
    private static final String COLUMN_PLAY_LIST_ID = "playlist_id";
    public static final String COLUMN_RESTRICTION = "restriction";
    private static final String COLUMN_TITLE = "title";
    private static final String COLUMN_URL = "url";
    public static final int RESTRICTION_LOCATION = 2;
    public static final int RESTRICTION_NONE = 0;
    public static final int RESTRICTION_WITHDRAWN = 1;
    public String accessKey;
    public int aid;
    public AlbumLink album;
    public String artist;
    public int duration;
    public String durationS;
    private int fileSize;
    public boolean fromAttachment;
    public int lyricsID;
    public String lyricsText;
    protected String mid;
    public int oid;
    public String playlistId;
    private int restrictionTypeD;
    public String title;
    public String url;
    protected static final String[] COLUMNS = concatColumns(DataObject.COLUMNS, "artist", "title", "duration", "url", "aid", "oid", "lyrics_id", "lyrics_text", "playlist_id", "restriction");
    private static final int INDEX_ARTIST = DataObject.COLUMNS.length;
    private static final int INDEX_TITLE = INDEX_ARTIST + 1;
    private static final int INDEX_DURATION = INDEX_TITLE + 1;
    private static final int INDEX_URL = INDEX_DURATION + 1;
    private static final int INDEX_AID = INDEX_URL + 1;
    private static final int INDEX_OID = INDEX_AID + 1;
    private static final int INDEX_LYRICS_ID = INDEX_OID + 1;
    private static final int INDEX_LYRICS_TEXT = INDEX_LYRICS_ID + 1;
    private static final int INDEX_PLAY_LIST_ID = INDEX_LYRICS_ID + 1;
    private static final int INDEX_RESTRICTION = INDEX_PLAY_LIST_ID + 1;
    public static final Serializer.Creator<MusicTrack> CREATOR = new Serializer.CreatorAdapter<MusicTrack>() { // from class: com.vkontakte.android.audio.MusicTrack.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public MusicTrack mo1087createFromSerializer(Serializer s) {
            return new MusicTrack(null, s);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public MusicTrack[] mo1088newArray(int size) {
            return new MusicTrack[size];
        }
    };

    public int getRestrictionType() {
        switch (this.restrictionTypeD) {
            case 0:
            case 1:
            case 2:
                return this.restrictionTypeD;
            default:
                this.restrictionTypeD = 0;
                return 0;
        }
    }

    public void setRestrictionType(int restrictionTypeD) {
        switch (restrictionTypeD) {
            case 0:
            case 1:
            case 2:
                this.restrictionTypeD = restrictionTypeD;
                return;
            default:
                this.restrictionTypeD = 0;
                return;
        }
    }

    public int getAlbumId() {
        if (this.album == null) {
            return 0;
        }
        return this.album.id;
    }

    @Nullable
    public Thumb getThumb() {
        if (this.album == null) {
            return null;
        }
        return this.album.thumb;
    }

    @Nullable
    public String getThumbUrl(int size) {
        if (this.album == null || this.album.thumb == null) {
            return null;
        }
        return this.album.thumb.getForSize(size);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static Table fillTable(Table table) {
        table.withIntegerColumn("_id").setPrimaryKey().setAutoincrement().withTextColumn("artist").withTextColumn("title").withIntegerColumn("duration").withTextColumn("url").withIntegerColumn("aid").withIntegerColumn("oid").withIntegerColumn("lyrics_id").withTextColumn("lyrics_text").withIntegerColumn("playlist_id").withIntegerColumn("restriction");
        return table;
    }

    public MusicTrack() {
        super(null);
        this.restrictionTypeD = 0;
    }

    public MusicTrack(int aid, int oid, String artist, String title, int duration, String url) {
        super(null);
        this.restrictionTypeD = 0;
        this.aid = aid;
        this.oid = oid;
        this.artist = artist;
        this.title = title;
        this.duration = duration;
        this.url = url;
        this.durationS = String.format("%d:%02d", Integer.valueOf(duration / 60), Integer.valueOf(duration % 60));
    }

    public MusicTrack(JSONObject o, int ownerId, int playlistId) {
        this(o);
        this.playlistId = ownerId + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + playlistId;
    }

    public MusicTrack(JSONObject o) {
        super(null);
        this.restrictionTypeD = 0;
        try {
            this.aid = o.optInt("id", o.optInt("aid"));
            this.oid = o.getInt("owner_id");
            this.artist = o.getString("artist");
            this.title = o.getString("title");
            this.duration = o.getInt("duration");
            this.url = o.getString("url");
            this.lyricsID = o.optInt("lyrics_id");
            if (o.has(ArgKeys.ALBUM)) {
                this.album = new AlbumLink(o.optJSONObject(ArgKeys.ALBUM));
            }
            this.accessKey = o.optString("access_key");
            setRestrictionType(o.optInt("content_restricted", 0));
        } catch (Exception x) {
            L.w(x, "Error parsing audio", o);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public MusicTrack(DataProvider<? extends MusicTrack> dataProvider) {
        super(dataProvider);
        this.restrictionTypeD = 0;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MusicTrack(DataProvider<? extends MusicTrack> dataProvider, Serializer in) {
        super(dataProvider);
        boolean z = false;
        this.restrictionTypeD = 0;
        if (in != null) {
            this.mid = in.readString();
            this.artist = in.readString();
            this.title = in.readString();
            this.duration = in.readInt();
            this.durationS = in.readString();
            this.url = in.readString();
            this.aid = in.readInt();
            this.oid = in.readInt();
            this.lyricsID = in.readInt();
            this.lyricsText = in.readString();
            this.fileSize = in.readInt();
            this.fromAttachment = in.readByte() != 0 ? true : z;
            this.album = (AlbumLink) in.readSerializable(AlbumLink.class.getClassLoader());
            this.accessKey = in.readString();
            setRestrictionType(in.readInt());
        }
    }

    public void changeIds(int newOid, int newAid) {
        this.oid = newOid;
        this.aid = newAid;
        this.mid = null;
    }

    public long getMidId() {
        return (this.oid << 32) | (this.aid & 268435455);
    }

    public String getMid() {
        if (this.mid == null) {
            String generateMid = generateMid(this.oid, this.aid);
            this.mid = generateMid;
            return generateMid;
        }
        return this.mid;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String generateMid(int oid, int aid) {
        return oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + aid;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void copyBaseValues(MusicTrack track) {
        this.mid = track.mid;
        this.artist = track.artist;
        this.title = track.title;
        this.duration = track.duration;
        this.durationS = track.durationS;
        this.url = track.url;
        this.aid = track.aid;
        this.oid = track.oid;
        this.lyricsID = track.lyricsID;
        this.lyricsText = track.lyricsText;
        this.fileSize = track.fileSize;
        this.fromAttachment = track.fromAttachment;
        this.album = track.album;
        this.accessKey = track.accessKey;
        setRestrictionType(track.getRestrictionType());
    }

    public String getUniqueId() {
        return getMid();
    }

    public String getActualLink(boolean forceLoad) {
        String str;
        try {
            if (forceLoad) {
                str = MusicApp.getActualLink(getMid(), this);
                this.url = str;
            } else {
                str = this.url;
            }
            return str;
        } catch (Exception e) {
            return this.url;
        }
    }

    public boolean equals(Object obj) {
        if (obj instanceof MusicTrack) {
            MusicTrack f = (MusicTrack) obj;
            return f.oid == this.oid && f.aid == this.aid;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.database.DataObject
    public void loadFromCursor(Cursor cursor) {
        super.loadFromCursor(cursor);
        this.artist = cursor.getString(INDEX_ARTIST);
        this.title = cursor.getString(INDEX_TITLE);
        this.duration = cursor.getInt(INDEX_DURATION);
        this.url = cursor.getString(INDEX_URL);
        this.aid = cursor.getInt(INDEX_AID);
        this.oid = cursor.getInt(INDEX_OID);
        this.lyricsID = cursor.getInt(INDEX_LYRICS_ID);
        this.lyricsText = cursor.getString(INDEX_LYRICS_TEXT);
        setRestrictionType(cursor.getInt(INDEX_RESTRICTION));
        this.durationS = String.format("%d:%02d", Integer.valueOf(this.duration / 60), Integer.valueOf(this.duration % 60));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.database.DataObject
    public void fillContentValues(ContentValues cv) {
        super.fillContentValues(cv);
        cv.put("artist", this.artist);
        cv.put("title", this.title);
        cv.put("duration", Integer.valueOf(this.duration));
        cv.put("url", this.url);
        cv.put("aid", Integer.valueOf(this.aid));
        cv.put("oid", Integer.valueOf(this.oid));
        cv.put("lyrics_id", Integer.valueOf(this.lyricsID));
        cv.put("lyrics_text", this.lyricsText);
        cv.put("restriction", Integer.valueOf(getRestrictionType()));
    }

    /* loaded from: classes2.dex */
    protected static abstract class MusicTrackProvider<T extends MusicTrack> extends DataProvider<T> {
        public MusicTrackProvider(String tableName, boolean useCache) {
            super(tableName, useCache);
        }

        @Override // com.vkontakte.android.audio.database.DataProvider
        protected SQLiteDatabase getDatabase() {
            return Database.getInst(MusicApp.getInstance()).getWritableDatabase();
        }

        @Override // com.vkontakte.android.audio.database.DataProvider
        protected String[] getProjection() {
            return MusicTrack.COLUMNS;
        }
    }

    @Override // android.os.Parcelable
    public final int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public final void writeToParcel(Parcel dest, int flags) {
        try {
            serializeTo(Serializer.get(dest));
        } catch (Exception e) {
            L.e(e, new Object[0]);
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeString(this.mid);
        s.writeString(this.artist);
        s.writeString(this.title);
        s.writeInt(this.duration);
        s.writeString(this.durationS);
        s.writeString(this.url);
        s.writeInt(this.aid);
        s.writeInt(this.oid);
        s.writeInt(this.lyricsID);
        s.writeString(this.lyricsText);
        s.writeInt(this.fileSize);
        s.writeByte(this.fromAttachment ? (byte) 1 : (byte) 0);
        s.writeSerializable(this.album);
        s.writeString(this.accessKey);
        s.writeInt(getRestrictionType());
    }

    public String toString() {
        return this.artist + " - " + this.title;
    }

    public String getUid() {
        return this.oid + EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.aid;
    }

    public String getSecureUid() {
        return getUid() + (this.accessKey != null ? EventsFilesManager.ROLL_OVER_FILE_NAME_SEPARATOR + this.accessKey : "");
    }
}
