package net.ypresto.androidtranscoder.engine;

import java.nio.ShortBuffer;
/* loaded from: classes3.dex */
public interface AudioRemixer {
    public static final AudioRemixer DOWNMIX = new AudioRemixer() { // from class: net.ypresto.androidtranscoder.engine.AudioRemixer.1
        private static final int SIGNED_SHORT_LIMIT = 32768;
        private static final int UNSIGNED_SHORT_MAX = 65535;

        @Override // net.ypresto.androidtranscoder.engine.AudioRemixer
        public void remix(ShortBuffer inSBuff, ShortBuffer outSBuff) {
            int m;
            int inRemaining = inSBuff.remaining() / 2;
            int outSpace = outSBuff.remaining();
            int samplesToBeProcessed = Math.min(inRemaining, outSpace);
            for (int i = 0; i < samplesToBeProcessed; i++) {
                int a = inSBuff.get() + 32768;
                int b = inSBuff.get() + 32768;
                if (a < 32768 || b < 32768) {
                    m = (a * b) / 32768;
                } else {
                    m = (((a + b) * 2) - ((a * b) / 32768)) - 65535;
                }
                if (m == 65536) {
                    m = 65535;
                }
                outSBuff.put((short) (m - 32768));
            }
        }
    };
    public static final AudioRemixer UPMIX = new AudioRemixer() { // from class: net.ypresto.androidtranscoder.engine.AudioRemixer.2
        @Override // net.ypresto.androidtranscoder.engine.AudioRemixer
        public void remix(ShortBuffer inSBuff, ShortBuffer outSBuff) {
            int inRemaining = inSBuff.remaining();
            int outSpace = outSBuff.remaining() / 2;
            int samplesToBeProcessed = Math.min(inRemaining, outSpace);
            for (int i = 0; i < samplesToBeProcessed; i++) {
                short inSample = inSBuff.get();
                outSBuff.put(inSample);
                outSBuff.put(inSample);
            }
        }
    };
    public static final AudioRemixer PASSTHROUGH = new AudioRemixer() { // from class: net.ypresto.androidtranscoder.engine.AudioRemixer.3
        @Override // net.ypresto.androidtranscoder.engine.AudioRemixer
        public void remix(ShortBuffer inSBuff, ShortBuffer outSBuff) {
            outSBuff.put(inSBuff);
        }
    };

    void remix(ShortBuffer shortBuffer, ShortBuffer shortBuffer2);
}
