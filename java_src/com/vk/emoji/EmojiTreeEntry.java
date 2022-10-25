package com.vk.emoji;
/* loaded from: classes2.dex */
final class EmojiTreeEntry {
    public final String key;
    public final byte spriteIndex;
    public final byte x;
    public final byte y;

    public EmojiTreeEntry(String key) {
        this.key = key;
        this.spriteIndex = (byte) -1;
        this.x = (byte) 0;
        this.y = (byte) 0;
    }

    public EmojiTreeEntry(String key, int spriteIndex, int x, int y) {
        this.key = key;
        this.spriteIndex = (byte) spriteIndex;
        this.x = (byte) x;
        this.y = (byte) y;
    }

    public int length() {
        return this.key.length();
    }
}
