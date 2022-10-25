.class Lcom/vk/music/attach/controller/SearchController$1;
.super Ljava/lang/Object;
.source "SearchController.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/attach/controller/SearchController;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/music/attach/controller/SearchController;


# direct methods
.method constructor <init>(Lcom/vk/music/attach/controller/SearchController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/music/attach/controller/SearchController;

    .prologue
    .line 20
    iput-object p1, p0, Lcom/vk/music/attach/controller/SearchController$1;->this$0:Lcom/vk/music/attach/controller/SearchController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 4
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 30
    iget-object v0, p0, Lcom/vk/music/attach/controller/SearchController$1;->this$0:Lcom/vk/music/attach/controller/SearchController;

    invoke-static {v0}, Lcom/vk/music/attach/controller/SearchController;->access$100(Lcom/vk/music/attach/controller/SearchController;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/SearchController$1;->this$0:Lcom/vk/music/attach/controller/SearchController;

    invoke-static {v1}, Lcom/vk/music/attach/controller/SearchController;->access$000(Lcom/vk/music/attach/controller/SearchController;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 31
    invoke-static {p1}, Landroid/text/TextUtils;->isGraphic(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 32
    iget-object v0, p0, Lcom/vk/music/attach/controller/SearchController$1;->this$0:Lcom/vk/music/attach/controller/SearchController;

    invoke-static {v0}, Lcom/vk/music/attach/controller/SearchController;->access$100(Lcom/vk/music/attach/controller/SearchController;)Landroid/os/Handler;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/music/attach/controller/SearchController$1;->this$0:Lcom/vk/music/attach/controller/SearchController;

    invoke-static {v1}, Lcom/vk/music/attach/controller/SearchController;->access$000(Lcom/vk/music/attach/controller/SearchController;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x190

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 36
    :goto_0
    return-void

    .line 34
    :cond_0
    iget-object v0, p0, Lcom/vk/music/attach/controller/SearchController$1;->this$0:Lcom/vk/music/attach/controller/SearchController;

    invoke-virtual {v0}, Lcom/vk/music/attach/controller/SearchController;->onStopSearch()V

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 23
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 26
    return-void
.end method
