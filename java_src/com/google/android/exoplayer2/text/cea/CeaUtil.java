package com.google.android.exoplayer2.text.cea;

import com.google.android.exoplayer2.extractor.TrackOutput;
import com.google.android.exoplayer2.util.ParsableByteArray;
/* loaded from: classes.dex */
public final class CeaUtil {
    private static final int COUNTRY_CODE = 181;
    private static final int PAYLOAD_TYPE_CC = 4;
    private static final int PROVIDER_CODE = 49;
    private static final int USER_DATA_TYPE_CODE = 3;
    private static final int USER_ID = 1195456820;

    public static void consume(long presentationTimeUs, ParsableByteArray seiBuffer, TrackOutput output) {
        int b;
        int b2;
        while (seiBuffer.bytesLeft() > 1) {
            int payloadType = 0;
            do {
                b = seiBuffer.readUnsignedByte();
                payloadType += b;
            } while (b == 255);
            int payloadSize = 0;
            do {
                b2 = seiBuffer.readUnsignedByte();
                payloadSize += b2;
            } while (b2 == 255);
            if (isSeiMessageCea608(payloadType, payloadSize, seiBuffer)) {
                seiBuffer.skipBytes(8);
                int ccCount = seiBuffer.readUnsignedByte() & 31;
                seiBuffer.skipBytes(1);
                int sampleLength = ccCount * 3;
                output.sampleData(seiBuffer, sampleLength);
                output.sampleMetadata(presentationTimeUs, 1, sampleLength, 0, null);
                seiBuffer.skipBytes(payloadSize - ((ccCount * 3) + 10));
            } else {
                seiBuffer.skipBytes(payloadSize);
            }
        }
    }

    private static boolean isSeiMessageCea608(int payloadType, int payloadLength, ParsableByteArray payload) {
        if (payloadType != 4 || payloadLength < 8) {
            return false;
        }
        int startPosition = payload.getPosition();
        int countryCode = payload.readUnsignedByte();
        int providerCode = payload.readUnsignedShort();
        int userIdentifier = payload.readInt();
        int userDataTypeCode = payload.readUnsignedByte();
        payload.setPosition(startPosition);
        return countryCode == COUNTRY_CODE && providerCode == 49 && userIdentifier == USER_ID && userDataTypeCode == 3;
    }

    private CeaUtil() {
    }
}
