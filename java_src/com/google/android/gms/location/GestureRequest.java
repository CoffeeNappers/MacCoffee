package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public final class GestureRequest extends AbstractSafeParcelable {
    private final List<Integer> akh;
    private final int mVersionCode;
    private static final List<Integer> akd = Collections.unmodifiableList(Arrays.asList(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19));
    private static final List<Integer> ake = Collections.unmodifiableList(Arrays.asList(1));
    private static final List<Integer> akf = Collections.unmodifiableList(Arrays.asList(2, 4, 6, 8, 10, 12, 14, 16, 18, 19));
    private static final List<Integer> akg = Collections.unmodifiableList(Arrays.asList(3, 5, 7, 9, 11, 13, 15, 17));
    public static final Parcelable.Creator<GestureRequest> CREATOR = new zzg();

    /* JADX INFO: Access modifiers changed from: package-private */
    public GestureRequest(int i, List<Integer> list) {
        this.mVersionCode = i;
        this.akh = list;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzg.zza(this, parcel, i);
    }

    public List<Integer> zzbqb() {
        return this.akh;
    }
}
