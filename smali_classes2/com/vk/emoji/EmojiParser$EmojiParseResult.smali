.class public Lcom/vk/emoji/EmojiParser$EmojiParseResult;
.super Ljava/lang/Object;
.source "EmojiParser.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/EmojiParser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EmojiParseResult"
.end annotation


# instance fields
.field public final emojiTreeEntry:Lcom/vk/emoji/EmojiTreeEntry;

.field public final end:I

.field public final start:I


# direct methods
.method public constructor <init>(IILcom/vk/emoji/EmojiTreeEntry;)V
    .locals 0
    .param p1, "start"    # I
    .param p2, "end"    # I
    .param p3, "emojiTreeEntry"    # Lcom/vk/emoji/EmojiTreeEntry;

    .prologue
    .line 75
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 76
    iput p1, p0, Lcom/vk/emoji/EmojiParser$EmojiParseResult;->start:I

    .line 77
    iput p2, p0, Lcom/vk/emoji/EmojiParser$EmojiParseResult;->end:I

    .line 78
    iput-object p3, p0, Lcom/vk/emoji/EmojiParser$EmojiParseResult;->emojiTreeEntry:Lcom/vk/emoji/EmojiTreeEntry;

    .line 79
    return-void
.end method
