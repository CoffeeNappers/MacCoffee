.class Lcom/vk/stories/CreateAndEditStoryActivity$16;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;


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


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 798
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$16;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 3

    .prologue
    .line 808
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$16;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1800(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 809
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$16;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 810
    return-void
.end method

.method public onSuccess(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 801
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$16;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1800(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 802
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$16;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Lcom/vk/attachpicker/util/CameraUtils;->addMediaToGallery(Landroid/content/Context;Ljava/io/File;Landroid/media/MediaScannerConnection$OnScanCompletedListener;)V

    .line 803
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$16;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v1, 0x7f0804ab

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 804
    return-void
.end method
