package com.googlecode.mp4parser.boxes.mp4.objectdescriptors;

import android.support.v4.media.TransportMediator;
import com.coremedia.iso.Hex;
import com.coremedia.iso.IsoTypeWriter;
import com.facebook.imagepipeline.common.RotationOptions;
import com.facebook.imageutils.JfifUtil;
import com.facebook.internal.FacebookRequestErrorClassification;
import com.google.android.exoplayer2.extractor.ts.PsExtractor;
import com.google.android.exoplayer2.extractor.ts.TsExtractor;
import com.vk.core.util.AnimationUtils;
import com.vkontakte.android.api.VKAPIRequest;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.util.logging.Logger;
@Descriptor(tags = {19, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, TransportMediator.KEYCODE_MEDIA_PLAY, TransportMediator.KEYCODE_MEDIA_PAUSE, 128, TsExtractor.TS_STREAM_TYPE_AC3, 130, 131, 132, 133, TsExtractor.TS_STREAM_TYPE_SPLICE_INFO, 135, 136, 137, TsExtractor.TS_STREAM_TYPE_DTS, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, AnimationUtils.DELAY_MID, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, RotationOptions.ROTATE_180, 181, 182, 183, 184, 185, 186, 187, 188, PsExtractor.PRIVATE_STREAM_1, FacebookRequestErrorClassification.EC_INVALID_TOKEN, 191, 192, 193, 194, AnimationUtils.DURATION_SHORT, 196, 197, 198, 199, 200, VKAPIRequest.ERROR_AUDIO_ACCESS, 202, VKAPIRequest.ERROR_GROUP_ACCESS, 204, 205, 206, 207, JfifUtil.MARKER_RST0, 209, 210, 211, 212, 213, 214, JfifUtil.MARKER_RST7, JfifUtil.MARKER_SOI, JfifUtil.MARKER_EOI, JfifUtil.MARKER_SOS, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, PsExtractor.VIDEO_STREAM_MASK, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253})
/* loaded from: classes.dex */
public class ExtensionDescriptor extends BaseDescriptor {
    private static Logger log = Logger.getLogger(ExtensionDescriptor.class.getName());
    ByteBuffer data;

    static int[] allTags() {
        int[] ints = new int[148];
        for (int i = 106; i < 254; i++) {
            int pos = i - 106;
            log.finest("pos:" + pos);
            ints[pos] = i;
        }
        return ints;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public void parseDetail(ByteBuffer bb) throws IOException {
        this.data = bb.slice();
        bb.position(bb.position() + this.data.remaining());
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append("ExtensionDescriptor");
        sb.append("tag=").append(this.tag);
        sb.append(",bytes=").append(Hex.encodeHex(this.data.array()));
        sb.append('}');
        return sb.toString();
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    public ByteBuffer serialize() {
        ByteBuffer out = ByteBuffer.allocate(getSize());
        IsoTypeWriter.writeUInt8(out, this.tag);
        writeSize(out, getContentSize());
        out.put(this.data.duplicate());
        return out;
    }

    @Override // com.googlecode.mp4parser.boxes.mp4.objectdescriptors.BaseDescriptor
    int getContentSize() {
        return this.data.remaining();
    }
}
