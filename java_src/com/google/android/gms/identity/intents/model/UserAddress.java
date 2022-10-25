package com.google.android.gms.identity.intents.model;

import android.content.Intent;
import android.os.Parcel;
import android.os.Parcelable;
import com.google.android.gms.common.internal.ReflectedParcelable;
import com.google.android.gms.common.internal.safeparcel.AbstractSafeParcelable;
import com.google.android.gms.identity.intents.AddressConstants;
/* loaded from: classes2.dex */
public final class UserAddress extends AbstractSafeParcelable implements ReflectedParcelable {
    public static final Parcelable.Creator<UserAddress> CREATOR = new zzb();
    String ahQ;
    String ahR;
    String ahS;
    String ahT;
    String ahU;
    String ahV;
    String ahW;
    String ahX;
    String ahY;
    boolean ahZ;
    String aia;
    String aib;
    private final int mVersionCode;
    String name;
    String phoneNumber;
    String zzcpw;

    UserAddress() {
        this.mVersionCode = 1;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UserAddress(int i, String str, String str2, String str3, String str4, String str5, String str6, String str7, String str8, String str9, String str10, String str11, String str12, boolean z, String str13, String str14) {
        this.mVersionCode = i;
        this.name = str;
        this.ahQ = str2;
        this.ahR = str3;
        this.ahS = str4;
        this.ahT = str5;
        this.ahU = str6;
        this.ahV = str7;
        this.ahW = str8;
        this.zzcpw = str9;
        this.ahX = str10;
        this.ahY = str11;
        this.phoneNumber = str12;
        this.ahZ = z;
        this.aia = str13;
        this.aib = str14;
    }

    public static UserAddress fromIntent(Intent intent) {
        if (intent == null || !intent.hasExtra(AddressConstants.Extras.EXTRA_ADDRESS)) {
            return null;
        }
        return (UserAddress) intent.getParcelableExtra(AddressConstants.Extras.EXTRA_ADDRESS);
    }

    public String getAddress1() {
        return this.ahQ;
    }

    public String getAddress2() {
        return this.ahR;
    }

    public String getAddress3() {
        return this.ahS;
    }

    public String getAddress4() {
        return this.ahT;
    }

    public String getAddress5() {
        return this.ahU;
    }

    public String getAdministrativeArea() {
        return this.ahV;
    }

    public String getCompanyName() {
        return this.aia;
    }

    public String getCountryCode() {
        return this.zzcpw;
    }

    public String getEmailAddress() {
        return this.aib;
    }

    public String getLocality() {
        return this.ahW;
    }

    public String getName() {
        return this.name;
    }

    public String getPhoneNumber() {
        return this.phoneNumber;
    }

    public String getPostalCode() {
        return this.ahX;
    }

    public String getSortingCode() {
        return this.ahY;
    }

    public int getVersionCode() {
        return this.mVersionCode;
    }

    public boolean isPostBox() {
        return this.ahZ;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        zzb.zza(this, parcel, i);
    }
}
