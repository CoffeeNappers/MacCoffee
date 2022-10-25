.class Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "StickerManagerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->setActiveState(Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

.field final synthetic val$activate:Z

.field final synthetic val$item:Lcom/vkontakte/android/data/orm/StickerStockItem;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/app/Fragment;Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 165
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iput-boolean p4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$activate:Z

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 168
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$activate:Z

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/stickers/Stickers;->setActive(Lcom/vkontakte/android/data/orm/StickerStockItem;Z)V

    .line 169
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$activate:Z

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 171
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 176
    :goto_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->updateList()V

    .line 177
    return-void

    .line 173
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 174
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mInactive:Ljava/util/List;

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$2;->val$item:Lcom/vkontakte/android/data/orm/StickerStockItem;

    invoke-interface {v0, v1, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_0
.end method
