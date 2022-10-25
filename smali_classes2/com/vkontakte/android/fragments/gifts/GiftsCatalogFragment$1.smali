.class Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "GiftsCatalogFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    .prologue
    .line 67
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 70
    const-string/jumbo v5, "gift"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/models/CatalogedGift;

    .line 71
    .local v2, "gift":Lcom/vkontakte/android/api/models/CatalogedGift;
    const-string/jumbo v5, "user_ids"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v4

    .line 74
    .local v4, "user_ids":[I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$000(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 75
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$100(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/GiftCategory;

    .line 76
    .local v1, "category":Lcom/vkontakte/android/api/models/GiftCategory;
    iget-object v6, v1, Lcom/vkontakte/android/api/models/GiftCategory;->cache:Landroid/util/SparseArray;

    if-eqz v6, :cond_0

    iget-object v6, v1, Lcom/vkontakte/android/api/models/GiftCategory;->cache:Landroid/util/SparseArray;

    iget-object v7, v2, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget v7, v7, Lcom/vkontakte/android/api/models/Gift;->id:I

    invoke-virtual {v6, v7}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/CatalogedGift;

    .local v0, "catalogedGift":Lcom/vkontakte/android/api/models/CatalogedGift;
    if-eqz v0, :cond_0

    .line 77
    const/4 v3, 0x0

    .line 78
    .local v3, "notifyAdapter":Z
    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$200(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v5

    if-eqz v5, :cond_1

    invoke-virtual {v0}, Lcom/vkontakte/android/api/models/CatalogedGift;->isStickerPack()Z

    move-result v5

    if-eqz v5, :cond_1

    iget-object v5, p0, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;->access$200(Lcom/vkontakte/android/fragments/gifts/GiftsCatalogFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v5

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v4, v5}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_1

    .line 79
    const/4 v5, 0x1

    iput-boolean v5, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->disabled:Z

    .line 80
    const/4 v3, 0x1

    .line 82
    :cond_1
    iget-object v5, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    if-eqz v5, :cond_3

    .line 83
    iget-object v5, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    array-length v6, v4

    sub-int/2addr v5, v6

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    .line 84
    invoke-virtual {v0}, Lcom/vkontakte/android/api/models/CatalogedGift;->isLimitExpired()Z

    move-result v5

    if-eqz v5, :cond_2

    .line 85
    iget-object v5, v1, Lcom/vkontakte/android/api/models/GiftCategory;->items:Ljava/util/List;

    invoke-interface {v5, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 87
    :cond_2
    const/4 v3, 0x1

    .line 89
    :cond_3
    if-eqz v3, :cond_4

    invoke-virtual {v1}, Lcom/vkontakte/android/api/models/GiftCategory;->getTag()Ljava/lang/Object;

    move-result-object v5

    if-eqz v5, :cond_4

    .line 90
    invoke-virtual {v1}, Lcom/vkontakte/android/api/models/GiftCategory;->getTag()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v5}, Landroid/support/v7/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    .line 96
    .end local v0    # "catalogedGift":Lcom/vkontakte/android/api/models/CatalogedGift;
    .end local v1    # "category":Lcom/vkontakte/android/api/models/GiftCategory;
    .end local v3    # "notifyAdapter":Z
    :cond_4
    return-void
.end method
