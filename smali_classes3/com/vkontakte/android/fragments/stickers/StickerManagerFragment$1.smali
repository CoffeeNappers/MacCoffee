.class Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "StickerManagerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/vkontakte/android/data/orm/StickerStockItem;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 130
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 130
    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;->success(Ljava/util/List;)V

    return-void
.end method

.method public success(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/data/orm/StickerStockItem;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 134
    .local p1, "packs":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/data/orm/StickerStockItem;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->access$202(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;

    .line 136
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 137
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 138
    .local v1, "pack":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget-boolean v2, v1, Lcom/vkontakte/android/data/orm/StickerStockItem;->active:Z

    if-eqz v2, :cond_0

    .line 139
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 136
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 141
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 144
    .end local v1    # "pack":Lcom/vkontakte/android/data/orm/StickerStockItem;
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    const/4 v3, 0x0

    invoke-static {v2, p1, v3}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->access$300(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Ljava/util/List;Z)V

    .line 145
    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$1;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->updateList()V

    .line 146
    return-void
.end method
