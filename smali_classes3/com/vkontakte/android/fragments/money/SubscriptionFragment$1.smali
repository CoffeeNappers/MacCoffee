.class Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;
.super Ljava/lang/Object;
.source "SubscriptionFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->doLoadData(II)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    .prologue
    .line 91
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 112
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 113
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->access$202(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/api/store/GetSubscription;)Lcom/vkontakte/android/api/store/GetSubscription;

    .line 114
    return-void
.end method

.method synthetic lambda$null$0(Lcom/vkontakte/android/data/Subscription;)V
    .locals 1
    .param p1, "subscription1"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->access$000(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method

.method synthetic lambda$success$1(Lcom/vkontakte/android/data/Subscription;Ljava/lang/String;)Ljava/lang/Void;
    .locals 1
    .param p1, "subscription1"    # Lcom/vkontakte/android/data/Subscription;
    .param p2, "s"    # Ljava/lang/String;

    .prologue
    .line 102
    iput-object p2, p1, Lcom/vkontakte/android/data/Subscription;->priceStr:Ljava/lang/String;

    .line 103
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;Lcom/vkontakte/android/data/Subscription;)Ljava/lang/Runnable;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/ViewUtils;->post(Ljava/lang/Runnable;)V

    .line 104
    const/4 v0, 0x0

    return-object v0
.end method

.method public success(Lcom/vkontakte/android/data/Subscription;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 94
    iget-boolean v1, p1, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    if-nez v1, :cond_0

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v1

    if-nez v1, :cond_1

    .line 95
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-static {v1, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->access$000(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/data/Subscription;)V

    .line 107
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->access$202(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/api/store/GetSubscription;)Lcom/vkontakte/android/api/store/GetSubscription;

    .line 108
    return-void

    .line 97
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->access$100(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;)Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-virtual {v1, v2, p1, v3}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->restore(Landroid/app/Fragment;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 99
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-static {}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1$$Lambda$1;->lambdaFactory$()Lcom/vkontakte/android/functions/F1;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/functions/Functions;->map(Ljava/util/Collection;Lcom/vkontakte/android/functions/F1;)Ljava/util/Map;

    move-result-object v0

    .line 101
    .local v0, "map":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Lcom/vkontakte/android/data/Subscription;>;"
    invoke-static {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;)Lcom/vkontakte/android/functions/F2;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayPricesSubs(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 91
    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;->success(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method
