.class public final Lcom/my/target/core/controllers/b;
.super Ljava/lang/Object;
.source "InstreamAdVideoController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/controllers/b$a;
    }
.end annotation


# static fields
.field private static a:Landroid/os/Handler;


# instance fields
.field private final b:Lcom/my/target/ads/instream/InstreamAd;

.field private final c:Ljava/lang/Runnable;

.field private final d:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

.field private e:Lcom/my/target/core/models/c;

.field private f:I

.field private g:Ljava/lang/String;

.field private h:Z

.field private i:Z

.field private j:Ljava/util/concurrent/atomic/AtomicInteger;

.field private k:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/banners/m;",
            ">;"
        }
    .end annotation
.end field

.field private l:Lcom/my/target/ads/instream/InstreamAdPlayer;

.field private m:Lcom/my/target/core/models/banners/m;

.field private n:I

.field private o:I

.field private p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

.field private q:Lcom/my/target/core/models/sections/k;

.field private r:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/my/target/core/models/i;",
            ">;"
        }
    .end annotation
.end field

.field private s:Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

.field private t:Z

.field private u:Z

.field private v:F

.field private w:Lcom/my/target/core/controllers/b$a;

.field private x:I

.field private y:F

.field private z:F


# direct methods
.method public constructor <init>(Lcom/my/target/ads/instream/InstreamAd;)V
    .locals 2

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lcom/my/target/core/controllers/b$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/controllers/b$1;-><init>(Lcom/my/target/core/controllers/b;)V

    iput-object v0, p0, Lcom/my/target/core/controllers/b;->c:Ljava/lang/Runnable;

    .line 118
    new-instance v0, Lcom/my/target/core/controllers/b$2;

    invoke-direct {v0, p0}, Lcom/my/target/core/controllers/b$2;-><init>(Lcom/my/target/core/controllers/b;)V

    iput-object v0, p0, Lcom/my/target/core/controllers/b;->d:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    .line 248
    iput v1, p0, Lcom/my/target/core/controllers/b;->y:F

    .line 249
    iput v1, p0, Lcom/my/target/core/controllers/b;->z:F

    .line 318
    iput-object p1, p0, Lcom/my/target/core/controllers/b;->b:Lcom/my/target/ads/instream/InstreamAd;

    .line 319
    return-void
.end method

.method static synthetic a(Lcom/my/target/core/controllers/b;F)V
    .locals 2

    .prologue
    .line 24
    .line 2503
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->r:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2505
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->r:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v1}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/my/target/core/models/c;->a(Ljava/util/Set;FLandroid/content/Context;)V

    .line 24
    :cond_0
    return-void
.end method

.method private a(ZZ)V
    .locals 3

    .prologue
    .line 580
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->k()V

    .line 581
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/controllers/b;->t:Z

    .line 583
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 585
    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 587
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    const-string/jumbo v1, "closedByUser"

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    .line 589
    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 587
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 592
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    if-eqz v0, :cond_1

    .line 593
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->b:Lcom/my/target/ads/instream/InstreamAd;

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->s:Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onBannerComplete(Lcom/my/target/ads/instream/InstreamAd;Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;)V

    .line 595
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer;->stopAdVideo()V

    .line 598
    :cond_2
    if-eqz p2, :cond_3

    .line 600
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->m()V

    .line 1616
    :goto_0
    return-void

    .line 1609
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_6

    .line 1611
    iget v0, p0, Lcom/my/target/core/controllers/b;->f:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/my/target/core/controllers/b;->f:I

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 1613
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_5

    .line 1615
    :cond_4
    iget v0, p0, Lcom/my/target/core/controllers/b;->f:I

    invoke-direct {p0, v0}, Lcom/my/target/core/controllers/b;->b(I)V

    goto :goto_0

    .line 1619
    :cond_5
    const-string/jumbo v0, "Reached maximum of ad banners for current section"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 1624
    :cond_6
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->m()V

    goto :goto_0
.end method

.method static synthetic a(Lcom/my/target/core/controllers/b;)Z
    .locals 1

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/my/target/core/controllers/b;->u:Z

    return v0
.end method

.method static synthetic a(Lcom/my/target/core/controllers/b;Z)Z
    .locals 0

    .prologue
    .line 24
    iput-boolean p1, p0, Lcom/my/target/core/controllers/b;->t:Z

    return p1
.end method

.method static synthetic b(Lcom/my/target/core/controllers/b;F)F
    .locals 0

    .prologue
    .line 24
    iput p1, p0, Lcom/my/target/core/controllers/b;->v:F

    return p1
.end method

.method private b(I)V
    .locals 9

    .prologue
    const/4 v8, 0x0

    .line 516
    :goto_0
    iput-boolean v8, p0, Lcom/my/target/core/controllers/b;->i:Z

    .line 517
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/m;

    iput-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    .line 518
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_0

    .line 519
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 521
    :cond_0
    const-string/jumbo v0, "statistics"

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/m;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 523
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->e:Lcom/my/target/core/models/c;

    if-eqz v0, :cond_1

    .line 524
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    const-string/jumbo v1, "playbackStarted"

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    .line 526
    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 524
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 527
    :cond_1
    iget v0, p0, Lcom/my/target/core/controllers/b;->f:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/my/target/core/controllers/b;->f:I

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 528
    iget p1, p0, Lcom/my/target/core/controllers/b;->f:I

    goto :goto_0

    .line 531
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->w:Lcom/my/target/core/controllers/b$a;

    if-eqz v0, :cond_4

    .line 533
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->w:Lcom/my/target/core/controllers/b$a;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/my/target/core/controllers/b$a;->sectionCompleted(Ljava/lang/String;)V

    .line 564
    :cond_3
    :goto_1
    return-void

    .line 534
    :cond_4
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    if-eqz v0, :cond_3

    .line 536
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->b:Lcom/my/target/ads/instream/InstreamAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAd;)V

    goto :goto_1

    .line 542
    :cond_5
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/m;->m()Ljava/util/List;

    move-result-object v0

    .line 544
    iget v1, p0, Lcom/my/target/core/controllers/b;->n:I

    invoke-static {v0, v1}, Lcom/my/target/core/utils/n;->a(Ljava/util/List;I)Lcom/my/target/nativeads/models/VideoData;

    move-result-object v6

    .line 547
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/m;->getStats()Ljava/util/ArrayList;

    move-result-object v0

    .line 1568
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    iput-object v1, p0, Lcom/my/target/core/controllers/b;->r:Ljava/util/HashSet;

    .line 1569
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_6
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/k;

    .line 1571
    invoke-virtual {v0}, Lcom/my/target/core/models/k;->c()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "playheadReachedValue"

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_6

    instance-of v2, v0, Lcom/my/target/core/models/i;

    if-eqz v2, :cond_6

    .line 1573
    iget-object v2, p0, Lcom/my/target/core/controllers/b;->r:Ljava/util/HashSet;

    check-cast v0, Lcom/my/target/core/models/i;

    invoke-virtual {v2, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 549
    :cond_7
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/m;->g()Z

    move-result v1

    .line 550
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/m;->h()F

    move-result v2

    .line 551
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/m;->f()F

    move-result v3

    .line 552
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/m;->getCtaText()Ljava/lang/String;

    move-result-object v7

    .line 554
    new-instance v0, Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    .line 556
    invoke-virtual {v6}, Lcom/my/target/nativeads/models/VideoData;->getWidth()I

    move-result v4

    invoke-virtual {v6}, Lcom/my/target/nativeads/models/VideoData;->getHeight()I

    move-result v5

    invoke-direct/range {v0 .. v5}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;-><init>(ZFFII)V

    iput-object v0, p0, Lcom/my/target/core/controllers/b;->s:Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    .line 558
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->s:Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    iput-object v7, v0, Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;->ctaText:Ljava/lang/String;

    .line 560
    invoke-virtual {v6}, Lcom/my/target/nativeads/models/VideoData;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 561
    iget-object v1, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    iget v2, p0, Lcom/my/target/core/controllers/b;->y:F

    invoke-interface {v1, v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->setVolume(F)V

    .line 562
    iget-object v1, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-virtual {v6}, Lcom/my/target/nativeads/models/VideoData;->getWidth()I

    move-result v2

    invoke-virtual {v6}, Lcom/my/target/nativeads/models/VideoData;->getHeight()I

    move-result v3

    invoke-interface {v1, v0, v2, v3}, Lcom/my/target/ads/instream/InstreamAdPlayer;->playAdVideo(Landroid/net/Uri;II)V

    .line 563
    iput v8, p0, Lcom/my/target/core/controllers/b;->o:I

    goto/16 :goto_1
.end method

.method static synthetic b(Lcom/my/target/core/controllers/b;)Z
    .locals 1

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    return v0
.end method

.method static synthetic c(Lcom/my/target/core/controllers/b;F)F
    .locals 0

    .prologue
    .line 24
    iput p1, p0, Lcom/my/target/core/controllers/b;->z:F

    return p1
.end method

.method static synthetic c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    return-object v0
.end method

.method static synthetic d(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->s:Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    return-object v0
.end method

.method static synthetic e(Lcom/my/target/core/controllers/b;)Z
    .locals 1

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/my/target/core/controllers/b;->i:Z

    return v0
.end method

.method static synthetic f(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/banners/m;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    return-object v0
.end method

.method static synthetic g(Lcom/my/target/core/controllers/b;)Z
    .locals 1

    .prologue
    .line 24
    iget-boolean v0, p0, Lcom/my/target/core/controllers/b;->h:Z

    return v0
.end method

.method static synthetic h(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/sections/k;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->q:Lcom/my/target/core/models/sections/k;

    return-object v0
.end method

.method static synthetic i()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 24
    sget-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic i(Lcom/my/target/core/controllers/b;)Z
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/controllers/b;->h:Z

    return v0
.end method

.method static synthetic j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    return-object v0
.end method

.method private j()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 452
    const/4 v0, 0x1

    .line 454
    iget-object v2, p0, Lcom/my/target/core/controllers/b;->e:Lcom/my/target/core/models/c;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    if-nez v2, :cond_1

    .line 456
    :cond_0
    const-string/jumbo v0, "Unable to perform operation: not loaded yet"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    move v0, v1

    .line 459
    :cond_1
    iget-object v2, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    if-nez v2, :cond_2

    .line 461
    const-string/jumbo v0, "Player not created"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    move v0, v1

    .line 465
    :cond_2
    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    if-nez v2, :cond_3

    .line 467
    const-string/jumbo v0, "Player return null view"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    .line 471
    :goto_0
    return v1

    :cond_3
    move v1, v0

    goto :goto_0
.end method

.method static synthetic k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->b:Lcom/my/target/ads/instream/InstreamAd;

    return-object v0
.end method

.method private k()V
    .locals 2

    .prologue
    .line 476
    sget-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 477
    sget-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->c:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 478
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    .line 479
    return-void
.end method

.method private l()V
    .locals 4

    .prologue
    .line 483
    sget-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 487
    :try_start_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 494
    :cond_0
    :goto_0
    sget-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 496
    sget-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->c:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 497
    sget-object v0, Lcom/my/target/core/controllers/b;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->c:Ljava/lang/Runnable;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 499
    :cond_1
    return-void

    .line 488
    :catch_0
    move-exception v0

    .line 490
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "error creating timer handler "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method static synthetic l(Lcom/my/target/core/controllers/b;)Z
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/controllers/b;->i:Z

    return v0
.end method

.method static synthetic m(Lcom/my/target/core/controllers/b;)F
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lcom/my/target/core/controllers/b;->v:F

    return v0
.end method

.method private m()V
    .locals 3

    .prologue
    .line 629
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->w:Lcom/my/target/core/controllers/b$a;

    if-eqz v0, :cond_1

    .line 631
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->w:Lcom/my/target/core/controllers/b$a;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/my/target/core/controllers/b$a;->sectionCompleted(Ljava/lang/String;)V

    .line 636
    :cond_0
    :goto_0
    return-void

    .line 632
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    if-eqz v0, :cond_0

    .line 634
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->b:Lcom/my/target/ads/instream/InstreamAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAd;)V

    goto :goto_0
.end method

.method static synthetic n(Lcom/my/target/core/controllers/b;)I
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/target/core/controllers/b;->o:I

    return v0
.end method

.method static synthetic o(Lcom/my/target/core/controllers/b;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 24
    invoke-direct {p0, v0, v0}, Lcom/my/target/core/controllers/b;->a(ZZ)V

    return-void
.end method

.method static synthetic p(Lcom/my/target/core/controllers/b;)I
    .locals 2

    .prologue
    .line 24
    iget v0, p0, Lcom/my/target/core/controllers/b;->o:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/my/target/core/controllers/b;->o:I

    return v0
.end method

.method static synthetic q(Lcom/my/target/core/controllers/b;)I
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lcom/my/target/core/controllers/b;->o:I

    return v0
.end method

.method static synthetic r(Lcom/my/target/core/controllers/b;)I
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lcom/my/target/core/controllers/b;->x:I

    return v0
.end method

.method static synthetic s(Lcom/my/target/core/controllers/b;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 24
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->c:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic t(Lcom/my/target/core/controllers/b;)Z
    .locals 1

    .prologue
    .line 24
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/controllers/b;->u:Z

    return v0
.end method

.method static synthetic u(Lcom/my/target/core/controllers/b;)V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->l()V

    return-void
.end method

.method static synthetic v(Lcom/my/target/core/controllers/b;)V
    .locals 0

    .prologue
    .line 24
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->k()V

    return-void
.end method

.method static synthetic w(Lcom/my/target/core/controllers/b;)F
    .locals 1

    .prologue
    .line 24
    iget v0, p0, Lcom/my/target/core/controllers/b;->z:F

    return v0
.end method


# virtual methods
.method public final a()Lcom/my/target/ads/instream/InstreamAdPlayer;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    return-object v0
.end method

.method public final a(F)V
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/my/target/core/controllers/b;->y:F

    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v0, p1}, Lcom/my/target/ads/instream/InstreamAdPlayer;->setVolume(F)V

    .line 313
    :cond_0
    iput p1, p0, Lcom/my/target/core/controllers/b;->y:F

    .line 314
    return-void
.end method

.method public final a(I)V
    .locals 0

    .prologue
    .line 304
    iput p1, p0, Lcom/my/target/core/controllers/b;->n:I

    .line 305
    return-void
.end method

.method public final a(Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;)V
    .locals 0

    .prologue
    .line 299
    iput-object p1, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    .line 300
    return-void
.end method

.method public final a(Lcom/my/target/ads/instream/InstreamAdPlayer;)V
    .locals 1

    .prologue
    .line 293
    iput-object p1, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    .line 294
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->d:Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    invoke-interface {p1, v0}, Lcom/my/target/ads/instream/InstreamAdPlayer;->setAdPlayerListener(Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;)V

    .line 295
    return-void
.end method

.method public final a(Lcom/my/target/core/controllers/b$a;)V
    .locals 0

    .prologue
    .line 275
    iput-object p1, p0, Lcom/my/target/core/controllers/b;->w:Lcom/my/target/core/controllers/b$a;

    .line 276
    return-void
.end method

.method public final a(Lcom/my/target/core/models/c;)V
    .locals 0

    .prologue
    .line 270
    iput-object p1, p0, Lcom/my/target/core/controllers/b;->e:Lcom/my/target/core/models/c;

    .line 271
    return-void
.end method

.method public final a(Lcom/my/target/core/models/sections/k;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/my/target/core/models/sections/k;",
            "Ljava/util/List",
            "<",
            "Lcom/my/target/core/models/banners/m;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 323
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/k;->k()Lcom/my/target/core/models/l;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/l;->d()I

    move-result v0

    .line 324
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/k;->e()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    if-lez v0, :cond_0

    .line 326
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 328
    :cond_0
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/k;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    .line 329
    invoke-virtual {p0, p1, p2}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/models/sections/k;Ljava/util/List;)V

    .line 330
    return-void
.end method

.method public final a(Z)V
    .locals 3

    .prologue
    .line 280
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 283
    if-eqz p1, :cond_1

    .line 284
    const-string/jumbo v0, "fullscreenOn"

    .line 287
    :goto_0
    iget-object v1, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 289
    :cond_0
    return-void

    .line 286
    :cond_1
    const-string/jumbo v0, "fullscreenOff"

    goto :goto_0
.end method

.method public final a(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 265
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    .line 263
    goto :goto_0
.end method

.method public final b()V
    .locals 1

    .prologue
    const/4 v0, 0x1

    .line 376
    invoke-direct {p0, v0, v0}, Lcom/my/target/core/controllers/b;->a(ZZ)V

    .line 377
    return-void
.end method

.method public final b(Lcom/my/target/core/models/sections/k;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/my/target/core/models/sections/k;",
            "Ljava/util/List",
            "<",
            "Lcom/my/target/core/models/banners/m;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 334
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/k;->e()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 336
    const-string/jumbo v0, "try to continue wrong section"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 369
    :cond_0
    :goto_0
    return-void

    .line 339
    :cond_1
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lcom/my/target/core/controllers/b;->k:Ljava/util/ArrayList;

    .line 340
    iput v2, p0, Lcom/my/target/core/controllers/b;->f:I

    .line 341
    iput-boolean v2, p0, Lcom/my/target/core/controllers/b;->h:Z

    .line 342
    iput-object p1, p0, Lcom/my/target/core/controllers/b;->q:Lcom/my/target/core/models/sections/k;

    .line 343
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/k;->k()Lcom/my/target/core/models/l;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/l;->c()I

    move-result v0

    iput v0, p0, Lcom/my/target/core/controllers/b;->x:I

    .line 345
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 347
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->w:Lcom/my/target/core/controllers/b$a;

    if-eqz v0, :cond_2

    .line 349
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->w:Lcom/my/target/core/controllers/b$a;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/my/target/core/controllers/b$a;->sectionCompleted(Ljava/lang/String;)V

    goto :goto_0

    .line 350
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    if-eqz v0, :cond_0

    .line 352
    const-string/jumbo v0, "Banners list is empty"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 353
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->b:Lcom/my/target/ads/instream/InstreamAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAd;)V

    goto :goto_0

    .line 357
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/my/target/core/controllers/b;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_5

    .line 359
    :cond_4
    invoke-direct {p0, v2}, Lcom/my/target/core/controllers/b;->b(I)V

    .line 360
    iput-boolean v2, p0, Lcom/my/target/core/controllers/b;->u:Z

    .line 361
    iput v2, p0, Lcom/my/target/core/controllers/b;->o:I

    .line 362
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->l()V

    goto :goto_0

    .line 365
    :cond_5
    const-string/jumbo v0, "Reached maximum of ad banners for current section"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 366
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->p:Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->b:Lcom/my/target/ads/instream/InstreamAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAd;)V

    goto :goto_0
.end method

.method public final c()V
    .locals 2

    .prologue
    .line 384
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/my/target/core/controllers/b;->a(ZZ)V

    .line 385
    return-void
.end method

.method public final d()V
    .locals 1

    .prologue
    .line 392
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 394
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer;->pauseAdVideo()V

    .line 396
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->k()V

    .line 397
    return-void
.end method

.method public final e()V
    .locals 1

    .prologue
    .line 404
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 406
    iget-boolean v0, p0, Lcom/my/target/core/controllers/b;->t:Z

    if-eqz v0, :cond_0

    .line 407
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->l()V

    .line 408
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer;->resumeAdVideo()V

    .line 410
    :cond_1
    return-void
.end method

.method public final f()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 417
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer;->stopAdVideo()V

    .line 420
    const/4 v0, 0x1

    invoke-direct {p0, v3, v0}, Lcom/my/target/core/controllers/b;->a(ZZ)V

    .line 421
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    const-string/jumbo v1, "playbackStopped"

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    .line 423
    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 421
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 425
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->k()V

    .line 426
    iput-boolean v3, p0, Lcom/my/target/core/controllers/b;->t:Z

    .line 427
    return-void
.end method

.method public final g()V
    .locals 1

    .prologue
    .line 434
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer;->destroy()V

    .line 438
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->k()V

    .line 439
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/controllers/b;->t:Z

    .line 440
    return-void
.end method

.method public final h()V
    .locals 3

    .prologue
    .line 444
    invoke-direct {p0}, Lcom/my/target/core/controllers/b;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 446
    iget-object v0, p0, Lcom/my/target/core/controllers/b;->e:Lcom/my/target/core/models/c;

    iget-object v1, p0, Lcom/my/target/core/controllers/b;->m:Lcom/my/target/core/models/banners/m;

    iget-object v2, p0, Lcom/my/target/core/controllers/b;->l:Lcom/my/target/ads/instream/InstreamAdPlayer;

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 448
    :cond_0
    return-void
.end method
