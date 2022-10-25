package com.facebook.imageformat;

import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class ImageFormat {
    public static final ImageFormat UNKNOWN = new ImageFormat("UNKNOWN", null);
    private final String mFileExtension;
    private final String mName;

    /* loaded from: classes.dex */
    public interface FormatChecker {
        @Nullable
        ImageFormat determineFormat(byte[] bArr, int i);

        int getHeaderSize();
    }

    public ImageFormat(String name, @Nullable String fileExtension) {
        this.mName = name;
        this.mFileExtension = fileExtension;
    }

    @Nullable
    public String getFileExtension() {
        return this.mFileExtension;
    }

    public String toString() {
        return getName();
    }

    public String getName() {
        return this.mName;
    }
}
