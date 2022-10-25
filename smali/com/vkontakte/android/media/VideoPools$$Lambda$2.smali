.class final synthetic Lcom/vkontakte/android/media/VideoPools$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/api/VideoFile;

.field private final arg$2:I


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/VideoFile;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$2;->arg$1:Lcom/vkontakte/android/api/VideoFile;

    iput p2, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$2;->arg$2:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/api/VideoFile;I)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/VideoPools$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/media/VideoPools$$Lambda$2;-><init>(Lcom/vkontakte/android/api/VideoFile;I)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$2;->arg$1:Lcom/vkontakte/android/api/VideoFile;

    iget v1, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$2;->arg$2:I

    invoke-static {v0, v1}, Lcom/vkontakte/android/media/VideoPools;->lambda$detachAndReleasePlayer$2(Lcom/vkontakte/android/api/VideoFile;I)V

    return-void
.end method
