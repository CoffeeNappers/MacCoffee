.class Lcom/vk/stories/CreateAndEditStoryActivity$18;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


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

.field final synthetic val$future:Lcom/vk/stories/util/VideoCompressor$RenderTask;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/stories/util/VideoCompressor$RenderTask;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 858
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$18;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$18;->val$future:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 1
    .param p1, "dialogInterface"    # Landroid/content/DialogInterface;

    .prologue
    .line 861
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$18;->val$future:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    if-eqz v0, :cond_0

    .line 862
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$18;->val$future:Lcom/vk/stories/util/VideoCompressor$RenderTask;

    invoke-interface {v0}, Lcom/vk/stories/util/VideoCompressor$RenderTask;->cancel()V

    .line 864
    :cond_0
    return-void
.end method
