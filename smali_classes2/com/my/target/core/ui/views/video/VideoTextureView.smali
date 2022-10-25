.class public Lcom/my/target/core/ui/views/video/VideoTextureView;
.super Landroid/view/TextureView;
.source "VideoTextureView.java"

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/my/target/core/ui/views/video/VideoTextureView$a;
    }
.end annotation


# static fields
.field private static a:Lcom/my/target/core/ui/views/video/VideoTextureView;

.field private static b:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/my/target/core/controllers/c;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private c:Z

.field private d:Lcom/my/target/nativeads/models/VideoData;

.field private e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

.field private f:F

.field private g:I

.field private h:Landroid/media/MediaPlayer;

.field private i:Z

.field private j:I

.field private k:I

.field private l:Landroid/graphics/Bitmap;

.field private m:I

.field private final n:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .prologue
    .line 238
    invoke-direct {p0, p1}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 148
    new-instance v0, Lcom/my/target/core/ui/views/video/VideoTextureView$1;

    invoke-direct {v0, p0}, Lcom/my/target/core/ui/views/video/VideoTextureView$1;-><init>(Lcom/my/target/core/ui/views/video/VideoTextureView;)V

    iput-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->n:Ljava/lang/Runnable;

    .line 239
    return-void
.end method

.method static synthetic a(I)F
    .locals 2

    .prologue
    .line 22
    .line 2615
    int-to-float v0, p0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    .line 22
    return v0
.end method

.method static synthetic a(Lcom/my/target/core/ui/views/video/VideoTextureView;I)I
    .locals 0

    .prologue
    .line 22
    iput p1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    return p1
.end method

.method static synthetic a(Lcom/my/target/core/ui/views/video/VideoTextureView;)Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method public static a(Lcom/my/target/core/controllers/c;Landroid/content/Context;)Lcom/my/target/core/ui/views/video/VideoTextureView;
    .locals 2

    .prologue
    .line 33
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->a:Lcom/my/target/core/ui/views/video/VideoTextureView;

    if-nez v0, :cond_0

    .line 35
    new-instance v0, Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-direct {v0, p1}, Lcom/my/target/core/ui/views/video/VideoTextureView;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->a:Lcom/my/target/core/ui/views/video/VideoTextureView;

    .line 36
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    .line 37
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->a:Lcom/my/target/core/ui/views/video/VideoTextureView;

    .line 57
    :goto_0
    return-object v0

    .line 41
    :cond_0
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_1

    .line 43
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/my/target/core/controllers/c;

    .line 44
    sget-object v1, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v1}, Ljava/lang/ref/WeakReference;->clear()V

    .line 45
    const/4 v1, 0x0

    sput-object v1, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    .line 46
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lcom/my/target/core/controllers/c;->c()V

    .line 49
    :cond_1
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->a:Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eq v0, p1, :cond_2

    .line 51
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->a:Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-virtual {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->a()V

    .line 52
    new-instance v0, Lcom/my/target/core/ui/views/video/VideoTextureView;

    invoke-direct {v0, p1}, Lcom/my/target/core/ui/views/video/VideoTextureView;-><init>(Landroid/content/Context;)V

    sput-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->a:Lcom/my/target/core/ui/views/video/VideoTextureView;

    .line 55
    :cond_2
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    .line 57
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->a:Lcom/my/target/core/ui/views/video/VideoTextureView;

    goto :goto_0
.end method

.method private a(Landroid/view/Surface;Landroid/net/Uri;)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 383
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: call play state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 384
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " url = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 386
    invoke-virtual {p2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 383
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 387
    if-nez p1, :cond_1

    .line 1533
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 388
    :cond_1
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->o()V

    .line 390
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    packed-switch v0, :pswitch_data_0

    .line 425
    :cond_2
    const/4 v0, 0x1

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 427
    iput v2, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->g:I

    .line 428
    new-instance v0, Landroid/media/MediaPlayer;

    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    iput-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    .line 429
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 430
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 431
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 433
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 437
    :try_start_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1, p2}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 438
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 439
    :catch_0
    move-exception v0

    .line 441
    iget-object v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v1, :cond_0

    .line 443
    iget-object v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v1, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->a(Ljava/lang/String;)V

    goto :goto_0

    .line 395
    :pswitch_1
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 397
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    goto :goto_0

    .line 402
    :pswitch_2
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 404
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: trying to start paused mediaplayer, state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 405
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 404
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 1519
    const-string/jumbo v0, "VideoTextureView: Resume textureView"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 1520
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_4

    .line 1522
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->o()V

    .line 1523
    const/4 v0, 0x3

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 1524
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->f()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1525
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->g()V

    .line 1528
    :goto_1
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 1529
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 1530
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->j:I

    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 1531
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_0

    .line 1533
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->g()V

    goto/16 :goto_0

    .line 1527
    :cond_3
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->h()V

    goto :goto_1

    .line 1537
    :cond_4
    iput v2, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    goto/16 :goto_0

    .line 411
    :pswitch_3
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_2

    .line 413
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: trying to RESUMING mediaplayer, state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 414
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 413
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 415
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 416
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_0

    .line 418
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->h()V

    goto/16 :goto_0

    .line 390
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_2
        :pswitch_1
        :pswitch_3
    .end packed-switch
.end method

.method public static a(Lcom/my/target/core/controllers/c;)V
    .locals 1

    .prologue
    .line 130
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_0

    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 132
    sget-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->clear()V

    .line 133
    const/4 v0, 0x0

    sput-object v0, Lcom/my/target/core/ui/views/video/VideoTextureView;->b:Ljava/lang/ref/WeakReference;

    .line 135
    :cond_0
    return-void
.end method

.method static synthetic a(Lcom/my/target/core/ui/views/video/VideoTextureView;Landroid/view/Surface;Landroid/net/Uri;)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/my/target/core/ui/views/video/VideoTextureView;->a(Landroid/view/Surface;Landroid/net/Uri;)V

    return-void
.end method

.method static synthetic b(Lcom/my/target/core/ui/views/video/VideoTextureView;I)I
    .locals 0

    .prologue
    .line 22
    iput p1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->j:I

    return p1
.end method

.method static synthetic b(Lcom/my/target/core/ui/views/video/VideoTextureView;)Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->l:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method private b(Z)V
    .locals 2

    .prologue
    .line 101
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: call stop, state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " show play "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 103
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_0

    .line 105
    if-eqz p1, :cond_0

    .line 106
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->e()V

    .line 108
    :cond_0
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->j:I

    .line 109
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->m()V

    .line 111
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    .line 113
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 114
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 115
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    .line 118
    :cond_1
    const/4 v0, 0x5

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 119
    return-void
.end method

.method static synthetic c(Lcom/my/target/core/ui/views/video/VideoTextureView;)I
    .locals 1

    .prologue
    .line 22
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->g:I

    return v0
.end method

.method static synthetic c(Lcom/my/target/core/ui/views/video/VideoTextureView;I)I
    .locals 0

    .prologue
    .line 22
    iput p1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->m:I

    return p1
.end method

.method static synthetic d(Lcom/my/target/core/ui/views/video/VideoTextureView;)Lcom/my/target/core/ui/views/video/VideoTextureView$a;
    .locals 1

    .prologue
    .line 22
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    return-object v0
.end method

.method static synthetic e(Lcom/my/target/core/ui/views/video/VideoTextureView;)V
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->b(Z)V

    return-void
.end method

.method static synthetic f(Lcom/my/target/core/ui/views/video/VideoTextureView;)I
    .locals 1

    .prologue
    .line 22
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->j:I

    return v0
.end method

.method static synthetic g(Lcom/my/target/core/ui/views/video/VideoTextureView;)I
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->g:I

    return v0
.end method

.method static synthetic h(Lcom/my/target/core/ui/views/video/VideoTextureView;)I
    .locals 1

    .prologue
    .line 22
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->m:I

    return v0
.end method

.method static synthetic i(Lcom/my/target/core/ui/views/video/VideoTextureView;)I
    .locals 2

    .prologue
    .line 22
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->g:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->g:I

    return v0
.end method

.method static synthetic j(Lcom/my/target/core/ui/views/video/VideoTextureView;)I
    .locals 1

    .prologue
    .line 22
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    return v0
.end method

.method static synthetic k(Lcom/my/target/core/ui/views/video/VideoTextureView;)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->o()V

    return-void
.end method

.method private l()Ljava/lang/String;
    .locals 1

    .prologue
    .line 82
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    packed-switch v0, :pswitch_data_0

    .line 95
    const-string/jumbo v0, "idle"

    :goto_0
    return-object v0

    .line 85
    :pswitch_0
    const-string/jumbo v0, "preparing"

    goto :goto_0

    .line 87
    :pswitch_1
    const-string/jumbo v0, "wait"

    goto :goto_0

    .line 89
    :pswitch_2
    const-string/jumbo v0, "playing"

    goto :goto_0

    .line 91
    :pswitch_3
    const-string/jumbo v0, "paused"

    goto :goto_0

    .line 93
    :pswitch_4
    const-string/jumbo v0, "stopped"

    goto :goto_0

    .line 82
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method static synthetic l(Lcom/my/target/core/ui/views/video/VideoTextureView;)Z
    .locals 6

    .prologue
    .line 3491
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 3492
    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3494
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    mul-int/2addr v0, v1

    int-to-double v0, v0

    .line 3495
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getWidth()I

    move-result v2

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getHeight()I

    move-result v3

    mul-int/2addr v2, v3

    int-to-double v2, v2

    .line 3497
    const-wide v4, 0x3fe3333340000000L    # 0.6000000238418579

    mul-double/2addr v2, v4

    cmpl-double v0, v0, v2

    if-ltz v0, :cond_0

    .line 3499
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 3503
    :cond_0
    const/4 v0, 0x0

    .line 22
    goto :goto_0
.end method

.method static synthetic m(Lcom/my/target/core/ui/views/video/VideoTextureView;)Landroid/media/MediaPlayer;
    .locals 1

    .prologue
    .line 22
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    return-object v0
.end method

.method private m()V
    .locals 1

    .prologue
    .line 123
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->i:Z

    .line 124
    iget-boolean v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->c:Z

    if-nez v0, :cond_0

    .line 125
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->n:Ljava/lang/Runnable;

    invoke-virtual {p0, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 126
    :cond_0
    return-void
.end method

.method private n()Landroid/view/Surface;
    .locals 2

    .prologue
    .line 451
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 453
    new-instance v0, Landroid/view/Surface;

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getSurfaceTexture()Landroid/graphics/SurfaceTexture;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 459
    :goto_0
    return-object v0

    .line 457
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static synthetic n(Lcom/my/target/core/ui/views/video/VideoTextureView;)V
    .locals 0

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->m()V

    return-void
.end method

.method private o()V
    .locals 4

    .prologue
    .line 482
    iget-boolean v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->i:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->c:Z

    if-nez v0, :cond_0

    .line 484
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->i:Z

    .line 485
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->n:Ljava/lang/Runnable;

    const-wide/16 v2, 0xc8

    invoke-virtual {p0, v0, v2, v3}, Lcom/my/target/core/ui/views/video/VideoTextureView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 487
    :cond_0
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .prologue
    .line 75
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: call stop from controller state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 76
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 75
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 77
    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->b(Z)V

    .line 78
    return-void
.end method

.method public final a(Lcom/my/target/nativeads/models/VideoData;Z)V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 243
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_0

    .line 245
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->i()V

    .line 249
    :cond_0
    invoke-virtual {p1}, Lcom/my/target/nativeads/models/VideoData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 251
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v0, "file://"

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lcom/my/target/nativeads/models/VideoData;->getData()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 257
    :goto_0
    iget-object v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->d:Lcom/my/target/nativeads/models/VideoData;

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->d:Lcom/my/target/nativeads/models/VideoData;

    if-eq p1, v1, :cond_1

    .line 259
    invoke-direct {p0, v2}, Lcom/my/target/core/ui/views/video/VideoTextureView;->b(Z)V

    .line 260
    iput v2, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 262
    :cond_1
    iput-object p1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->d:Lcom/my/target/nativeads/models/VideoData;

    .line 264
    if-eqz p2, :cond_2

    const/4 v1, 0x2

    iput v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 1271
    :cond_2
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "VideoTextureView: Playing video "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "state: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " dims "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    .line 1272
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getMeasuredHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, " "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1271
    invoke-static {v1}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 1274
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->isAvailable()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 1275
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->n()Landroid/view/Surface;

    move-result-object v1

    invoke-direct {p0, v1, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->a(Landroid/view/Surface;Landroid/net/Uri;)V

    .line 1277
    :cond_3
    new-instance v1, Lcom/my/target/core/ui/views/video/VideoTextureView$2;

    invoke-direct {v1, p0, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$2;-><init>(Lcom/my/target/core/ui/views/video/VideoTextureView;Landroid/net/Uri;)V

    invoke-virtual {p0, v1}, Lcom/my/target/core/ui/views/video/VideoTextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 267
    return-void

    .line 254
    :cond_4
    invoke-virtual {p1}, Lcom/my/target/nativeads/models/VideoData;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_0
.end method

.method public final a(Z)V
    .locals 2

    .prologue
    .line 543
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->m()V

    .line 544
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 546
    if-eqz p1, :cond_0

    .line 1559
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->d:Lcom/my/target/nativeads/models/VideoData;

    if-eqz v0, :cond_0

    .line 1560
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->d:Lcom/my/target/nativeads/models/VideoData;

    invoke-virtual {v0}, Lcom/my/target/nativeads/models/VideoData;->getWidth()I

    move-result v0

    iget-object v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->d:Lcom/my/target/nativeads/models/VideoData;

    invoke-virtual {v1}, Lcom/my/target/nativeads/models/VideoData;->getHeight()I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getBitmap(II)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->l:Landroid/graphics/Bitmap;

    .line 548
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: Pause textureView, state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 549
    const/4 v0, 0x4

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 550
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 551
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->j:I

    .line 552
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_1

    .line 553
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->h()V

    .line 555
    :cond_1
    return-void
.end method

.method public final b()Landroid/graphics/Bitmap;
    .locals 1

    .prologue
    .line 195
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->l:Landroid/graphics/Bitmap;

    return-object v0
.end method

.method public final c()F
    .locals 2

    .prologue
    .line 200
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 202
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    .line 204
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final d()F
    .locals 2

    .prologue
    .line 209
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 211
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    .line 213
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final e()I
    .locals 1

    .prologue
    .line 218
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    return v0
.end method

.method public final f()Z
    .locals 2

    .prologue
    .line 223
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    const/4 v1, 0x0

    cmpg-float v0, v0, v1

    if-gtz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final g()V
    .locals 3

    .prologue
    .line 464
    const/4 v0, 0x0

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    .line 465
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 466
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    iget v2, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 467
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_1

    .line 468
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    iget v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    invoke-interface {v0, v1}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->a(F)V

    .line 469
    :cond_1
    return-void
.end method

.method public final h()V
    .locals 3

    .prologue
    .line 473
    const/high16 v0, 0x3f800000    # 1.0f

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    .line 474
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 475
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    iget v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    iget v2, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 476
    :cond_0
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_1

    .line 477
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    iget v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    invoke-interface {v0, v1}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->a(F)V

    .line 478
    :cond_1
    return-void
.end method

.method public final i()V
    .locals 1

    .prologue
    .line 508
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->m()V

    .line 509
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->isPlaying()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 511
    const-string/jumbo v0, "VideoTextureView: Pause textureView until available"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 512
    const/4 v0, 0x2

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 513
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 515
    :cond_0
    return-void
.end method

.method public final j()V
    .locals 2

    .prologue
    const v1, 0x3e99999a    # 0.3f

    .line 565
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 566
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 567
    :cond_0
    return-void
.end method

.method public final k()V
    .locals 1

    .prologue
    .line 645
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->c:Z

    .line 646
    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .prologue
    .line 605
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getDuration()I

    move-result v0

    .line 1615
    int-to-float v0, v0

    const/high16 v1, 0x447a0000    # 1000.0f

    div-float/2addr v0, v1

    .line 606
    iget-object v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v1, :cond_0

    .line 608
    iget-object v1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v1, v0, v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->a(FF)V

    .line 609
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->j()V

    .line 611
    :cond_0
    return-void
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 4

    .prologue
    const/4 v3, 0x1

    .line 621
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_0

    .line 623
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Video error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->a(Ljava/lang/String;)V

    .line 625
    :cond_0
    invoke-direct {p0, v3}, Lcom/my/target/core/ui/views/video/VideoTextureView;->b(Z)V

    .line 626
    return v3
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 2

    .prologue
    .line 572
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: call on prepared, state: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->l()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 574
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 576
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->isAvailable()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 578
    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v1, "VideoTextureView: call mediaplayer to start visibility "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 579
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getVisibility()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " dims = "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getHeight()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 578
    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    .line 580
    invoke-direct {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->n()Landroid/view/Surface;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 581
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->f()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 582
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->g()V

    .line 585
    :goto_0
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 586
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->j:I

    if-eqz v0, :cond_0

    .line 588
    iget v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->j:I

    invoke-virtual {p1, v0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 590
    :cond_0
    const/4 v0, 0x3

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 591
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_1

    .line 593
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->f()V

    .line 600
    :cond_1
    :goto_1
    return-void

    .line 584
    :cond_2
    invoke-virtual {p0}, Lcom/my/target/core/ui/views/video/VideoTextureView;->h()V

    goto :goto_0

    .line 597
    :cond_3
    const-string/jumbo v0, "VideoTextureView: mediaplayer is ready, but surface isn\'t available"

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public setVideoListener(Lcom/my/target/core/ui/views/video/VideoTextureView$a;)V
    .locals 0

    .prologue
    .line 228
    iput-object p1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    .line 229
    return-void
.end method

.method public setVolume(F)V
    .locals 1

    .prologue
    .line 62
    iput p1, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->f:F

    .line 63
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    if-eqz v0, :cond_0

    .line 65
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->h:Landroid/media/MediaPlayer;

    invoke-virtual {v0, p1, p1}, Landroid/media/MediaPlayer;->setVolume(FF)V

    .line 66
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    if-eqz v0, :cond_0

    .line 68
    iget-object v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->e:Lcom/my/target/core/ui/views/video/VideoTextureView$a;

    invoke-interface {v0, p1}, Lcom/my/target/core/ui/views/video/VideoTextureView$a;->a(F)V

    .line 71
    :cond_0
    return-void
.end method

.method public setWaitingState()V
    .locals 1

    .prologue
    .line 233
    const/4 v0, 0x2

    iput v0, p0, Lcom/my/target/core/ui/views/video/VideoTextureView;->k:I

    .line 234
    return-void
.end method
