package com.vkontakte.android.media.video;

import android.os.Parcel;
import android.os.Parcelable;
import com.vk.media.camera.CameraUtils;
/* loaded from: classes3.dex */
public class VideoEncoderSettings implements Parcelable {
    private int bitrate;
    private int shorterLength;
    public static final VideoEncoderSettings p480 = new VideoEncoderSettings(CameraUtils.Settings.LOW_HEIGHT, 1000000);
    public static final VideoEncoderSettings p720 = new VideoEncoderSettings(720, 2500000);
    public static final Parcelable.Creator<VideoEncoderSettings> CREATOR = new Parcelable.Creator<VideoEncoderSettings>() { // from class: com.vkontakte.android.media.video.VideoEncoderSettings.1
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: createFromParcel */
        public VideoEncoderSettings mo1083createFromParcel(Parcel source) {
            return new VideoEncoderSettings(source);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        /* renamed from: newArray */
        public VideoEncoderSettings[] mo1084newArray(int size) {
            return new VideoEncoderSettings[size];
        }
    };

    private VideoEncoderSettings(int shorterLength, int bitrate) {
        this.shorterLength = shorterLength;
        this.bitrate = bitrate;
    }

    public VideoEncoderSettings(Parcel in) {
        this.shorterLength = in.readInt();
        this.bitrate = in.readInt();
    }

    public int getShorterLength() {
        return this.shorterLength;
    }

    public int getBitrate() {
        return this.bitrate;
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeInt(this.shorterLength);
        dest.writeInt(this.bitrate);
    }
}
