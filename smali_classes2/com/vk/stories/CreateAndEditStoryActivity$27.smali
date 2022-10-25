.class Lcom/vk/stories/CreateAndEditStoryActivity$27;
.super Ljava/lang/Object;
.source "CreateAndEditStoryActivity.java"

# interfaces
.implements Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/CreateAndEditStoryActivity;->showLastPhotoVideoIcon()V
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
    .line 1098
    iput-object p1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$27;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoaded(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "mediaStore":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/attachpicker/mediastore/AlbumEntry;>;"
    const/4 v4, 0x0

    .line 1101
    if-eqz p1, :cond_0

    .line 1102
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_0

    .line 1103
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1104
    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1105
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    iget-wide v0, v0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->dateTaken:J

    sub-long v0, v2, v0

    const-wide/32 v2, 0x5265c00

    cmp-long v0, v0, v2

    if-gez v0, :cond_0

    .line 1106
    iget-object v1, p0, Lcom/vk/stories/CreateAndEditStoryActivity$27;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-virtual {p1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v0}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2702(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 1108
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$27;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v4}, Landroid/view/View;->setVisibility(I)V

    .line 1114
    :goto_0
    return-void

    .line 1111
    :cond_0
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$27;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2702(Lcom/vk/stories/CreateAndEditStoryActivity;Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 1112
    iget-object v0, p0, Lcom/vk/stories/CreateAndEditStoryActivity$27;->this$0:Lcom/vk/stories/CreateAndEditStoryActivity;

    invoke-static {v0}, Lcom/vk/stories/CreateAndEditStoryActivity;->access$2800(Lcom/vk/stories/CreateAndEditStoryActivity;)Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
