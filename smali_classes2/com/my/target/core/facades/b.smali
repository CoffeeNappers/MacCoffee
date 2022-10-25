.class public abstract Lcom/my/target/core/facades/b;
.super Lcom/my/target/core/facades/a;
.source "AbstractNativeAd.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/facades/b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/my/target/core/facades/a;"
    }
.end annotation


# static fields
.field private static final minViewAlpha:F = 0.5f

.field private static final minVisibleSquare:F = 0.6f


# instance fields
.field private autoLoadImages:Z

.field protected banner:Lcom/my/target/core/models/banners/h;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final imageListener:Lcom/my/target/core/net/b$a;

.field private isShown:Z

.field private listener:Lcom/my/target/core/facades/b$a;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private nativeAdVideoController:Lcom/my/target/core/controllers/c;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field private final promoCardListener:Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardListener;

.field private promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/my/target/nativeads/views/PromoCardRecyclerView;",
            ">;"
        }
    .end annotation
.end field

.field private final showHelper:Lcom/my/target/core/utils/a$a;

.field private final statisticsListener:Lcom/my/target/core/controllers/c$a;

.field private final supportedTypes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final viewClickListener:Landroid/view/View$OnClickListener;

.field private viewWeakReference:Ljava/lang/ref/WeakReference;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field private visibleCards:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/nativeads/banners/NativePromoCard;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(ILjava/util/List;Landroid/content/Context;Lcom/my/target/ads/CustomParams;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;",
            "Landroid/content/Context;",
            "Lcom/my/target/ads/CustomParams;",
            ")V"
        }
    .end annotation

    .prologue
    .line 292
    invoke-direct {p0}, Lcom/my/target/core/facades/a;-><init>()V

    .line 69
    new-instance v0, Lcom/my/target/core/facades/b$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/facades/b$1;-><init>(Lcom/my/target/core/facades/b;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->statisticsListener:Lcom/my/target/core/controllers/c$a;

    .line 139
    new-instance v0, Lcom/my/target/core/facades/b$2;

    invoke-direct {v0, p0}, Lcom/my/target/core/facades/b$2;-><init>(Lcom/my/target/core/facades/b;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->imageListener:Lcom/my/target/core/net/b$a;

    .line 148
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/facades/b;->autoLoadImages:Z

    .line 154
    new-instance v0, Lcom/my/target/core/facades/b$3;

    invoke-direct {v0, p0}, Lcom/my/target/core/facades/b$3;-><init>(Lcom/my/target/core/facades/b;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->promoCardListener:Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardListener;

    .line 190
    new-instance v0, Lcom/my/target/core/facades/b$4;

    invoke-direct {v0, p0}, Lcom/my/target/core/facades/b$4;-><init>(Lcom/my/target/core/facades/b;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->showHelper:Lcom/my/target/core/utils/a$a;

    .line 234
    new-instance v0, Lcom/my/target/core/facades/b$5;

    invoke-direct {v0, p0}, Lcom/my/target/core/facades/b$5;-><init>(Lcom/my/target/core/facades/b;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->viewClickListener:Landroid/view/View$OnClickListener;

    .line 293
    iput-object p2, p0, Lcom/my/target/core/facades/b;->supportedTypes:Ljava/util/List;

    .line 295
    new-instance v0, Lcom/my/target/core/a;

    const-string/jumbo v1, "nativeads"

    invoke-direct {v0, p1, v1}, Lcom/my/target/core/a;-><init>(ILjava/lang/String;)V

    .line 297
    invoke-virtual {v0, p4}, Lcom/my/target/core/a;->a(Lcom/my/target/ads/CustomParams;)V

    .line 298
    invoke-virtual {v0}, Lcom/my/target/core/a;->h()V

    .line 300
    invoke-virtual {p0, v0, p3}, Lcom/my/target/core/facades/b;->init(Lcom/my/target/core/a;Landroid/content/Context;)V

    .line 301
    return-void
.end method

.method static synthetic access$000(Lcom/my/target/core/facades/b;)V
    .locals 0

    .prologue
    .line 47
    invoke-direct {p0}, Lcom/my/target/core/facades/b;->doLoadSuccess()V

    return-void
.end method

.method static synthetic access$100(Lcom/my/target/core/facades/b;)Lcom/my/target/core/facades/b$a;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    return-object v0
.end method

.method static synthetic access$200(Lcom/my/target/core/facades/b;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/my/target/core/facades/b;->visibleCards:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/my/target/core/facades/b;)Z
    .locals 1

    .prologue
    .line 47
    iget-boolean v0, p0, Lcom/my/target/core/facades/b;->isShown:Z

    return v0
.end method

.method static synthetic access$400(Lcom/my/target/core/facades/b;)Lcom/my/target/core/controllers/c;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    return-object v0
.end method

.method static synthetic access$500(Lcom/my/target/core/facades/b;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method static synthetic access$600(Lcom/my/target/core/facades/b;)Ljava/lang/ref/WeakReference;
    .locals 1

    .prologue
    .line 47
    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    return-object v0
.end method

.method private doAutoLoadImages()V
    .locals 4

    .prologue
    .line 390
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 391
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    if-nez v0, :cond_0

    .line 409
    :goto_0
    return-void

    .line 393
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 394
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 395
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 396
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getIcon()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 397
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->m()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/i;

    .line 399
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/i;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v3

    if-eqz v3, :cond_3

    .line 400
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/i;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 403
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Starting load: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v2, " urls"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 404
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_5

    .line 406
    invoke-static {}, Lcom/my/target/core/net/b;->a()Lcom/my/target/core/net/b;

    move-result-object v0

    iget-object v2, p0, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    iget-object v3, p0, Lcom/my/target/core/facades/b;->imageListener:Lcom/my/target/core/net/b$a;

    invoke-virtual {v0, v1, v2, v3}, Lcom/my/target/core/net/b;->a(Ljava/util/List;Landroid/content/Context;Lcom/my/target/core/net/b$a;)V

    goto :goto_0

    .line 408
    :cond_5
    invoke-direct {p0}, Lcom/my/target/core/facades/b;->doLoadSuccess()V

    goto :goto_0
.end method

.method private doLoadFailure(Ljava/lang/String;)V
    .locals 1

    .prologue
    .line 378
    if-eqz p1, :cond_1

    .line 379
    :goto_0
    iget-object v0, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    invoke-interface {v0, p1, p0}, Lcom/my/target/core/facades/b$a;->onNoAd(Ljava/lang/String;Lcom/my/target/core/facades/b;)V

    .line 380
    :cond_0
    return-void

    .line 378
    :cond_1
    const-string/jumbo p1, "No ad"

    goto :goto_0
.end method

.method private doLoadSuccess()V
    .locals 1

    .prologue
    .line 385
    iget-object v0, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    invoke-interface {v0, p0}, Lcom/my/target/core/facades/b$a;->onLoad(Lcom/my/target/core/facades/b;)V

    .line 386
    :cond_0
    return-void
.end method

.method private doRegisterView(Landroid/view/View;)V
    .locals 4

    .prologue
    const/16 v3, 0x8

    .line 488
    instance-of v0, p1, Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    if-eqz v0, :cond_1

    .line 490
    new-instance v0, Ljava/lang/ref/WeakReference;

    check-cast p1, Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    .line 491
    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    iget-object v1, p0, Lcom/my/target/core/facades/b;->promoCardListener:Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardListener;

    invoke-virtual {v0, v1}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->setOnPromoCardListener(Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardListener;)V

    .line 534
    :cond_0
    :goto_0
    return-void

    .line 493
    :cond_1
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_5

    move-object v0, p1

    .line 495
    check-cast v0, Landroid/view/ViewGroup;

    .line 497
    instance-of v1, v0, Lcom/my/target/nativeads/views/MediaAdView;

    if-eqz v1, :cond_4

    .line 499
    iget-object v1, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    if-eqz v1, :cond_0

    move-object v1, v0

    .line 501
    check-cast v1, Lcom/my/target/nativeads/views/MediaAdView;

    .line 502
    invoke-virtual {v1}, Lcom/my/target/nativeads/views/MediaAdView;->getProgressBarView()Landroid/widget/ProgressBar;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 503
    invoke-virtual {v1}, Lcom/my/target/nativeads/views/MediaAdView;->getPlayButtonView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 504
    iget-object v2, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-virtual {v2}, Lcom/my/target/core/models/banners/h;->getImage()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v2

    .line 505
    if-eqz v2, :cond_2

    .line 506
    invoke-virtual {v2}, Lcom/my/target/nativeads/models/ImageData;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Lcom/my/target/nativeads/models/ImageData;->getHeight()I

    move-result v2

    invoke-virtual {v1, v3, v2}, Lcom/my/target/nativeads/views/MediaAdView;->setPlaceHolderDimension(II)V

    .line 508
    :cond_2
    const/16 v2, 0xe

    invoke-static {v2}, Lcom/my/target/core/utils/l;->c(I)Z

    move-result v2

    if-eqz v2, :cond_4

    iget-object v2, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    .line 509
    invoke-virtual {v2}, Lcom/my/target/core/models/banners/h;->a()Lcom/my/target/core/models/banners/m;

    move-result-object v2

    if-eqz v2, :cond_4

    .line 511
    iget-object v2, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    .line 512
    invoke-virtual {v2}, Lcom/my/target/core/models/banners/h;->a()Lcom/my/target/core/models/banners/m;

    move-result-object v2

    invoke-virtual {v2}, Lcom/my/target/core/models/banners/m;->m()Ljava/util/List;

    move-result-object v2

    const/16 v3, 0x168

    .line 511
    invoke-static {v2, v3}, Lcom/my/target/core/utils/n;->a(Ljava/util/List;I)Lcom/my/target/nativeads/models/VideoData;

    move-result-object v2

    .line 513
    if-eqz v2, :cond_4

    .line 515
    iget-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    if-nez v0, :cond_3

    .line 517
    new-instance v0, Lcom/my/target/core/controllers/c;

    iget-object v3, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-direct {v0, v3, v2}, Lcom/my/target/core/controllers/c;-><init>(Lcom/my/target/core/models/banners/h;Lcom/my/target/nativeads/models/VideoData;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    .line 519
    iget-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    iget-object v2, p0, Lcom/my/target/core/facades/b;->viewClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {v0, v2}, Lcom/my/target/core/controllers/c;->a(Landroid/view/View$OnClickListener;)V

    .line 520
    iget-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    iget-object v2, p0, Lcom/my/target/core/facades/b;->statisticsListener:Lcom/my/target/core/controllers/c$a;

    invoke-virtual {v0, v2}, Lcom/my/target/core/controllers/c;->a(Lcom/my/target/core/controllers/c$a;)V

    .line 522
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    invoke-virtual {v0, v1}, Lcom/my/target/core/controllers/c;->a(Lcom/my/target/nativeads/views/MediaAdView;)V

    goto :goto_0

    .line 527
    :cond_4
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_5

    .line 529
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 530
    invoke-direct {p0, v2}, Lcom/my/target/core/facades/b;->doRegisterView(Landroid/view/View;)V

    .line 527
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 533
    :cond_5
    iget-object v0, p0, Lcom/my/target/core/facades/b;->viewClickListener:Landroid/view/View$OnClickListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto/16 :goto_0
.end method

.method private doUnregisterView(Landroid/view/View;)V
    .locals 3

    .prologue
    .line 538
    instance-of v0, p1, Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    if-eqz v0, :cond_0

    .line 551
    :goto_0
    return-void

    .line 541
    :cond_0
    instance-of v0, p1, Landroid/view/ViewGroup;

    if-eqz v0, :cond_1

    instance-of v0, p1, Lcom/my/target/nativeads/views/MediaAdView;

    if-nez v0, :cond_1

    move-object v0, p1

    .line 543
    check-cast v0, Landroid/view/ViewGroup;

    .line 544
    const/4 v1, 0x0

    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 546
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    .line 547
    invoke-direct {p0, v2}, Lcom/my/target/core/facades/b;->doUnregisterView(Landroid/view/View;)V

    .line 544
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 550
    :cond_1
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0
.end method


# virtual methods
.method public final getBanner()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 264
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    return-object v0
.end method

.method public final handleClick()V
    .locals 3

    .prologue
    .line 420
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    if-eqz v0, :cond_0

    .line 422
    iget-object v0, p0, Lcom/my/target/core/facades/b;->adData:Lcom/my/target/core/models/c;

    iget-object v1, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    iget-object v2, p0, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 423
    iget-object v0, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    if-eqz v0, :cond_0

    .line 424
    iget-object v0, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    invoke-interface {v0, p0}, Lcom/my/target/core/facades/b$a;->onClick(Lcom/my/target/core/facades/b;)V

    .line 426
    :cond_0
    return-void
.end method

.method public final handleShow()V
    .locals 2

    .prologue
    .line 430
    iget-boolean v0, p0, Lcom/my/target/core/facades/b;->isShown:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    if-eqz v0, :cond_0

    .line 432
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    iget-object v1, p0, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/my/target/core/models/c;->c(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 433
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/facades/b;->isShown:Z

    .line 434
    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    .line 435
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b;->visibleCards:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    .line 438
    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-virtual {v0}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->getCurrentCard()Lcom/my/target/nativeads/banners/NativePromoCard;

    move-result-object v0

    .line 439
    if-eqz v0, :cond_0

    .line 441
    iget-object v1, p0, Lcom/my/target/core/facades/b;->visibleCards:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 442
    check-cast v0, Lcom/my/target/core/models/banners/d;

    iget-object v1, p0, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    invoke-static {v0, v1}, Lcom/my/target/core/models/c;->c(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 446
    :cond_0
    return-void
.end method

.method public isAutoLoadImages()Z
    .locals 1

    .prologue
    .line 269
    iget-boolean v0, p0, Lcom/my/target/core/facades/b;->autoLoadImages:Z

    return v0
.end method

.method protected onLoad(Lcom/my/target/core/models/c;)V
    .locals 8

    .prologue
    const/4 v7, 0x0

    const/16 v2, 0x28

    .line 310
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->g()Z

    move-result v0

    .line 312
    if-eqz v0, :cond_5

    .line 314
    const-string/jumbo v0, "nativeads"

    invoke-virtual {p1, v0}, Lcom/my/target/core/models/c;->c(Ljava/lang/String;)Lcom/my/target/core/models/sections/i;

    move-result-object v0

    .line 315
    instance-of v1, v0, Lcom/my/target/core/models/sections/h;

    if-eqz v1, :cond_5

    .line 317
    check-cast v0, Lcom/my/target/core/models/sections/h;

    .line 318
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/h;->b()I

    move-result v1

    if-lez v1, :cond_5

    .line 321
    invoke-virtual {v0}, Lcom/my/target/core/models/sections/h;->g()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/h;

    .line 323
    iget-object v1, p0, Lcom/my/target/core/facades/b;->supportedTypes:Ljava/util/List;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getType()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 325
    iput-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    .line 342
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    if-nez v0, :cond_2

    .line 344
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "No supported banners found for Ad types \'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/my/target/core/facades/b;->supportedTypes:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 347
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 348
    const-class v1, Lcom/my/target/core/facades/b;

    .line 349
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 351
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    .line 352
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->b()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    .line 348
    invoke-static/range {v0 .. v5}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    .line 354
    invoke-direct {p0, v7}, Lcom/my/target/core/facades/b;->doLoadFailure(Ljava/lang/String;)V

    .line 373
    :goto_1
    return-void

    .line 329
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "Banner "

    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getId()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v3, " with type \'"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 330
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getType()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\' does not matches for Ad types \'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/facades/b;->supportedTypes:Ljava/util/List;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 332
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 333
    const-class v1, Lcom/my/target/core/facades/b;

    .line 334
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .line 336
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v3

    .line 337
    invoke-virtual {p1}, Lcom/my/target/core/models/c;->b()Ljava/lang/String;

    move-result-object v4

    iget-object v5, p0, Lcom/my/target/core/facades/b;->context:Landroid/content/Context;

    .line 333
    invoke-static/range {v0 .. v5}, Lcom/my/target/core/async/a;->a(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    goto/16 :goto_0

    .line 358
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/facades/b;->banner:Lcom/my/target/core/models/banners/h;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/h;->getCards()Ljava/util/List;

    move-result-object v0

    .line 359
    if-eqz v0, :cond_3

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 361
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->visibleCards:Ljava/util/ArrayList;

    .line 364
    :cond_3
    iget-boolean v0, p0, Lcom/my/target/core/facades/b;->autoLoadImages:Z

    if-nez v0, :cond_4

    invoke-direct {p0}, Lcom/my/target/core/facades/b;->doLoadSuccess()V

    goto :goto_1

    .line 365
    :cond_4
    invoke-direct {p0}, Lcom/my/target/core/facades/b;->doAutoLoadImages()V

    goto :goto_1

    .line 372
    :cond_5
    invoke-direct {p0, v7}, Lcom/my/target/core/facades/b;->doLoadFailure(Ljava/lang/String;)V

    goto :goto_1
.end method

.method protected onLoadError(Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 414
    invoke-direct {p0, p1}, Lcom/my/target/core/facades/b;->doLoadFailure(Ljava/lang/String;)V

    .line 415
    return-void
.end method

.method public final registerView(Landroid/view/View;)V
    .locals 2

    .prologue
    .line 450
    const/4 v0, 0x0

    .line 451
    iget-object v1, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 453
    :cond_0
    if-eq p1, v0, :cond_1

    .line 455
    invoke-virtual {p0}, Lcom/my/target/core/facades/b;->unregisterView()V

    .line 456
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    .line 457
    invoke-direct {p0, p1}, Lcom/my/target/core/facades/b;->doRegisterView(Landroid/view/View;)V

    .line 458
    iget-object v0, p0, Lcom/my/target/core/facades/b;->showHelper:Lcom/my/target/core/utils/a$a;

    invoke-interface {v0}, Lcom/my/target/core/utils/a$a;->a()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {}, Lcom/my/target/core/utils/a;->a()Lcom/my/target/core/utils/a;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/facades/b;->showHelper:Lcom/my/target/core/utils/a$a;

    invoke-virtual {v0, v1}, Lcom/my/target/core/utils/a;->a(Lcom/my/target/core/utils/a$a;)V

    .line 460
    :cond_1
    return-void
.end method

.method public setAutoLoadImages(Z)V
    .locals 0

    .prologue
    .line 274
    iput-boolean p1, p0, Lcom/my/target/core/facades/b;->autoLoadImages:Z

    .line 275
    return-void
.end method

.method public setListener(Lcom/my/target/core/facades/b$a;)V
    .locals 0
    .param p1    # Lcom/my/target/core/facades/b$a;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 282
    iput-object p1, p0, Lcom/my/target/core/facades/b;->listener:Lcom/my/target/core/facades/b$a;

    .line 283
    return-void
.end method

.method public final unregisterView()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 464
    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    .line 466
    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 467
    iget-object v0, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/nativeads/views/PromoCardRecyclerView;

    invoke-virtual {v0, v2}, Lcom/my/target/nativeads/views/PromoCardRecyclerView;->setOnPromoCardListener(Lcom/my/target/nativeads/views/PromoCardRecyclerView$PromoCardListener;)V

    .line 468
    :cond_0
    iput-object v2, p0, Lcom/my/target/core/facades/b;->promoCardRecyclerViewWeakReference:Ljava/lang/ref/WeakReference;

    .line 471
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    if-eqz v0, :cond_2

    .line 473
    iget-object v0, p0, Lcom/my/target/core/facades/b;->nativeAdVideoController:Lcom/my/target/core/controllers/c;

    invoke-virtual {v0}, Lcom/my/target/core/controllers/c;->b()V

    .line 476
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_4

    .line 478
    iget-object v0, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    .line 479
    if-eqz v0, :cond_3

    invoke-direct {p0, v0}, Lcom/my/target/core/facades/b;->doUnregisterView(Landroid/view/View;)V

    .line 480
    :cond_3
    invoke-static {}, Lcom/my/target/core/utils/a;->a()Lcom/my/target/core/utils/a;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/facades/b;->showHelper:Lcom/my/target/core/utils/a$a;

    invoke-virtual {v0, v1}, Lcom/my/target/core/utils/a;->b(Lcom/my/target/core/utils/a$a;)V

    .line 481
    iget-object v0, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 482
    iput-object v2, p0, Lcom/my/target/core/facades/b;->viewWeakReference:Ljava/lang/ref/WeakReference;

    .line 484
    :cond_4
    return-void
.end method
