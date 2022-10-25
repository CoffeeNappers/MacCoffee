package com.google.android.gms.measurement.internal;

import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import java.util.Iterator;
/* loaded from: classes2.dex */
public class EventParams extends AbstractSafeParcelable implements Iterable<String> {
    public static final Parcelable.Creator<EventParams> CREATOR = new zzj();
    private final Bundle arG;
    public final int versionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public EventParams(int i, Bundle bundle) {
        this.versionCode = i;
        this.arG = bundle;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public EventParams(Bundle bundle) {
        com.google.android.gms.common.internal.zzaa.zzy(bundle);
        this.arG = bundle;
        this.versionCode = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public Object get(String str) {
        return this.arG.get(str);
    }

    @Override // java.lang.Iterable
    public Iterator<String> iterator() {
        return new Iterator<String>() { // from class: com.google.android.gms.measurement.internal.EventParams.1
            Iterator<String> arH;

            {
                this.arH = EventParams.this.arG.keySet().iterator();
            }

            @Override // java.util.Iterator
            public boolean hasNext() {
                return this.arH.hasNext();
            }

            @Override // java.util.Iterator
            public String next() {
                return this.arH.next();
            }

            @Override // java.util.Iterator
            public void remove() {
                throw new UnsupportedOperationException("Remove not supported");
            }
        };
    }

    public int size() {
        return this.arG.size();
    }

    public String toString() {
        return this.arG.toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzj.zza(this, parcel, i);
    }

    public Bundle zzbww() {
        return new Bundle(this.arG);
    }
}
