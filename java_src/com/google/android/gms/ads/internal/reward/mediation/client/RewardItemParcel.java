package com.google.android.gms.ads.internal.reward.mediation.client;

import android.os.Parcel;
import android.os.Parcelable;
import android.support.annotation.Nullable;
import android.text.TextUtils;
import com.google.android.gms.ads.reward.RewardItem;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.common.internal.zzz;
import com.google.android.gms.internal.zzji;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
@zzji
/* loaded from: classes.dex */
public final class RewardItemParcel extends AbstractSafeParcelable {
    public static final Parcelable.Creator<RewardItemParcel> CREATOR = new zzc();
    public final String type;
    public final int versionCode;
    public final int zzcsc;

    public RewardItemParcel(int i, String str, int i2) {
        this.versionCode = i;
        this.type = str;
        this.zzcsc = i2;
    }

    public RewardItemParcel(RewardItem rewardItem) {
        this(1, rewardItem.getType(), rewardItem.getAmount());
    }

    public RewardItemParcel(String str, int i) {
        this(1, str, i);
    }

    @Nullable
    public static RewardItemParcel zza(JSONArray jSONArray) throws JSONException {
        if (jSONArray == null || jSONArray.length() == 0) {
            return null;
        }
        return new RewardItemParcel(jSONArray.getJSONObject(0).optString("rb_type"), jSONArray.getJSONObject(0).optInt("rb_amount"));
    }

    @Nullable
    public static RewardItemParcel zzct(@Nullable String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        try {
            return zza(new JSONArray(str));
        } catch (JSONException e) {
            return null;
        }
    }

    public boolean equals(Object obj) {
        if (obj == null || !(obj instanceof RewardItemParcel)) {
            return false;
        }
        RewardItemParcel rewardItemParcel = (RewardItemParcel) obj;
        return zzz.equal(this.type, rewardItemParcel.type) && zzz.equal(Integer.valueOf(this.zzcsc), Integer.valueOf(rewardItemParcel.zzcsc));
    }

    public int hashCode() {
        return zzz.hashCode(this.type, Integer.valueOf(this.zzcsc));
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzc.zza(this, parcel, i);
    }

    public JSONArray zzue() throws JSONException {
        JSONObject jSONObject = new JSONObject();
        jSONObject.put("rb_type", this.type);
        jSONObject.put("rb_amount", this.zzcsc);
        JSONArray jSONArray = new JSONArray();
        jSONArray.put(jSONObject);
        return jSONArray;
    }
}
