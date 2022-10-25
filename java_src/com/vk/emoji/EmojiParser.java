package com.vk.emoji;

import java.util.LinkedList;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public final class EmojiParser {
    private static volatile EmojiParser instance;
    private final EmojiTree tree = new EmojiTree();

    public static EmojiParser instance() {
        if (instance == null) {
            synchronized (EmojiParser.class) {
                if (instance == null) {
                    instance = new EmojiParser();
                }
            }
        }
        return instance;
    }

    private EmojiParser() {
        EmojiGenerated.fillEmojiTree(this.tree);
    }

    public boolean containsEmoji(CharSequence text) {
        for (int i = 0; i < text.length(); i++) {
            EmojiTreeEntry found = this.tree.findEmoji(text, i, text.length());
            if (found != null) {
                return true;
            }
        }
        return false;
    }

    public boolean isEmoji(CharSequence text) {
        EmojiTreeEntry e = this.tree.findEmoji(text, 0, text.length());
        return e != null && e.length() == text.length();
    }

    public EmojiTreeEntry findEmojiAtPosition(CharSequence text) {
        return this.tree.findEmoji(text, 0, text.length());
    }

    public EmojiTreeEntry findEmojiAtPosition(CharSequence text, int start, int end) {
        return this.tree.findEmoji(text, start, end);
    }

    public LinkedList<EmojiParseResult> findEmoji(CharSequence text) {
        LinkedList<EmojiParseResult> list = new LinkedList<>();
        int index = 0;
        while (index < text.length()) {
            EmojiTreeEntry found = this.tree.findEmoji(text, index, text.length());
            if (found != null) {
                list.add(new EmojiParseResult(index, found.length() + index, found));
                index += found.length();
            } else {
                index++;
            }
        }
        return list;
    }

    /* loaded from: classes2.dex */
    public static class EmojiParseResult {
        public final EmojiTreeEntry emojiTreeEntry;
        public final int end;
        public final int start;

        public EmojiParseResult(int start, int end, EmojiTreeEntry emojiTreeEntry) {
            this.start = start;
            this.end = end;
            this.emojiTreeEntry = emojiTreeEntry;
        }
    }
}
