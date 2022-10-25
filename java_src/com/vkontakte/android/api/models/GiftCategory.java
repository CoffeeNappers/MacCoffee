package com.vkontakte.android.api.models;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.util.SparseArray;
import com.vkontakte.android.data.ServerKeys;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class GiftCategory extends Model implements Parcelable {
    public static final Parcelable.Creator<GiftCategory> CREATOR = new Parcelable.Creator<GiftCategory>() { // from class: com.vkontakte.android.api.models.GiftCategory.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GiftCategory mo732createFromParcel(Parcel source) {
            return new GiftCategory(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GiftCategory[] mo733newArray(int size) {
            return new GiftCategory[size];
        }
    };
    @Nullable
    public SparseArray<CatalogedGift> cache;
    @Nullable
    public List<CatalogedGift> items;
    public String name;
    public String title;

    public GiftCategory(JSONObject source) {
        this.name = source.optString("name");
        this.title = source.optString("title");
        JSONArray items = source.optJSONArray(ServerKeys.ITEMS);
        if (items != null) {
            this.items = new ArrayList(items.length());
            this.cache = new SparseArray<>(items.length());
            for (int i = 0; i < items.length(); i++) {
                JSONObject item = items.optJSONObject(i);
                if (item != null) {
                    CatalogedGift gift = new CatalogedGift(item);
                    this.items.add(gift);
                    this.cache.put(gift.gift.id, gift);
                }
            }
        }
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.name);
        dest.writeString(this.title);
        dest.writeInt(this.items == null ? -1 : this.items.size());
        dest.writeList(this.items);
    }

    public GiftCategory(Parcel in) {
        this.name = in.readString();
        this.title = in.readString();
        int size = in.readInt();
        if (size >= 0) {
            this.items = new ArrayList(size);
            in.readList(this.items, CatalogedGift.class.getClassLoader());
            this.cache = new SparseArray<>(size);
            for (CatalogedGift gift : this.items) {
                this.cache.put(gift.gift.id, gift);
            }
        }
    }
}
