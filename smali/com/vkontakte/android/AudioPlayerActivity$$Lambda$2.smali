.class final synthetic Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

.field private final arg$2:Z


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioPlayerActivity;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iput-boolean p2, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;->arg$2:Z

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/AudioPlayerActivity;Z)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;-><init>(Lcom/vkontakte/android/AudioPlayerActivity;Z)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;->arg$1:Lcom/vkontakte/android/AudioPlayerActivity;

    iget-boolean v1, p0, Lcom/vkontakte/android/AudioPlayerActivity$$Lambda$2;->arg$2:Z

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/AudioPlayerActivity;->lambda$displayInfo$1(Z)V

    return-void
.end method
