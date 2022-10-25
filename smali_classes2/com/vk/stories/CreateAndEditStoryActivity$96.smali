.class Lcom/vk/stories/CreateAndEditStoryActivity$96;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->trackText(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

.field final synthetic val$isFinal:Z


# direct methods
.method constructor <init>(Lcom/vk/stories/CreateAndEditStoryActivity;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/CreateAndEditStoryActivity;

    .prologue
    .line 3145
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$96;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-boolean p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$96;->val$isFinal:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 3148
    iget-object v2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$96;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v2}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->getStickers()Ljava/util/ArrayList;

    move-result-object v1

    .line 3149
    .local v1, "stickers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/stickers/Sticker;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/stickers/Sticker;

    .line 3150
    .local v0, "s":Lcom/vk/attachpicker/stickers/Sticker;
    instance-of v3, v0, Lcom/vk/attachpicker/stickers/TextSticker;

    if-eqz v3, :cond_0

    .line 3151
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$96;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v3

    iget-boolean v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$96;->val$isFinal:Z

    invoke-virtual {v3, v4}, Lcom/vk/attachpicker/EditorAnalytics;->logText(Z)V

    goto :goto_0

    .line 3154
    .end local v0    # "s":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_1
    return-void
.end method
