package net.ypresto.androidtranscoder.utils;

import java.nio.ByteBuffer;
/* loaded from: classes3.dex */
public class AvcSpsUtils {
    public static byte getProfileIdc(ByteBuffer spsBuffer) {
        return spsBuffer.get(0);
    }
}
