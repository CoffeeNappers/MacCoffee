.class Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SubscriptionFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ControlSubscriptionHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/Subscription;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field final textView:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Landroid/content/Context;)V
    .locals 1
    .param p2, "ctx"    # Landroid/content/Context;

    .prologue
    .line 212
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    .line 213
    const v0, 0x7f030207

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 214
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->textView:Landroid/widget/TextView;

    .line 215
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/Subscription;)V
    .locals 2
    .param p1, "o"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 219
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->textView:Landroid/widget/TextView;

    iget-boolean v0, p1, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    if-nez v0, :cond_0

    const v0, 0x7f0803f8

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(I)V

    .line 220
    return-void

    .line 219
    :cond_0
    const v0, 0x7f080180

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 207
    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->onBind(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method

.method public onClick()V
    .locals 5

    .prologue
    .line 224
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Subscription;

    iget-boolean v1, v1, Lcom/vkontakte/android/data/Subscription;->purchased:Z

    if-eqz v1, :cond_0

    .line 225
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 226
    .local v0, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Subscription;

    iget-object v1, v1, Lcom/vkontakte/android/data/Subscription;->management_url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 227
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 237
    .end local v0    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 229
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 230
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment;->access$100(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;)Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/PurchasesManager$Product;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-virtual {v2, v3, v1, v4}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->purchase(Landroid/app/Fragment;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    goto :goto_0

    .line 232
    :cond_1
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 233
    .restart local v0    # "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/data/Subscription;

    iget-object v1, v1, Lcom/vkontakte/android/data/Subscription;->no_inapp_url:Ljava/lang/String;

    invoke-static {v1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 234
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method
