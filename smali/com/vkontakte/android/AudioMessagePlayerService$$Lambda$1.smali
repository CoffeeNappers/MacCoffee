.class final synthetic Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/AudioMessagePlayerService;

.field private final arg$2:[Ljava/lang/Boolean;

.field private final arg$3:Ljava/io/File;

.field private final arg$4:Ljava/util/concurrent/Semaphore;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;[Ljava/lang/Boolean;Ljava/io/File;Ljava/util/concurrent/Semaphore;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$1:Lcom/vkontakte/android/AudioMessagePlayerService;

    iput-object p2, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$2:[Ljava/lang/Boolean;

    iput-object p3, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$3:Ljava/io/File;

    iput-object p4, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$4:Ljava/util/concurrent/Semaphore;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/AudioMessagePlayerService;[Ljava/lang/Boolean;Ljava/io/File;Ljava/util/concurrent/Semaphore;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;[Ljava/lang/Boolean;Ljava/io/File;Ljava/util/concurrent/Semaphore;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$1:Lcom/vkontakte/android/AudioMessagePlayerService;

    iget-object v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$2:[Ljava/lang/Boolean;

    iget-object v2, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$3:Ljava/io/File;

    iget-object v3, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$1;->arg$4:Ljava/util/concurrent/Semaphore;

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/AudioMessagePlayerService;->lambda$playOpusFile$0([Ljava/lang/Boolean;Ljava/io/File;Ljava/util/concurrent/Semaphore;)V

    return-void
.end method
