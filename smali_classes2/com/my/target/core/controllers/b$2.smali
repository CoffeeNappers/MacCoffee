.class final Lcom/my/target/core/controllers/b$2;
.super Ljava/lang/Object;
.source "InstreamAdVideoController.java"

# interfaces
.implements Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;


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
    .line 121
    iput-object p1, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAdVideoCompleted()V
    .locals 4

    .prologue
    .line 191
    const-string/jumbo v0, "\u0441ontroller: onAdVideoCompleted"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 192
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->v(Lcom/my/target/core/controllers/b;)V

    .line 193
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    iget-object v1, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->d(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    move-result-object v1

    iget v1, v1, Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;->duration:F

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;F)V

    .line 194
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 195
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    .line 196
    invoke-static {v2}, Lcom/my/target/core/controllers/b;->d(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    move-result-object v2

    iget v2, v2, Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;->duration:F

    iget-object v3, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    .line 197
    invoke-static {v3}, Lcom/my/target/core/controllers/b;->k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;

    move-result-object v3

    .line 195
    invoke-interface {v0, v1, v2, v3}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAd;)V

    .line 198
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->o(Lcom/my/target/core/controllers/b;)V

    .line 199
    return-void
.end method

.method public final onAdVideoError(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 178
    const-string/jumbo v0, "\u0441ontroller: onAdVideoError"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 180
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onError(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAd;)V

    .line 185
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->o(Lcom/my/target/core/controllers/b;)V

    .line 186
    return-void
.end method

.method public final onAdVideoPaused()V
    .locals 3

    .prologue
    .line 136
    const-string/jumbo v0, "\u0441ontroller: onAdVideoPaused"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 138
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/controllers/b;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 140
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->v(Lcom/my/target/core/controllers/b;)V

    .line 141
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;Z)Z

    .line 142
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->f(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/banners/m;

    move-result-object v0

    const-string/jumbo v1, "playbackPaused"

    iget-object v2, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    .line 144
    invoke-static {v2}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 142
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 146
    :cond_0
    return-void
.end method

.method public final onAdVideoResumed()V
    .locals 3

    .prologue
    .line 151
    const-string/jumbo v0, "\u0441ontroller: onAdVideoResumed"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 153
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/controllers/b;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->u(Lcom/my/target/core/controllers/b;)V

    .line 156
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;Z)Z

    .line 157
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->f(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/banners/m;

    move-result-object v0

    const-string/jumbo v1, "playbackResumed"

    iget-object v2, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    .line 159
    invoke-static {v2}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 157
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 161
    :cond_0
    return-void
.end method

.method public final onAdVideoStarted()V
    .locals 3

    .prologue
    .line 125
    const-string/jumbo v0, "\u0441ontroller: onAdVideoStarted"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 126
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 127
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->j(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v1}, Lcom/my/target/core/controllers/b;->k(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v2}, Lcom/my/target/core/controllers/b;->d(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAd$InstreamAdListener;->onBannerStart(Lcom/my/target/ads/instream/InstreamAd;Lcom/my/target/ads/instream/InstreamAd$InstreamAdBanner;)V

    .line 128
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->t(Lcom/my/target/core/controllers/b;)Z

    .line 129
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->u(Lcom/my/target/core/controllers/b;)V

    .line 130
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;Z)Z

    .line 131
    return-void
.end method

.method public final onAdVideoStopped()V
    .locals 2

    .prologue
    .line 166
    const-string/jumbo v0, "\u0441ontroller: onAdVideoStopped"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 168
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/controllers/b;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 170
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->v(Lcom/my/target/core/controllers/b;)V

    .line 171
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/b;->a(Lcom/my/target/core/controllers/b;Z)Z

    .line 173
    :cond_0
    return-void
.end method

.method public final onVolumeChanged(F)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 204
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-lez v0, :cond_2

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "wrong volume got from onVolumeChanged: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", volume must be in range [0..1]"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 226
    :cond_1
    :goto_0
    return-void

    .line 211
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->b(Lcom/my/target/core/controllers/b;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->w(Lcom/my/target/core/controllers/b;)F

    move-result v0

    invoke-static {v0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_1

    .line 213
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-lez v0, :cond_3

    .line 215
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->f(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/banners/m;

    move-result-object v0

    const-string/jumbo v1, "volumeOn"

    iget-object v2, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    .line 217
    invoke-static {v2}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 215
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 224
    :goto_1
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0, p1}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;F)F

    goto :goto_0

    .line 220
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    invoke-static {v0}, Lcom/my/target/core/controllers/b;->f(Lcom/my/target/core/controllers/b;)Lcom/my/target/core/models/banners/m;

    move-result-object v0

    const-string/jumbo v1, "volumeOff"

    iget-object v2, p0, Lcom/my/target/core/controllers/b$2;->a:Lcom/my/target/core/controllers/b;

    .line 222
    invoke-static {v2}, Lcom/my/target/core/controllers/b;->c(Lcom/my/target/core/controllers/b;)Lcom/my/target/ads/instream/InstreamAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAdPlayer;->getView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    .line 220
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_1
.end method
