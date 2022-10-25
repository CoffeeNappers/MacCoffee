.class Lcom/vk/lists/PaginateHelper$1;
.super Landroid/os/Handler;
.source "PaginateHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/lists/PaginateHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/lists/PaginateHelper;


# direct methods
.method constructor <init>(Lcom/vk/lists/PaginateHelper;Landroid/os/Looper;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/lists/PaginateHelper;
    .param p2, "x0"    # Landroid/os/Looper;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/vk/lists/PaginateHelper$1;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1
    .param p1, "msg"    # Landroid/os/Message;

    .prologue
    .line 46
    iget v0, p1, Landroid/os/Message;->what:I

    if-nez v0, :cond_0

    .line 47
    iget-object v0, p0, Lcom/vk/lists/PaginateHelper$1;->this$0:Lcom/vk/lists/PaginateHelper;

    invoke-static {v0}, Lcom/vk/lists/PaginateHelper;->access$000(Lcom/vk/lists/PaginateHelper;)Lcom/vk/lists/PaginateHelper$UIControl;

    move-result-object v0

    invoke-interface {v0}, Lcom/vk/lists/PaginateHelper$UIControl;->clearSwipeRefreshing()V

    .line 49
    :cond_0
    return-void
.end method
