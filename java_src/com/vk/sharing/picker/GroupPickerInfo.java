package com.vk.sharing.picker;

import android.os.Parcel;
import android.os.Parcelable;
/* loaded from: classes2.dex */
public class GroupPickerInfo implements Parcelable {
    public static final Parcelable.Creator<GroupPickerInfo> CREATOR = new Parcelable.Creator<GroupPickerInfo>() { // from class: com.vk.sharing.picker.GroupPickerInfo.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public GroupPickerInfo mo525createFromParcel(Parcel source) {
            return new GroupPickerInfo(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public GroupPickerInfo[] mo526newArray(int size) {
            return new GroupPickerInfo[size];
        }
    };
    public int adminedGroupId;
    public int preselectedGroupId;
    public boolean restrictToAdminedGroup;

    public GroupPickerInfo() {
    }

    private GroupPickerInfo(Parcel in) {
        this.restrictToAdminedGroup = in.readInt() != 1 ? false : true;
        this.preselectedGroupId = in.readInt();
        this.adminedGroupId = in.readInt();
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.restrictToAdminedGroup ? 1 : 0);
        dest.writeInt(this.preselectedGroupId);
        dest.writeInt(this.adminedGroupId);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }
}
