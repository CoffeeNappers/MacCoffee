.class Lcom/vk/stories/CreateAndEditStoryActivity$93$2;
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
        "Landroid/graphics/Bitmap;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

.field final synthetic val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

.field final synthetic val$dialogShow:Ljava/lang/Runnable;

.field final synthetic val$emoji:Z

.field final synthetic val$handler:Landroid/os/Handler;

.field final synthetic val$metaInfo:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$93;Landroid/os/Handler;Ljava/lang/Runnable;Ljava/util/concurrent/atomic/AtomicReference;ZLjava/lang/String;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$93;

    .prologue
    .line 3020
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$handler:Landroid/os/Handler;

    iput-object p3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$dialogShow:Ljava/lang/Runnable;

    iput-object p4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

    iput-boolean p5, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$emoji:Z

    iput-object p6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$metaInfo:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Landroid/graphics/Bitmap;)V
    .locals 5
    .param p1, "bitmap"    # Landroid/graphics/Bitmap;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const/4 v4, 0x0

    .line 3023
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$handler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$dialogShow:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3024
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$dialog:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/Dialog;

    invoke-static {v1}, Lcom/vk/attachpicker/widget/LoadingDialog;->dismissLoadingDialog(Landroid/app/Dialog;)V

    .line 3025
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v1, v1, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$11200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 3027
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v1, v1, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredWidth()I

    move-result v1

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v2, v2, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    .line 3028
    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getMeasuredHeight()I

    move-result v2

    .line 3027
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 3029
    .local v0, "maxWidth":I
    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$emoji:Z

    if-eqz v1, :cond_0

    .line 3030
    div-int/lit8 v0, v0, 0x2

    .line 3032
    :cond_0
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v1, v1, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v1

    new-instance v2, Lcom/vk/attachpicker/stickers/BitmapSticker;

    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$metaInfo:Ljava/lang/String;

    invoke-direct {v2, p1, v0, v3}, Lcom/vk/attachpicker/stickers/BitmapSticker;-><init>(Landroid/graphics/Bitmap;ILjava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->addStickerView(Lcom/vk/attachpicker/stickers/Sticker;)V

    .line 3034
    iget-boolean v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->val$emoji:Z

    if-eqz v1, :cond_1

    .line 3035
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v1, v1, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$11300(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    .line 3040
    :goto_0
    return-void

    .line 3037
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$93;

    iget-object v1, v1, Lcom/vk/stories/CreateAndEditStoryActivity$93;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$11400(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V

    goto :goto_0
.end method

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
    .line 3020
    check-cast p1, Landroid/graphics/Bitmap;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$93$2;->accept(Landroid/graphics/Bitmap;)V

    return-void
.end method
