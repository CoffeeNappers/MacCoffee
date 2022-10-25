package com.vkontakte.android.data;

import android.os.Parcel;
import android.os.Parcelable;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GameGenre implements Parcelable {
    public static final Parcelable.Creator<GameGenre> CREATOR = new Parcelable.Creator<GameGenre>() { // from class: com.vkontakte.android.data.GameGenre.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GameGenre mo958createFromParcel(Parcel source) {
            return new GameGenre(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GameGenre[] mo959newArray(int size) {
            return new GameGenre[size];
        }
    };
    public static final String KEY_ID = "id";
    public static final String KEY_NAME = "name";
    public final int id;
    public final String name;

    public GameGenre(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public GameGenre(JSONObject o) {
        this(o.optInt("id"), o.optString("name"));
    }

    public GameGenre(Parcel parcel) {
        this(parcel.readInt(), parcel.readString());
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeInt(this.id);
        parcel.writeString(this.name);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
