package com.my.target.nativeads.models;

import android.graphics.Bitmap;
import com.my.target.core.models.a;
/* loaded from: classes2.dex */
public class ImageData extends a<Bitmap> {
    public ImageData(String str) {
        super(str);
    }

    public ImageData(String str, int i, int i2) {
        super(str);
        this.width = i;
        this.height = i2;
    }

    public Bitmap getBitmap() {
        return getData();
    }

    public void setBitmap(Bitmap bitmap) {
        setData(bitmap);
    }

    public String toString() {
        return "ImageData{url='" + this.url + "', width=" + this.width + ", height=" + this.height + ", bitmap=" + getData() + '}';
    }
}
