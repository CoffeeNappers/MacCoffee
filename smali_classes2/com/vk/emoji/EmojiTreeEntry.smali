.class final Lcom/vk/emoji/EmojiTreeEntry;
.super Ljava/lang/Object;
.source "EmojiTreeEntry.java"


# instance fields
.field public final key:Ljava/lang/String;

.field public final spriteIndex:B

.field public final x:B

.field public final y:B


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2
    .param p1, "key"    # Ljava/lang/String;

    .prologue
    const/4 v1, 0x0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    iput-object p1, p0, Lcom/vk/emoji/EmojiTreeEntry;->key:Ljava/lang/String;

    .line 11
    const/4 v0, -0x1

    iput-byte v0, p0, Lcom/vk/emoji/EmojiTreeEntry;->spriteIndex:B

    .line 12
    iput-byte v1, p0, Lcom/vk/emoji/EmojiTreeEntry;->x:B

    .line 13
    iput-byte v1, p0, Lcom/vk/emoji/EmojiTreeEntry;->y:B

    .line 14
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;III)V
    .locals 1
    .param p1, "key"    # Ljava/lang/String;
    .param p2, "spriteIndex"    # I
    .param p3, "x"    # I
    .param p4, "y"    # I

    .prologue
    .line 16
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 17
    iput-object p1, p0, Lcom/vk/emoji/EmojiTreeEntry;->key:Ljava/lang/String;

    .line 18
    int-to-byte v0, p2

    iput-byte v0, p0, Lcom/vk/emoji/EmojiTreeEntry;->spriteIndex:B

    .line 19
    int-to-byte v0, p3

    iput-byte v0, p0, Lcom/vk/emoji/EmojiTreeEntry;->x:B

    .line 20
    int-to-byte v0, p4

    iput-byte v0, p0, Lcom/vk/emoji/EmojiTreeEntry;->y:B

    .line 21
    return-void
.end method


# virtual methods
.method public length()I
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/vk/emoji/EmojiTreeEntry;->key:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    return v0
.end method
