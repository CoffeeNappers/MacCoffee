package com.vk.core.util;

import android.media.ExifInterface;
import com.facebook.imagepipeline.common.RotationOptions;
import java.io.File;
import java.io.IOException;
/* loaded from: classes2.dex */
public class Exif {
    private static final String TAG = "CameraExif";

    public static int getOrientation(File file) {
        try {
            ExifInterface exif = new ExifInterface(file.getAbsolutePath());
            try {
                int orientation = exif.getAttributeInt("Orientation", 0);
                switch (orientation) {
                    case 1:
                        return 0;
                    case 2:
                    case 4:
                    case 5:
                    case 7:
                    default:
                        return 0;
                    case 3:
                        return RotationOptions.ROTATE_180;
                    case 6:
                        return 90;
                    case 8:
                        return RotationOptions.ROTATE_270;
                }
            } catch (IOException e) {
                return 0;
            }
        } catch (IOException e2) {
            return 0;
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:30:0x0059, code lost:
        android.util.Log.e(com.vk.core.util.Exif.TAG, "Invalid length");
     */
    /* JADX WARN: Code restructure failed: missing block: B:83:?, code lost:
        return 0;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static int getOrientation(byte[] r15) {
        /*
            Method dump skipped, instructions count: 262
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.vk.core.util.Exif.getOrientation(byte[]):int");
    }

    private static int pack(byte[] bytes, int offset, int length, boolean littleEndian) {
        int step = 1;
        if (littleEndian) {
            offset += length - 1;
            step = -1;
        }
        int value = 0;
        while (true) {
            int length2 = length;
            length = length2 - 1;
            if (length2 > 0) {
                value = (value << 8) | (bytes[offset] & 255);
                offset += step;
            } else {
                return value;
            }
        }
    }
}
