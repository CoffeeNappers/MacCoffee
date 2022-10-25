.class Lcom/vk/stories/CreateAndEditStoryActivity$93$3;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$93;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

.field final synthetic val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$dialogShow:Ljava/lang/Runnable;

.field final synthetic val$emoji:Z

.field final synthetic val$handler:Landroid/os/Handler;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$93;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;Z)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$93;

    .prologue
    .line 3041
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$handler:Landroid/os/Handler;

    iput-object p3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$dialogShow:Ljava/lang/Runnable;

    iput-object p4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

    iput-boolean p5, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$emoji:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 3041
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "throwable"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 3044
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$handler:Landroid/os/Handler;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$dialogShow:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3045
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;

    invoke-static {v0}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 3046
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v1, 0x7f0804d3

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 3047
    iget-boolean v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->val$emoji:Z

    if-eqz v0, :cond_0

    .line 3048
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$11300(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 3052
    :goto_0
    return-void

    .line 3050
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$11400(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    goto :goto_0
.end method
