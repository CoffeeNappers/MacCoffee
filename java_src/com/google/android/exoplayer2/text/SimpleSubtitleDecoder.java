package com.google.android.exoplayer2.text;

import com.google.android.exoplayer2.decoder.SimpleDecoder;
import java.nio.ByteBuffer;
/* loaded from: classes.dex */
public abstract class SimpleSubtitleDecoder extends SimpleDecoder<SubtitleInputBuffer, SubtitleOutputBuffer, SubtitleDecoderException> implements SubtitleDecoder {
    private final String name;

    /* renamed from: decode */
    protected abstract Subtitle mo374decode(byte[] bArr, int i) throws SubtitleDecoderException;

    /* JADX INFO: Access modifiers changed from: protected */
    public SimpleSubtitleDecoder(String name) {
        super(new SubtitleInputBuffer[2], new SubtitleOutputBuffer[2]);
        this.name = name;
        setInitialInputBufferSize(1024);
    }

    @Override // com.google.android.exoplayer2.decoder.Decoder
    public final String getName() {
        return this.name;
    }

    @Override // com.google.android.exoplayer2.text.SubtitleDecoder
    public void setPositionUs(long timeUs) {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.exoplayer2.decoder.SimpleDecoder
    public final SubtitleInputBuffer createInputBuffer() {
        return new SubtitleInputBuffer();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.exoplayer2.decoder.SimpleDecoder
    public final SubtitleOutputBuffer createOutputBuffer() {
        return new SimpleSubtitleOutputBuffer(this);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.exoplayer2.decoder.SimpleDecoder
    public final void releaseOutputBuffer(SubtitleOutputBuffer buffer) {
        super.releaseOutputBuffer((SimpleSubtitleDecoder) buffer);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.google.android.exoplayer2.decoder.SimpleDecoder
    public final SubtitleDecoderException decode(SubtitleInputBuffer inputBuffer, SubtitleOutputBuffer outputBuffer, boolean reset) {
        try {
            ByteBuffer inputData = inputBuffer.data;
            Subtitle subtitle = mo374decode(inputData.array(), inputData.limit());
            outputBuffer.setContent(inputBuffer.timeUs, subtitle, inputBuffer.subsampleOffsetUs);
            return null;
        } catch (SubtitleDecoderException e) {
            return e;
        }
    }
}
