package com.vk.music.dto;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.util.SparseArray;
import com.vkontakte.android.utils.Serializer;
import java.util.Iterator;
import org.json.JSONArray;
import org.json.JSONObject;
/* loaded from: classes.dex */
public final class Thumb extends Serializer.SerializableAdapter {
    public static final Serializer.Creator<Thumb> CREATOR = new Serializer.CreatorAdapter<Thumb>() { // from class: com.vk.music.dto.Thumb.1
        @Override // com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: createFromSerializer */
        public Thumb mo1087createFromSerializer(Serializer in) {
            return new Thumb(in);
        }

        @Override // android.os.Parcelable.Creator, com.vkontakte.android.utils.Serializer.Creator
        /* renamed from: newArray */
        public Thumb[] mo1088newArray(int size) {
            return new Thumb[size];
        }
    };
    public int height;
    private SparseArray<String> urls;
    public int width;

    public Thumb(@NonNull JSONObject jThumb) {
        Iterator<String> it = jThumb.keys();
        while (it.hasNext()) {
            String key = it.next();
            if ("sizes".equals(key)) {
                if (this.urls == null) {
                    this.urls = new SparseArray<>();
                }
                JSONArray jSizes = jThumb.optJSONArray("sizes");
                for (int i = 0; jSizes != null && i < jSizes.length(); i++) {
                    JSONObject size = jSizes.optJSONObject(i);
                    if (size != null) {
                        this.urls.append(size.optInt("width"), size.optString("src"));
                    }
                }
            } else if (key.startsWith("photo_")) {
                if (this.urls == null) {
                    this.urls = new SparseArray<>();
                }
                this.urls.append(Integer.valueOf(key.substring("photo_".length())).intValue(), jThumb.optString(key));
            } else if (key.equalsIgnoreCase("width")) {
                this.width = jThumb.optInt(key);
            } else if (key.equalsIgnoreCase("height")) {
                this.height = jThumb.optInt(key);
            }
        }
    }

    private Thumb(Serializer in) {
        this.width = in.readInt();
        this.height = in.readInt();
        int count = in.readInt();
        if (count > 0) {
            this.urls = new SparseArray<>();
            for (int i = 0; i < count; i++) {
                this.urls.append(in.readInt(), in.readString());
            }
        }
    }

    @Override // com.vkontakte.android.utils.Serializer.Serializable
    public void serializeTo(Serializer s) {
        s.writeInt(this.width);
        s.writeInt(this.height);
        int count = this.urls != null ? this.urls.size() : 0;
        s.writeInt(count);
        if (count > 0) {
            for (int i = 0; i < count; i++) {
                s.writeInt(this.urls.keyAt(i));
                s.writeString(this.urls.valueAt(i));
            }
        }
    }

    @Nullable
    public String getForSize(int size) {
        int count = this.urls != null ? this.urls.size() : 0;
        if (count == 0) {
            return null;
        }
        if (count == 1) {
            return this.urls.valueAt(0);
        }
        for (int i = 0; i < count - 1; i++) {
            int diff1 = Math.abs(size - this.urls.keyAt(i));
            int diff2 = Math.abs(size - this.urls.keyAt(i + 1));
            if (diff1 < diff2) {
                if (diff1 / size < 0.05d) {
                    return this.urls.valueAt(i);
                } else {
                    return this.urls.valueAt(i + 1);
                }
            }
        }
        return this.urls.valueAt(count - 1);
    }
}
