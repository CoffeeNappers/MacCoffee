.class Lcom/vk/stories/CreateAndEditStoryActivity$43;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->onMaskSelected(ILcom/vk/masks/model/Mask;)V
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
        "Lcom/vk/core/network/RxFileDownloader$DownloadEvent;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$finalMask:Lcom/vk/masks/model/Mask;

.field final synthetic val$firstProgressTime:J

.field final synthetic val$needDownload:Z

.field final synthetic val$sectionId:I


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;ZJI)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 1402
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$finalMask:Lcom/vk/masks/model/Mask;

    iput-boolean p3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$needDownload:Z

    iput-wide p4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$firstProgressTime:J

    iput p6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$sectionId:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)V
    .locals 12
    .param p1, "downloadEvent"    # Lcom/vk/core/network/RxFileDownloader$DownloadEvent;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    const-wide/16 v10, 0x7d0

    const/4 v8, 0x1

    .line 1405
    invoke-virtual {p1}, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->isDoneEvent()Z

    move-result v6

    if-eqz v6, :cond_5

    .line 1406
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksAnalytics;

    move-result-object v6

    iget-object v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$finalMask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v6, v7}, Lcom/vk/masks/MasksAnalytics;->trackMaskLoadingSuccess(Lcom/vk/masks/model/Mask;)V

    .line 1409
    iget-boolean v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$needDownload:Z

    if-eqz v6, :cond_2

    .line 1410
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v6, v8}, Lcom/vk/stories/CreateAndEditStoryActivity;->reloadLocalMasks(Z)V

    .line 1415
    :goto_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 1418
    .local v0, "downloadStop":J
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4100(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v6

    const/4 v7, 0x0

    invoke-virtual {v6, v7}, Landroid/view/View;->setVisibility(I)V

    .line 1419
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->notifyMasksChanged()V

    .line 1422
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4200(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 1426
    iget-boolean v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$needDownload:Z

    if-eqz v6, :cond_4

    .line 1427
    iget-wide v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$firstProgressTime:J

    sub-long v4, v0, v6

    .line 1428
    .local v4, "maskAuthorOnScreenDuration":J
    cmp-long v6, v4, v10

    if-ltz v6, :cond_3

    .line 1429
    const-wide/16 v2, 0x0

    .line 1433
    .local v2, "maskAuthorHideDelay":J
    :goto_1
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6, v2, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4300(Lcom/vk/stories/CreateAndEditStoryActivity;J)V

    .line 1439
    .end local v4    # "maskAuthorOnScreenDuration":J
    :goto_2
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$finalMask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v6}, Lcom/vk/masks/model/Mask;->hasHint()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1440
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$finalMask:Lcom/vk/masks/model/Mask;

    const-wide/16 v8, 0x258

    add-long/2addr v8, v2

    invoke-static {v6, v7, v8, v9}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4400(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/masks/model/Mask;J)V

    .line 1444
    :cond_0
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v6

    if-eqz v6, :cond_1

    .line 1445
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4000(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/masks/MasksAnalytics;

    move-result-object v6

    iget v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$sectionId:I

    iget-object v8, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$finalMask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v8}, Lcom/vk/masks/model/Mask;->getFullId()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/vk/masks/MasksAnalytics;->startMaskUsage(ILjava/lang/String;)V

    .line 1446
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2300(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/camera/camera1/Camera1View;

    move-result-object v6

    iget-object v7, p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->resultFile:Ljava/io/File;

    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/vk/camera/camera1/Camera1View;->setEffect(Ljava/lang/String;)Lcom/vk/camera/CameraSurfaceView$Status;

    .line 1449
    :cond_1
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v7, 0x0

    invoke-static {v6, v7}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4502(Lcom/vk/stories/CreateAndEditStoryActivity;Lio/reactivex/disposables/Disposable;)Lio/reactivex/disposables/Disposable;

    .line 1454
    .end local v0    # "downloadStop":J
    .end local v2    # "maskAuthorHideDelay":J
    :goto_3
    return-void

    .line 1412
    :cond_2
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iget-object v7, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->val$finalMask:Lcom/vk/masks/model/Mask;

    invoke-virtual {v6, v7}, Lcom/vk/stories/CreateAndEditStoryActivity;->checkMaskForUpdates(Lcom/vk/masks/model/Mask;)V

    goto :goto_0

    .line 1431
    .restart local v0    # "downloadStop":J
    .restart local v4    # "maskAuthorOnScreenDuration":J
    :cond_3
    sub-long v2, v10, v4

    .restart local v2    # "maskAuthorHideDelay":J
    goto :goto_1

    .line 1435
    .end local v2    # "maskAuthorHideDelay":J
    .end local v4    # "maskAuthorOnScreenDuration":J
    :cond_4
    const-wide/16 v2, 0x0

    .restart local v2    # "maskAuthorHideDelay":J
    goto :goto_2

    .line 1451
    .end local v0    # "downloadStop":J
    .end local v2    # "maskAuthorHideDelay":J
    :cond_5
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vkontakte/android/ui/CircularProgressView;

    move-result-object v6

    iget v7, p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;->progress:F

    invoke-virtual {v6, v7}, Lcom/vkontakte/android/ui/CircularProgressView;->setProgress(F)V

    .line 1452
    iget-object v6, p0, Lcom/vk/stories/CreateAndEditStoryActivity$43;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v6}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$4700(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/os/Handler;

    move-result-object v6

    invoke-virtual {v6, v8}, Landroid/os/Handler;->removeMessages(I)V

    goto :goto_3
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
    .line 1402
    check-cast p1, Lcom/vk/core/network/RxFileDownloader$DownloadEvent;

    invoke-virtual {p0, p1}, Lcom/vk/stories/CreateAndEditStoryActivity$43;->accept(Lcom/vk/core/network/RxFileDownloader$DownloadEvent;)V

    return-void
.end method
