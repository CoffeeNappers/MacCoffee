.class Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;
.super Ljava/lang/Object;
.source "BuyMusicSubscriptionFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->loadStockItemInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/data/Subscription;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    .prologue
    .line 153
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->access$202(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Lcom/vkontakte/android/api/store/GetSubscription;)Lcom/vkontakte/android/api/store/GetSubscription;

    .line 177
    return-void
.end method

.method synthetic lambda$null$0(Ljava/lang/String;)V
    .locals 2
    .param p1, "s"    # Ljava/lang/String;

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->access$100(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Ljava/lang/String;Z)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/data/Subscription;Ljava/lang/String;)Ljava/lang/Void;
    .locals 1
    .param p1, "subscription1"    # Lcom/vkontakte/android/data/Subscription;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 166
    iput-object p2, p1, Lcom/vkontakte/android/data/Subscription;->priceStr:Ljava/lang/String;

    .line 167
    invoke-static {p0, p2}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;Ljava/lang/String;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 168
    const/4 v0, 0x0

    return-object v0
.end method

.method public success(Lcom/vkontakte/android/data/Subscription;)V
    .locals 6
    .param p1, "result"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    const/4 v5, 0x0

    .line 156
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    invoke-static {v2, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->access$002(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Lcom/vkontakte/android/data/Subscription;)Lcom/vkontakte/android/data/Subscription;

    .line 157
    iget-boolean v0, p1, Lcom/vkontakte/android/data/Subscription;->can_purchase:Z

    .line 158
    .local v0, "canBePurchased":Z
    if-nez v0, :cond_0

    .line 159
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    const/4 v3, 0x0

    invoke-static {v2, v5, v3}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->access$100(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Ljava/lang/String;Z)V

    .line 171
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    invoke-static {v2, v5}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->access$202(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Lcom/vkontakte/android/api/store/GetSubscription;)Lcom/vkontakte/android/api/store/GetSubscription;

    .line 172
    return-void

    .line 160
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v2

    if-nez v2, :cond_1

    .line 161
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    iget-object v3, p1, Lcom/vkontakte/android/data/Subscription;->priceStr:Ljava/lang/String;

    const/4 v4, 0x1

    invoke-static {v2, v3, v4}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->access$100(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Ljava/lang/String;Z)V

    goto :goto_0

    .line 163
    :cond_1
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    invoke-static {}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/functions/Functions;->map(Ljava/util/Collection;Lcom/vkontakte/android/functions/F1;)Ljava/util/Map;

    move-result-object v1

    .line 165
    .local v1, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/data/Subscription;>;"
    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;)Lcom/vkontakte/android/functions/F2;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayPricesSubs(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 153
    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->success(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method
