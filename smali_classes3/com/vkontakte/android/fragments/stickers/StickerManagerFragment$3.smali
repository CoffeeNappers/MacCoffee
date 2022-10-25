.class Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "StickerManagerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->sendReorder(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

.field final synthetic val$position:I

.field final synthetic val$prevPosition:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;Landroid/app/Fragment;II)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 190
    iput-object p1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->val$position:I

    iput p4, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->val$prevPosition:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 199
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mReorderReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 200
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->access$400(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->val$position:I

    iget v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->val$prevPosition:I

    invoke-static {p0, v1, v2}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;II)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->post(Ljava/lang/Runnable;)Z

    .line 206
    return-void
.end method

.method synthetic lambda$fail$0(II)V
    .locals 2
    .param p1, "position"    # I
    .param p2, "prevPosition"    # I

    .prologue
    .line 202
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v1, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/orm/StickerStockItem;

    .line 203
    .local v0, "item":Lcom/vkontakte/android/data/orm/StickerStockItem;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mActive:Ljava/util/List;

    invoke-interface {v1, p2, v0}, Ljava/util/List;->add(ILjava/lang/Object;)V

    .line 204
    iget-object v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->updateList()V

    .line 205
    return-void
.end method

.method public success()V
    .locals 3

    .prologue
    .line 193
    iget-object v0, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->this$0:Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment;->mReorderReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 194
    invoke-static {}, Lcom/vkontakte/android/stickers/Stickers;->get()Lcom/vkontakte/android/stickers/Stickers;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->val$position:I

    iget v2, p0, Lcom/vkontakte/android/fragments/stickers/StickerManagerFragment$3;->val$prevPosition:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/stickers/Stickers;->swap(II)V

    .line 195
    return-void
.end method
