.class Lcom/vk/stories/CreateAndEditStoryActivity$22;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->initCameraViewPart()V
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
    .line 974
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$22;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 977
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$22;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2100(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 994
    :cond_0
    :goto_0
    return-void

    .line 980
    :cond_1
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$22;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2200(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 983
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$22;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const-class v2, Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 984
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "single_mode"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 985
    const-string/jumbo v1, "media_type"

    const/16 v2, 0x6f

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 986
    const-string/jumbo v1, "camera_enabled"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 987
    const-string/jumbo v1, "prevent_styling_photo"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 988
    const-string/jumbo v1, "prevent_styling_video"

    invoke-virtual {v0, v1, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 989
    const-string/jumbo v1, "big_previews"

    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 990
    const-string/jumbo v1, "only_last_n_milliseconds"

    const-wide/32 v2, 0x5265c00

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 991
    const-string/jumbo v1, "video_max_length_ms"

    const-wide/16 v2, 0x3a98

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 992
    const-string/jumbo v1, "static_header_title"

    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$22;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const v3, 0x7f0807a3

    invoke-virtual {v2, v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 993
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$22;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v1, v0, v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method
