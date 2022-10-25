.class Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "GiftCategoryFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 49
    const-string/jumbo v4, "gift"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/CatalogedGift;

    .line 50
    .local v1, "gift":Lcom/vkontakte/android/api/models/CatalogedGift;
    const-string/jumbo v4, "user_ids"

    invoke-virtual {p2, v4}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v3

    .line 52
    .local v3, "user_ids":[I
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$000(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/api/models/GiftCategory;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/api/models/GiftCategory;->cache:Landroid/util/SparseArray;

    if-eqz v4, :cond_3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$000(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/api/models/GiftCategory;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/api/models/GiftCategory;->cache:Landroid/util/SparseArray;

    iget-object v5, v1, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget v5, v5, Lcom/vkontakte/android/api/models/Gift;->id:I

    invoke-virtual {v4, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/CatalogedGift;

    .local v0, "catalogedGift":Lcom/vkontakte/android/api/models/CatalogedGift;
    if-eqz v0, :cond_3

    .line 53
    const/4 v2, 0x0

    .line 54
    .local v2, "notifyAdapter":Z
    iget-object v4, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v4, v4, Lcom/vkontakte/android/api/models/Gift;->stickers_product_id:Ljava/lang/Integer;

    if-eqz v4, :cond_0

    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$100(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/UserProfile;

    move-result-object v4

    iget v4, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v3, v4}, Ljava/util/Arrays;->binarySearch([II)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    .line 55
    const/4 v4, 0x1

    iput-boolean v4, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->disabled:Z

    .line 56
    const/4 v2, 0x1

    .line 58
    :cond_0
    iget-object v4, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    if-eqz v4, :cond_2

    .line 59
    iget-object v4, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    array-length v5, v3

    sub-int/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    iput-object v4, v0, Lcom/vkontakte/android/api/models/CatalogedGift;->gifts_left:Ljava/lang/Integer;

    .line 60
    invoke-virtual {v0}, Lcom/vkontakte/android/api/models/CatalogedGift;->isLimitExpired()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 61
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$000(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/api/models/GiftCategory;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/api/models/GiftCategory;->items:Ljava/util/List;

    invoke-interface {v4, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 63
    :cond_1
    const/4 v2, 0x1

    .line 65
    :cond_2
    if-eqz v2, :cond_3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$200(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v4

    if-eqz v4, :cond_3

    .line 66
    iget-object v4, p0, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment$1;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;->access$300(Lcom/vkontakte/android/fragments/gifts/GiftCategoryFragment;)Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/base/GridFragment$GridAdapter;->notifyDataSetChanged()V

    .line 69
    .end local v0    # "catalogedGift":Lcom/vkontakte/android/api/models/CatalogedGift;
    .end local v2    # "notifyAdapter":Z
    :cond_3
    return-void
.end method
