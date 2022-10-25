.class public Lcom/vkontakte/android/ui/animation/MovieDrawable;
.super Landroid/graphics/drawable/BitmapDrawable;
.source "MovieDrawable.java"

# interfaces
.implements Landroid/graphics/drawable/Animatable;


# instance fields
.field private mInvalidate:Ljava/lang/Runnable;

.field private mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

.field private mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

.field private mReady:Ljava/lang/Runnable;

.field private mReadyCallback:Lcom/vkontakte/android/functions/VoidF1;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/ui/animation/MovieDrawable;",
            ">;"
        }
    .end annotation
.end field

.field private final mWorkerThread:Lcom/vkontakte/android/background/WorkerThread;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 67
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;-><init>(Ljava/lang/String;Z)V

    .line 68
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;IZ)V
    .locals 3
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "resolution"    # I
    .param p3, "repeat"    # Z

    .prologue
    .line 60
    invoke-direct {p0}, Landroid/graphics/drawable/BitmapDrawable;-><init>()V

    .line 15
    new-instance v0, Lcom/vkontakte/android/background/WorkerThread;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Gif decoder #"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/background/WorkerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mWorkerThread:Lcom/vkontakte/android/background/WorkerThread;

    .line 19
    new-instance v0, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable$1;-><init>(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    .line 43
    new-instance v0, Lcom/vkontakte/android/ui/animation/MovieDrawable$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable$2;-><init>(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mInvalidate:Ljava/lang/Runnable;

    .line 50
    new-instance v0, Lcom/vkontakte/android/ui/animation/MovieDrawable$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable$3;-><init>(Lcom/vkontakte/android/ui/animation/MovieDrawable;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mReady:Ljava/lang/Runnable;

    .line 61
    new-instance v0, Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-direct {v0, p1, p2, p3}, Lcom/vk/medianative/MediaAnimationPlayer;-><init>(Ljava/lang/String;IZ)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    .line 62
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    iget-object v1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mListener:Lcom/vk/medianative/MediaAnimationPlayer$Listener;

    invoke-virtual {v0, v1}, Lcom/vk/medianative/MediaAnimationPlayer;->setListener(Lcom/vk/medianative/MediaAnimationPlayer$Listener;)V

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mWorkerThread:Lcom/vkontakte/android/background/WorkerThread;

    invoke-virtual {v0}, Lcom/vkontakte/android/background/WorkerThread;->start()V

    .line 64
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "path"    # Ljava/lang/String;
    .param p2, "repeat"    # Z

    .prologue
    .line 71
    const/4 v0, -0x1

    invoke-direct {p0, p1, v0, p2}, Lcom/vkontakte/android/ui/animation/MovieDrawable;-><init>(Ljava/lang/String;IZ)V

    .line 72
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mReady:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vk/medianative/MediaAnimationPlayer;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/background/WorkerThread;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mWorkerThread:Lcom/vkontakte/android/background/WorkerThread;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Ljava/lang/Runnable;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mInvalidate:Ljava/lang/Runnable;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/ui/animation/MovieDrawable;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/animation/MovieDrawable;

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mReadyCallback:Lcom/vkontakte/android/functions/VoidF1;

    return-object v0
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;)V
    .locals 3
    .param p1, "canvas"    # Landroid/graphics/Canvas;

    .prologue
    const/4 v2, 0x0

    .line 91
    invoke-super {p0, p1}, Landroid/graphics/drawable/BitmapDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 92
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->isRunning()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 93
    iget-object v1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    invoke-virtual {v1, p1, v2}, Lcom/vk/medianative/MediaAnimationPlayer;->draw(Landroid/graphics/Canvas;Landroid/graphics/Rect;)V

    .line 100
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getRenderingBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    .line 96
    .local v0, "bitmap":Landroid/graphics/Bitmap;
    if-eqz v0, :cond_0

    .line 97
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {p1, v0, v2, v1, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    goto :goto_0
.end method

.method protected finalize()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Throwable;
        }
    .end annotation

    .prologue
    .line 125
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->recycle()V

    .line 126
    invoke-super {p0}, Ljava/lang/Object;->finalize()V

    .line 127
    return-void
.end method

.method public getIntrinsicHeight()I
    .locals 1

    .prologue
    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->getHeight()I

    move-result v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .locals 1

    .prologue
    .line 86
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->getWidth()I

    move-result v0

    return v0
.end method

.method public getOpacity()I
    .locals 1

    .prologue
    .line 76
    const/4 v0, -0x2

    return v0
.end method

.method public getPosition()I
    .locals 1

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->getPosition()I

    move-result v0

    return v0
.end method

.method public getRenderingBitmap()Landroid/graphics/Bitmap;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 120
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->getRenderingBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    return-object v0
.end method

.method public isReady()Z
    .locals 1

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->isReady()Z

    move-result v0

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .prologue
    .line 137
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->isRunning()Z

    move-result v0

    return v0
.end method

.method public recycle()V
    .locals 1

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->recycle()V

    .line 150
    return-void
.end method

.method public seek(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 115
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0, p1}, Lcom/vk/medianative/MediaAnimationPlayer;->seek(I)V

    .line 116
    return-void
.end method

.method public setReadyCallback(Lcom/vkontakte/android/functions/VoidF1;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/functions/VoidF1",
            "<",
            "Lcom/vkontakte/android/ui/animation/MovieDrawable;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 145
    .local p1, "callback":Lcom/vkontakte/android/functions/VoidF1;, "Lcom/vkontakte/android/functions/VoidF1<Lcom/vkontakte/android/ui/animation/MovieDrawable;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mReadyCallback:Lcom/vkontakte/android/functions/VoidF1;

    .line 146
    return-void
.end method

.method public start()V
    .locals 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->isRunning()Z

    move-result v0

    if-nez v0, :cond_0

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->start()Z

    .line 106
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mWorkerThread:Lcom/vkontakte/android/background/WorkerThread;

    iget-object v1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/background/WorkerThread;->postRunnable(Ljava/lang/Runnable;)V

    .line 108
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 2

    .prologue
    .line 131
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0}, Lcom/vk/medianative/MediaAnimationPlayer;->stop()V

    .line 132
    iget-object v0, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mWorkerThread:Lcom/vkontakte/android/background/WorkerThread;

    iget-object v1, p0, Lcom/vkontakte/android/ui/animation/MovieDrawable;->mPlayer:Lcom/vk/medianative/MediaAnimationPlayer;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/background/WorkerThread;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 133
    return-void
.end method
