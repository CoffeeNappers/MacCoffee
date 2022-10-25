.class Lcom/vk/stories/CreateAndEditStoryActivity$75$1;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity$75;->onClick(Lcom/vk/attachpicker/stickers/TextSticker;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

.field final synthetic val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity$75;Lcom/vk/attachpicker/stickers/TextSticker;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vk/stories/CreateAndEditStoryActivity$75;

    .prologue
    .line 2092
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iput-object p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 2095
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/TextStickerDialog;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2096
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;->val$textSticker:Lcom/vk/attachpicker/stickers/TextSticker;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/stickers/TextSticker;->setInEditMode(Z)V

    .line 2097
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$75$1;->this$1:Lcom/vk/stories/CreateAndEditStoryActivity$75;

    iget-object v0, v0, Lcom/vk/stories/CreateAndEditStoryActivity$75;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->invalidate()V

    .line 2099
    :cond_0
    return-void
.end method
