.class public final Lcom/my/target/core/engines/h;
.super Lcom/my/target/core/engines/a;
.source "Native320x50Engine.java"

# interfaces
.implements Lcom/my/target/core/ui/views/StandardNative320x50View$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/engines/h$a;
    }
.end annotation


# static fields
.field private static c:Landroid/os/Handler;


# instance fields
.field private A:I

.field private final d:Lcom/my/target/core/ui/views/AdView;

.field private final e:Lcom/my/target/ads/MyTargetView;

.field private final f:[Landroid/widget/ViewFlipper;

.field private final g:Landroid/widget/ViewFlipper;

.field private final h:[Lcom/my/target/core/facades/h;

.field private final i:Lcom/my/target/core/engines/h$a;

.field private final j:Lcom/my/target/core/net/b$a;

.field private final k:Landroid/view/animation/Animation$AnimationListener;

.field private final l:Ljava/lang/Runnable;

.field private final m:Lcom/my/target/core/net/b$a;

.field private final n:Lcom/my/target/core/facades/h$a;

.field private o:I

.field private p:J

.field private q:J

.field private r:I

.field private s:Lcom/my/target/core/models/j;

.field private t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

.field private u:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/banners/j;",
            ">;"
        }
    .end annotation
.end field

.field private v:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/banners/j;",
            ">;"
        }
    .end annotation
.end field

.field private w:Lcom/my/target/core/models/banners/j;

.field private x:Z

.field private y:Z

.field private z:Z


# direct methods
.method public constructor <init>(Lcom/my/target/ads/MyTargetView;Landroid/content/Context;)V
    .locals 7

    .prologue
    const/4 v2, 0x2

    const/4 v6, 0x1

    const/4 v5, 0x0

    const/4 v4, -0x1

    .line 370
    invoke-direct {p0, p1, p2}, Lcom/my/target/core/engines/a;-><init>(Landroid/view/ViewGroup;Landroid/content/Context;)V

    .line 57
    new-instance v0, Lcom/my/target/core/engines/h$a;

    invoke-direct {v0, v5}, Lcom/my/target/core/engines/h$a;-><init>(B)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    .line 58
    new-instance v0, Lcom/my/target/core/engines/h$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/h$1;-><init>(Lcom/my/target/core/engines/h;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->j:Lcom/my/target/core/net/b$a;

    .line 71
    new-instance v0, Lcom/my/target/core/engines/h$2;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/h$2;-><init>(Lcom/my/target/core/engines/h;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->k:Landroid/view/animation/Animation$AnimationListener;

    .line 111
    new-instance v0, Lcom/my/target/core/engines/h$3;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/h$3;-><init>(Lcom/my/target/core/engines/h;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->l:Ljava/lang/Runnable;

    .line 127
    new-instance v0, Lcom/my/target/core/engines/h$4;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/h$4;-><init>(Lcom/my/target/core/engines/h;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->m:Lcom/my/target/core/net/b$a;

    .line 143
    new-instance v0, Lcom/my/target/core/engines/h$5;

    invoke-direct {v0, p0}, Lcom/my/target/core/engines/h$5;-><init>(Lcom/my/target/core/engines/h;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->n:Lcom/my/target/core/facades/h$a;

    .line 371
    iput-object p1, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    .line 372
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    .line 373
    new-instance v0, Lcom/my/target/core/ui/views/AdView;

    invoke-direct {v0, p2}, Lcom/my/target/core/ui/views/AdView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    .line 374
    new-instance v0, Landroid/widget/ViewFlipper;

    invoke-direct {v0, p2}, Landroid/widget/ViewFlipper;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    .line 375
    new-array v0, v2, [Landroid/widget/ViewFlipper;

    iput-object v0, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    .line 376
    iget-object v0, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    new-instance v1, Landroid/widget/ViewFlipper;

    invoke-direct {v1, p2}, Landroid/widget/ViewFlipper;-><init>(Landroid/content/Context;)V

    aput-object v1, v0, v5

    .line 377
    iget-object v0, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    new-instance v1, Landroid/widget/ViewFlipper;

    invoke-direct {v1, p2}, Landroid/widget/ViewFlipper;-><init>(Landroid/content/Context;)V

    aput-object v1, v0, v6

    .line 378
    new-array v0, v2, [Lcom/my/target/core/facades/h;

    iput-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    .line 2393
    iget-object v0, p0, Lcom/my/target/core/engines/h;->b:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    .line 2394
    const/high16 v1, 0x42480000    # 50.0f

    mul-float/2addr v1, v0

    float-to-int v1, v1

    iput v1, p0, Lcom/my/target/core/engines/h;->r:I

    .line 2396
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2398
    iget-object v2, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    invoke-virtual {v2, v1}, Landroid/widget/ViewFlipper;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2400
    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v1, v4, v4}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2404
    iget-object v2, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    const/high16 v3, 0x44200000    # 640.0f

    mul-float/2addr v0, v3

    float-to-int v0, v0

    invoke-virtual {v2, v0}, Lcom/my/target/core/ui/views/AdView;->setMaxWidth(I)V

    .line 2406
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    iget v2, p0, Lcom/my/target/core/engines/h;->r:I

    invoke-direct {v0, v4, v2}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 2408
    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 2409
    iget-object v2, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v2, v0}, Lcom/my/target/core/ui/views/AdView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 2411
    iget-object v0, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    iget-object v2, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    aget-object v2, v2, v5

    invoke-virtual {v0, v2}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 2412
    iget-object v0, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    iget-object v2, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    aget-object v2, v2, v6

    invoke-virtual {v0, v2}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 2414
    iget-object v0, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    iget-object v2, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    invoke-virtual {v0, v2, v1}, Lcom/my/target/core/ui/views/AdView;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 2416
    iget-object v0, p0, Lcom/my/target/core/engines/h;->a:Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 380
    return-void
.end method

.method static synthetic a(Lcom/my/target/core/engines/h;J)J
    .locals 1

    .prologue
    .line 28
    iput-wide p1, p0, Lcom/my/target/core/engines/h;->p:J

    return-wide p1
.end method

.method static synthetic a(Lcom/my/target/core/engines/h;)Lcom/my/target/core/engines/h$a;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    return-object v0
.end method

.method static synthetic a(Lcom/my/target/core/engines/h;Lcom/my/target/core/models/banners/j;)Lcom/my/target/core/models/banners/j;
    .locals 0

    .prologue
    .line 28
    iput-object p1, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    return-object p1
.end method

.method private static a(Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/banners/j;",
            ">;)",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/my/target/core/models/h;",
            ">;"
        }
    .end annotation

    .prologue
    .line 40
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 41
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/j;

    .line 43
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v3

    if-eqz v3, :cond_0

    .line 45
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->f()Lcom/my/target/nativeads/models/ImageData;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 49
    :cond_1
    return-object v1
.end method

.method private a(Landroid/widget/ViewFlipper;)V
    .locals 5

    .prologue
    .line 526
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->l()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 528
    iget-object v0, p0, Lcom/my/target/core/engines/h;->v:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/j;

    .line 530
    new-instance v2, Lcom/my/target/core/ui/views/StandardNative320x50View;

    iget-object v3, p0, Lcom/my/target/core/engines/h;->b:Landroid/content/Context;

    iget v4, p0, Lcom/my/target/core/engines/h;->r:I

    invoke-direct {v2, v3, v4}, Lcom/my/target/core/ui/views/StandardNative320x50View;-><init>(Landroid/content/Context;I)V

    .line 531
    const-string/jumbo v3, "banner"

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->getType()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    .line 532
    iget-object v4, p0, Lcom/my/target/core/engines/h;->s:Lcom/my/target/core/models/j;

    invoke-virtual {v2, v4, v3}, Lcom/my/target/core/ui/views/StandardNative320x50View;->setViewSettings(Lcom/my/target/core/models/j;Z)V

    .line 533
    invoke-virtual {v2, p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->setMyTargetClickListener(Lcom/my/target/core/engines/h;)V

    .line 534
    invoke-virtual {v2, p0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->setEngineListener(Lcom/my/target/core/ui/views/StandardNative320x50View$a;)V

    .line 535
    invoke-virtual {p1, v2}, Landroid/widget/ViewFlipper;->addView(Landroid/view/View;)V

    .line 536
    iget v3, p0, Lcom/my/target/core/engines/h;->A:I

    invoke-virtual {v2, v0, v3}, Lcom/my/target/core/ui/views/StandardNative320x50View;->setBanner(Lcom/my/target/core/models/banners/j;I)V

    goto :goto_0

    .line 539
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/h;->v:Ljava/util/ArrayList;

    iput-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    .line 540
    return-void
.end method

.method static synthetic a(Lcom/my/target/core/engines/h;Landroid/widget/ViewFlipper;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/my/target/core/engines/h;->a(Landroid/widget/ViewFlipper;)V

    return-void
.end method

.method static synthetic a(Lcom/my/target/core/engines/h;Lcom/my/target/core/facades/h;)V
    .locals 6

    .prologue
    .line 28
    .line 8586
    invoke-virtual {p1}, Lcom/my/target/core/facades/h;->f()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/engines/h;->v:Ljava/util/ArrayList;

    .line 8587
    iget-object v0, p0, Lcom/my/target/core/engines/h;->v:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 8588
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 8590
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->l()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/h;->a(Landroid/widget/ViewFlipper;)V

    .line 8591
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/engines/h;->x:Z

    .line 8592
    const-string/jumbo v0, "banner"

    iget-object v1, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getType()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    .line 8593
    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->getTimeout()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    .line 8594
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/my/target/core/engines/h;->p:J

    sub-long/2addr v2, v4

    cmp-long v0, v0, v2

    if-gtz v0, :cond_0

    .line 8596
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->m()V

    :cond_0
    :goto_0
    return-void

    .line 8606
    :cond_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 8608
    invoke-static {}, Lcom/my/target/core/net/b;->a()Lcom/my/target/core/net/b;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/engines/h;->b:Landroid/content/Context;

    iget-object v3, p0, Lcom/my/target/core/engines/h;->m:Lcom/my/target/core/net/b$a;

    invoke-virtual {v1, v0, v2, v3}, Lcom/my/target/core/net/b;->a(Ljava/util/List;Landroid/content/Context;Lcom/my/target/core/net/b$a;)V

    goto :goto_0
.end method

.method static synthetic a(Lcom/my/target/core/engines/h;Ljava/lang/String;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0, p1}, Lcom/my/target/core/engines/h;->b(Ljava/lang/String;)V

    return-void
.end method

.method private a(Lcom/my/target/core/models/sections/j;)V
    .locals 11

    .prologue
    .line 502
    const/4 v0, 0x0

    .line 503
    if-eqz p1, :cond_5

    .line 505
    invoke-virtual {p1}, Lcom/my/target/core/models/sections/j;->n()I

    move-result v0

    move v10, v0

    .line 4561
    :goto_0
    if-nez v10, :cond_0

    .line 5159
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 5160
    const-wide/16 v2, 0xa

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    move-object v9, v0

    .line 6545
    :goto_1
    if-nez v10, :cond_2

    .line 7166
    new-instance v0, Landroid/view/animation/AlphaAnimation;

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 7167
    const-wide/16 v2, 0xa

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setStartOffset(J)V

    .line 7168
    const-wide/16 v2, 0xa

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 511
    :goto_2
    iget-object v1, p0, Lcom/my/target/core/engines/h;->k:Landroid/view/animation/Animation$AnimationListener;

    invoke-virtual {v9, v1}, Landroid/view/animation/Animation;->setAnimationListener(Landroid/view/animation/Animation$AnimationListener;)V

    .line 513
    iget-object v1, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    invoke-virtual {v1, v9}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 514
    iget-object v1, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    invoke-virtual {v1, v0}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 516
    iget-object v2, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    array-length v3, v2

    const/4 v1, 0x0

    :goto_3
    if-ge v1, v3, :cond_4

    aget-object v4, v2, v1

    .line 518
    invoke-virtual {v4, v9}, Landroid/widget/ViewFlipper;->setInAnimation(Landroid/view/animation/Animation;)V

    .line 519
    invoke-virtual {v4, v0}, Landroid/widget/ViewFlipper;->setOutAnimation(Landroid/view/animation/Animation;)V

    .line 516
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    .line 4564
    :cond_0
    const/4 v0, 0x2

    if-ne v10, v0, :cond_1

    .line 6148
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/high16 v2, 0x3f800000    # 1.0f

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 6152
    const-wide/16 v2, 0x190

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 6153
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    move-object v9, v0

    .line 4566
    goto :goto_1

    .line 4569
    :cond_1
    invoke-static {}, Lcom/my/target/core/utils/b;->a()Landroid/view/animation/Animation;

    move-result-object v0

    move-object v9, v0

    goto :goto_1

    .line 6548
    :cond_2
    const/4 v0, 0x2

    if-ne v10, v0, :cond_3

    .line 8137
    new-instance v0, Landroid/view/animation/TranslateAnimation;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/high16 v4, -0x40800000    # -1.0f

    const/4 v5, 0x2

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/4 v8, 0x0

    invoke-direct/range {v0 .. v8}, Landroid/view/animation/TranslateAnimation;-><init>(IFIFIFIF)V

    .line 8141
    const-wide/16 v2, 0x190

    invoke-virtual {v0, v2, v3}, Landroid/view/animation/Animation;->setDuration(J)V

    .line 8142
    new-instance v1, Landroid/view/animation/AccelerateDecelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateDecelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/view/animation/Animation;->setInterpolator(Landroid/view/animation/Interpolator;)V

    goto :goto_2

    .line 6553
    :cond_3
    invoke-static {}, Lcom/my/target/core/utils/b;->b()Landroid/view/animation/Animation;

    move-result-object v0

    goto :goto_2

    .line 521
    :cond_4
    return-void

    :cond_5
    move v10, v0

    goto/16 :goto_0
.end method

.method private a(Z)V
    .locals 1

    .prologue
    .line 622
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getCurrentView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 624
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getCurrentView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-virtual {v0, p1}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a(Z)V

    .line 626
    :cond_0
    return-void
.end method

.method static synthetic b(Lcom/my/target/core/engines/h;J)J
    .locals 1

    .prologue
    .line 28
    iput-wide p1, p0, Lcom/my/target/core/engines/h;->q:J

    return-wide p1
.end method

.method static synthetic b(Lcom/my/target/core/engines/h;)Lcom/my/target/ads/MyTargetView;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    return-object v0
.end method

.method private b(Ljava/lang/String;)V
    .locals 3

    .prologue
    const/4 v2, -0x2

    .line 351
    if-eqz p1, :cond_2

    .line 353
    iget-object v0, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    if-nez v0, :cond_0

    .line 355
    new-instance v0, Lcom/my/target/core/ui/views/controls/AdInfoButton;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->b:Landroid/content/Context;

    invoke-direct {v0, v1}, Lcom/my/target/core/ui/views/controls/AdInfoButton;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    .line 356
    iget-object v0, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0, v1, v2, v2}, Lcom/my/target/core/ui/views/AdView;->addView(Landroid/view/View;II)V

    .line 359
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0, p1}, Lcom/my/target/core/ui/views/controls/AdInfoButton;->setUrl(Ljava/lang/String;)V

    .line 366
    :cond_1
    :goto_0
    return-void

    .line 360
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    if-eqz v0, :cond_1

    .line 362
    iget-object v0, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/controls/AdInfoButton;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    .line 363
    if-eqz v0, :cond_3

    iget-object v1, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 364
    :cond_3
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/target/core/engines/h;->t:Lcom/my/target/core/ui/views/controls/AdInfoButton;

    goto :goto_0
.end method

.method static synthetic c(Lcom/my/target/core/engines/h;)Z
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/engines/h;->z:Z

    return v0
.end method

.method static synthetic d(Lcom/my/target/core/engines/h;)Ljava/util/ArrayList;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic e(Lcom/my/target/core/engines/h;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    return-object v0
.end method

.method static synthetic f(Lcom/my/target/core/engines/h;)Lcom/my/target/core/models/banners/j;
    .locals 1

    .prologue
    .line 28
    iget-object v0, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    return-object v0
.end method

.method static synthetic g(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->n()V

    return-void
.end method

.method static synthetic h(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    return-object v0
.end method

.method private i()Lcom/my/target/core/facades/h;
    .locals 2

    .prologue
    .line 176
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method static synthetic i(Lcom/my/target/core/engines/h;)V
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/h;->a(Z)V

    return-void
.end method

.method private j()Landroid/widget/ViewFlipper;
    .locals 2

    .prologue
    .line 181
    iget-object v0, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    aget-object v0, v0, v1

    return-object v0
.end method

.method static synthetic j(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->o()V

    return-void
.end method

.method private k()Lcom/my/target/core/facades/h;
    .locals 2

    .prologue
    .line 186
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method static synthetic k(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->m()V

    return-void
.end method

.method private l()Landroid/widget/ViewFlipper;
    .locals 2

    .prologue
    .line 191
    iget-object v0, p0, Lcom/my/target/core/engines/h;->f:[Landroid/widget/ViewFlipper;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    return-object v0
.end method

.method static synthetic l(Lcom/my/target/core/engines/h;)Z
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/engines/h;->y:Z

    return v0
.end method

.method static synthetic m(Lcom/my/target/core/engines/h;)Landroid/widget/ViewFlipper;
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->l()Landroid/widget/ViewFlipper;

    move-result-object v0

    return-object v0
.end method

.method private m()V
    .locals 5

    .prologue
    const/4 v2, 0x0

    const/4 v4, 0x1

    const/4 v3, 0x0

    .line 421
    iget-boolean v0, p0, Lcom/my/target/core/engines/h;->x:Z

    if-eqz v0, :cond_2

    .line 2639
    iget v0, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/my/target/core/engines/h;->o:I

    .line 2640
    iget-object v0, p0, Lcom/my/target/core/engines/h;->g:Landroid/widget/ViewFlipper;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    invoke-virtual {v0, v1}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    .line 2642
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0, v2}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 2643
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v1, v1, 0x1

    aput-object v2, v0, v1

    .line 2645
    invoke-direct {p0, v3}, Lcom/my/target/core/engines/h;->a(Z)V

    .line 2646
    iget-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/j;

    iput-object v0, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    .line 2647
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2649
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->b(Ljava/lang/String;)V

    .line 2650
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->h()Lcom/my/target/core/models/sections/j;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/h;->a(Lcom/my/target/core/models/sections/j;)V

    .line 2651
    iget-object v0, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->getTimeout()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    iput-wide v0, p0, Lcom/my/target/core/engines/h;->q:J

    .line 2652
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->o()V

    .line 424
    :cond_0
    iput-boolean v3, p0, Lcom/my/target/core/engines/h;->y:Z

    .line 425
    iput-boolean v3, p0, Lcom/my/target/core/engines/h;->x:Z

    .line 452
    :cond_1
    :goto_0
    return-void

    .line 426
    :cond_2
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getDisplayedChild()I

    move-result v0

    .line 427
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    if-ge v0, v1, :cond_3

    .line 429
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->p()V

    .line 430
    iput-boolean v4, p0, Lcom/my/target/core/engines/h;->z:Z

    .line 431
    iput-boolean v3, p0, Lcom/my/target/core/engines/h;->y:Z

    .line 432
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->showNext()V

    goto :goto_0

    .line 435
    :cond_3
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->h()Lcom/my/target/core/models/sections/j;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 437
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->h()Lcom/my/target/core/models/sections/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/sections/j;->l()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 3576
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->b()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-direct {p0}, Lcom/my/target/core/engines/h;->k()Lcom/my/target/core/facades/h;

    move-result-object v0

    if-nez v0, :cond_4

    .line 3578
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    .line 4346
    iget-object v1, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v2, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v2, v2, 0x1

    aput-object v0, v1, v2

    .line 3579
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->k()Lcom/my/target/core/facades/h;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/h;->n:Lcom/my/target/core/facades/h$a;

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 3580
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->k()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->load()V

    .line 442
    :cond_4
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getChildCount()I

    move-result v0

    if-le v0, v4, :cond_1

    .line 444
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->h()Lcom/my/target/core/models/sections/j;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/sections/j;->m()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 446
    iput-boolean v4, p0, Lcom/my/target/core/engines/h;->z:Z

    .line 447
    iput-boolean v3, p0, Lcom/my/target/core/engines/h;->y:Z

    .line 448
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/widget/ViewFlipper;->setDisplayedChild(I)V

    goto/16 :goto_0
.end method

.method private n()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 456
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/h;->a(Landroid/widget/ViewFlipper;)V

    .line 458
    iget-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 461
    iget-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/models/banners/j;

    iput-object v0, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    .line 462
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 464
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/j;->getId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/my/target/core/facades/h;->b(Ljava/lang/String;)V

    .line 465
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/my/target/core/engines/h;->p:J

    .line 466
    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 467
    sput-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->l:Ljava/lang/Runnable;

    iget-object v2, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v2}, Lcom/my/target/core/models/banners/j;->getTimeout()I

    move-result v2

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v2, v2

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 468
    invoke-direct {p0, v4}, Lcom/my/target/core/engines/h;->a(Z)V

    .line 471
    :cond_0
    return-void
.end method

.method static synthetic n(Lcom/my/target/core/engines/h;)Z
    .locals 1

    .prologue
    .line 28
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/engines/h;->x:Z

    return v0
.end method

.method static synthetic o(Lcom/my/target/core/engines/h;)J
    .locals 2

    .prologue
    .line 28
    iget-wide v0, p0, Lcom/my/target/core/engines/h;->p:J

    return-wide v0
.end method

.method private o()V
    .locals 4

    .prologue
    .line 488
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 490
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 493
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/my/target/core/engines/h;->u:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    iget-wide v0, p0, Lcom/my/target/core/engines/h;->q:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_2

    .line 495
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    if-nez v0, :cond_1

    new-instance v0, Landroid/os/Handler;

    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    sput-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    .line 496
    :cond_1
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->l:Ljava/lang/Runnable;

    iget-wide v2, p0, Lcom/my/target/core/engines/h;->q:J

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 498
    :cond_2
    return-void
.end method

.method static synthetic p(Lcom/my/target/core/engines/h;)Lcom/my/target/core/facades/h;
    .locals 1

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->k()Lcom/my/target/core/facades/h;

    move-result-object v0

    return-object v0
.end method

.method private p()V
    .locals 1

    .prologue
    .line 614
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getCurrentView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 616
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->getCurrentView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/ui/views/StandardNative320x50View;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/StandardNative320x50View;->a()V

    .line 618
    :cond_0
    return-void
.end method

.method private q()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 630
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    if-eqz v0, :cond_0

    .line 632
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v1, v1, 0x1

    aget-object v0, v0, v1

    invoke-virtual {v0, v2}, Lcom/my/target/core/facades/h;->a(Lcom/my/target/core/facades/h$a;)V

    .line 633
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v1, p0, Lcom/my/target/core/engines/h;->o:I

    xor-int/lit8 v1, v1, 0x1

    aput-object v2, v0, v1

    .line 635
    :cond_0
    return-void
.end method

.method static synthetic q(Lcom/my/target/core/engines/h;)V
    .locals 0

    .prologue
    .line 28
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->q()V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .prologue
    .line 253
    invoke-super {p0}, Lcom/my/target/core/engines/a;->a()V

    .line 255
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->a()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 257
    const-string/jumbo v0, "Pause native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 1475
    iget-boolean v0, p0, Lcom/my/target/core/engines/h;->z:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    if-eqz v0, :cond_0

    .line 1476
    iget-object v0, p0, Lcom/my/target/core/engines/h;->w:Lcom/my/target/core/models/banners/j;

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/j;->getTimeout()I

    move-result v0

    mul-int/lit16 v0, v0, 0x3e8

    int-to-long v0, v0

    .line 1477
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/my/target/core/engines/h;->p:J

    sub-long/2addr v2, v4

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/my/target/core/engines/h;->q:J

    .line 1479
    :cond_0
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    if-eqz v0, :cond_1

    .line 1481
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 1482
    const/4 v0, 0x0

    sput-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    .line 259
    :cond_1
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->p()V

    .line 260
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->f()V

    .line 262
    :goto_0
    return-void

    .line 261
    :cond_2
    const-string/jumbo v0, "Cannot pause native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final a(I)V
    .locals 0

    .prologue
    .line 206
    iput p1, p0, Lcom/my/target/core/engines/h;->A:I

    .line 207
    return-void
.end method

.method public final a(Lcom/my/target/core/engines/b$a;)V
    .locals 0

    .prologue
    .line 337
    return-void
.end method

.method public final a(Lcom/my/target/core/facades/g;)V
    .locals 4

    .prologue
    .line 212
    instance-of v0, p1, Lcom/my/target/core/facades/h;

    if-eqz v0, :cond_5

    move-object v0, p1

    .line 214
    check-cast v0, Lcom/my/target/core/facades/h;

    .line 1341
    iget-object v1, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    iget v2, p0, Lcom/my/target/core/engines/h;->o:I

    aput-object v0, v1, v2

    move-object v0, p1

    .line 215
    check-cast v0, Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->j()Lcom/my/target/core/models/j;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/engines/h;->s:Lcom/my/target/core/models/j;

    move-object v0, p1

    .line 217
    check-cast v0, Lcom/my/target/core/facades/h;

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->h()Lcom/my/target/core/models/sections/j;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/h;->a(Lcom/my/target/core/models/sections/j;)V

    .line 219
    check-cast p1, Lcom/my/target/core/facades/h;

    invoke-virtual {p1}, Lcom/my/target/core/facades/h;->f()Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/engines/h;->v:Ljava/util/ArrayList;

    .line 221
    iget-object v0, p0, Lcom/my/target/core/engines/h;->v:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4

    .line 223
    iget-object v0, p0, Lcom/my/target/core/engines/h;->v:Ljava/util/ArrayList;

    invoke-static {v0}, Lcom/my/target/core/engines/h;->a(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object v0

    .line 225
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 227
    invoke-static {}, Lcom/my/target/core/net/b;->a()Lcom/my/target/core/net/b;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/engines/h;->b:Landroid/content/Context;

    iget-object v3, p0, Lcom/my/target/core/engines/h;->j:Lcom/my/target/core/net/b$a;

    invoke-virtual {v1, v0, v2, v3}, Lcom/my/target/core/net/b;->a(Ljava/util/List;Landroid/content/Context;Lcom/my/target/core/net/b$a;)V

    .line 236
    :cond_0
    :goto_0
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 237
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/facades/h;->e()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/my/target/core/engines/h;->b(Ljava/lang/String;)V

    .line 238
    :cond_1
    const-string/jumbo v0, "load native"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 242
    :cond_2
    :goto_1
    return-void

    .line 230
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->e()V

    .line 231
    iget-object v0, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 233
    iget-object v0, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onLoad(Lcom/my/target/ads/MyTargetView;)V

    goto :goto_0

    .line 239
    :cond_4
    iget-object v0, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 240
    iget-object v0, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    const-string/jumbo v1, "No ad"

    iget-object v2, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onNoAd(Ljava/lang/String;Lcom/my/target/ads/MyTargetView;)V

    goto :goto_1

    .line 241
    :cond_5
    const-string/jumbo v0, "StandardAdEngine: incorrect ad type"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 385
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "Banner clicked "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 386
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 387
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->i()Lcom/my/target/core/facades/h;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/my/target/core/facades/h;->a(Ljava/lang/String;)V

    .line 388
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-virtual {v0}, Lcom/my/target/ads/MyTargetView;->getListener()Lcom/my/target/ads/MyTargetView$MyTargetViewListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/engines/h;->e:Lcom/my/target/ads/MyTargetView;

    invoke-interface {v0, v1}, Lcom/my/target/ads/MyTargetView$MyTargetViewListener;->onClick(Lcom/my/target/ads/MyTargetView;)V

    .line 389
    :cond_1
    return-void
.end method

.method public final b()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 267
    invoke-super {p0}, Lcom/my/target/core/engines/a;->b()V

    .line 269
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->c()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 271
    const-string/jumbo v0, "Resume native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 273
    iget-object v0, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/AdView;->setVisibility(I)V

    .line 275
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->o()V

    .line 276
    invoke-direct {p0, v1}, Lcom/my/target/core/engines/h;->a(Z)V

    .line 277
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->g()V

    .line 279
    :goto_0
    return-void

    .line 278
    :cond_0
    const-string/jumbo v0, "Cannot resume native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final c()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 284
    invoke-super {p0}, Lcom/my/target/core/engines/a;->c()V

    .line 286
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->b()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 288
    const-string/jumbo v0, "Stop native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 289
    iget-object v0, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/AdView;->setVisibility(I)V

    .line 291
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    if-eqz v0, :cond_0

    .line 293
    sget-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    iget-object v1, p0, Lcom/my/target/core/engines/h;->l:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 294
    const/4 v0, 0x0

    sput-object v0, Lcom/my/target/core/engines/h;->c:Landroid/os/Handler;

    .line 297
    :cond_0
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->p()V

    .line 299
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->j()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 300
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->l()Landroid/widget/ViewFlipper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ViewFlipper;->removeAllViews()V

    .line 301
    iput-boolean v2, p0, Lcom/my/target/core/engines/h;->y:Z

    .line 302
    iput-boolean v2, p0, Lcom/my/target/core/engines/h;->x:Z

    .line 303
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->q()V

    .line 304
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->i()V

    .line 306
    :goto_0
    return-void

    .line 305
    :cond_1
    const-string/jumbo v0, "Cannot stop native banner: Not started"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final d()V
    .locals 2

    .prologue
    .line 311
    invoke-super {p0}, Lcom/my/target/core/engines/a;->d()V

    .line 313
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 315
    const-string/jumbo v0, "Start native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 316
    iget-object v0, p0, Lcom/my/target/core/engines/h;->d:Lcom/my/target/core/ui/views/AdView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/my/target/core/ui/views/AdView;->setVisibility(I)V

    .line 317
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->n()V

    .line 318
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->h()V

    .line 320
    :goto_0
    return-void

    .line 319
    :cond_0
    const-string/jumbo v0, "Cannot start native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public final f()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 325
    invoke-super {p0}, Lcom/my/target/core/engines/a;->f()V

    .line 326
    invoke-virtual {p0}, Lcom/my/target/core/engines/h;->c()V

    .line 327
    const-string/jumbo v0, "Destroy native banner"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 328
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    const/4 v1, 0x0

    aput-object v2, v0, v1

    .line 329
    iget-object v0, p0, Lcom/my/target/core/engines/h;->h:[Lcom/my/target/core/facades/h;

    const/4 v1, 0x1

    aput-object v2, v0, v1

    .line 330
    iget-object v0, p0, Lcom/my/target/core/engines/h;->i:Lcom/my/target/core/engines/h$a;

    invoke-virtual {v0}, Lcom/my/target/core/engines/h$a;->j()V

    .line 331
    return-void
.end method

.method public final g()V
    .locals 0

    .prologue
    .line 248
    return-void
.end method

.method public final h()V
    .locals 1

    .prologue
    .line 197
    iget-boolean v0, p0, Lcom/my/target/core/engines/h;->y:Z

    if-eqz v0, :cond_0

    .line 199
    invoke-direct {p0}, Lcom/my/target/core/engines/h;->m()V

    .line 201
    :cond_0
    return-void
.end method
