package com.vk.emoji;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
/* loaded from: classes2.dex */
final class EmojiTree {
    private EmojiTreeNode root = new EmojiTreeNode(null);

    public void add(@NonNull EmojiTreeEntry emoji) {
        String unicode = emoji.key;
        EmojiTreeNode current = this.root;
        for (int i = 0; i < unicode.length() - 1; i++) {
            current = current.appendOrGet(unicode.charAt(i));
        }
        current.appendLast(unicode.charAt(unicode.length() - 1), emoji);
    }

    @Nullable
    public EmojiTreeEntry findEmoji(@NonNull CharSequence candidate, int startPosition, int endPosition) {
        EmojiTreeNode current = this.root;
        EmojiTreeEntry result = null;
        for (int i = startPosition; i < endPosition; i++) {
            current = current.getChild(candidate.charAt(i));
            if (current == null) {
                break;
            }
            if (current.getEmoji() != null) {
                result = current.getEmoji();
            }
        }
        return result;
    }
}
