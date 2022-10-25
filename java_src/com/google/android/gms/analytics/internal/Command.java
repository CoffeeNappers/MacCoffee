package com.google.android.gms.analytics.internal;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes.dex */
public class Command implements Parcelable {
    @Deprecated
    public static final Parcelable.Creator<Command> CREATOR = new Parcelable.Creator<Command>() { // from class: com.google.android.gms.analytics.internal.Command.1
        @Override // android.os.Parcelable.Creator
        @Deprecated
        /* renamed from: zzcf */
        public Command[] newArray(int i) {
            return new Command[i];
        }

        @Override // android.os.Parcelable.Creator
        @Deprecated
        /* renamed from: zzw */
        public Command createFromParcel(Parcel parcel) {
            return new Command(parcel);
        }
    };
    private String dW;
    private String mValue;
    private String zzboa;

    @Deprecated
    public Command() {
    }

    @Deprecated
    Command(Parcel parcel) {
        readFromParcel(parcel);
    }

    @Deprecated
    private void readFromParcel(Parcel parcel) {
        this.zzboa = parcel.readString();
        this.dW = parcel.readString();
        this.mValue = parcel.readString();
    }

    @Override // android.os.Parcelable
    @Deprecated
    public int describeContents() {
        return 0;
    }

    public String getId() {
        return this.zzboa;
    }

    public String getValue() {
        return this.mValue;
    }

    @Override // android.os.Parcelable
    @Deprecated
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.zzboa);
        parcel.writeString(this.dW);
        parcel.writeString(this.mValue);
    }
}
