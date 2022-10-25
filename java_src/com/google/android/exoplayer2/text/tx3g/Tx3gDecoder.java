package com.google.android.exoplayer2.text.tx3g;

import com.google.android.exoplayer2.text.Cue;
import com.google.android.exoplayer2.text.SimpleSubtitleDecoder;
import com.google.android.exoplayer2.text.Subtitle;
import com.google.android.exoplayer2.util.ParsableByteArray;
/* loaded from: classes.dex */
public final class Tx3gDecoder extends SimpleSubtitleDecoder {
    private final ParsableByteArray parsableByteArray;

    public Tx3gDecoder() {
        super("Tx3gDecoder");
        this.parsableByteArray = new ParsableByteArray();
    }

    @Override // com.google.android.exoplayer2.text.SimpleSubtitleDecoder
    /* renamed from: decode */
    protected Subtitle mo374decode(byte[] bytes, int length) {
        this.parsableByteArray.reset(bytes, length);
        int textLength = this.parsableByteArray.readUnsignedShort();
        if (textLength == 0) {
            return Tx3gSubtitle.EMPTY;
        }
        String cueText = this.parsableByteArray.readString(textLength);
        return new Tx3gSubtitle(new Cue(cueText));
    }
}
