.class final Lcom/vk/emoji/EmojiTreeNode;
.super Ljava/lang/Object;
.source "EmojiTreeNode.java"


# instance fields
.field final children:Landroid/support/v4/util/SparseArrayCompat;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/support/v4/util/SparseArrayCompat",
            "<",
            "Lcom/vk/emoji/EmojiTreeNode;",
            ">;"
        }
    .end annotation
.end field

.field private emoji:Lcom/vk/emoji/EmojiTreeEntry;


# direct methods
.method constructor <init>(Lcom/vk/emoji/EmojiTreeEntry;)V
    .locals 1
    .param p1, "emoji"    # Lcom/vk/emoji/EmojiTreeEntry;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 9
    new-instance v0, Landroid/support/v4/util/SparseArrayCompat;

    invoke-direct {v0}, Landroid/support/v4/util/SparseArrayCompat;-><init>()V

    iput-object v0, p0, Lcom/vk/emoji/EmojiTreeNode;->children:Landroid/support/v4/util/SparseArrayCompat;

    .line 14
    iput-object p1, p0, Lcom/vk/emoji/EmojiTreeNode;->emoji:Lcom/vk/emoji/EmojiTreeEntry;

    .line 15
    return-void
.end method


# virtual methods
.method appendLast(CLcom/vk/emoji/EmojiTreeEntry;)V
    .locals 2
    .param p1, "child"    # C
    .param p2, "newEmoji"    # Lcom/vk/emoji/EmojiTreeEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 45
    iget-object v1, p0, Lcom/vk/emoji/EmojiTreeNode;->children:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SparseArrayCompat;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/emoji/EmojiTreeNode;

    .line 47
    .local v0, "existing":Lcom/vk/emoji/EmojiTreeNode;
    if-nez v0, :cond_0

    .line 48
    new-instance v0, Lcom/vk/emoji/EmojiTreeNode;

    .end local v0    # "existing":Lcom/vk/emoji/EmojiTreeNode;
    invoke-direct {v0, p2}, Lcom/vk/emoji/EmojiTreeNode;-><init>(Lcom/vk/emoji/EmojiTreeEntry;)V

    .line 50
    .restart local v0    # "existing":Lcom/vk/emoji/EmojiTreeNode;
    iget-object v1, p0, Lcom/vk/emoji/EmojiTreeNode;->children:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/util/SparseArrayCompat;->put(ILjava/lang/Object;)V

    .line 54
    :goto_0
    return-void

    .line 52
    :cond_0
    invoke-virtual {v0, p2}, Lcom/vk/emoji/EmojiTreeNode;->setEmoji(Lcom/vk/emoji/EmojiTreeEntry;)V

    goto :goto_0
.end method

.method appendOrGet(C)Lcom/vk/emoji/EmojiTreeNode;
    .locals 2
    .param p1, "child"    # C
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 33
    iget-object v1, p0, Lcom/vk/emoji/EmojiTreeNode;->children:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v1, p1}, Landroid/support/v4/util/SparseArrayCompat;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/emoji/EmojiTreeNode;

    .line 35
    .local v0, "existing":Lcom/vk/emoji/EmojiTreeNode;
    if-nez v0, :cond_0

    .line 36
    new-instance v0, Lcom/vk/emoji/EmojiTreeNode;

    .end local v0    # "existing":Lcom/vk/emoji/EmojiTreeNode;
    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vk/emoji/EmojiTreeNode;-><init>(Lcom/vk/emoji/EmojiTreeEntry;)V

    .line 38
    .restart local v0    # "existing":Lcom/vk/emoji/EmojiTreeNode;
    iget-object v1, p0, Lcom/vk/emoji/EmojiTreeNode;->children:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v1, p1, v0}, Landroid/support/v4/util/SparseArrayCompat;->put(ILjava/lang/Object;)V

    .line 41
    :cond_0
    return-object v0
.end method

.method getChild(C)Lcom/vk/emoji/EmojiTreeNode;
    .locals 1
    .param p1, "child"    # C
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 19
    iget-object v0, p0, Lcom/vk/emoji/EmojiTreeNode;->children:Landroid/support/v4/util/SparseArrayCompat;

    invoke-virtual {v0, p1}, Landroid/support/v4/util/SparseArrayCompat;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/emoji/EmojiTreeNode;

    return-object v0
.end method

.method getEmoji()Lcom/vk/emoji/EmojiTreeEntry;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/emoji/EmojiTreeNode;->emoji:Lcom/vk/emoji/EmojiTreeEntry;

    return-object v0
.end method

.method setEmoji(Lcom/vk/emoji/EmojiTreeEntry;)V
    .locals 0
    .param p1, "emoji"    # Lcom/vk/emoji/EmojiTreeEntry;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vk/emoji/EmojiTreeNode;->emoji:Lcom/vk/emoji/EmojiTreeEntry;

    .line 29
    return-void
.end method
