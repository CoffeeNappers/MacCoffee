.class public Lcom/vkontakte/android/data/PurchasesManager;
.super Ljava/lang/Object;
.source "PurchasesManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;,
        Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;,
        Lcom/vkontakte/android/data/PurchasesManager$Result;,
        Lcom/vkontakte/android/data/PurchasesManager$Product;,
        Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D::",
        "Lcom/vkontakte/android/data/PurchasesManager$Product;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field private static final API_VERSION:I = 0x3

.field private static final PRICES_PAGE_SIZE:I = 0x12

.field private static final REQUEST_BUY_VOTES:I = 0x3ea

.field private static final REQUEST_PAY:I = 0x3e9

.field private static final TAG:Ljava/lang/String; = "PurchasesManager"

.field private static final TYPE_INAPP:Ljava/lang/String; = "inapp"

.field private static final TYPE_SUBS:Ljava/lang/String; = "subs"

.field private static mService:Lcom/android/vending/billing/IInAppBillingService;

.field private static mServiceConn:Landroid/content/ServiceConnection;

.field private static mServiceInit:Z

.field private static final mServiceInitMonitor:Ljava/lang/Object;

.field private static sPackage:Ljava/lang/String;


# instance fields
.field private ignoreValidation:Z

.field private final mActivity:Landroid/app/Activity;

.field private final mFragment:Landroid/app/Fragment;

.field private mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TD;"
        }
    .end annotation
.end field

.field private mOnSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 63
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInitMonitor:Ljava/lang/Object;

    .line 65
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInit:Z

    .line 67
    new-instance v0, Lcom/vkontakte/android/data/PurchasesManager$1;

    invoke-direct {v0}, Lcom/vkontakte/android/data/PurchasesManager$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/data/PurchasesManager;->mServiceConn:Landroid/content/ServiceConnection;

    return-void
.end method

.method public constructor <init>(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 199
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Activity;Landroid/app/Fragment;)V

    .line 200
    return-void
.end method

.method private constructor <init>(Landroid/app/Activity;Landroid/app/Fragment;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
    .param p2, "fragment"    # Landroid/app/Fragment;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 206
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 196
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->ignoreValidation:Z

    .line 207
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    .line 208
    iput-object p2, p0, Lcom/vkontakte/android/data/PurchasesManager;->mFragment:Landroid/app/Fragment;

    .line 209
    return-void
.end method

.method public constructor <init>(Landroid/app/Fragment;)V
    .locals 1
    .param p1, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 203
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    invoke-virtual {p1}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/data/PurchasesManager;-><init>(Landroid/app/Activity;Landroid/app/Fragment;)V

    .line 204
    return-void
.end method

.method static synthetic access$002(Lcom/android/vending/billing/IInAppBillingService;)Lcom/android/vending/billing/IInAppBillingService;
    .locals 0
    .param p0, "x0"    # Lcom/android/vending/billing/IInAppBillingService;

    .prologue
    .line 57
    sput-object p0, Lcom/vkontakte/android/data/PurchasesManager;->mService:Lcom/android/vending/billing/IInAppBillingService;

    return-object p0
.end method

.method static synthetic access$100()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 57
    sget-object v0, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInitMonitor:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$202(Z)Z
    .locals 0
    .param p0, "x0"    # Z

    .prologue
    .line 57
    sput-boolean p0, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInit:Z

    return p0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/data/PurchasesManager;)Landroid/app/Activity;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/data/PurchasesManager;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/data/PurchasesManager;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mOnSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/data/PurchasesManager;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/PurchasesManager;
    .param p1, "x1"    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mOnSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    return-object p1
.end method

.method static synthetic access$500(Lcom/vkontakte/android/data/PurchasesManager;)Lcom/vkontakte/android/data/PurchasesManager$Product;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/data/PurchasesManager;

    .prologue
    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;

    return-object v0
.end method

.method static synthetic access$502(Lcom/vkontakte/android/data/PurchasesManager;Lcom/vkontakte/android/data/PurchasesManager$Product;)Lcom/vkontakte/android/data/PurchasesManager$Product;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/PurchasesManager;
    .param p1, "x1"    # Lcom/vkontakte/android/data/PurchasesManager$Product;

    .prologue
    .line 57
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;

    return-object p1
.end method

.method static synthetic access$600(Lcom/vkontakte/android/data/PurchasesManager;I)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/PurchasesManager;
    .param p1, "x1"    # I

    .prologue
    .line 57
    invoke-direct {p0, p1}, Lcom/vkontakte/android/data/PurchasesManager;->showNotEnoughVotesDialog(I)V

    return-void
.end method

.method static synthetic access$700(Lcom/vkontakte/android/data/PurchasesManager;Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/data/PurchasesManager;
    .param p1, "x1"    # Lcom/android/vending/billing/IInAppBillingService;
    .param p2, "x2"    # I
    .param p3, "x3"    # Ljava/lang/String;
    .param p4, "x4"    # Ljava/lang/String;
    .param p5, "x5"    # Ljava/lang/String;
    .param p6, "x6"    # Landroid/app/ProgressDialog;

    .prologue
    .line 57
    invoke-direct/range {p0 .. p6}, Lcom/vkontakte/android/data/PurchasesManager;->consumePurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    return-void
.end method

.method public static canUseInApps()Z
    .locals 1

    .prologue
    .line 116
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->isPlayStoreInstalled()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->hasGoogleAccount()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private consumePurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V
    .locals 9
    .param p1, "service"    # Lcom/android/vending/billing/IInAppBillingService;
    .param p2, "id"    # I
    .param p3, "orderId"    # Ljava/lang/String;
    .param p4, "productId"    # Ljava/lang/String;
    .param p5, "token"    # Ljava/lang/String;
    .param p6, "progress"    # Landroid/app/ProgressDialog;

    .prologue
    .line 453
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    new-instance v0, Lcom/vkontakte/android/api/store/StorePurchase;

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-interface {v1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getType()Ljava/lang/String;

    move-result-object v5

    move v1, p2

    move-object v2, p4

    move-object v3, p3

    move-object v4, p5

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/store/StorePurchase;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    iget-boolean v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->ignoreValidation:Z

    .line 454
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/StorePurchase;->ignoreValidation(Z)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 455
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->toObservable()Lio/reactivex/Observable;

    move-result-object v8

    .line 456
    .local v8, "observable":Lio/reactivex/Observable;, "Lio/reactivex/Observable<Lcom/vkontakte/android/data/PurchasesManager$Result;>;"
    new-instance v0, Lcom/vkontakte/android/data/PurchasesManager$4;

    move-object v1, p0

    move-object v2, p1

    move v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/data/PurchasesManager$4;-><init>(Lcom/vkontakte/android/data/PurchasesManager;Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    new-instance v1, Lcom/vkontakte/android/data/PurchasesManager$5;

    invoke-direct {v1, p0, p6}, Lcom/vkontakte/android/data/PurchasesManager$5;-><init>(Lcom/vkontakte/android/data/PurchasesManager;Landroid/app/ProgressDialog;)V

    invoke-virtual {v8, v0, v1}, Lio/reactivex/Observable;->subscribe(Lio/reactivex/functions/Consumer;Lio/reactivex/functions/Consumer;)Lio/reactivex/disposables/Disposable;

    .line 495
    return-void
.end method

.method private finishPurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 7
    .param p1, "service"    # Lcom/android/vending/billing/IInAppBillingService;
    .param p2, "id"    # I
    .param p3, "orderId"    # Ljava/lang/String;
    .param p4, "productId"    # Ljava/lang/String;
    .param p5, "token"    # Ljava/lang/String;

    .prologue
    .line 445
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    new-instance v6, Landroid/app/ProgressDialog;

    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v6, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 446
    .local v6, "progress":Landroid/app/ProgressDialog;
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v1, 0x7f080175

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 447
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 448
    invoke-virtual {v6}, Landroid/app/ProgressDialog;->show()V

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v5, p5

    .line 449
    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/data/PurchasesManager;->consumePurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V

    .line 450
    return-void
.end method

.method public static getGooglePlayPrices(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Product:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TProduct;>;",
            "Lcom/vkontakte/android/functions/F2",
            "<",
            "Ljava/lang/Void;",
            "TProduct;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "products":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TProduct;>;"
    .local p1, "setter":Lcom/vkontakte/android/functions/F2;, "Lcom/vkontakte/android/functions/F2<Ljava/lang/Void;TProduct;Ljava/lang/String;>;"
    const-string/jumbo v0, "inapp"

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayPrices(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;Ljava/lang/String;)V

    .line 127
    return-void
.end method

.method private static getGooglePlayPrices(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;Ljava/lang/String;)V
    .locals 7
    .param p2, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Product:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TProduct;>;",
            "Lcom/vkontakte/android/functions/F2",
            "<",
            "Ljava/lang/Void;",
            "TProduct;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 134
    .local p0, "products":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TProduct;>;"
    .local p1, "setter":Lcom/vkontakte/android/functions/F2;, "Lcom/vkontakte/android/functions/F2<Ljava/lang/Void;TProduct;Ljava/lang/String;>;"
    new-instance v2, Ljava/util/ArrayList;

    new-instance v5, Ljava/util/LinkedHashMap;

    invoke-direct {v5, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    invoke-virtual {v5}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 136
    .local v2, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    div-int/lit8 v6, v5, 0x12

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v5

    rem-int/lit8 v5, v5, 0x12

    if-nez v5, :cond_0

    const/4 v5, 0x0

    :goto_0
    add-int v3, v6, v5

    .line 137
    .local v3, "iterations":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    if-ge v1, v3, :cond_1

    .line 138
    mul-int/lit8 v4, v1, 0x12

    .line 139
    .local v4, "start":I
    add-int/lit8 v5, v1, 0x1

    mul-int/lit8 v5, v5, 0x12

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v6

    invoke-static {v5, v6}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 140
    .local v0, "end":I
    new-instance v5, Ljava/util/ArrayList;

    invoke-virtual {v2, v4, v0}, Ljava/util/ArrayList;->subList(II)Ljava/util/List;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p0, v5, p1, p2}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayPrices(Ljava/util/Map;Ljava/util/ArrayList;Lcom/vkontakte/android/functions/F2;Ljava/lang/String;)V

    .line 137
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 136
    .end local v0    # "end":I
    .end local v1    # "i":I
    .end local v3    # "iterations":I
    .end local v4    # "start":I
    :cond_0
    const/4 v5, 0x1

    goto :goto_0

    .line 143
    .restart local v1    # "i":I
    .restart local v3    # "iterations":I
    :cond_1
    return-void
.end method

.method private static getGooglePlayPrices(Ljava/util/Map;Ljava/util/ArrayList;Lcom/vkontakte/android/functions/F2;Ljava/lang/String;)V
    .locals 12
    .param p3, "type"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Product:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TProduct;>;",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Lcom/vkontakte/android/functions/F2",
            "<",
            "Ljava/lang/Void;",
            "TProduct;",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .prologue
    .line 147
    .local p0, "products":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TProduct;>;"
    .local p1, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .local p2, "setter":Lcom/vkontakte/android/functions/F2;, "Lcom/vkontakte/android/functions/F2<Ljava/lang/Void;TProduct;Ljava/lang/String;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 148
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v9, "ITEM_ID_LIST"

    invoke-virtual {v0, v9, p1}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 149
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayService()Lcom/android/vending/billing/IInAppBillingService;

    move-result-object v3

    .line 152
    .local v3, "gps":Lcom/android/vending/billing/IInAppBillingService;
    if-eqz v3, :cond_1

    const/4 v9, 0x3

    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v3, v9, v10, p3}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result v9

    if-nez v9, :cond_1

    .line 153
    const/4 v9, 0x3

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v3, v9, v10, p3, v0}, Lcom/android/vending/billing/IInAppBillingService;->getSkuDetails(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)Landroid/os/Bundle;

    move-result-object v1

    .line 155
    .local v1, "details":Landroid/os/Bundle;
    const-string/jumbo v9, "RESPONSE_CODE"

    invoke-virtual {v1, v9}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    .line 156
    .local v5, "responseCode":I
    if-nez v5, :cond_1

    .line 157
    const-string/jumbo v9, "DETAILS_LIST"

    invoke-virtual {v1, v9}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 158
    .local v6, "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_0
    :goto_0
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 159
    .local v8, "thisResponse":Ljava/lang/String;
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 161
    .local v4, "object":Lorg/json/JSONObject;
    const-string/jumbo v10, "productId"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    .line 162
    .local v7, "sku":Ljava/lang/String;
    if-eqz v7, :cond_0

    .line 163
    invoke-interface {p0, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    const-string/jumbo v11, "price"

    invoke-virtual {v4, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-interface {p2, v10, v11}, Lcom/vkontakte/android/functions/F2;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 168
    .end local v1    # "details":Landroid/os/Bundle;
    .end local v4    # "object":Lorg/json/JSONObject;
    .end local v5    # "responseCode":I
    .end local v6    # "responseList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v7    # "sku":Ljava/lang/String;
    .end local v8    # "thisResponse":Ljava/lang/String;
    :catch_0
    move-exception v2

    .line 169
    .local v2, "e":Ljava/lang/Exception;
    const-string/jumbo v9, "VKApplication"

    const-string/jumbo v10, "#getGooglePlayPrices(): Error appkit_loading prices from Google Play"

    invoke-static {v9, v10, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 171
    .end local v2    # "e":Ljava/lang/Exception;
    :cond_1
    return-void
.end method

.method public static getGooglePlayPricesSubs(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<Product:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "TProduct;>;",
            "Lcom/vkontakte/android/functions/F2",
            "<",
            "Ljava/lang/Void;",
            "TProduct;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 130
    .local p0, "products":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;TProduct;>;"
    .local p1, "setter":Lcom/vkontakte/android/functions/F2;, "Lcom/vkontakte/android/functions/F2<Ljava/lang/Void;TProduct;Ljava/lang/String;>;"
    const-string/jumbo v0, "subs"

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayPrices(Ljava/util/Map;Lcom/vkontakte/android/functions/F2;Ljava/lang/String;)V

    .line 131
    return-void
.end method

.method private static getGooglePlayService()Lcom/android/vending/billing/IInAppBillingService;
    .locals 3

    .prologue
    .line 174
    sget-boolean v1, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInit:Z

    if-eqz v1, :cond_1

    .line 175
    sget-object v2, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInitMonitor:Ljava/lang/Object;

    monitor-enter v2

    .line 176
    .local v0, "e":Ljava/lang/InterruptedException;
    :goto_0
    :try_start_0
    sget-boolean v1, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInit:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    .line 178
    :try_start_1
    sget-object v1, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInitMonitor:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 179
    :catch_0
    move-exception v0

    .line 180
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    goto :goto_0

    .line 183
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 185
    :cond_1
    sget-object v1, Lcom/vkontakte/android/data/PurchasesManager;->mService:Lcom/android/vending/billing/IInAppBillingService;

    return-object v1
.end method

.method public static getPackage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 189
    sget-object v0, Lcom/vkontakte/android/data/PurchasesManager;->sPackage:Ljava/lang/String;

    return-object v0
.end method

.method private static hasGoogleAccount()Z
    .locals 3

    .prologue
    .line 110
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-static {v2}, Landroid/accounts/AccountManager;->get(Landroid/content/Context;)Landroid/accounts/AccountManager;

    move-result-object v1

    .line 111
    .local v1, "am":Landroid/accounts/AccountManager;
    const-string/jumbo v2, "com.google"

    invoke-virtual {v1, v2}, Landroid/accounts/AccountManager;->getAccountsByType(Ljava/lang/String;)[Landroid/accounts/Account;

    move-result-object v0

    .line 112
    .local v0, "accounts":[Landroid/accounts/Account;
    array-length v2, v0

    if-lez v2, :cond_0

    const/4 v2, 0x1

    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static init(Landroid/content/Context;)V
    .locals 7
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 88
    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 89
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "com.android.vending"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 90
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v1, v5}, Landroid/content/pm/PackageManager;->queryIntentServices(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object v0

    .line 91
    .local v0, "info":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ResolveInfo;>;"
    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_0

    .line 92
    sput-boolean v6, Lcom/vkontakte/android/data/PurchasesManager;->mServiceInit:Z

    .line 93
    new-instance v3, Landroid/content/ComponentName;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v4, v2, Landroid/content/pm/ServiceInfo;->packageName:Ljava/lang/String;

    invoke-interface {v0, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ResolveInfo;

    iget-object v2, v2, Landroid/content/pm/ResolveInfo;->serviceInfo:Landroid/content/pm/ServiceInfo;

    iget-object v2, v2, Landroid/content/pm/ServiceInfo;->name:Ljava/lang/String;

    invoke-direct {v3, v4, v2}, Landroid/content/ComponentName;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 94
    sget-object v2, Lcom/vkontakte/android/data/PurchasesManager;->mServiceConn:Landroid/content/ServiceConnection;

    invoke-virtual {p0, v1, v2, v6}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 97
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    sput-object v2, Lcom/vkontakte/android/data/PurchasesManager;->sPackage:Ljava/lang/String;

    .line 98
    return-void
.end method

.method private static isPlayStoreInstalled()Z
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 101
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const-string/jumbo v3, "com.android.vending"

    invoke-static {v2, v3}, Lcom/vkontakte/android/Global;->isAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 106
    .local v0, "intent":Landroid/content/Intent;
    :cond_0
    :goto_0
    return v1

    .line 104
    .end local v0    # "intent":Landroid/content/Intent;
    :cond_1
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "com.android.vending.billing.InAppBillingService.BIND"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 105
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v2, "com.android.vending"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 106
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    invoke-virtual {v2, v0, v1}, Landroid/content/pm/PackageManager;->resolveService(Landroid/content/Intent;I)Landroid/content/pm/ResolveInfo;

    move-result-object v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0
.end method

.method private processRestore(Lcom/android/vending/billing/IInAppBillingService;)V
    .locals 16
    .param p1, "service"    # Lcom/android/vending/billing/IInAppBillingService;

    .prologue
    .line 420
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    new-instance v7, Landroid/app/ProgressDialog;

    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v7, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 421
    .local v7, "progress":Landroid/app/ProgressDialog;
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v7, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 422
    const/4 v1, 0x0

    invoke-virtual {v7, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 423
    invoke-virtual {v7}, Landroid/app/ProgressDialog;->show()V

    .line 426
    const/4 v1, 0x3

    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v14, "inapp"

    const/4 v15, 0x0

    move-object/from16 v0, p1

    invoke-interface {v0, v1, v2, v14, v15}, Lcom/android/vending/billing/IInAppBillingService;->getPurchases(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v12

    .line 427
    .local v12, "info":Landroid/os/Bundle;
    const-string/jumbo v1, "INAPP_PURCHASE_DATA_LIST"

    invoke-virtual {v12, v1}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v9

    .line 429
    .local v9, "dataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v1, 0x0

    invoke-virtual {v9, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 430
    .local v8, "data":Ljava/lang/String;
    new-instance v13, Lorg/json/JSONObject;

    invoke-direct {v13, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 431
    .local v13, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v1, "developerPayload"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 432
    .local v10, "dp":Ljava/lang/String;
    const-string/jumbo v1, "purchaseToken"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 433
    .local v6, "token":Ljava/lang/String;
    const-string/jumbo v1, "orderId"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 434
    .local v4, "orderId":Ljava/lang/String;
    const-string/jumbo v1, "productId"

    invoke-virtual {v13, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 435
    .local v5, "productId":Ljava/lang/String;
    const-string/jumbo v1, ","

    invoke-virtual {v10, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    aget-object v1, v1, v2

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    .local v3, "id":I
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    .line 436
    invoke-direct/range {v1 .. v7}, Lcom/vkontakte/android/data/PurchasesManager;->consumePurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 442
    .end local v3    # "id":I
    .end local v4    # "orderId":Ljava/lang/String;
    .end local v5    # "productId":Ljava/lang/String;
    .end local v6    # "token":Ljava/lang/String;
    .end local v8    # "data":Ljava/lang/String;
    .end local v9    # "dataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v10    # "dp":Ljava/lang/String;
    .end local v12    # "info":Landroid/os/Bundle;
    .end local v13    # "jsonObject":Lorg/json/JSONObject;
    :goto_0
    return-void

    .line 437
    :catch_0
    move-exception v11

    .line 438
    .local v11, "e":Ljava/lang/Exception;
    const-string/jumbo v1, "PurchasesManager"

    const-string/jumbo v2, "Error during restore inapp #processRestore"

    invoke-static {v1, v2, v11}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 439
    move-object/from16 v0, p0

    iget-object v1, v0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v2, 0x7f080201

    const/4 v14, 0x0

    invoke-static {v1, v2, v14}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 440
    invoke-static {v7}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    goto :goto_0
.end method

.method private processRestoreSubs(Lcom/android/vending/billing/IInAppBillingService;Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;)V
    .locals 9
    .param p1, "service"    # Lcom/android/vending/billing/IInAppBillingService;
    .param p2, "purchasedData"    # Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    const/4 v8, 0x0

    .line 405
    new-instance v6, Landroid/app/ProgressDialog;

    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v6, v0}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 406
    .local v6, "progress":Landroid/app/ProgressDialog;
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v1, 0x7f08033d

    invoke-virtual {v0, v1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 407
    invoke-virtual {v6, v8}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 408
    invoke-virtual {v6}, Landroid/app/ProgressDialog;->show()V

    .line 411
    :try_start_0
    invoke-virtual {p2}, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->getId()I

    move-result v2

    iget-object v3, p2, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->orderId:Ljava/lang/String;

    iget-object v4, p2, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->productId:Ljava/lang/String;

    iget-object v5, p2, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->purchaseToken:Ljava/lang/String;

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/data/PurchasesManager;->consumePurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Landroid/app/ProgressDialog;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 417
    :goto_0
    return-void

    .line 413
    :catch_0
    move-exception v7

    .line 414
    .local v7, "e":Ljava/lang/Exception;
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v1, 0x7f080201

    invoke-static {v0, v1, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 415
    invoke-static {v6}, Lcom/vkontakte/android/ViewUtils;->dismissDialogSafety(Landroid/app/Dialog;)V

    goto :goto_0
.end method

.method private purchaseFreeItem(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 6
    .param p1    # Lcom/vkontakte/android/data/PurchasesManager$Product;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    .local p1, "product":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p2, "onSuccess":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    const/4 v2, 0x0

    .line 268
    new-instance v0, Lcom/vkontakte/android/api/store/StorePurchase;

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getId()I

    move-result v1

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getType()Ljava/lang/String;

    move-result-object v5

    move-object v3, v2

    move-object v4, v2

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/api/store/StorePurchase;-><init>(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/data/PurchasesManager$2;

    iget-object v2, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/vkontakte/android/data/PurchasesManager$2;-><init>(Lcom/vkontakte/android/data/PurchasesManager;Landroid/content/Context;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 269
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/StorePurchase;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    .line 289
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    .line 290
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 291
    return-void
.end method

.method private purchaseFromBalance(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 4
    .param p1    # Lcom/vkontakte/android/data/PurchasesManager$Product;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;)V"
        }
    .end annotation

    .prologue
    .line 294
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    .local p1, "product":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p2, "onSuccess":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    new-instance v0, Lcom/vkontakte/android/api/store/StoreBuyProduct;

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getId()I

    move-result v1

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getType()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getRefer()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/store/StoreBuyProduct;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/data/PurchasesManager$3;

    iget-object v2, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v1, p0, v2, p1, p2}, Lcom/vkontakte/android/data/PurchasesManager$3;-><init>(Lcom/vkontakte/android/data/PurchasesManager;Landroid/content/Context;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 295
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/StoreBuyProduct;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    .line 324
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    .line 325
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 326
    return-void
.end method

.method private purchaseInapp(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 12
    .param p1    # Lcom/vkontakte/android/data/PurchasesManager$Product;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;)V"
        }
    .end annotation

    .prologue
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    .local p1, "product":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p2, "onSuccess":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    const/4 v11, 0x0

    .line 382
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayService()Lcom/android/vending/billing/IInAppBillingService;

    move-result-object v0

    .line 383
    .local v0, "service":Lcom/android/vending/billing/IInAppBillingService;
    const/4 v1, 0x3

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "inapp"

    invoke-interface {v0, v1, v2, v3}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result v1

    if-nez v1, :cond_1

    .line 384
    const/4 v1, 0x3

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getMerchantProductId()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "inapp"

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getDeveloperPayload()Ljava/lang/String;

    move-result-object v5

    invoke-interface/range {v0 .. v5}, Lcom/android/vending/billing/IInAppBillingService;->getBuyIntent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v8

    .line 385
    .local v8, "buyIntent":Landroid/os/Bundle;
    const-string/jumbo v1, "RESPONSE_CODE"

    invoke-virtual {v8, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v9

    .line 387
    .local v9, "code":I
    iput-object p1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;

    .line 388
    iput-object p2, p0, Lcom/vkontakte/android/data/PurchasesManager;->mOnSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    .line 390
    const/4 v1, 0x7

    if-ne v9, v1, :cond_0

    .line 391
    invoke-direct {p0, v0}, Lcom/vkontakte/android/data/PurchasesManager;->processRestore(Lcom/android/vending/billing/IInAppBillingService;)V

    .line 402
    .end local v0    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .end local v8    # "buyIntent":Landroid/os/Bundle;
    .end local v9    # "code":I
    :goto_0
    return-void

    .line 393
    .restart local v0    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .restart local v8    # "buyIntent":Landroid/os/Bundle;
    .restart local v9    # "code":I
    :cond_0
    const-string/jumbo v1, "BUY_INTENT"

    invoke-virtual {v8, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v1

    check-cast v1, Landroid/app/PendingIntent;

    invoke-virtual {v1}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v2

    const/16 v3, 0x3e9

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v1, p0

    invoke-direct/range {v1 .. v7}, Lcom/vkontakte/android/data/PurchasesManager;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 398
    .end local v0    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .end local v8    # "buyIntent":Landroid/os/Bundle;
    .end local v9    # "code":I
    :catch_0
    move-exception v10

    .line 399
    .local v10, "e":Ljava/lang/Exception;
    :goto_1
    const-string/jumbo v1, "PurchasesManager"

    const-string/jumbo v2, "Error starting inapp #purchaseInapp"

    invoke-static {v1, v2, v10}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 400
    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v2, 0x7f080201

    invoke-static {v1, v2, v11}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 396
    .end local v10    # "e":Ljava/lang/Exception;
    .restart local v0    # "service":Lcom/android/vending/billing/IInAppBillingService;
    :cond_1
    :try_start_1
    new-instance v1, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;

    invoke-direct {v1}, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;-><init>()V

    throw v1
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_1 .. :try_end_1} :catch_2

    .line 398
    .end local v0    # "service":Lcom/android/vending/billing/IInAppBillingService;
    :catch_1
    move-exception v10

    goto :goto_1

    :catch_2
    move-exception v10

    goto :goto_1
.end method

.method private purchaseSubs(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;Z)V
    .locals 23
    .param p1    # Lcom/vkontakte/android/data/PurchasesManager$Product;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "restoreOnly"    # Z
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;Z)V"
        }
    .end annotation

    .prologue
    .line 330
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    .local p1, "product":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p2, "onSuccess":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    :try_start_0
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayService()Lcom/android/vending/billing/IInAppBillingService;

    move-result-object v2

    .line 331
    .local v2, "service":Lcom/android/vending/billing/IInAppBillingService;
    if-eqz v2, :cond_7

    const/4 v3, 0x3

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "subs"

    invoke-interface {v2, v3, v4, v5}, Lcom/android/vending/billing/IInAppBillingService;->isBillingSupported(ILjava/lang/String;Ljava/lang/String;)I

    move-result v3

    if-nez v3, :cond_7

    .line 332
    const/16 v21, 0x0

    .line 333
    .local v21, "purchasedItem":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    new-instance v20, Ljava/util/ArrayList;

    invoke-direct/range {v20 .. v20}, Ljava/util/ArrayList;-><init>()V

    .line 334
    .local v20, "purchasedData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;>;"
    const/4 v13, 0x0

    .line 336
    .local v13, "continueToken":Ljava/lang/String;
    :cond_0
    const/4 v3, 0x3

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "subs"

    invoke-interface {v2, v3, v4, v5, v13}, Lcom/android/vending/billing/IInAppBillingService;->getPurchases(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v10

    .line 337
    .local v10, "bundle":Landroid/os/Bundle;
    const-string/jumbo v3, "INAPP_PURCHASE_ITEM_LIST"

    invoke-virtual {v10, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v19

    .line 338
    .local v19, "purchaseItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v3, "INAPP_PURCHASE_DATA_LIST"

    invoke-virtual {v10, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v18

    .line 339
    .local v18, "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v3, "INAPP_DATA_SIGNATURE_LIST"

    invoke-virtual {v10, v3}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v22

    .line 340
    .local v22, "signatures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz v19, :cond_2

    if-eqz v18, :cond_2

    if-eqz v22, :cond_2

    .line 341
    const/16 v16, 0x0

    .local v16, "i":I
    :goto_0
    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_0 .. :try_end_0} :catch_3

    move-result v3

    move/from16 v0, v16

    if-ge v0, v3, :cond_2

    .line 343
    :try_start_1
    new-instance v5, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;

    move-object/from16 v0, v18

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    move-object/from16 v0, v22

    move/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-direct {v5, v3, v4}, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object/from16 v0, v20

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_1 .. :try_end_1} :catch_3

    .line 341
    :goto_1
    add-int/lit8 v16, v16, 0x1

    goto :goto_0

    .line 344
    :catch_0
    move-exception v15

    .line 345
    .local v15, "e":Ljava/lang/Exception;
    const/4 v3, 0x0

    :try_start_2
    new-array v3, v3, [Ljava/lang/Object;

    invoke-static {v15, v3}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_2 .. :try_end_2} :catch_3

    goto :goto_1

    .line 374
    .end local v2    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .end local v10    # "bundle":Landroid/os/Bundle;
    .end local v13    # "continueToken":Ljava/lang/String;
    .end local v15    # "e":Ljava/lang/Exception;
    .end local v16    # "i":I
    .end local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v19    # "purchaseItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v20    # "purchasedData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;>;"
    .end local v21    # "purchasedItem":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    .end local v22    # "signatures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_1
    move-exception v15

    .line 375
    .restart local v15    # "e":Ljava/lang/Exception;
    :goto_2
    const-string/jumbo v3, "PurchasesManager"

    const-string/jumbo v4, "Error starting inapp #purchaseInapp"

    invoke-static {v3, v4, v15}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 376
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v4, 0x7f080201

    const/4 v5, 0x0

    invoke-static {v3, v4, v5}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v3

    invoke-virtual {v3}, Landroid/widget/Toast;->show()V

    .line 378
    .end local v15    # "e":Ljava/lang/Exception;
    :cond_1
    :goto_3
    return-void

    .line 349
    .restart local v2    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .restart local v10    # "bundle":Landroid/os/Bundle;
    .restart local v13    # "continueToken":Ljava/lang/String;
    .restart local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v19    # "purchaseItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v20    # "purchasedData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;>;"
    .restart local v21    # "purchasedItem":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    .restart local v22    # "signatures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_2
    :try_start_3
    const-string/jumbo v3, "INAPP_CONTINUATION_TOKEN"

    invoke-virtual {v10, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    .line 350
    invoke-static {v13}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 352
    invoke-virtual/range {v20 .. v20}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;

    .line 353
    .local v14, "data":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    invoke-virtual {v14}, Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;->getId()I

    move-result v17

    .line 354
    .local v17, "id":I
    invoke-interface/range {p1 .. p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getId()I

    move-result v4

    move/from16 v0, v17

    if-ne v0, v4, :cond_3

    .line 355
    move-object/from16 v21, v14

    .line 360
    .end local v14    # "data":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    .end local v17    # "id":I
    :cond_4
    const/4 v3, 0x3

    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getPackage()Ljava/lang/String;

    move-result-object v4

    invoke-interface/range {p1 .. p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getMerchantProductId()Ljava/lang/String;

    move-result-object v5

    const-string/jumbo v6, "subs"

    invoke-interface/range {p1 .. p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getDeveloperPayload()Ljava/lang/String;

    move-result-object v7

    invoke-interface/range {v2 .. v7}, Lcom/android/vending/billing/IInAppBillingService;->getBuyIntent(ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v11

    .line 361
    .local v11, "buyIntent":Landroid/os/Bundle;
    const-string/jumbo v3, "RESPONSE_CODE"

    invoke-virtual {v11, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v12

    .line 363
    .local v12, "code":I
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/data/PurchasesManager;->mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;

    .line 364
    move-object/from16 v0, p2

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/data/PurchasesManager;->mOnSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    .line 366
    if-nez v21, :cond_5

    const/4 v3, 0x7

    if-ne v12, v3, :cond_6

    .line 367
    :cond_5
    move-object/from16 v0, p0

    move-object/from16 v1, v21

    invoke-direct {v0, v2, v1}, Lcom/vkontakte/android/data/PurchasesManager;->processRestoreSubs(Lcom/android/vending/billing/IInAppBillingService;Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;)V

    goto :goto_3

    .line 374
    .end local v2    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .end local v10    # "bundle":Landroid/os/Bundle;
    .end local v11    # "buyIntent":Landroid/os/Bundle;
    .end local v12    # "code":I
    .end local v13    # "continueToken":Ljava/lang/String;
    .end local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v19    # "purchaseItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v20    # "purchasedData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;>;"
    .end local v21    # "purchasedItem":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    .end local v22    # "signatures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_2
    move-exception v15

    goto :goto_2

    .line 368
    .restart local v2    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .restart local v10    # "bundle":Landroid/os/Bundle;
    .restart local v11    # "buyIntent":Landroid/os/Bundle;
    .restart local v12    # "code":I
    .restart local v13    # "continueToken":Ljava/lang/String;
    .restart local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v19    # "purchaseItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v20    # "purchasedData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;>;"
    .restart local v21    # "purchasedItem":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    .restart local v22    # "signatures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_6
    if-nez p3, :cond_1

    .line 369
    const-string/jumbo v3, "BUY_INTENT"

    invoke-virtual {v11, v3}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Landroid/app/PendingIntent;

    invoke-virtual {v3}, Landroid/app/PendingIntent;->getIntentSender()Landroid/content/IntentSender;

    move-result-object v4

    const/16 v5, 0x3e9

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object/from16 v3, p0

    invoke-direct/range {v3 .. v9}, Lcom/vkontakte/android/data/PurchasesManager;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V

    goto :goto_3

    .line 374
    .end local v2    # "service":Lcom/android/vending/billing/IInAppBillingService;
    .end local v10    # "bundle":Landroid/os/Bundle;
    .end local v11    # "buyIntent":Landroid/os/Bundle;
    .end local v12    # "code":I
    .end local v13    # "continueToken":Ljava/lang/String;
    .end local v18    # "purchaseDataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v19    # "purchaseItemList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v20    # "purchasedData":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;>;"
    .end local v21    # "purchasedItem":Lcom/vkontakte/android/data/PurchasesManager$PurchasedData;
    .end local v22    # "signatures":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_3
    move-exception v15

    goto/16 :goto_2

    .line 372
    .restart local v2    # "service":Lcom/android/vending/billing/IInAppBillingService;
    :cond_7
    new-instance v3, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;

    invoke-direct {v3}, Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException;-><init>()V

    throw v3
    :try_end_3
    .catch Landroid/os/RemoteException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Lcom/vkontakte/android/data/PurchasesManager$PayNotAvailableException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Landroid/content/IntentSender$SendIntentException; {:try_start_3 .. :try_end_3} :catch_3
.end method

.method private showNotEnoughVotesDialog(I)V
    .locals 3
    .param p1, "price"    # I

    .prologue
    .line 498
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    .line 499
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08028f

    .line 500
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    new-instance v2, Lcom/vkontakte/android/data/PurchasesManager$6;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/data/PurchasesManager$6;-><init>(Lcom/vkontakte/android/data/PurchasesManager;I)V

    .line 501
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 509
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 510
    return-void
.end method

.method private startActivityForResult(Landroid/content/Intent;I)V
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "requestCode"    # I

    .prologue
    .line 513
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mFragment:Landroid/app/Fragment;

    if-eqz v0, :cond_0

    .line 514
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mFragment:Landroid/app/Fragment;

    invoke-virtual {v0, p1, p2}, Landroid/app/Fragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 518
    :goto_0
    return-void

    .line 516
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    invoke-virtual {v0, p1, p2}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method private startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V
    .locals 7
    .param p1, "intent"    # Landroid/content/IntentSender;
    .param p2, "requestCode"    # I
    .param p3, "fillInIntent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "flagsMask"    # I
    .param p5, "flagsValues"    # I
    .param p6, "extraFlags"    # I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/content/IntentSender$SendIntentException;
        }
    .end annotation

    .prologue
    .line 521
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move v4, p4

    move v5, p5

    move v6, p6

    invoke-virtual/range {v0 .. v6}, Landroid/app/Activity;->startIntentSenderForResult(Landroid/content/IntentSender;ILandroid/content/Intent;III)V

    .line 522
    return-void
.end method


# virtual methods
.method public ignoreValidation()Lcom/vkontakte/android/data/PurchasesManager;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/vkontakte/android/data/PurchasesManager",
            "<TD;>;"
        }
    .end annotation

    .prologue
    .line 213
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->ignoreValidation:Z

    .line 214
    return-object p0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 11
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    const/4 v10, 0x0

    .line 242
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 243
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_2

    .line 244
    const-string/jumbo v0, "RESPONSE_CODE"

    invoke-virtual {p3, v0, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 245
    .local v9, "responseCode":I
    const-string/jumbo v0, "INAPP_PURCHASE_DATA"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 247
    .local v8, "purchaseData":Ljava/lang/String;
    const/4 v0, 0x6

    if-ne v9, v0, :cond_1

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mActivity:Landroid/app/Activity;

    const v1, 0x7f0801f9

    invoke-static {v0, v1, v10}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 265
    .end local v8    # "purchaseData":Ljava/lang/String;
    .end local v9    # "responseCode":I
    :cond_0
    :goto_0
    return-void

    .line 249
    .restart local v8    # "purchaseData":Ljava/lang/String;
    .restart local v9    # "responseCode":I
    :cond_1
    if-nez v9, :cond_0

    .line 251
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    invoke-direct {v7, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 252
    .local v7, "jo":Lorg/json/JSONObject;
    const-string/jumbo v0, "orderId"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 253
    .local v3, "orderId":Ljava/lang/String;
    const-string/jumbo v0, "productId"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 254
    .local v4, "productId":Ljava/lang/String;
    const-string/jumbo v0, "purchaseToken"

    invoke-virtual {v7, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 255
    .local v5, "token":Ljava/lang/String;
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-interface {v0}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getId()I

    move-result v2

    .line 256
    .local v2, "id":I
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->getGooglePlayService()Lcom/android/vending/billing/IInAppBillingService;

    move-result-object v1

    move-object v0, p0

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/data/PurchasesManager;->finishPurchase(Lcom/android/vending/billing/IInAppBillingService;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 257
    .end local v2    # "id":I
    .end local v3    # "orderId":Ljava/lang/String;
    .end local v4    # "productId":Ljava/lang/String;
    .end local v5    # "token":Ljava/lang/String;
    .end local v7    # "jo":Lorg/json/JSONObject;
    :catch_0
    move-exception v6

    .line 258
    .local v6, "e":Ljava/lang/Exception;
    const-string/jumbo v0, "PurchasesManager"

    const-string/jumbo v1, "Error during processing #onActivityResult"

    invoke-static {v0, v1, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 261
    .end local v6    # "e":Ljava/lang/Exception;
    .end local v8    # "purchaseData":Ljava/lang/String;
    .end local v9    # "responseCode":I
    :cond_2
    const/16 v0, 0x3ea

    if-ne p1, v0, :cond_0

    .line 262
    iget-object v0, p0, Lcom/vkontakte/android/data/PurchasesManager;->mLastPurchase:Lcom/vkontakte/android/data/PurchasesManager$Product;

    iget-object v1, p0, Lcom/vkontakte/android/data/PurchasesManager;->mOnSuccess:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/data/PurchasesManager;->purchaseFromBalance(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    goto :goto_0
.end method

.method public purchase(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 2
    .param p1    # Lcom/vkontakte/android/data/PurchasesManager$Product;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;)V"
        }
    .end annotation

    .prologue
    .line 218
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    .local p1, "item":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p2, "onSuccess":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->isFree()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 219
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/data/PurchasesManager;->purchaseFreeItem(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    .line 233
    :cond_0
    :goto_0
    return-void

    .line 220
    :cond_1
    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getPaymentType()Lcom/vkontakte/android/api/models/PaymentType;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 221
    sget-object v0, Lcom/vkontakte/android/data/PurchasesManager$7;->$SwitchMap$com$vkontakte$android$api$models$PaymentType:[I

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getPaymentType()Lcom/vkontakte/android/api/models/PaymentType;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/api/models/PaymentType;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 223
    :pswitch_0
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/data/PurchasesManager;->purchaseFromBalance(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    goto :goto_0

    .line 226
    :pswitch_1
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/data/PurchasesManager;->purchaseSubs(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;Z)V

    goto :goto_0

    .line 229
    :pswitch_2
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/data/PurchasesManager;->purchaseInapp(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    goto :goto_0

    .line 221
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public restore(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 2
    .param p1    # Lcom/vkontakte/android/data/PurchasesManager$Product;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TD;",
            "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
            "<TD;>;)V"
        }
    .end annotation

    .prologue
    .line 236
    .local p0, "this":Lcom/vkontakte/android/data/PurchasesManager;, "Lcom/vkontakte/android/data/PurchasesManager<TD;>;"
    .local p1, "item":Lcom/vkontakte/android/data/PurchasesManager$Product;, "TD;"
    .local p2, "onSuccess":Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;, "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener<TD;>;"
    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->isFree()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lcom/vkontakte/android/data/PurchasesManager$Product;->getPaymentType()Lcom/vkontakte/android/api/models/PaymentType;

    move-result-object v0

    sget-object v1, Lcom/vkontakte/android/api/models/PaymentType;->Subs:Lcom/vkontakte/android/api/models/PaymentType;

    if-ne v0, v1, :cond_0

    .line 237
    const/4 v0, 0x1

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/data/PurchasesManager;->purchaseSubs(Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;Z)V

    .line 239
    :cond_0
    return-void
.end method
