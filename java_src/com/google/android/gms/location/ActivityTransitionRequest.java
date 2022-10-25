package com.google.android.gms.location;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
import com.google.android.gms.location.internal.ClientIdentity;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.TreeSet;
/* loaded from: classes2.dex */
public class ActivityTransitionRequest extends AbstractSafeParcelable {
    public static final Parcelable.Creator<ActivityTransitionRequest> CREATOR = new zzd();
    public static final Comparator<ActivityTransition> ajI = new Comparator<ActivityTransition>() { // from class: com.google.android.gms.location.ActivityTransitionRequest.1
        @Override // java.util.Comparator
        /* renamed from: zza */
        public int compare(ActivityTransition activityTransition, ActivityTransition activityTransition2) {
            int zzbdw = activityTransition.zzbdw();
            int zzbdw2 = activityTransition2.zzbdw();
            if (zzbdw != zzbdw2) {
                return zzbdw < zzbdw2 ? -1 : 1;
            }
            int zzbpx = activityTransition.zzbpx();
            int zzbpx2 = activityTransition2.zzbpx();
            if (zzbpx == zzbpx2) {
                return 0;
            }
            return zzbpx >= zzbpx2 ? 1 : -1;
        }
    };
    private final List<ActivityTransition> ajJ;
    private final List<ClientIdentity> ajK;
    @Nullable
    private final String mTag;
    private final int mVersionCode;

    /* JADX INFO: Access modifiers changed from: package-private */
    public ActivityTransitionRequest(int i, List<ActivityTransition> list, @Nullable String str, @Nullable List<ClientIdentity> list2) {
        zzaa.zzb(list, "transitions can't be null");
        zzaa.zzb(list.size() > 0, "transitions can't be empty.");
        zzab(list);
        this.mVersionCode = i;
        this.ajJ = Collections.unmodifiableList(list);
        this.mTag = str;
        this.ajK = list2 == null ? Collections.emptyList() : Collections.unmodifiableList(list2);
    }

    private static void zzab(List<ActivityTransition> list) {
        TreeSet treeSet = new TreeSet(ajI);
        for (ActivityTransition activityTransition : list) {
            zzaa.zzb(treeSet.add(activityTransition), String.format("Found duplicated transition: %s.", activityTransition));
        }
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ActivityTransitionRequest activityTransitionRequest = (ActivityTransitionRequest) obj;
        return zzz.equal(this.ajJ, activityTransitionRequest.ajJ) && zzz.equal(this.mTag, activityTransitionRequest.mTag) && zzz.equal(this.ajK, activityTransitionRequest.ajK);
    }

    @Nullable
    public String getTag() {
        return this.mTag;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        int i = 0;
        int hashCode = ((this.mTag != null ? this.mTag.hashCode() : 0) + (this.ajJ.hashCode() * 31)) * 31;
        if (this.ajK != null) {
            i = this.ajK.hashCode();
        }
        return hashCode + i;
    }

    public String toString() {
        String valueOf = String.valueOf(this.ajJ);
        String str = this.mTag;
        String valueOf2 = String.valueOf(this.ajK);
        return new StringBuilder(String.valueOf(valueOf).length() + 61 + String.valueOf(str).length() + String.valueOf(valueOf2).length()).append("ActivityTransitionRequest [mTransitions=").append(valueOf).append(", mTag='").append(str).append("'").append(", mClients=").append(valueOf2).append("]").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzd.zza(this, parcel, i);
    }

    public List<ActivityTransition> zzbpy() {
        return this.ajJ;
    }

    public List<ClientIdentity> zzbpz() {
        return this.ajK;
    }
}
