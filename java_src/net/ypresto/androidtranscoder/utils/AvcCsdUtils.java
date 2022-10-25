package net.ypresto.androidtranscoder.utils;

import android.media.MediaFormat;
import java.nio.ByteBuffer;
import java.util.Arrays;
import net.ypresto.androidtranscoder.format.MediaFormatExtraConstants;
/* loaded from: classes3.dex */
public class AvcCsdUtils {
    private static final byte AVC_SPS_NAL = 103;
    private static final byte AVC_SPS_NAL_2 = 39;
    private static final byte AVC_SPS_NAL_3 = 71;
    private static final byte[] AVC_START_CODE_3 = {0, 0, 1};
    private static final byte[] AVC_START_CODE_4 = {0, 0, 0, 1};

    public static ByteBuffer getSpsBuffer(MediaFormat format) {
        ByteBuffer sourceBuffer = format.getByteBuffer(MediaFormatExtraConstants.KEY_AVC_SPS).asReadOnlyBuffer();
        ByteBuffer prefixedSpsBuffer = ByteBuffer.allocate(sourceBuffer.limit()).order(sourceBuffer.order());
        prefixedSpsBuffer.put(sourceBuffer);
        prefixedSpsBuffer.flip();
        skipStartCode(prefixedSpsBuffer);
        byte spsNalData = prefixedSpsBuffer.get();
        if (spsNalData != 103 && spsNalData != 39 && spsNalData != 71) {
            throw new IllegalStateException("Got non SPS NAL data.");
        }
        return prefixedSpsBuffer.slice();
    }

    private static void skipStartCode(ByteBuffer prefixedSpsBuffer) {
        byte[] prefix3 = new byte[3];
        prefixedSpsBuffer.get(prefix3);
        if (!Arrays.equals(prefix3, AVC_START_CODE_3)) {
            byte[] prefix4 = Arrays.copyOf(prefix3, 4);
            prefix4[3] = prefixedSpsBuffer.get();
            if (Arrays.equals(prefix4, AVC_START_CODE_4)) {
                return;
            }
            throw new IllegalStateException("AVC NAL start code does not found in csd.");
        }
    }

    private AvcCsdUtils() {
        throw new RuntimeException();
    }
}
