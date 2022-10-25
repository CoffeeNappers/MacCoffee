package com.vkontakte.android.audio.player;

import android.content.ContentValues;
import android.database.Cursor;
import com.vkontakte.android.audio.MusicTrack;
import com.vkontakte.android.data.db.Table;
import com.vkontakte.android.utils.Serializer;
import java.io.File;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public final class SavedTrack extends MusicTrack {
    protected static final String COLUMN_FILE = "file";
    protected static final String COLUMN_POSITION = "position";
    public static final String TABLE = "saved_track";
    public File file;
    public int position;
    public static final Serializer.Creator<SavedTrack> CREATOR = new Serializer.CreatorAdapter<SavedTrack>() { // from class: com.vkontakte.android.audio.player.SavedTrack.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public SavedTrack mo1087createFromSerializer(Serializer in) {
            return new SavedTrack(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public SavedTrack[] mo1088newArray(int size) {
            return new SavedTrack[size];
        }
    };
    public static final SavedTrackProvider PROVIDER = new SavedTrackProvider();
    private static final String[] COLUMNS = concatColumns(MusicTrack.COLUMNS, "position", "file");
    private static final int INDEX_POSITION = MusicTrack.COLUMNS.length;
    private static final int INDEX_FILE = INDEX_POSITION + 1;

    protected static Table fillTable(Table table) {
        MusicTrack.fillTable(table);
        table.withIntegerColumn("position").withTextColumn("file");
        return table;
    }

    public static String createSql() {
        return fillTable(new Table(TABLE)).createSql();
    }

    public SavedTrack(MusicTrack track, File file) {
        super(PROVIDER);
        copyBaseValues(track);
        this.file = file;
    }

    SavedTrack() {
        super(PROVIDER);
    }

    protected SavedTrack(Serializer in) {
        super(PROVIDER, in);
        this.position = in.readInt();
        this.file = (File) in.readJavaSerializable();
    }

    @Override // com.vkontakte.android.audio.MusicTrack, com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        super.serializeTo(s);
        s.writeInt(this.position);
        s.writeJavaSerializable(this.file);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.MusicTrack, com.vkontakte.android.audio.database.DataObject
    public void loadFromCursor(Cursor cursor) {
        super.loadFromCursor(cursor);
        this.position = cursor.getInt(INDEX_POSITION);
        this.file = new File(cursor.getString(INDEX_FILE));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.vkontakte.android.audio.MusicTrack, com.vkontakte.android.audio.database.DataObject
    public void fillContentValues(ContentValues contentValues) {
        super.fillContentValues(contentValues);
        contentValues.put(COLUMNS[INDEX_POSITION], Integer.valueOf(this.position));
        contentValues.put(COLUMNS[INDEX_FILE], this.file.getAbsolutePath());
    }

    @Override // com.vkontakte.android.audio.database.DataObject
    public void copyFrom(MusicTrack object) {
        super.copyFrom((SavedTrack) object);
        SavedTrack savedTrack = (SavedTrack) object;
        this.position = savedTrack.position;
        this.file = savedTrack.file;
    }

    /* loaded from: classes2.dex */
    public static class SavedTrackProvider extends MusicTrack.MusicTrackProvider<SavedTrack> {
        private SavedTrackProvider() {
            super(SavedTrack.TABLE, true);
        }

        /* JADX INFO: Access modifiers changed from: protected */
        @Override // com.vkontakte.android.audio.database.DataProvider
        /* renamed from: createNew  reason: collision with other method in class */
        public SavedTrack mo947createNew() {
            return new SavedTrack();
        }

        public ArrayList<SavedTrack> loadTracks() {
            return getListByQuery(null, null, SavedTrack.COLUMNS[SavedTrack.INDEX_POSITION]);
        }

        @Override // com.vkontakte.android.audio.MusicTrack.MusicTrackProvider, com.vkontakte.android.audio.database.DataProvider
        protected String[] getProjection() {
            return SavedTrack.COLUMNS;
        }
    }
}
