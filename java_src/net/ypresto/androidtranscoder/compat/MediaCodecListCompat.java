package net.ypresto.androidtranscoder.compat;

import android.media.MediaCodecInfo;
import android.media.MediaCodecList;
import android.media.MediaFormat;
import java.util.Arrays;
import java.util.Iterator;
import java.util.NoSuchElementException;
/* loaded from: classes3.dex */
public class MediaCodecListCompat {
    public static final int ALL_CODECS = 1;
    public static final int REGULAR_CODECS = 0;

    public MediaCodecListCompat(int kind) {
        if (kind != 0) {
            throw new UnsupportedOperationException("kind other than REGULAR_CODECS is not implemented.");
        }
    }

    public final String findDecoderForFormat(MediaFormat format) {
        return findCoderForFormat(format, false);
    }

    public final String findEncoderForFormat(MediaFormat format) {
        return findCoderForFormat(format, true);
    }

    private String findCoderForFormat(MediaFormat format, boolean findEncoder) {
        String mimeType = format.getString("mime");
        Iterator<MediaCodecInfo> iterator = new MediaCodecInfoIterator();
        while (iterator.hasNext()) {
            MediaCodecInfo codecInfo = iterator.next();
            if (codecInfo.isEncoder() == findEncoder && Arrays.asList(codecInfo.getSupportedTypes()).contains(mimeType)) {
                return codecInfo.getName();
            }
        }
        return null;
    }

    public final MediaCodecInfo[] getCodecInfos() {
        int codecCount = getCodecCount();
        MediaCodecInfo[] codecInfos = new MediaCodecInfo[codecCount];
        new MediaCodecInfoIterator();
        for (int i = 0; i < codecCount; i++) {
            codecInfos[i] = getCodecInfoAt(i);
        }
        return codecInfos;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static int getCodecCount() {
        return MediaCodecList.getCodecCount();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public static MediaCodecInfo getCodecInfoAt(int index) {
        return MediaCodecList.getCodecInfoAt(index);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes3.dex */
    public final class MediaCodecInfoIterator implements Iterator<MediaCodecInfo> {
        private int mCodecCount;
        private int mIndex;

        private MediaCodecInfoIterator() {
            this.mCodecCount = MediaCodecListCompat.getCodecCount();
            this.mIndex = -1;
        }

        @Override // java.util.Iterator
        public boolean hasNext() {
            return this.mIndex + 1 < this.mCodecCount;
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // java.util.Iterator
        /* renamed from: next */
        public MediaCodecInfo mo1208next() {
            if (!hasNext()) {
                throw new NoSuchElementException();
            }
            this.mIndex++;
            return MediaCodecListCompat.getCodecInfoAt(this.mIndex);
        }

        @Override // java.util.Iterator
        public void remove() {
            throw new UnsupportedOperationException();
        }
    }
}
