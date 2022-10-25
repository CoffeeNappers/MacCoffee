.class final synthetic Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/media/MediaPlayer$OnCompletionListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/NativeVideoPlayer;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$2;->arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/media/NativeVideoPlayer;)Landroid/media/MediaPlayer$OnCompletionListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$2;-><init>(Lcom/vkontakte/android/media/NativeVideoPlayer;)V

    return-object v0
.end method


# virtual methods
.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/NativeVideoPlayer$$Lambda$2;->arg$1:Lcom/vkontakte/android/media/NativeVideoPlayer;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/media/NativeVideoPlayer;->lambda$doSetDataSource$1(Landroid/media/MediaPlayer;)V

    return-void
.end method
