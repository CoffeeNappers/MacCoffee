.class final Lcom/vk/emoji/EmojiParser;
.super Ljava/lang/Object;
.source "EmojiParser.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/emoji/EmojiParser$EmojiParseResult;
    }
.end annotation


# static fields
.field private static volatile instance:Lcom/vk/emoji/EmojiParser;


# instance fields
.field private final tree:Lcom/vk/emoji/EmojiTree;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    new-instance v0, Lcom/vk/emoji/EmojiTree;

    invoke-direct {v0}, Lcom/vk/emoji/EmojiTree;-><init>()V

    iput-object v0, p0, Lcom/vk/emoji/EmojiParser;->tree:Lcom/vk/emoji/EmojiTree;

    .line 25
    iget-object v0, p0, Lcom/vk/emoji/EmojiParser;->tree:Lcom/vk/emoji/EmojiTree;

    invoke-static {v0}, Lcom/vk/emoji/EmojiGenerated;->fillEmojiTree(Lcom/vk/emoji/EmojiTree;)V

    .line 26
    return-void
.end method

.method public static instance()Lcom/vk/emoji/EmojiParser;
    .locals 2

    .prologue
    .line 11
    sget-object v0, Lcom/vk/emoji/EmojiParser;->instance:Lcom/vk/emoji/EmojiParser;

    if-nez v0, :cond_1

    .line 12
    const-class v1, Lcom/vk/emoji/EmojiParser;

    monitor-enter v1

    .line 13
    :try_start_0
    sget-object v0, Lcom/vk/emoji/EmojiParser;->instance:Lcom/vk/emoji/EmojiParser;

    if-nez v0, :cond_0

    .line 14
    new-instance v0, Lcom/vk/emoji/EmojiParser;

    invoke-direct {v0}, Lcom/vk/emoji/EmojiParser;-><init>()V

    sput-object v0, Lcom/vk/emoji/EmojiParser;->instance:Lcom/vk/emoji/EmojiParser;

    .line 16
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    :cond_1
    sget-object v0, Lcom/vk/emoji/EmojiParser;->instance:Lcom/vk/emoji/EmojiParser;

    return-object v0

    .line 16
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public containsEmoji(Ljava/lang/CharSequence;)Z
    .locals 4
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 29
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 30
    iget-object v2, p0, Lcom/vk/emoji/EmojiParser;->tree:Lcom/vk/emoji/EmojiTree;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-virtual {v2, p1, v1, v3}, Lcom/vk/emoji/EmojiTree;->findEmoji(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v0

    .line 31
    .local v0, "found":Lcom/vk/emoji/EmojiTreeEntry;
    if-eqz v0, :cond_0

    .line 32
    const/4 v2, 0x1

    .line 35
    .end local v0    # "found":Lcom/vk/emoji/EmojiTreeEntry;
    :goto_1
    return v2

    .line 29
    .restart local v0    # "found":Lcom/vk/emoji/EmojiTreeEntry;
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 35
    .end local v0    # "found":Lcom/vk/emoji/EmojiTreeEntry;
    :cond_1
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public findEmoji(Ljava/lang/CharSequence;)Ljava/util/LinkedList;
    .locals 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/CharSequence;",
            ")",
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vk/emoji/EmojiParser$EmojiParseResult;",
            ">;"
        }
    .end annotation

    .prologue
    .line 52
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    .line 54
    .local v2, "list":Ljava/util/LinkedList;, "Ljava/util/LinkedList<Lcom/vk/emoji/EmojiParser$EmojiParseResult;>;"
    const/4 v1, 0x0

    .line 56
    .local v1, "index":I
    :goto_0
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ge v1, v3, :cond_1

    .line 57
    iget-object v3, p0, Lcom/vk/emoji/EmojiParser;->tree:Lcom/vk/emoji/EmojiTree;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v4

    invoke-virtual {v3, p1, v1, v4}, Lcom/vk/emoji/EmojiTree;->findEmoji(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v0

    .line 58
    .local v0, "found":Lcom/vk/emoji/EmojiTreeEntry;
    if-eqz v0, :cond_0

    .line 59
    new-instance v3, Lcom/vk/emoji/EmojiParser$EmojiParseResult;

    invoke-virtual {v0}, Lcom/vk/emoji/EmojiTreeEntry;->length()I

    move-result v4

    add-int/2addr v4, v1

    invoke-direct {v3, v1, v4, v0}, Lcom/vk/emoji/EmojiParser$EmojiParseResult;-><init>(IILcom/vk/emoji/EmojiTreeEntry;)V

    invoke-virtual {v2, v3}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 60
    invoke-virtual {v0}, Lcom/vk/emoji/EmojiTreeEntry;->length()I

    move-result v3

    add-int/2addr v1, v3

    goto :goto_0

    .line 62
    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 66
    .end local v0    # "found":Lcom/vk/emoji/EmojiTreeEntry;
    :cond_1
    return-object v2
.end method

.method public findEmojiAtPosition(Ljava/lang/CharSequence;)Lcom/vk/emoji/EmojiTreeEntry;
    .locals 3
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/emoji/EmojiParser;->tree:Lcom/vk/emoji/EmojiTree;

    const/4 v1, 0x0

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v2

    invoke-virtual {v0, p1, v1, v2}, Lcom/vk/emoji/EmojiTree;->findEmoji(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v0

    return-object v0
.end method

.method public findEmojiAtPosition(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;
    .locals 1
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "end"    # I

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vk/emoji/EmojiParser;->tree:Lcom/vk/emoji/EmojiTree;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vk/emoji/EmojiTree;->findEmoji(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v0

    return-object v0
.end method

.method public isEmoji(Ljava/lang/CharSequence;)Z
    .locals 4
    .param p1, "text"    # Ljava/lang/CharSequence;

    .prologue
    const/4 v1, 0x0

    .line 39
    iget-object v2, p0, Lcom/vk/emoji/EmojiParser;->tree:Lcom/vk/emoji/EmojiTree;

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-virtual {v2, p1, v1, v3}, Lcom/vk/emoji/EmojiTree;->findEmoji(Ljava/lang/CharSequence;II)Lcom/vk/emoji/EmojiTreeEntry;

    move-result-object v0

    .line 40
    .local v0, "e":Lcom/vk/emoji/EmojiTreeEntry;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/vk/emoji/EmojiTreeEntry;->length()I

    move-result v2

    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-ne v2, v3, :cond_0

    const/4 v1, 0x1

    :cond_0
    return v1
.end method
