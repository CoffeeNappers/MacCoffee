.class final Lcom/vk/emoji/EmojiSpan;
.super Lcom/vk/emoji/BetterImageSpan;
.source "EmojiSpan.java"


# static fields
.field public static final EMOJI_ALIGNMENT_IN_TEXT:I = 0x2


# direct methods
.method public constructor <init>(Lcom/vk/emoji/EmojiDrawable;)V
    .locals 1
    .param p1, "drawable"    # Lcom/vk/emoji/EmojiDrawable;

    .prologue
    .line 8
    const/4 v0, 0x2

    invoke-static {v0}, Lcom/vk/emoji/BetterImageSpan;->normalizeAlignment(I)I

    move-result v0

    invoke-direct {p0, p1, v0}, Lcom/vk/emoji/BetterImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 9
    return-void
.end method
