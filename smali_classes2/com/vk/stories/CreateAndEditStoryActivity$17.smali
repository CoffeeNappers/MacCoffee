.class Lcom/vk/stories/CreateAndEditStoryActivity$17;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/stories/util/VideoCompressor$CompressDelegate;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->doSave()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$dialog:Landroid/app/ProgressDialog;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 828
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$17;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$17;->val$dialog:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBytes(I)V
    .locals 0
    .param p1, "bytes"    # I

    .prologue
    .line 837
    return-void
.end method

.method public onCancel()V
    .locals 0

    .prologue
    .line 848
    return-void
.end method

.method public onError(Ljava/lang/Exception;)V
    .locals 2
    .param p1, "e"    # Ljava/lang/Exception;

    .prologue
    .line 852
    invoke-static {p1}, Lcom/vk/analytics/Analytics;->logException(Ljava/lang/Throwable;)V

    .line 853
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$17;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v1, 0x7f080762

    invoke-virtual {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 854
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$17;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 855
    return-void
.end method

.method public onFinish(JLjava/io/File;)V
    .locals 2
    .param p1, "time"    # J
    .param p3, "resultFile"    # Ljava/io/File;

    .prologue
    .line 841
    const v0, 0x7f080763

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 842
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$17;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    .line 843
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$17;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, p3, v1}, Lcom/vk/attachpicker/util/CameraUtils;->addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 844
    return-void
.end method

.method public onProgress(I)V
    .locals 1
    .param p1, "progress"    # I

    .prologue
    .line 832
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$17;->val$dialog:Landroid/app/ProgressDialog;

    invoke-virtual {v0, p1}, Landroid/app/ProgressDialog;->setProgress(I)V

    .line 833
    return-void
.end method
