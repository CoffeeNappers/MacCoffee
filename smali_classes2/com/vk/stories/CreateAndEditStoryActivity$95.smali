.class Lcom/vk/stories/CreateAndEditStoryActivity$95;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->trackEmoji(Z)V
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
    .line 3127
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$95;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-boolean p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$95;->val$isFinal:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 3130
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$95;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->getStickers()Ljava/util/ArrayList;

    move-result-object v2

    .line 3131
    .local v2, "stickers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/stickers/Sticker;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/stickers/Sticker;

    .line 3132
    .local v1, "s":Lcom/vk/attachpicker/stickers/Sticker;
    instance-of v4, v1, Lcom/vk/attachpicker/stickers/BitmapSticker;

    if-eqz v4, :cond_0

    move-object v0, v1

    .line 3133
    check-cast v0, Lcom/vk/attachpicker/stickers/BitmapSticker;

    .line 3134
    .local v0, "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/BitmapSticker;->getMetaInfo()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_0

    .line 3135
    iget-object v3, p0, Lcom/vk/stories/CreateAndEditStoryActivity$95;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v3}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v3

    iget-boolean v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$95;->val$isFinal:Z

    invoke-virtual {v3, v4}, Lcom/vk/attachpicker/EditorAnalytics;->logEmoji(Z)V

    .line 3140
    .end local v0    # "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    .end local v1    # "s":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_1
    return-void
.end method
