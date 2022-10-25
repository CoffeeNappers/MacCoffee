.class public final Lcom/my/target/core/controllers/a;
.super Ljava/lang/Object;
.source "InstreamAdAudioController.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/controllers/a$a;
    }
.end annotation


# static fields
.field private static a:Landroid/os/Handler;


# instance fields
.field private final b:Lcom/my/target/ads/instream/InstreamAudioAd;

.field private final c:Ljava/lang/Runnable;

.field private final d:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

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
            "Lcom/my/target/core/models/banners/c;",
            ">;"
        }
    .end annotation
.end field

.field private l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

.field private m:Lcom/my/target/core/models/banners/c;

.field private n:I

.field private o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

.field private p:Lcom/my/target/core/models/sections/c;

.field private q:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet",
            "<",
            "Lcom/my/target/core/models/i;",
            ">;"
        }
    .end annotation
.end field

.field private r:Z

.field private s:Z

.field private t:F

.field private u:Lcom/my/target/core/controllers/a$a;

.field private v:I

.field private w:F

.field private x:F


# direct methods
.method public constructor <init>(Lcom/my/target/ads/instream/InstreamAudioAd;)V
    .locals 2

    .prologue
    const/high16 v1, 0x3f800000    # 1.0f

    .line 317
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    new-instance v0, Lcom/my/target/core/controllers/a$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/controllers/a$1;-><init>(Lcom/my/target/core/controllers/a;)V

    iput-object v0, p0, Lcom/my/target/core/controllers/a;->c:Ljava/lang/Runnable;

    .line 119
    new-instance v0, Lcom/my/target/core/controllers/a$2;

    invoke-direct {v0, p0}, Lcom/my/target/core/controllers/a$2;-><init>(Lcom/my/target/core/controllers/a;)V

    iput-object v0, p0, Lcom/my/target/core/controllers/a;->d:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    .line 248
    iput v1, p0, Lcom/my/target/core/controllers/a;->w:F

    .line 249
    iput v1, p0, Lcom/my/target/core/controllers/a;->x:F

    .line 318
    iput-object p1, p0, Lcom/my/target/core/controllers/a;->b:Lcom/my/target/ads/instream/InstreamAudioAd;

    .line 319
    return-void
.end method

.method private a(I)V
    .locals 6

    .prologue
    const/4 v5, 0x0

    .line 531
    :goto_0
    iput-boolean v5, p0, Lcom/my/target/core/controllers/a;->i:Z

    .line 532
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->k:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/c;

    iput-object v0, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    .line 533
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_0

    .line 534
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 536
    :cond_0
    const-string/jumbo v0, "statistics"

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/c;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 538
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->e:Lcom/my/target/core/models/c;

    if-eqz v0, :cond_1

    .line 539
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    const-string/jumbo v1, "playbackStarted"

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    .line 541
    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    .line 539
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 542
    :cond_1
    iget v0, p0, Lcom/my/target/core/controllers/a;->f:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/my/target/core/controllers/a;->f:I

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 543
    iget p1, p0, Lcom/my/target/core/controllers/a;->f:I

    goto :goto_0

    .line 545
    :cond_2
    invoke-direct {p0, v5, v5}, Lcom/my/target/core/controllers/a;->a(ZZ)V

    .line 564
    :cond_3
    :goto_1
    return-void

    .line 549
    :cond_4
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/c;->a()Lcom/my/target/core/models/e;

    move-result-object v1

    .line 551
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/c;->getStats()Ljava/util/ArrayList;

    move-result-object v0

    .line 1568
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    iput-object v2, p0, Lcom/my/target/core/controllers/a;->q:Ljava/util/HashSet;

    .line 1569
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_5
    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_6

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/k;

    .line 1571
    invoke-virtual {v0}, Lcom/my/target/core/models/k;->c()Ljava/lang/String;

    move-result-object v3

    const-string/jumbo v4, "playheadReachedValue"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    instance-of v3, v0, Lcom/my/target/core/models/i;

    if-eqz v3, :cond_5

    .line 1573
    iget-object v3, p0, Lcom/my/target/core/controllers/a;->q:Ljava/util/HashSet;

    check-cast v0, Lcom/my/target/core/models/i;

    invoke-virtual {v3, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 553
    :cond_6
    if-eqz v1, :cond_7

    invoke-virtual {v1}, Lcom/my/target/core/models/e;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_7

    .line 555
    invoke-virtual {v1}, Lcom/my/target/core/models/e;->a()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 556
    iget-object v1, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    iget v2, p0, Lcom/my/target/core/controllers/a;->w:F

    invoke-interface {v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->setVolume(F)V

    .line 557
    iget-object v1, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v1, v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->playAdAudio(Landroid/net/Uri;)V

    .line 558
    iput v5, p0, Lcom/my/target/core/controllers/a;->n:I

    goto :goto_1

    .line 559
    :cond_7
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    if-eqz v0, :cond_3

    .line 562
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    const-string/jumbo v1, "Missing audiodata params"

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->b:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onError(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V

    goto :goto_1
.end method

.method static synthetic a(Lcom/my/target/core/controllers/a;F)V
    .locals 2

    .prologue
    .line 26
    .line 2518
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->q:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2520
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->q:Ljava/util/HashSet;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v1}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, p1, v1}, Lcom/my/target/core/models/c;->a(Ljava/util/Set;FLandroid/content/Context;)V

    .line 26
    :cond_0
    return-void
.end method

.method private a(ZZ)V
    .locals 3

    .prologue
    .line 580
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->k()V

    .line 581
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/controllers/a;->r:Z

    .line 583
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 585
    if-eqz p1, :cond_0

    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 587
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    const-string/jumbo v1, "closedByUser"

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    .line 589
    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    .line 587
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 592
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    if-eqz v0, :cond_1

    .line 593
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->b:Lcom/my/target/ads/instream/InstreamAudioAd;

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onBannerComplete(Lcom/my/target/ads/instream/InstreamAudioAd;Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;)V

    .line 595
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->stopAdAudio()V

    .line 598
    :cond_2
    if-eqz p2, :cond_3

    .line 600
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->m()V

    .line 1616
    :goto_0
    return-void

    .line 1609
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->k:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_6

    .line 1611
    iget v0, p0, Lcom/my/target/core/controllers/a;->f:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/my/target/core/controllers/a;->f:I

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->k:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-ge v0, v1, :cond_6

    .line 1613
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_5

    .line 1615
    :cond_4
    iget v0, p0, Lcom/my/target/core/controllers/a;->f:I

    invoke-direct {p0, v0}, Lcom/my/target/core/controllers/a;->a(I)V

    goto :goto_0

    .line 1619
    :cond_5
    const-string/jumbo v0, "Reached maximum of ad banners for current section"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 1624
    :cond_6
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->m()V

    goto :goto_0
.end method

.method static synthetic a(Lcom/my/target/core/controllers/a;)Z
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/my/target/core/controllers/a;->s:Z

    return v0
.end method

.method static synthetic a(Lcom/my/target/core/controllers/a;Z)Z
    .locals 0

    .prologue
    .line 26
    iput-boolean p1, p0, Lcom/my/target/core/controllers/a;->r:Z

    return p1
.end method

.method static synthetic b(Lcom/my/target/core/controllers/a;F)F
    .locals 0

    .prologue
    .line 26
    iput p1, p0, Lcom/my/target/core/controllers/a;->t:F

    return p1
.end method

.method static synthetic b(Lcom/my/target/core/controllers/a;)Z
    .locals 1

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    return v0
.end method

.method static synthetic c(Lcom/my/target/core/controllers/a;F)F
    .locals 0

    .prologue
    .line 26
    iput p1, p0, Lcom/my/target/core/controllers/a;->x:F

    return p1
.end method

.method static synthetic c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    return-object v0
.end method

.method static synthetic d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    return-object v0
.end method

.method static synthetic e(Lcom/my/target/core/controllers/a;)Z
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/my/target/core/controllers/a;->i:Z

    return v0
.end method

.method static synthetic f(Lcom/my/target/core/controllers/a;)Z
    .locals 1

    .prologue
    .line 26
    iget-boolean v0, p0, Lcom/my/target/core/controllers/a;->h:Z

    return v0
.end method

.method static synthetic g(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/sections/c;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->p:Lcom/my/target/core/models/sections/c;

    return-object v0
.end method

.method static synthetic h(Lcom/my/target/core/controllers/a;)Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/controllers/a;->h:Z

    return v0
.end method

.method static synthetic i()Landroid/os/Handler;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    return-object v0
.end method

.method static synthetic i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    return-object v0
.end method

.method static synthetic j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->b:Lcom/my/target/ads/instream/InstreamAudioAd;

    return-object v0
.end method

.method private j()Z
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 466
    const/4 v0, 0x1

    .line 468
    iget-object v2, p0, Lcom/my/target/core/controllers/a;->e:Lcom/my/target/core/models/c;

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    if-nez v2, :cond_1

    .line 470
    :cond_0
    const-string/jumbo v0, "Unable to perform operation: not loaded yet"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    move v0, v1

    .line 473
    :cond_1
    iget-object v2, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    if-nez v2, :cond_2

    .line 475
    const-string/jumbo v0, "Player not created"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    move v0, v1

    .line 479
    :cond_2
    if-eqz v0, :cond_3

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    if-nez v2, :cond_3

    .line 481
    const-string/jumbo v0, "Player return null view"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    .line 485
    :goto_0
    return v1

    :cond_3
    move v1, v0

    goto :goto_0
.end method

.method private k()V
    .locals 2

    .prologue
    .line 490
    sget-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 491
    sget-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->c:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 493
    :cond_0
    const/4 v0, 0x0

    sput-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    .line 494
    return-void
.end method

.method static synthetic k(Lcom/my/target/core/controllers/a;)Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/controllers/a;->i:Z

    return v0
.end method

.method static synthetic l(Lcom/my/target/core/controllers/a;)F
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/my/target/core/controllers/a;->t:F

    return v0
.end method

.method private l()V
    .locals 4

    .prologue
    .line 498
    sget-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 502
    :try_start_0
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 509
    :cond_0
    :goto_0
    sget-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 511
    sget-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->c:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 512
    sget-object v0, Lcom/my/target/core/controllers/a;->a:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->c:Ljava/lang/Runnable;

    const-wide/16 v2, 0xc8

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 514
    :cond_1
    return-void

    .line 503
    :catch_0
    move-exception v0

    .line 505
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

.method static synthetic m(Lcom/my/target/core/controllers/a;)I
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/target/core/controllers/a;->n:I

    return v0
.end method

.method private m()V
    .locals 3

    .prologue
    .line 629
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->u:Lcom/my/target/core/controllers/a$a;

    if-eqz v0, :cond_1

    .line 631
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->u:Lcom/my/target/core/controllers/a$a;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/my/target/core/controllers/a$a;->sectionCompleted(Ljava/lang/String;)V

    .line 636
    :cond_0
    :goto_0
    return-void

    .line 632
    :cond_1
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    if-eqz v0, :cond_0

    .line 634
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->b:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V

    goto :goto_0
.end method

.method static synthetic n(Lcom/my/target/core/controllers/a;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 26
    invoke-direct {p0, v0, v0}, Lcom/my/target/core/controllers/a;->a(ZZ)V

    return-void
.end method

.method static synthetic o(Lcom/my/target/core/controllers/a;)I
    .locals 2

    .prologue
    .line 26
    iget v0, p0, Lcom/my/target/core/controllers/a;->n:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/my/target/core/controllers/a;->n:I

    return v0
.end method

.method static synthetic p(Lcom/my/target/core/controllers/a;)I
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/my/target/core/controllers/a;->n:I

    return v0
.end method

.method static synthetic q(Lcom/my/target/core/controllers/a;)I
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/my/target/core/controllers/a;->v:I

    return v0
.end method

.method static synthetic r(Lcom/my/target/core/controllers/a;)Ljava/lang/Runnable;
    .locals 1

    .prologue
    .line 26
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->c:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic s(Lcom/my/target/core/controllers/a;)Z
    .locals 1

    .prologue
    .line 26
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/controllers/a;->s:Z

    return v0
.end method

.method static synthetic t(Lcom/my/target/core/controllers/a;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->l()V

    return-void
.end method

.method static synthetic u(Lcom/my/target/core/controllers/a;)V
    .locals 0

    .prologue
    .line 26
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->k()V

    return-void
.end method

.method static synthetic v(Lcom/my/target/core/controllers/a;)F
    .locals 1

    .prologue
    .line 26
    iget v0, p0, Lcom/my/target/core/controllers/a;->x:F

    return v0
.end method


# virtual methods
.method public final a()Lcom/my/target/ads/instream/InstreamAudioAdPlayer;
    .locals 1

    .prologue
    .line 253
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    return-object v0
.end method

.method public final a(F)V
    .locals 1

    .prologue
    .line 309
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/my/target/core/controllers/a;->w:F

    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0, p1}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->setVolume(F)V

    .line 313
    :cond_0
    iput p1, p0, Lcom/my/target/core/controllers/a;->w:F

    .line 314
    return-void
.end method

.method public final a(Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;)V
    .locals 0

    .prologue
    .line 299
    iput-object p1, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    .line 300
    return-void
.end method

.method public final a(Lcom/my/target/ads/instream/InstreamAudioAdPlayer;)V
    .locals 1

    .prologue
    .line 293
    iput-object p1, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    .line 294
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->d:Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;

    invoke-interface {p1, v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->setAdPlayerListener(Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;)V

    .line 295
    return-void
.end method

.method public final a(Lcom/my/target/ads/instream/models/InstreamAdCompanionBanner;)V
    .locals 2

    .prologue
    .line 453
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->e:Lcom/my/target/core/models/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 454
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->e:Lcom/my/target/core/models/c;

    check-cast p1, Lcom/my/target/core/models/banners/d;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v1}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 455
    :cond_0
    return-void
.end method

.method public final a(Lcom/my/target/core/controllers/a$a;)V
    .locals 0

    .prologue
    .line 275
    iput-object p1, p0, Lcom/my/target/core/controllers/a;->u:Lcom/my/target/core/controllers/a$a;

    .line 276
    return-void
.end method

.method public final a(Lcom/my/target/core/models/c;)V
    .locals 0

    .prologue
    .line 270
    iput-object p1, p0, Lcom/my/target/core/controllers/a;->e:Lcom/my/target/core/models/c;

    .line 271
    return-void
.end method

.method public final a(Lcom/my/target/core/models/sections/c;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/my/target/core/models/sections/c;",
            "Ljava/util/List",
            "<",
            "Lcom/my/target/core/models/banners/c;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 323
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/c;->k()Lcom/my/target/core/models/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/f;->b()I

    move-result v0

    .line 324
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/c;->e()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    if-lez v0, :cond_0

    .line 326
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 328
    :cond_0
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/c;->e()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    .line 329
    invoke-virtual {p0, p1, p2}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/models/sections/c;Ljava/util/List;)V

    .line 330
    return-void
.end method

.method public final a(Ljava/lang/String;)Z
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

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
    invoke-direct {p0, v0, v0}, Lcom/my/target/core/controllers/a;->a(ZZ)V

    .line 377
    return-void
.end method

.method public final b(Lcom/my/target/ads/instream/models/InstreamAdCompanionBanner;)V
    .locals 1

    .prologue
    .line 460
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->e:Lcom/my/target/core/models/c;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 461
    check-cast p1, Lcom/my/target/core/models/banners/d;

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/my/target/core/models/c;->c(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 462
    :cond_0
    return-void
.end method

.method public final b(Lcom/my/target/core/models/sections/c;Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/my/target/core/models/sections/c;",
            "Ljava/util/List",
            "<",
            "Lcom/my/target/core/models/banners/c;",
            ">;)V"
        }
    .end annotation

    .prologue
    const/4 v2, 0x0

    .line 334
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/c;->e()Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

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

    iput-object v0, p0, Lcom/my/target/core/controllers/a;->k:Ljava/util/ArrayList;

    .line 340
    iput v2, p0, Lcom/my/target/core/controllers/a;->f:I

    .line 341
    iput-boolean v2, p0, Lcom/my/target/core/controllers/a;->h:Z

    .line 342
    iput-object p1, p0, Lcom/my/target/core/controllers/a;->p:Lcom/my/target/core/models/sections/c;

    .line 343
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/c;->k()Lcom/my/target/core/models/f;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/f;->a()I

    move-result v0

    iput v0, p0, Lcom/my/target/core/controllers/a;->v:I

    .line 345
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 347
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->u:Lcom/my/target/core/controllers/a$a;

    if-eqz v0, :cond_2

    .line 349
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->u:Lcom/my/target/core/controllers/a$a;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    invoke-interface {v0, v1}, Lcom/my/target/core/controllers/a$a;->sectionCompleted(Ljava/lang/String;)V

    goto :goto_0

    .line 350
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    if-eqz v0, :cond_0

    .line 352
    const-string/jumbo v0, "Banners list is empty"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 353
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->b:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V

    goto :goto_0

    .line 357
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/my/target/core/controllers/a;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    if-lez v0, :cond_5

    .line 359
    :cond_4
    iput-boolean v2, p0, Lcom/my/target/core/controllers/a;->s:Z

    .line 360
    iput v2, p0, Lcom/my/target/core/controllers/a;->n:I

    .line 361
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->l()V

    .line 362
    invoke-direct {p0, v2}, Lcom/my/target/core/controllers/a;->a(I)V

    goto :goto_0

    .line 365
    :cond_5
    const-string/jumbo v0, "Reached maximum of ad banners for current section"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 366
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->o:Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->g:Ljava/lang/String;

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->b:Lcom/my/target/ads/instream/InstreamAudioAd;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onComplete(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V

    goto :goto_0
.end method

.method public final c()V
    .locals 2

    .prologue
    .line 384
    const/4 v0, 0x1

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lcom/my/target/core/controllers/a;->a(ZZ)V

    .line 385
    return-void
.end method

.method public final d()V
    .locals 1

    .prologue
    .line 392
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 394
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->pauseAdAudio()V

    .line 396
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->k()V

    .line 397
    return-void
.end method

.method public final e()V
    .locals 1

    .prologue
    .line 404
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 406
    iget-boolean v0, p0, Lcom/my/target/core/controllers/a;->r:Z

    if-eqz v0, :cond_0

    .line 407
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->l()V

    .line 408
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->resumeAdAudio()V

    .line 410
    :cond_1
    return-void
.end method

.method public final f()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 417
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 419
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->stopAdAudio()V

    .line 420
    const/4 v0, 0x1

    invoke-direct {p0, v3, v0}, Lcom/my/target/core/controllers/a;->a(ZZ)V

    .line 421
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    const-string/jumbo v1, "playbackStopped"

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    .line 423
    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    .line 421
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 425
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->k()V

    .line 426
    iput-boolean v3, p0, Lcom/my/target/core/controllers/a;->r:Z

    .line 427
    return-void
.end method

.method public final g()V
    .locals 1

    .prologue
    .line 434
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 436
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->destroy()V

    .line 438
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->k()V

    .line 439
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/controllers/a;->r:Z

    .line 440
    return-void
.end method

.method public final h()V
    .locals 3

    .prologue
    .line 444
    invoke-direct {p0}, Lcom/my/target/core/controllers/a;->j()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 446
    iget-object v0, p0, Lcom/my/target/core/controllers/a;->e:Lcom/my/target/core/models/c;

    iget-object v1, p0, Lcom/my/target/core/controllers/a;->m:Lcom/my/target/core/models/banners/c;

    iget-object v2, p0, Lcom/my/target/core/controllers/a;->l:Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Landroid/content/Context;)V

    .line 448
    :cond_0
    return-void
.end method
