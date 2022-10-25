package com.facebook.imageformat;

import com.facebook.common.internal.ByteStreams;
import com.facebook.common.internal.Closeables;
import com.facebook.common.internal.Preconditions;
import com.facebook.common.internal.Throwables;
import com.facebook.imageformat.ImageFormat;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.List;
import javax.annotation.Nullable;
/* loaded from: classes.dex */
public class ImageFormatChecker {
    private static ImageFormatChecker sInstance;
    @Nullable
    private List<ImageFormat.FormatChecker> mCustomImageFormatCheckers;
    private final ImageFormat.FormatChecker mDefaultFormatChecker = new DefaultImageFormatChecker();
    private int mMaxHeaderLength;

    private ImageFormatChecker() {
        updateMaxHeaderLength();
    }

    public void setCustomImageFormatCheckers(@Nullable List<ImageFormat.FormatChecker> customImageFormatCheckers) {
        this.mCustomImageFormatCheckers = customImageFormatCheckers;
        updateMaxHeaderLength();
    }

    public ImageFormat determineImageFormat(InputStream is) throws IOException {
        Preconditions.checkNotNull(is);
        byte[] imageHeaderBytes = new byte[this.mMaxHeaderLength];
        int headerSize = readHeaderFromStream(this.mMaxHeaderLength, is, imageHeaderBytes);
        if (this.mCustomImageFormatCheckers != null) {
            for (ImageFormat.FormatChecker formatChecker : this.mCustomImageFormatCheckers) {
                ImageFormat format = formatChecker.determineFormat(imageHeaderBytes, headerSize);
                if (format != null && format != ImageFormat.UNKNOWN) {
                    return format;
                }
            }
        }
        ImageFormat format2 = this.mDefaultFormatChecker.determineFormat(imageHeaderBytes, headerSize);
        if (format2 == null) {
            return ImageFormat.UNKNOWN;
        }
        return format2;
    }

    private void updateMaxHeaderLength() {
        this.mMaxHeaderLength = this.mDefaultFormatChecker.getHeaderSize();
        if (this.mCustomImageFormatCheckers != null) {
            for (ImageFormat.FormatChecker checker : this.mCustomImageFormatCheckers) {
                this.mMaxHeaderLength = Math.max(this.mMaxHeaderLength, checker.getHeaderSize());
            }
        }
    }

    private static int readHeaderFromStream(int maxHeaderLength, InputStream is, byte[] imageHeaderBytes) throws IOException {
        Preconditions.checkNotNull(is);
        Preconditions.checkNotNull(imageHeaderBytes);
        Preconditions.checkArgument(imageHeaderBytes.length >= maxHeaderLength);
        if (is.markSupported()) {
            try {
                is.mark(maxHeaderLength);
                return ByteStreams.read(is, imageHeaderBytes, 0, maxHeaderLength);
            } finally {
                is.reset();
            }
        }
        return ByteStreams.read(is, imageHeaderBytes, 0, maxHeaderLength);
    }

    public static synchronized ImageFormatChecker getInstance() {
        ImageFormatChecker imageFormatChecker;
        synchronized (ImageFormatChecker.class) {
            if (sInstance == null) {
                sInstance = new ImageFormatChecker();
            }
            imageFormatChecker = sInstance;
        }
        return imageFormatChecker;
    }

    public static ImageFormat getImageFormat(InputStream is) throws IOException {
        return getInstance().determineImageFormat(is);
    }

    public static ImageFormat getImageFormat_WrapIOException(InputStream is) {
        try {
            return getImageFormat(is);
        } catch (IOException ioe) {
            throw Throwables.propagate(ioe);
        }
    }

    public static ImageFormat getImageFormat(String filename) {
        ImageFormat imageFormat;
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2 = null;
        try {
            try {
                fileInputStream = new FileInputStream(filename);
            } catch (Throwable th) {
                th = th;
            }
        } catch (IOException e) {
        }
        try {
            imageFormat = getImageFormat(fileInputStream);
            Closeables.closeQuietly(fileInputStream);
            fileInputStream2 = fileInputStream;
        } catch (IOException e2) {
            fileInputStream2 = fileInputStream;
            imageFormat = ImageFormat.UNKNOWN;
            Closeables.closeQuietly(fileInputStream2);
            return imageFormat;
        } catch (Throwable th2) {
            th = th2;
            fileInputStream2 = fileInputStream;
            Closeables.closeQuietly(fileInputStream2);
            throw th;
        }
        return imageFormat;
    }
}
