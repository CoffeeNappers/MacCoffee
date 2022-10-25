.class final Lcom/my/target/core/controllers/b$1;
.super Ljava/lang/Object;
.source "InstreamAdVideoController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/controllers/b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/controllers/b;


# direct methods
.method constructor <init>(Lcom/my/target/core/controllers/b;)V
    .locals 0

    .prologue
    .line 33
    iput-object p1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 11

    .prologue
    const-wide/16 v6, 0xc8

    const/high16 v10, 0x447a0000    # 1000.0f

    const/4 v1, 0x0

    .line 37
    .line 43
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/controllers/b;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 45
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getAdVideoDuration()F

    move-result v2

    .line 46
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->d(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    move-result-object v0

    iget v0, v0, Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;->duration:F

    .line 47
    iget-object v3, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v3}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v3

    invoke-interface {v3}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getAdVideoTimeElapsed()F

    move-result v3

    .line 48
    sub-float v4, v0, v3

    .line 51
    :goto_0
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/controllers/b;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->e(Lcom/my/target/core/controllers/b;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 53
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->f(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/banners/m;

    move-result-object v5

    const-string/jumbo v8, "playbackStarted"

    iget-object v9, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    .line 55
    invoke-static {v9}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v9

    invoke-interface {v9}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    .line 53
    invoke-static {v5, v8, v9}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 57
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->g(Lcom/my/target/core/controllers/b;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 60
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->h(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/sections/k;

    move-result-object v5

    const-string/jumbo v8, "impression"

    iget-object v9, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    .line 62
    invoke-static {v9}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v9

    invoke-interface {v9}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v9

    invoke-virtual {v9}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    .line 60
    invoke-static {v5, v8, v9}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Landroid/content/Context;)V

    .line 63
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->i(Lcom/my/target/core/controllers/b;)Z

    .line 65
    :cond_0
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 67
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v5

    iget-object v8, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    .line 69
    invoke-static {v8}, Lcom/my/target/core/controllers/b;->k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;

    move-result-object v8

    .line 67
    invoke-interface {v5, v1, v2, v8}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAd;)V

    .line 71
    :cond_1
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5, v1}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;F)V

    .line 72
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->l(Lcom/my/target/core/controllers/b;)Z

    .line 75
    :cond_2
    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;)Z

    move-result v5

    if-eqz v5, :cond_8

    iget-object v5, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v5}, Lcom/my/target/core/controllers/b;->m(Lcom/my/target/core/controllers/b;)F

    move-result v5

    cmpl-float v5, v5, v3

    if-eqz v5, :cond_8

    cmpl-float v1, v2, v1

    if-eqz v1, :cond_8

    .line 77
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->n(Lcom/my/target/core/controllers/b;)I

    .line 78
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1, v3}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/controllers/b;F)F

    .line 80
    cmpg-float v1, v3, v0

    if-gez v1, :cond_6

    .line 82
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1, v3}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;F)V

    .line 83
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 84
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    .line 86
    invoke-static {v2}, Lcom/my/target/core/controllers/b;->k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;

    move-result-object v2

    .line 84
    invoke-interface {v1, v4, v0, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAd;)V

    .line 87
    :cond_3
    mul-float v1, v3, v10

    mul-float v2, v0, v10

    const/high16 v4, 0x43480000    # 200.0f

    sub-float/2addr v2, v4

    cmpl-float v1, v1, v2

    if-lez v1, :cond_9

    .line 89
    sub-float/2addr v0, v3

    float-to-long v0, v0

    .line 105
    :goto_1
    iget-object v2, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v2}, Lcom/my/target/core/controllers/b;->q(Lcom/my/target/core/controllers/b;)I

    move-result v2

    int-to-long v2, v2

    iget-object v4, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v4}, Lcom/my/target/core/controllers/b;->r(Lcom/my/target/core/controllers/b;)I

    move-result v4

    mul-int/lit16 v4, v4, 0x3e8

    int-to-long v4, v4

    div-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-ltz v2, :cond_a

    .line 107
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "video freeze more then "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->r(Lcom/my/target/core/controllers/b;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " seconds, stopping"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 108
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 109
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    const-string/jumbo v1, "Timeout"

    iget-object v2, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v2}, Lcom/my/target/core/controllers/b;->k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onError(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAd;)V

    .line 110
    :cond_4
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->o(Lcom/my/target/core/controllers/b;)V

    .line 116
    :cond_5
    :goto_2
    return-void

    .line 93
    :cond_6
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1, v0}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;F)V

    .line 94
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 95
    iget-object v1, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    .line 97
    invoke-static {v2}, Lcom/my/target/core/controllers/b;->k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;

    move-result-object v2

    .line 95
    invoke-interface {v1, v0, v0, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAd;)V

    .line 98
    :cond_7
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->o(Lcom/my/target/core/controllers/b;)V

    move-wide v0, v6

    goto :goto_1

    .line 102
    :cond_8
    iget-object v0, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->p(Lcom/my/target/core/controllers/b;)I

    :cond_9
    move-wide v0, v6

    goto :goto_1

    .line 114
    :cond_a
    invoke-static {}, Lcom/my/target/core/controllers/b;->i()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 115
    invoke-static {}, Lcom/my/target/core/controllers/b;->i()Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/my/target/core/controllers/b$1;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v3}, Lcom/my/target/core/controllers/b;->s(Lcom/my/target/core/controllers/b;)Ljava/lang/Runnable;

    move-result-object v3

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_2

    :cond_b
    move v0, v1

    move v2, v1

    move v3, v1

    move v4, v1

    goto/16 :goto_0
.end method
