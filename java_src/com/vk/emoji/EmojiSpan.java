package com.vk.emoji;
/* loaded from: classes2.dex */
final class EmojiSpan extends BetterImageSpan {
    public static final int EMOJI_ALIGNMENT_IN_TEXT = 2;

    public EmojiSpan(EmojiDrawable drawable) {
        super(drawable, BetterImageSpan.normalizeAlignment(2));
    }
}
