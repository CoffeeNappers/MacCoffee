.class Lcom/vk/stories/CreateAndEditStoryActivity$93$1;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$93;->loadAndShow(Ljava/lang/String;ZLjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

.field final synthetic val$dialog:Ljava/util/concurrent/atomic/AtomicReference;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$93;Ljava/util/concurrent/atomic/AtomicReference;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$93;

    .prologue
    .line 3009
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$1;->val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 3012
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$1;->val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v1, v1, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v2, 0x7f0804d1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vk/attachpicker/widget/LoadingDialog;->getInstance(Landroid/content/Context;Ljava/lang/Integer;)Landroid/app/ProgressDialog;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    .line 3013
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$1;->val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    .line 3014
    return-void
.end method
