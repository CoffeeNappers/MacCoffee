.class Lcom/vk/stories/CreateAndEditStoryActivity$94;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->trackStickers(Z)V
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
    .line 3106
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$94;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    iput-boolean p2, p0, Lcom/vk/stories/CreateAndEditStoryActivity$94;->val$isFinal:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 3109
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 3110
    .local v2, "stickerIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$94;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$7700(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/stickers/StickersDrawingView;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/attachpicker/stickers/StickersDrawingView;->getDrawingState()Lcom/vk/attachpicker/stickers/StickersDrawingState;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vk/attachpicker/stickers/StickersDrawingState;->getStickers()Ljava/util/ArrayList;

    move-result-object v3

    .line 3111
    .local v3, "stickers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/stickers/Sticker;>;"
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/stickers/Sticker;

    .line 3112
    .local v1, "s":Lcom/vk/attachpicker/stickers/Sticker;
    instance-of v5, v1, Lcom/vk/attachpicker/stickers/BitmapSticker;

    if-eqz v5, :cond_0

    move-object v0, v1

    .line 3113
    check-cast v0, Lcom/vk/attachpicker/stickers/BitmapSticker;

    .line 3114
    .local v0, "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/BitmapSticker;->getMetaInfo()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_0

    .line 3115
    invoke-virtual {v0}, Lcom/vk/attachpicker/stickers/BitmapSticker;->getMetaInfo()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 3119
    .end local v0    # "bs":Lcom/vk/attachpicker/stickers/BitmapSticker;
    .end local v1    # "s":Lcom/vk/attachpicker/stickers/Sticker;
    :cond_1
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    if-lez v4, :cond_2

    .line 3120
    iget-object v4, p0, Lcom/vk/stories/CreateAndEditStoryActivity$94;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v4}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$1500(Lcom/vk/stories/CreateAndEditStoryActivity;)Lcom/vk/attachpicker/EditorAnalytics;

    move-result-object v4

    iget-boolean v5, p0, Lcom/vk/stories/CreateAndEditStoryActivity$94;->val$isFinal:Z

    invoke-virtual {v4, v2, v5}, Lcom/vk/attachpicker/EditorAnalytics;->logStickers(Ljava/util/Collection;Z)V

    .line 3122
    :cond_2
    return-void
.end method
