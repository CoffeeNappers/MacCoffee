package com.vk.stories.model;

import android.location.Location;
import android.os.Parcel;
import android.os.Parcelable;
import java.util.ArrayList;
/* loaded from: classes2.dex */
public class StoryUploadParams implements Parcelable {
    public static final Parcelable.Creator<StoryUploadParams> CREATOR = new Parcelable.Creator<StoryUploadParams>() { // from class: com.vk.stories.model.StoryUploadParams.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public StoryUploadParams mo540createFromParcel(Parcel source) {
            return new StoryUploadParams(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public StoryUploadParams[] mo541newArray(int size) {
            return new StoryUploadParams[size];
        }
    };
    private boolean addToNews;
    private CameraType cameraType;
    private Location location;
    private String maskId;
    private Integer sectionId;
    private ArrayList<Integer> userIds;

    /* loaded from: classes2.dex */
    public enum CameraType {
        BACK("back"),
        FRONT("front");
        
        private final String name;

        CameraType(String name) {
            this.name = name;
        }

        @Override // java.lang.Enum
        public String toString() {
            return this.name;
        }
    }

    public String getMaskId() {
        return this.maskId;
    }

    public StoryUploadParams setMaskId(String maskId) {
        this.maskId = maskId;
        return this;
    }

    public Location getLocation() {
        return this.location;
    }

    public StoryUploadParams setLocation(Location location) {
        this.location = location;
        return this;
    }

    public boolean isAddToNews() {
        return this.addToNews;
    }

    public StoryUploadParams setAddToNews(boolean addToNews) {
        this.addToNews = addToNews;
        return this;
    }

    public ArrayList<Integer> getUserIds() {
        return this.userIds;
    }

    public StoryUploadParams setUserIds(ArrayList<Integer> userIds) {
        this.userIds = userIds;
        return this;
    }

    public CameraType getCameraType() {
        return this.cameraType;
    }

    public StoryUploadParams setCameraType(CameraType cameraType) {
        this.cameraType = cameraType;
        return this;
    }

    public Integer getSectionId() {
        return this.sectionId;
    }

    public StoryUploadParams setSectionId(int sectionId) {
        this.sectionId = Integer.valueOf(sectionId);
        return this;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeString(this.maskId);
        dest.writeValue(this.sectionId);
        dest.writeParcelable(this.location, flags);
        dest.writeByte(this.addToNews ? (byte) 1 : (byte) 0);
        dest.writeList(this.userIds);
        dest.writeInt(this.cameraType == null ? -1 : this.cameraType.ordinal());
    }

    public StoryUploadParams() {
    }

    protected StoryUploadParams(Parcel in) {
        this.maskId = in.readString();
        this.sectionId = (Integer) in.readValue(Integer.class.getClassLoader());
        this.location = (Location) in.readParcelable(Location.class.getClassLoader());
        this.addToNews = in.readByte() != 0;
        this.userIds = new ArrayList<>();
        in.readList(this.userIds, Integer.class.getClassLoader());
        int tmpCameraType = in.readInt();
        this.cameraType = tmpCameraType == -1 ? null : CameraType.values()[tmpCameraType];
    }
}
