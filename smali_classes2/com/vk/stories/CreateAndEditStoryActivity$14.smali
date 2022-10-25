.class Lcom/vk/stories/CreateAndEditStoryActivity$14;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->enableResultPreview()V
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
    .line 665
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$14;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 668
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$14;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$14;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1600(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/widget/TextureVideoView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/TextureVideoView;->start()V

    .line 669
    :cond_0
    return-void
.end method
