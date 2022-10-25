package com.google.android.gms.location;

import android.content.Intent;
import android.os.Bundle;
import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzaa;
import com.google.android.gms.common.internal.zzz;
import java.util.Collections;
import java.util.List;
/* loaded from: classes2.dex */
public class ActivityRecognitionResult extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<ActivityRecognitionResult> CREATOR = new zzb();
    List<DetectedActivity> ajD;
    long ajE;
    long ajF;
    int ajG;
    Bundle extras;
    private final int mVersionCode;

    public ActivityRecognitionResult(int i, List<DetectedActivity> list, long j, long j2, int i2, Bundle bundle) {
        this.mVersionCode = i;
        this.ajD = list;
        this.ajE = j;
        this.ajF = j2;
        this.ajG = i2;
        this.extras = bundle;
    }

    public ActivityRecognitionResult(DetectedActivity detectedActivity, long j, long j2) {
        this(detectedActivity, j, j2, 0, (Bundle) null);
    }

    public ActivityRecognitionResult(DetectedActivity detectedActivity, long j, long j2, int i, Bundle bundle) {
        this(Collections.singletonList(detectedActivity), j, j2, i, bundle);
    }

    public ActivityRecognitionResult(List<DetectedActivity> list, long j, long j2) {
        this(list, j, j2, 0, (Bundle) null);
    }

    public ActivityRecognitionResult(List<DetectedActivity> list, long j, long j2, int i, Bundle bundle) {
        boolean z = true;
        zzaa.zzb(list != null && list.size() > 0, "Must have at least 1 detected activity");
        zzaa.zzb((j <= 0 || j2 <= 0) ? false : z, "Must set times");
        this.mVersionCode = 2;
        this.ajD = list;
        this.ajE = j;
        this.ajF = j2;
        this.ajG = i;
        this.extras = bundle;
    }

    public static ActivityRecognitionResult extractResult(Intent intent) {
        ActivityRecognitionResult zzx = zzx(intent);
        if (zzx != null) {
            return zzx;
        }
        List<ActivityRecognitionResult> zzz = zzz(intent);
        if (zzz != null && !zzz.isEmpty()) {
            return zzz.get(zzz.size() - 1);
        }
        return null;
    }

    public static boolean hasResult(Intent intent) {
        if (intent == null) {
            return false;
        }
        if (zzw(intent)) {
            return true;
        }
        List<ActivityRecognitionResult> zzz = zzz(intent);
        return zzz != null && !zzz.isEmpty();
    }

    private static boolean zzc(Bundle bundle, Bundle bundle2) {
        if (bundle == null && bundle2 == null) {
            return true;
        }
        if ((bundle == null && bundle2 != null) || (bundle != null && bundle2 == null)) {
            return false;
        }
        if (bundle.size() != bundle2.size()) {
            return false;
        }
        for (String str : bundle.keySet()) {
            if (!bundle2.containsKey(str)) {
                return false;
            }
            if (bundle.get(str) == null) {
                if (bundle2.get(str) != null) {
                    return false;
                }
            } else if (bundle.get(str) instanceof Bundle) {
                if (!zzc(bundle.getBundle(str), bundle2.getBundle(str))) {
                    return false;
                }
            } else if (!bundle.get(str).equals(bundle2.get(str))) {
                return false;
            }
        }
        return true;
    }

    private static boolean zzw(Intent intent) {
        if (intent == null) {
            return false;
        }
        return intent.hasExtra("com.google.android.location.internal.EXTRA_ACTIVITY_RESULT");
    }

    private static ActivityRecognitionResult zzx(Intent intent) {
        if (!hasResult(intent)) {
            return null;
        }
        Object obj = intent.getExtras().get("com.google.android.location.internal.EXTRA_ACTIVITY_RESULT");
        if (obj instanceof byte[]) {
            return (ActivityRecognitionResult) com.google.android.gms.common.internal.safeparcel.zzc.zza((byte[]) obj, CREATOR);
        }
        if (!(obj instanceof ActivityRecognitionResult)) {
            return null;
        }
        return (ActivityRecognitionResult) obj;
    }

    public static boolean zzy(@Nullable Intent intent) {
        if (intent == null) {
            return false;
        }
        return intent.hasExtra("com.google.android.location.internal.EXTRA_ACTIVITY_RESULT_LIST");
    }

    @Nullable
    public static List<ActivityRecognitionResult> zzz(Intent intent) {
        if (!zzy(intent)) {
            return null;
        }
        return com.google.android.gms.common.internal.safeparcel.zzc.zzb(intent, "com.google.android.location.internal.EXTRA_ACTIVITY_RESULT_LIST", CREATOR);
    }

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ActivityRecognitionResult activityRecognitionResult = (ActivityRecognitionResult) obj;
        return this.ajE == activityRecognitionResult.ajE && this.ajF == activityRecognitionResult.ajF && this.ajG == activityRecognitionResult.ajG && zzz.equal(this.ajD, activityRecognitionResult.ajD) && zzc(this.extras, activityRecognitionResult.extras);
    }

    public int getActivityConfidence(int i) {
        for (DetectedActivity detectedActivity : this.ajD) {
            if (detectedActivity.getType() == i) {
                return detectedActivity.getConfidence();
            }
        }
        return 0;
    }

    public long getElapsedRealtimeMillis() {
        return this.ajF;
    }

    public DetectedActivity getMostProbableActivity() {
        return this.ajD.get(0);
    }

    public List<DetectedActivity> getProbableActivities() {
        return this.ajD;
    }

    public long getTime() {
        return this.ajE;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public int hashCode() {
        return zzz.hashCode(Long.valueOf(this.ajE), Long.valueOf(this.ajF), Integer.valueOf(this.ajG), this.ajD, this.extras);
    }

    public String toString() {
        String valueOf = String.valueOf(this.ajD);
        long j = this.ajE;
        return new StringBuilder(String.valueOf(valueOf).length() + 124).append("ActivityRecognitionResult [probableActivities=").append(valueOf).append(", timeMillis=").append(j).append(", elapsedRealtimeMillis=").append(this.ajF).append("]").toString();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }
}
