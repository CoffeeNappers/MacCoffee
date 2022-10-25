.class final synthetic Lcom/vkontakte/android/audio/player/PlayerService$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;


# instance fields
.field private final arg$1:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method private constructor <init>(Ljava/util/concurrent/CountDownLatch;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/audio/player/PlayerService$$Lambda$1;->arg$1:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method

.method public static lambdaFactory$(Ljava/util/concurrent/CountDownLatch;)Lcom/vkontakte/android/audio/player/PlayerService$NetworkStateEventHandler;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/audio/player/PlayerService$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/audio/player/PlayerService$$Lambda$1;-><init>(Ljava/util/concurrent/CountDownLatch;)V

    return-object v0
.end method


# virtual methods
.method public onNetworkStateChanged(Lcom/vkontakte/android/audio/player/PlayerService;Z)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/audio/player/PlayerService$$Lambda$1;->arg$1:Ljava/util/concurrent/CountDownLatch;

    invoke-static {v0, p1, p2}, Lcom/vkontakte/android/audio/player/PlayerService;->lambda$waitForOnline$0(Ljava/util/concurrent/CountDownLatch;Lcom/vkontakte/android/audio/player/PlayerService;Z)V

    return-void
.end method
