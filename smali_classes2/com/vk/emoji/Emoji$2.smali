.class Lcom/vk/emoji/Emoji$2;
.super Ljava/lang/Object;
.source "Emoji.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/emoji/Emoji;->loadAll()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/emoji/Emoji;


# direct methods
.method constructor <init>(Lcom/vk/emoji/Emoji;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/emoji/Emoji;

    .prologue
    .line 232
    iput-object p1, p0, Lcom/vk/emoji/Emoji$2;->this$0:Lcom/vk/emoji/Emoji;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .prologue
    .line 236
    invoke-static {}, Lcom/vk/emoji/EmojiParser;->instance()Lcom/vk/emoji/EmojiParser;

    .line 237
    return-void
.end method
