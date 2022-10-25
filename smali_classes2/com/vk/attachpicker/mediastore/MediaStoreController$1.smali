.class final Lcom/vk/attachpicker/mediastore/MediaStoreController$1;
.super Ljava/lang/Object;
.source "MediaStoreController.java"

# interfaces
.implements Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/mediastore/MediaStoreController;->findPhoto(Landroid/net/Uri;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$entryCallback:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;

.field final synthetic val$uri:Landroid/net/Uri;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;Landroid/net/Uri;)V
    .locals 0

    .prologue
    .line 155
    iput-object p1, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;->val$entryCallback:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;

    iput-object p2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;->val$uri:Landroid/net/Uri;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onLoaded(Ljava/util/ArrayList;)V
    .locals 6
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
    const/4 v5, 0x0

    .line 158
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 159
    :cond_0
    iget-object v2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;->val$entryCallback:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;

    invoke-interface {v2, v5}, Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;->onLoaded(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    .line 170
    :goto_0
    return-void

    .line 162
    :cond_1
    const/4 v2, 0x0

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {v2}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getBucketImages()Ljava/util/ArrayList;

    move-result-object v0

    .line 163
    .local v0, "entries":Ljava/util/List;, "Ljava/util/List<Lcom/vk/attachpicker/mediastore/MediaStoreEntry;>;"
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 164
    .local v1, "entry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    iget-object v3, v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    iget-object v4, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;->val$uri:Landroid/net/Uri;

    invoke-virtual {v3, v4}, Landroid/net/Uri;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 165
    iget-object v2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;->val$entryCallback:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;

    invoke-interface {v2, v1}, Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;->onLoaded(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    goto :goto_0

    .line 169
    .end local v1    # "entry":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    :cond_3
    iget-object v2, p0, Lcom/vk/attachpicker/mediastore/MediaStoreController$1;->val$entryCallback:Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;

    invoke-interface {v2, v5}, Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;->onLoaded(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)V

    goto :goto_0
.end method
