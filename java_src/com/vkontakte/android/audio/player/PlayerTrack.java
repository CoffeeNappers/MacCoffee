package com.vkontakte.android.audio.player;

import android.content.ContentValues;
import android.database.Cursor;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.db.Table;
import com.vkontakte.android.utils.Serializer;
import java.util.List;
import java.util.UUID;
/* loaded from: classes2.dex */
public final class PlayerTrack extends MusicTrack {
    private static final String COLUMN_POSITION = "position";
    private static final String COLUMN_UUID = "uuid";
    public static final String TABLE = "player_track";
    public int position;
    public String uuid;
    public static final Serializer.Creator<PlayerTrack> CREATOR = new Serializer.CreatorAdapter<PlayerTrack>() { // from class: com.vkontakte.android.audio.player.PlayerTrack.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public PlayerTrack mo1087createFromSerializer(Serializer in) {
            return new PlayerTrack(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public PlayerTrack[] mo1088newArray(int size) {
            return new PlayerTrack[size];
        }
    };
    public static final PlayerTrackProvider PROVIDER = new PlayerTrackProvider();
    private static final String[] COLUMNS = concatColumns(MusicTrack.COLUMNS, "position", "uuid");
    private static final int INDEX_POSITION = MusicTrack.COLUMNS.length;
    private static final int INDEX_UUID = INDEX_POSITION + 1;

    protected static Table fillTable(Table table) {
        MusicTrack.fillTable(table);
        table.withIntegerColumn("position").withTextColumn("uuid");
        return table;
    }

    public static String createSql() {
        return fillTable(new Table(TABLE)).createSql();
    }

    public PlayerTrack(MusicTrack track) {
        super(PROVIDER);
        copyBaseValues(track);
        this.uuid = UUID.randomUUID().toString();
    }

    private PlayerTrack() {
        super(PROVIDER);
    }

    protected PlayerTrack(Serializer in) {
        super(PROVIDER, in);
        this.position = in.readInt();
        this.uuid = in.readString();
    }

    @Override // com.vkontakte.android.audio.MusicTrack, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        super.serializeTo(s);
        s.writeInt(this.position);
        s.writeString(this.uuid);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.MusicTrack, com.vkontakte.android.audio.database.DataObject
    public void loadFromCursor(Cursor cursor) {
        super.loadFromCursor(cursor);
        this.position = cursor.getInt(INDEX_POSITION);
        this.uuid = cursor.getString(INDEX_UUID);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.MusicTrack, com.vkontakte.android.audio.database.DataObject
    public void fillContentValues(ContentValues contentValues) {
        super.fillContentValues(contentValues);
        contentValues.put(COLUMNS[INDEX_POSITION], Integer.valueOf(this.position));
        contentValues.put(COLUMNS[INDEX_UUID], this.uuid);
    }

    @Override // com.vkontakte.android.audio.database.DataObject
    public void copyFrom(MusicTrack object) {
        super.copyFrom((PlayerTrack) object);
        PlayerTrack playerTrack = (PlayerTrack) object;
        this.position = playerTrack.position;
        this.uuid = playerTrack.uuid;
    }

    /* loaded from: classes2.dex */
    public static class PlayerTrackProvider extends MusicTrack.MusicTrackProvider<PlayerTrack> {
        private PlayerTrackProvider() {
            super(PlayerTrack.TABLE, true);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.audio.database.DataProvider
        /* renamed from: createNew  reason: collision with other method in class */
        public PlayerTrack mo947createNew() {
            return new PlayerTrack();
        }

        public List<PlayerTrack> loadTracks() {
            return getListByQuery(null, null, PlayerTrack.COLUMNS[PlayerTrack.INDEX_POSITION]);
        }

        @Override // com.vkontakte.android.audio.MusicTrack.MusicTrackProvider, com.vkontakte.android.audio.database.DataProvider
        protected String[] getProjection() {
            return PlayerTrack.COLUMNS;
        }
    }
}
