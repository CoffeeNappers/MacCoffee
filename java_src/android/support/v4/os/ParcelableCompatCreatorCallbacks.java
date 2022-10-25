package android.support.v4.os;

import android.os.Parcel;
/* loaded from: classes.dex */
public interface ParcelableCompatCreatorCallbacks<T> {
    /* renamed from: createFromParcel */
    T mo157createFromParcel(Parcel parcel, ClassLoader classLoader);

    /* renamed from: newArray */
    T[] mo158newArray(int i);
}
