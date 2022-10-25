.class final synthetic Lcom/vkontakte/android/media/audio/SensorUtils$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/media/audio/SensorUtils;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/audio/SensorUtils;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/audio/SensorUtils$$Lambda$2;->arg$1:Lcom/vkontakte/android/media/audio/SensorUtils;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/media/audio/SensorUtils;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/audio/SensorUtils$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/media/audio/SensorUtils$$Lambda$2;-><init>(Lcom/vkontakte/android/media/audio/SensorUtils;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/SensorUtils$$Lambda$2;->arg$1:Lcom/vkontakte/android/media/audio/SensorUtils;

    invoke-virtual {v0}, Lcom/vkontakte/android/media/audio/SensorUtils;->lambda$stopSensors$1()V

    return-void
.end method
