.class final Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;
.super Ljava/lang/Object;
.source "InstreamAdVideoPlayer.java"

# interfaces
.implements Lcom/my/target/core/ui/views/video/VideoTextureView$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/my/target/core/ui/InstreamAdVideoPlayer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;


# direct methods
.method constructor <init>(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)V
    .locals 0

    .prologue
    .line 53
    iput-object p1, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(F)V
    .locals 1

    .prologue
    .line 63
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;->onVolumeChanged(F)V

    .line 67
    :cond_0
    return-void
.end method

.method public final a(FF)V
    .locals 0

    .prologue
    .line 108
    return-void
.end method

.method public final a(Ljava/lang/String;)V
    .locals 2

    .prologue
    .line 113
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$102(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z

    .line 114
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 115
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;->onAdVideoError(Ljava/lang/String;)V

    .line 116
    :cond_0
    return-void
.end method

.method public final e()V
    .locals 2

    .prologue
    .line 57
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$102(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z

    .line 58
    return-void
.end method

.method public final f()V
    .locals 2

    .prologue
    .line 72
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$300(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 74
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;->onAdVideoStarted()V

    .line 75
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$302(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z

    .line 77
    :cond_0
    return-void
.end method

.method public final g()V
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$100(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 84
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 85
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;->onAdVideoResumed()V

    .line 86
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$102(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z

    .line 88
    :cond_1
    return-void
.end method

.method public final h()V
    .locals 2

    .prologue
    .line 93
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$102(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z

    .line 94
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 95
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;->onAdVideoPaused()V

    .line 96
    :cond_0
    return-void
.end method

.method public final i()V
    .locals 0

    .prologue
    .line 102
    return-void
.end method

.method public final j()V
    .locals 2

    .prologue
    .line 121
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$102(Lcom/my/target/core/ui/InstreamAdVideoPlayer;Z)Z

    .line 122
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 123
    iget-object v0, p0, Lcom/my/target/core/ui/InstreamAdVideoPlayer$2;->a:Lcom/my/target/core/ui/InstreamAdVideoPlayer;

    invoke-static {v0}, Lcom/my/target/core/ui/InstreamAdVideoPlayer;->access$200(Lcom/my/target/core/ui/InstreamAdVideoPlayer;)Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;

    move-result-object v0

    invoke-interface {v0}, Lcom/my/target/ads/instream/InstreamAdPlayer$AdPlayerListener;->onAdVideoCompleted()V

    .line 124
    :cond_0
    return-void
.end method
