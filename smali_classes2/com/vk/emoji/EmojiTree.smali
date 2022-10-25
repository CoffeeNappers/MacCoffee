.class final Lcom/vk/emoji/EmojiTree;
.super Ljava/lang/Object;
.source "EmojiTree.java"


# instance fields
.field private root:Lcom/vk/emoji/EmojiTreeNode;


# direct methods
.method constructor <init>()V
    .locals 2

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    new-instance v0, Lcom/vk/emoji/EmojiTreeNode;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vk/emoji/EmojiTreeNode;-><init>(Lcom/vk/emoji/EmojiTreeEntry;)V

    iput-object v0, p0, Lcom/vk/emoji/EmojiTree;->root:Lcom/vk/emoji/EmojiTreeNode;

    return-void
.end method


# virtual methods
.method public add(Lcom/vk/emoji/EmojiTreeEntry;)V
    .locals 4
    .param p1, "emoji"    # Lcom/vk/emoji/EmojiTreeEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 11
    iget-object v2, p1, Lcom/vk/emoji/EmojiTreeEntry;->key:Ljava/lang/String;

    .line 13
    .local v2, "unicode":Ljava/lang/String;
    iget-object v0, p0, Lcom/vk/emoji/EmojiTree;->root:Lcom/vk/emoji/EmojiTreeNode;

    .line 15
    .local v0, "current":Lcom/vk/emoji/EmojiTreeNode;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    if-ge v1, v3, :cond_0

    .line 16
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Lcom/vk/emoji/EmojiTreeNode;->appendOrGet(C)Lcom/vk/emoji/EmojiTreeNode;

    move-result-object v0

    .line 15
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 19
    :cond_0
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    add-int/lit8 v3, v3, -0x1

    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3, p1}, Lcom/vk/emoji/EmojiTreeNode;->appendLast(CLcom/vk/emoji/EmojiTreeEntry;)V

    .line 20
    return-void
.end method

.method public findEmoji(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;
    .locals 4
    .param p1, "candidate"    # Ljava/lang/CharSequence;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "startPosition"    # I
    .param p3, "endPosition"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/emoji/EmojiTree;->root:Lcom/vk/emoji/EmojiTreeNode;

    .line 25
    .local v0, "current":Lcom/vk/emoji/EmojiTreeNode;
    const/4 v2, 0x0

    .line 27
    .local v2, "result":Lcom/vk/emoji/EmojiTreeEntry;
    move v1, p2

    .local v1, "i":I
    :goto_0
    if-ge v1, p3, :cond_0

    .line 28
    invoke-interface {p1, v1}, Ljava/lang/CharSequence;->charAt(I)C

    move-result v3

    invoke-virtual {v0, v3}, Lcom/vk/emoji/EmojiTreeNode;->getChild(C)Lcom/vk/emoji/EmojiTreeNode;

    move-result-object v0

    .line 30
    if-nez v0, :cond_1

    .line 37
    :cond_0
    return-object v2

    .line 32
    :cond_1
    invoke-virtual {v0}, Lcom/vk/emoji/EmojiTreeNode;->getEmoji()Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v3

    if-eqz v3, :cond_2

    .line 33
    invoke-virtual {v0}, Lcom/vk/emoji/EmojiTreeNode;->getEmoji()Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v2

    .line 27
    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0
.end method
