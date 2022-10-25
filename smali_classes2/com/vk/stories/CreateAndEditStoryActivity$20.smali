.class Lcom/vk/stories/CreateAndEditStoryActivity$20;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->doShare()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$params:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 915
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->val$params:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSuccess(Ljava/io/File;Ljava/io/File;)V
    .locals 3
    .param p1, "overlay1"    # Ljava/io/File;
    .param p2, "videoPreview1"    # Ljava/io/File;

    .prologue
    .line 918
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1800(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 920
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->val$params:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-virtual {v1, p1}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->imageFile(Ljava/io/File;)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .line 921
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->val$params:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-virtual {v1, p2}, Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;->previewFile(Ljava/io/File;)Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    .line 923
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const-class v2, Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 924
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "video_render_params"

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->val$params:Lcom/vk/stories/util/VideoCompressor$VideoCompressorParameters;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 925
    const-string/jumbo v1, "story_upload_param"

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/model/StoryUploadParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 926
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$20;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v2, 0x2

    invoke-virtual {v1, v0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 927
    return-void
.end method
