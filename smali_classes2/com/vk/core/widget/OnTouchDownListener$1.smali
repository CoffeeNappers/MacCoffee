.class Lcom/vk/core/widget/OnTouchDownListener$1;
.super Landroid/os/Handler;
.source "OnTouchDownListener.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/widget/OnTouchDownListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/widget/OnTouchDownListener;


# direct methods
.method constructor <init>(Lcom/vk/core/widget/OnTouchDownListener;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/widget/OnTouchDownListener;
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/vk/core/widget/OnTouchDownListener$1;->this$0:Lcom/vk/core/widget/OnTouchDownListener;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 3
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 23
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_0

    .line 24
    iget-object v0, p0, Lcom/vk/core/widget/OnTouchDownListener$1;->this$0:Lcom/vk/core/widget/OnTouchDownListener;

    invoke-static {v0}, Lcom/vk/core/widget/OnTouchDownListener;->access$000(Lcom/vk/core/widget/OnTouchDownListener;)Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 25
    iget-object v0, p0, Lcom/vk/core/widget/OnTouchDownListener$1;->this$0:Lcom/vk/core/widget/OnTouchDownListener;

    invoke-static {v0}, Lcom/vk/core/widget/OnTouchDownListener;->access$000(Lcom/vk/core/widget/OnTouchDownListener;)Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;

    move-result-object v0

    iget v1, p1, Landroid/os/Message;->arg1:I

    iget v2, p1, Landroid/os/Message;->arg2:I

    invoke-interface {v0, v1, v2}, Lcom/vk/core/widget/OnTouchDownListener$DownUpListener;->onDown(II)V

    .line 28
    :cond_0
    return-void
.end method
