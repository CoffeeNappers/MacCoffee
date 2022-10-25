package com.vkontakte.android.data;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
/* loaded from: classes2.dex */
public class CatalogInfo implements Parcelable {
    public static final Parcelable.Creator<CatalogInfo> CREATOR = new Parcelable.Creator<CatalogInfo>() { // from class: com.vkontakte.android.data.CatalogInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public CatalogInfo mo956createFromParcel(Parcel source) {
            return new CatalogInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public CatalogInfo[] mo957newArray(int size) {
            return new CatalogInfo[size];
        }
    };
    public static final int DEFAULT_GENRE_ID = -1;
    public final FilterType filterType;
    public final int genre_id;
    public String platform;
    public final String title;
    public final int titleRes;

    /* loaded from: classes2.dex */
    public enum FilterType {
        installed(ServerKeys.INSTALLED),
        featured("featured"),
        filterNew("new"),
        html5("html5");
        
        final String serverKey;

        FilterType(String serverKey) {
            this.serverKey = serverKey;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public String getServerKey() {
            return this.serverKey;
        }
    }

    public CatalogInfo(int titleRes) {
        this.title = null;
        this.titleRes = titleRes;
        this.genre_id = -1;
        this.filterType = null;
    }

    public CatalogInfo(String title) {
        this.title = title;
        this.titleRes = -1;
        this.genre_id = -1;
        this.filterType = null;
    }

    public CatalogInfo(GameGenre gameGenre) {
        this.title = gameGenre.name;
        this.titleRes = -1;
        this.genre_id = gameGenre.id;
        this.filterType = null;
    }

    public CatalogInfo(int titleRes, FilterType filterType) {
        this.title = null;
        this.titleRes = titleRes;
        this.genre_id = -1;
        this.filterType = filterType;
    }

    public CatalogInfo(int titleRes, FilterType filterType, String platform) {
        this(titleRes, filterType);
        this.platform = platform;
    }

    public boolean hasGenreId() {
        return this.genre_id != -1;
    }

    @Nullable
    public String getServerKey() {
        if (this.filterType == null) {
            return null;
        }
        return this.filterType.getServerKey();
    }

    public String toString() {
        return "{\"genre_id\"=" + this.genre_id + ", \"filterType\"=" + (this.filterType == null ? "null" : this.filterType.name()) + "}";
    }

    public CatalogInfo(Parcel parcel) {
        this.genre_id = parcel.readInt();
        int i = parcel.readInt();
        this.filterType = i == -1 ? null : FilterType.values()[i];
        this.title = parcel.readString();
        this.titleRes = parcel.readInt();
        this.platform = parcel.readString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int flags) {
        parcel.writeInt(this.genre_id);
        parcel.writeInt(this.filterType == null ? -1 : this.filterType.ordinal());
        parcel.writeString(this.title);
        parcel.writeInt(this.titleRes);
        parcel.writeString(this.platform == null ? "" : this.platform);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
