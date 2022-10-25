.class final synthetic Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/audio/AudioStateListener;

.field private final arg$2:Lcom/vkontakte/android/audio/player/Player;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/AudioStateListener;Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;->arg$1:Lcom/vkontakte/android/audio/AudioStateListener;

    iput-object p2, p0, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;->arg$2:Lcom/vkontakte/android/audio/player/Player;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/audio/AudioStateListener;Lcom/vkontakte/android/audio/player/Player;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;-><init>(Lcom/vkontakte/android/audio/AudioStateListener;Lcom/vkontakte/android/audio/player/Player;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;->arg$1:Lcom/vkontakte/android/audio/AudioStateListener;

    iget-object v1, p0, Lcom/vkontakte/android/audio/AudioStateListener$$Lambda$6;->arg$2:Lcom/vkontakte/android/audio/player/Player;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/audio/AudioStateListener;->lambda$notifyOnParametersChanged$4(Lcom/vkontakte/android/audio/player/Player;)V

    return-void
.end method
