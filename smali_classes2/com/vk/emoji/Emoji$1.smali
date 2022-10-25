.class Lcom/vk/emoji/Emoji$1;
.super Landroid/os/Handler;
.source "Emoji.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/Emoji;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/emoji/Emoji;


# direct methods
.method constructor <init>(Lcom/vk/emoji/Emoji;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/emoji/Emoji;
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 81
    iput-object p1, p0, Lcom/vk/emoji/Emoji$1;->this$0:Lcom/vk/emoji/Emoji;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 84
    iget v1, p1, Landroid/os/Message;->what:I

    if-nez v1, :cond_0

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lcom/vk/emoji/Emoji$1;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v1}, Lcom/vk/emoji/Emoji;->access$000(Lcom/vk/emoji/Emoji;)Lcom/squareup/picasso/Picasso;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 85
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;

    .line 86
    .local v0, "networkEmojiDrawable":Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;
    iget-object v1, p0, Lcom/vk/emoji/Emoji$1;->this$0:Lcom/vk/emoji/Emoji;

    invoke-static {v1}, Lcom/vk/emoji/Emoji;->access$000(Lcom/vk/emoji/Emoji;)Lcom/squareup/picasso/Picasso;

    move-result-object v1

    invoke-virtual {v0}, Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;->getUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/squareup/picasso/Picasso;->load(Ljava/lang/String;)Lcom/squareup/picasso/RequestCreator;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/squareup/picasso/RequestCreator;->into(Lcom/squareup/picasso/Target;)V

    .line 88
    .end local v0    # "networkEmojiDrawable":Lcom/vk/emoji/Emoji$NetworkEmojiDrawable;
    :cond_0
    return-void
.end method
