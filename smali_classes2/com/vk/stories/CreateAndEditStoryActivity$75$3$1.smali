.class Lcom/vk/stories/CreateAndEditStoryActivity$75$3$1;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$75$3;->onDismiss(Landroid/content/DialogInterface;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/vk/stories/CreateAndEditStoryActivity$75$3;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$75$3;)V
    .locals 0
    .param p1, "this$2"    # Lcom/vk/stories/CreateAndEditStoryActivity$75$3;

    .prologue
    .line 2131
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3$1;->this$2:Lcom/vk/stories/CreateAndEditStoryActivity$75$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2134
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3$1;->this$2:Lcom/vk/stories/CreateAndEditStoryActivity$75$3;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/TextSticker;->setInEditMode(Z)V

    .line 2135
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3$1;->this$2:Lcom/vk/stories/CreateAndEditStoryActivity$75$3;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75$3;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 2136
    return-void
.end method
