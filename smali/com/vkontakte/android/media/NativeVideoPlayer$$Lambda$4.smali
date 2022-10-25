.class final synthetic Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/MediaPlayer$OnInfoListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;

.field private final arg$2:Landroid/media/MediaPlayer;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/NativeVideoPlayer;Landroid/media/MediaPlayer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;->arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;

    iput-object p2, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;->arg$2:Landroid/media/MediaPlayer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;Landroid/media/MediaPlayer;)Landroid/media/MediaPlayer$OnInfoListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;-><init>(Lcom/vkontakte/android/media/NativeVideoPlayer;Landroid/media/MediaPlayer;)V

    return-object v0
.end method


# virtual methods
.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;->arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;

    iget-object v1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$4;->arg$2:Landroid/media/MediaPlayer;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/vkontakte/android/media/NativeVideoPlayer;->lambda$doSetDataSource$3(Landroid/media/MediaPlayer;Landroid/media/MediaPlayer;II)Z

    move-result v0

    return v0
.end method
