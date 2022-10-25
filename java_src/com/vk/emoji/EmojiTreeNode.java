package com.vk.emoji;

import android.support.annotation.NonNull;
import android.support.annotation.Nullable;
import android.support.v4.util.SparseArrayCompat;
/* loaded from: classes2.dex */
final class EmojiTreeNode {
    final SparseArrayCompat<EmojiTreeNode> children = new SparseArrayCompat<>();
    private EmojiTreeEntry emoji;

    /* JADX INFO: Access modifiers changed from: package-private */
    public EmojiTreeNode(@Nullable EmojiTreeEntry emoji) {
        this.emoji = emoji;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public EmojiTreeNode getChild(char child) {
        return this.children.get(child);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @Nullable
    public EmojiTreeEntry getEmoji() {
        return this.emoji;
    }

    void setEmoji(@NonNull EmojiTreeEntry emoji) {
        this.emoji = emoji;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    @NonNull
    public EmojiTreeNode appendOrGet(char child) {
        EmojiTreeNode existing = this.children.get(child);
        if (existing == null) {
            EmojiTreeNode existing2 = new EmojiTreeNode(null);
            this.children.put(child, existing2);
            return existing2;
        }
        return existing;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void appendLast(char child, @NonNull EmojiTreeEntry newEmoji) {
        EmojiTreeNode existing = this.children.get(child);
        if (existing == null) {
            this.children.put(child, new EmojiTreeNode(newEmoji));
            return;
        }
        existing.setEmoji(newEmoji);
    }
}
