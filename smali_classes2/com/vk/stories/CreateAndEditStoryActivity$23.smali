.class Lcom/vk/stories/CreateAndEditStoryActivity$23;
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
    .line 996
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$23;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 999
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$23;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2200(Lcom/vk/stories/CreateAndEditStoryActivity;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1003
    :goto_0
    return-void

    .line 1002
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$23;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->onBackPressed()V

    goto :goto_0
.end method
