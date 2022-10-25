.class final synthetic Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/AudioMessagePlayerService;

.field private final arg$2:F


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/AudioMessagePlayerService;F)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;->arg$1:Lcom/vkontakte/android/AudioMessagePlayerService;

    iput p2, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;->arg$2:F

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/AudioMessagePlayerService;F)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;-><init>(Lcom/vkontakte/android/AudioMessagePlayerService;F)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;->arg$1:Lcom/vkontakte/android/AudioMessagePlayerService;

    iget v1, p0, Lcom/vkontakte/android/AudioMessagePlayerService$$Lambda$3;->arg$2:F

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/AudioMessagePlayerService;->lambda$seekOpusPlayer$2(F)V

    return-void
.end method
