.class final synthetic Lcom/vkontakte/android/media/VideoPools$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/media/VideoPools$PlayerContext;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$3;->arg$1:Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/VideoPools$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/media/VideoPools$$Lambda$3;-><init>(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$3;->arg$1:Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    invoke-static {v0}, Lcom/vkontakte/android/media/VideoPools;->lambda$null$0(Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V

    return-void
.end method
