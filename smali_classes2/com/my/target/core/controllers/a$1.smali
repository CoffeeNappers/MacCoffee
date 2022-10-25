.class final Lcom/my/target/core/controllers/a$1;
.super Ljava/lang/Object;
.source "InstreamAdAudioController.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/controllers/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/controllers/a;


# direct methods
.method constructor <init>(Lcom/my/target/core/controllers/a;)V
    .locals 0

    .prologue
    .line 34
    iput-object p1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

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

    .line 38
    .line 44
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;)Z

    move-result v0

    if-eqz v0, :cond_b

    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/controllers/a;)Z

    move-result v0

    if-eqz v0, :cond_b

    .line 46
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getAdAudioDuration()F

    move-result v2

    .line 47
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v0

    invoke-virtual {v0}, Lcom/my/target/core/models/banners/c;->getDuration()F

    move-result v0

    .line 48
    iget-object v3, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v3}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v3

    invoke-interface {v3}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getAdAudioTimeElapsed()F

    move-result v3

    .line 49
    sub-float v4, v0, v3

    .line 52
    :goto_0
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/controllers/a;)Z

    move-result v5

    if-eqz v5, :cond_2

    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->e(Lcom/my/target/core/controllers/a;)Z

    move-result v5

    if-nez v5, :cond_2

    .line 54
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v5

    const-string/jumbo v8, "playbackStarted"

    iget-object v9, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    .line 56
    invoke-static {v9}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v9

    invoke-interface {v9}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v9

    .line 54
    invoke-static {v5, v8, v9}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 58
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->f(Lcom/my/target/core/controllers/a;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 61
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->g(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/sections/c;

    move-result-object v5

    const-string/jumbo v8, "impression"

    iget-object v9, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    .line 63
    invoke-static {v9}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v9

    invoke-interface {v9}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v9

    .line 61
    invoke-static {v5, v8, v9}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/sections/i;Ljava/lang/String;Landroid/content/Context;)V

    .line 64
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->h(Lcom/my/target/core/controllers/a;)Z

    .line 66
    :cond_0
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v5

    if-eqz v5, :cond_1

    .line 68
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v5

    iget-object v8, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    .line 70
    invoke-static {v8}, Lcom/my/target/core/controllers/a;->j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;

    move-result-object v8

    .line 68
    invoke-interface {v5, v1, v2, v8}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAudioAd;)V

    .line 72
    :cond_1
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5, v1}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;F)V

    .line 73
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->k(Lcom/my/target/core/controllers/a;)Z

    .line 76
    :cond_2
    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;)Z

    move-result v5

    if-eqz v5, :cond_8

    iget-object v5, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v5}, Lcom/my/target/core/controllers/a;->l(Lcom/my/target/core/controllers/a;)F

    move-result v5

    cmpl-float v5, v5, v3

    if-eqz v5, :cond_8

    cmpl-float v1, v2, v1

    if-eqz v1, :cond_8

    .line 78
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->m(Lcom/my/target/core/controllers/a;)I

    .line 79
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1, v3}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/controllers/a;F)F

    .line 81
    cmpg-float v1, v3, v0

    if-gez v1, :cond_6

    .line 83
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1, v3}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;F)V

    .line 84
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 85
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    .line 87
    invoke-static {v2}, Lcom/my/target/core/controllers/a;->j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;

    move-result-object v2

    .line 85
    invoke-interface {v1, v4, v0, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAudioAd;)V

    .line 88
    :cond_3
    mul-float v1, v3, v10

    mul-float v2, v0, v10

    const/high16 v4, 0x43480000    # 200.0f

    sub-float/2addr v2, v4

    cmpl-float v1, v1, v2

    if-lez v1, :cond_9

    .line 90
    sub-float/2addr v0, v3

    float-to-long v0, v0

    .line 106
    :goto_1
    iget-object v2, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v2}, Lcom/my/target/core/controllers/a;->p(Lcom/my/target/core/controllers/a;)I

    move-result v2

    int-to-long v2, v2

    iget-object v4, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v4}, Lcom/my/target/core/controllers/a;->q(Lcom/my/target/core/controllers/a;)I

    move-result v4

    mul-int/lit16 v4, v4, 0x3e8

    int-to-long v4, v4

    div-long/2addr v4, v6

    cmp-long v2, v2, v4

    if-ltz v2, :cond_a

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "audio freeze more then "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->q(Lcom/my/target/core/controllers/a;)I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " seconds, stopping"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 109
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 110
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    const-string/jumbo v1, "Timeout"

    iget-object v2, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v2}, Lcom/my/target/core/controllers/a;->j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onError(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V

    .line 111
    :cond_4
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->n(Lcom/my/target/core/controllers/a;)V

    .line 117
    :cond_5
    :goto_2
    return-void

    .line 94
    :cond_6
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1, v0}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;F)V

    .line 95
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v1

    if-eqz v1, :cond_7

    .line 96
    iget-object v1, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    .line 98
    invoke-static {v2}, Lcom/my/target/core/controllers/a;->j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;

    move-result-object v2

    .line 96
    invoke-interface {v1, v0, v0, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAudioAd;)V

    .line 99
    :cond_7
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->n(Lcom/my/target/core/controllers/a;)V

    move-wide v0, v6

    goto :goto_1

    .line 103
    :cond_8
    iget-object v0, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->o(Lcom/my/target/core/controllers/a;)I

    :cond_9
    move-wide v0, v6

    goto :goto_1

    .line 115
    :cond_a
    invoke-static {}, Lcom/my/target/core/controllers/a;->i()Landroid/os/Handler;

    move-result-object v2

    if-eqz v2, :cond_5

    .line 116
    invoke-static {}, Lcom/my/target/core/controllers/a;->i()Landroid/os/Handler;

    move-result-object v2

    iget-object v3, p0, Lcom/my/target/core/controllers/a$1;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v3}, Lcom/my/target/core/controllers/a;->r(Lcom/my/target/core/controllers/a;)Ljava/lang/Runnable;

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
