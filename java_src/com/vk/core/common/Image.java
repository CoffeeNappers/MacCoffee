package com.vk.core.common;

import android.os.Parcel;
import android.support.annotation.Nullable;
import com.vkontakte.android.utils.Serializer;
import java.util.ArrayList;
import java.util.List;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes2.dex */
public class Image implements Serializer.Serializable {
    public static final Serializer.Creator<Image> CREATOR = new Serializer.CreatorAdapter<Image>() { // from class: com.vk.core.common.Image.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Image mo1087createFromSerializer(Serializer in) {
            return new Image(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Image[] mo1088newArray(int size) {
            return new Image[size];
        }
    };
    private final List<ImageSize> images;

    public Image(JSONArray data) throws JSONException {
        this.images = new ArrayList();
        for (int i = 0; data != null && i < data.length(); i++) {
            JSONObject size = data.optJSONObject(i);
            if (size != null) {
                this.images.add(new ImageSize(size));
            }
        }
    }

    public Image(Serializer image) {
        this.images = image.createTypedArrayList(ImageSize.CREATOR);
    }

    public boolean isEmpty() {
        return this.images.isEmpty();
    }

    @Nullable
    public ImageSize getImageByHeight(int height) {
        return getImageBySize(height, false);
    }

    @Nullable
    public ImageSize getImageByWidth(int width) {
        return getImageBySize(width, true);
    }

    private ImageSize getImageBySize(int size, boolean byWidth) {
        int count = this.images.size();
        if (count == 0) {
            return null;
        }
        if (count == 1) {
            return this.images.get(0);
        }
        for (int i = 0; i < count - 1; i++) {
            ImageSize size1 = this.images.get(i);
            ImageSize size2 = this.images.get(i + 1);
            int edge1 = byWidth ? size1.getWidth() : size1.getHeight();
            int edge2 = byWidth ? size2.getWidth() : size2.getHeight();
            int diff1 = Math.abs(edge1 - size);
            int diff2 = Math.abs(edge2 - size);
            if (diff1 < diff2) {
                return ((double) (((float) diff1) / ((float) size))) < 0.05d ? size1 : size2;
            }
        }
        return this.images.get(count - 1);
    }

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeTypedList(this.images);
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel dest, int flags) {
        dest.writeTypedList(this.images);
    }
}
