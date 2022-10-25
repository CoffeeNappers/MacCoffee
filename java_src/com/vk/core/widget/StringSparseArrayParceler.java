package com.vk.core.widget;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.NonNull;
import android.util.SparseArray;
/* loaded from: classes2.dex */
public class StringSparseArrayParceler implements Parcelable {
    public static final Parcelable.Creator<StringSparseArrayParceler> CREATOR = new Parcelable.Creator<StringSparseArrayParceler>() { // from class: com.vk.core.widget.StringSparseArrayParceler.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public StringSparseArrayParceler mo476createFromParcel(Parcel in) {
            return new StringSparseArrayParceler(in);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public StringSparseArrayParceler[] mo477newArray(int size) {
            return new StringSparseArrayParceler[size];
        }
    };
    private final SparseArray<String> stringSparseArray;

    public StringSparseArrayParceler(@NonNull SparseArray<String> stringSparseArray) {
        this.stringSparseArray = stringSparseArray;
    }

    private StringSparseArrayParceler(@NonNull Parcel in) {
        this.stringSparseArray = new SparseArray<>();
        int size = in.readInt();
        for (int i = 0; i < size; i++) {
            this.stringSparseArray.put(in.readInt(), in.readString());
        }
    }

    @NonNull
    public SparseArray<String> getStringSparseArray() {
        return this.stringSparseArray;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel out, int flags) {
        int size = this.stringSparseArray.size();
        out.writeInt(size);
        for (int i = 0; i < size; i++) {
            int key = this.stringSparseArray.keyAt(i);
            out.writeInt(key);
            out.writeString(this.stringSparseArray.get(key));
        }
    }
}
