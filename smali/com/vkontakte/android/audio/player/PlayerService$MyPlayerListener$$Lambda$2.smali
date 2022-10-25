.class final synthetic Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;

.field private final arg$2:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;Ljava/lang/String;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;->arg$1:Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;

    iput-object p2, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;->arg$2:Ljava/lang/String;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;Ljava/lang/String;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;-><init>(Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;Ljava/lang/String;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;->arg$1:Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;

    iget-object v1, p0, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener$$Lambda$2;->arg$2:Ljava/lang/String;

    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/audio/player/PlayerService$MyPlayerListener;->lambda$onStateChanged$1(Ljava/lang/String;Ljava/lang/Throwable;)V

    return-void
.end method
