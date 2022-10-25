.class final synthetic Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/MediaPlayer$OnErrorListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/NativeVideoPlayer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$3;->arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;)Landroid/media/MediaPlayer$OnErrorListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$3;-><init>(Lcom/vkontakte/android/media/NativeVideoPlayer;)V

    return-object v0
.end method


# virtual methods
.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$3;->arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/media/NativeVideoPlayer;->lambda$doSetDataSource$2(Landroid/media/MediaPlayer;II)Z

    move-result v0

    return v0
.end method
