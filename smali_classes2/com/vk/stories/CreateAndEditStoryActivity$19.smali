.class Lcom/vk/stories/CreateAndEditStoryActivity$19;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/stories/StoriesProcessor$ImageProcessingCallback;


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


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 879
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$19;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 3

    .prologue
    .line 898
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$19;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1800(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 899
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$19;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 900
    return-void
.end method

.method public onSuccess(Ljava/io/File;)V
    .locals 3
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 882
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$19;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1800(Lcom/vk/stories/CreateAndEditStoryActivity;)V

    .line 884
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$19;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const-class v2, Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 885
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "image_file"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 886
    const-string/jumbo v1, "story_upload_param"

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$19;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1900(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/stories/model/StoryUploadParams;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 887
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$19;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v2, 0x2

    invoke-virtual {v1, v0, v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 889
    invoke-static {}, Lcom/vk/attachpicker/util/Prefs;->storiesPrefs()Lcom/vk/attachpicker/util/Prefs;

    move-result-object v1

    const-string/jumbo v2, "save_stories"

    invoke-virtual {v1, v2}, Lcom/vk/attachpicker/util/Prefs;->getBoolean(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 890
    invoke-static {p1}, Lcom/vk/attachpicker/util/CameraUtils;->savePhotoAsync(Ljava/io/File;)V

    .line 894
    :cond_0
    return-void
.end method
