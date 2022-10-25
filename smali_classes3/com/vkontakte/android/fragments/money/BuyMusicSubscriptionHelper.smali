.class Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;
.super Ljava/lang/Object;
.source "BuyMusicSubscriptionHelper.java"

# interfaces
.implements Lcom/vkontakte/android/ui/ActivityResulter;
.implements Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D::",
        "Lcom/vkontakte/android/data/PurchasesManager$Product;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/ui/ActivityResulter;",
        "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
        "<TD;>;"
    }
.end annotation


# instance fields
.field private manager:Lcom/vkontakte/android/data/PurchasesManager;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<TD;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 13
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$purchase$0(Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;Lcom/vkontakte/android/data/PurchasesManager$Product;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
    .param p2, "d"    # Lcom/vkontakte/android/data/PurchasesManager$Product;

    .prologue
    .line 23
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    invoke-interface {p1, p2}, Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;->onSuccess(Ljava/lang/Object;)V

    .line 24
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->onSuccess(Lcom/vkontakte/android/data/PurchasesManager$Product;)V

    .line 25
    return-void
.end method

.method synthetic lambda$restore$1(Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;Lcom/vkontakte/android/data/PurchasesManager$Product;)V
    .locals 0
    .param p1, "listener"    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
    .param p2, "d"    # Lcom/vkontakte/android/data/PurchasesManager$Product;

    .prologue
    .line 33
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    invoke-interface {p1, p2}, Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;->onSuccess(Ljava/lang/Object;)V

    .line 34
    invoke-virtual {p0, p2}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->onSuccess(Lcom/vkontakte/android/data/PurchasesManager$Product;)V

    .line 35
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 52
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    if-eqz v0, :cond_0

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/data/PurchasesManager;->onActivityResult(IILandroid/content/Intent;)V

    .line 55
    :cond_0
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 39
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    instance-of v0, p1, Lcom/vkontakte/android/ui/ResulterProvider;

    if-eqz v0, :cond_0

    .line 40
    check-cast p1, Lcom/vkontakte/android/ui/ResulterProvider;

    .end local p1    # "activity":Landroid/app/Activity;
    invoke-interface {p1, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 42
    :cond_0
    return-void
.end method

.method public onDetach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 45
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    instance-of v0, p1, Lcom/vkontakte/android/ui/ResulterProvider;

    if-eqz v0, :cond_0

    .line 46
    check-cast p1, Lcom/vkontakte/android/ui/ResulterProvider;

    .end local p1    # "activity":Landroid/app/Activity;
    invoke-interface {p1, p0}, Lcom/vkontakte/android/ui/ResulterProvider;->unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 48
    :cond_0
    return-void
.end method

.method public onSuccess(Lcom/vkontakte/android/data/PurchasesManager$Product;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;)V"
        }
    .end annotation

    .prologue
    .line 59
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    .local p1, "d":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v0}, Lcom/vkontakte/android/NetworkStateReceiver;->updateInfo(Landroid/content/Context;)V

    .line 60
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 13
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    check-cast p1, Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->onSuccess(Lcom/vkontakte/android/data/PurchasesManager$Product;)V

    return-void
.end method

.method public purchase(Landroid/app/Fragment;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 2
    .param p1, "fragment"    # Landroid/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Fragment;",
            "TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    .local p2, "subscription":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p3, "listener":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Lcom/vkontakte/android/data/PurchasesManager;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Fragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    .line 22
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {p0, p3}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/vkontakte/android/data/PurchasesManager;->purchase(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 26
    return-void
.end method

.method public restore(Landroid/app/Fragment;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 2
    .param p1, "fragment"    # Landroid/app/Fragment;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Fragment;",
            "TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;)V"
        }
    .end annotation

    .prologue
    .line 29
    .local p0, "this":Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;, "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper<TD;>;"
    .local p2, "subscription":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p3, "listener":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    if-nez v0, :cond_0

    .line 30
    new-instance v0, Lcom/vkontakte/android/data/PurchasesManager;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Fragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    .line 32
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->manager:Lcom/vkontakte/android/data/PurchasesManager;

    invoke-static {p0, p3}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    move-result-object v1

    invoke-virtual {v0, p2, v1}, Lcom/vkontakte/android/data/PurchasesManager;->restore(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 36
    return-void
.end method
