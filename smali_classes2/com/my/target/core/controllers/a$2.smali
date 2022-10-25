.class final Lcom/my/target/core/controllers/a$2;
.super Ljava/lang/Object;
.source "InstreamAdAudioController.java"

# interfaces
.implements Lcom/my/target/ads/instream/InstreamAudioAdPlayer$AdPlayerListener;


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
    .line 122
    iput-object p1, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onAdAudioCompleted()V
    .locals 4

    .prologue
    .line 192
    const-string/jumbo v0, "\u0441ontroller: onAdAudioCompleted"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 193
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->u(Lcom/my/target/core/controllers/a;)V

    .line 194
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    iget-object v1, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v1

    invoke-virtual {v1}, Lcom/my/target/core/models/banners/c;->getDuration()F

    move-result v1

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;F)V

    .line 195
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 196
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    const/4 v1, 0x0

    iget-object v2, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    .line 197
    invoke-static {v2}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v2

    invoke-virtual {v2}, Lcom/my/target/core/models/banners/c;->getDuration()F

    move-result v2

    iget-object v3, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    .line 198
    invoke-static {v3}, Lcom/my/target/core/controllers/a;->j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;

    move-result-object v3

    .line 196
    invoke-interface {v0, v1, v2, v3}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onBannerTimeLeftChange(FFLcom/my/target/ads/instream/InstreamAudioAd;)V

    .line 199
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->n(Lcom/my/target/core/controllers/a;)V

    .line 200
    return-void
.end method

.method public final onAdAudioError(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 179
    const-string/jumbo v0, "\u0441ontroller: onAdAudioError"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 181
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 183
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;

    move-result-object v1

    invoke-interface {v0, p1, v1}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onError(Ljava/lang/String;Lcom/my/target/ads/instream/InstreamAudioAd;)V

    .line 186
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->n(Lcom/my/target/core/controllers/a;)V

    .line 187
    return-void
.end method

.method public final onAdAudioPaused()V
    .locals 3

    .prologue
    .line 137
    const-string/jumbo v0, "\u0441ontroller: onAdAudioPaused"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 139
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/controllers/a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 141
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->u(Lcom/my/target/core/controllers/a;)V

    .line 142
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;Z)Z

    .line 143
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v0

    const-string/jumbo v1, "playbackPaused"

    iget-object v2, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    .line 145
    invoke-static {v2}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    .line 143
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 147
    :cond_0
    return-void
.end method

.method public final onAdAudioResumed()V
    .locals 3

    .prologue
    .line 152
    const-string/jumbo v0, "\u0441ontroller: onAdAudioResumed"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 154
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/controllers/a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 156
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->t(Lcom/my/target/core/controllers/a;)V

    .line 157
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;Z)Z

    .line 158
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v0

    const-string/jumbo v1, "playbackResumed"

    iget-object v2, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    .line 160
    invoke-static {v2}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    .line 158
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 162
    :cond_0
    return-void
.end method

.method public final onAdAudioStarted()V
    .locals 3

    .prologue
    .line 126
    const-string/jumbo v0, "\u0441ontroller: onAdAudioStarted"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 127
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 128
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->i(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;

    move-result-object v0

    iget-object v1, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v1}, Lcom/my/target/core/controllers/a;->j(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAd;

    move-result-object v1

    iget-object v2, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v2}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdListener;->onBannerStart(Lcom/my/target/ads/instream/InstreamAudioAd;Lcom/my/target/ads/instream/InstreamAudioAd$InstreamAudioAdBanner;)V

    .line 129
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->s(Lcom/my/target/core/controllers/a;)Z

    .line 130
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->t(Lcom/my/target/core/controllers/a;)V

    .line 131
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;Z)Z

    .line 132
    return-void
.end method

.method public final onAdAudioStopped()V
    .locals 2

    .prologue
    .line 167
    const-string/jumbo v0, "\u0441ontroller: onAdAudioStopped"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 169
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/controllers/a;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 171
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->u(Lcom/my/target/core/controllers/a;)V

    .line 172
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/controllers/a;->a(Lcom/my/target/core/controllers/a;Z)Z

    .line 174
    :cond_0
    return-void
.end method

.method public final onVolumeChanged(F)V
    .locals 3

    .prologue
    const/4 v1, 0x0

    .line 205
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-ltz v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v0}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-lez v0, :cond_2

    .line 207
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

    .line 227
    :cond_1
    :goto_0
    return-void

    .line 212
    :cond_2
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->b(Lcom/my/target/core/controllers/a;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->v(Lcom/my/target/core/controllers/a;)F

    move-result v0

    invoke-static {v0, p1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-eqz v0, :cond_1

    .line 214
    invoke-static {p1, v1}, Ljava/lang/Float;->compare(FF)I

    move-result v0

    if-lez v0, :cond_3

    .line 216
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v0

    const-string/jumbo v1, "volumeOn"

    iget-object v2, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    .line 218
    invoke-static {v2}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    .line 216
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    .line 225
    :goto_1
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0, p1}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;F)F

    goto :goto_0

    .line 221
    :cond_3
    iget-object v0, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    invoke-static {v0}, Lcom/my/target/core/controllers/a;->d(Lcom/my/target/core/controllers/a;)Lcom/my/target/core/models/banners/c;

    move-result-object v0

    const-string/jumbo v1, "volumeOff"

    iget-object v2, p0, Lcom/my/target/core/controllers/a$2;->a:Lcom/my/target/core/controllers/a;

    .line 223
    invoke-static {v2}, Lcom/my/target/core/controllers/a;->c(Lcom/my/target/core/controllers/a;)Lcom/my/target/ads/instream/InstreamAudioAdPlayer;

    move-result-object v2

    invoke-interface {v2}, Lcom/my/target/ads/instream/InstreamAudioAdPlayer;->getCurrentContext()Landroid/content/Context;

    move-result-object v2

    .line 221
    invoke-static {v0, v1, v2}, Lcom/my/target/core/models/c;->a(Lcom/my/target/core/models/banners/d;Ljava/lang/String;Landroid/content/Context;)V

    goto :goto_1
.end method
