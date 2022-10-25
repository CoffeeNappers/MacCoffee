.class final synthetic Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/media/ExoVideoPlayer;

.field private final arg$2:Landroid/graphics/SurfaceTexture;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/ExoVideoPlayer;Landroid/graphics/SurfaceTexture;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;->arg$1:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iput-object p2, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;->arg$2:Landroid/graphics/SurfaceTexture;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/media/ExoVideoPlayer;Landroid/graphics/SurfaceTexture;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;-><init>(Lcom/vkontakte/android/media/ExoVideoPlayer;Landroid/graphics/SurfaceTexture;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;->arg$1:Lcom/vkontakte/android/media/ExoVideoPlayer;

    iget-object v1, p0, Lcom/vkontakte/android/media/ExoVideoPlayer$$Lambda$5;->arg$2:Landroid/graphics/SurfaceTexture;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/media/ExoVideoPlayer;->lambda$onSurfaceTextureDestroyed$4(Landroid/graphics/SurfaceTexture;)V

    return-void
.end method
