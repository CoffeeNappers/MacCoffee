.class final synthetic Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;

.field private final arg$2:Ljava/nio/ByteBuffer;

.field private final arg$3:Z


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;Ljava/nio/ByteBuffer;Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;->arg$1:Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;

    iput-object p2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;->arg$2:Ljava/nio/ByteBuffer;

    iput-boolean p3, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;->arg$3:Z

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;Ljava/nio/ByteBuffer;Z)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;-><init>(Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;Ljava/nio/ByteBuffer;Z)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;->arg$1:Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;

    iget-object v1, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;->arg$2:Ljava/nio/ByteBuffer;

    iget-boolean v2, p0, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable$$Lambda$1;->arg$3:Z

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils$RecordingRunnable;->lambda$encode$1(Ljava/nio/ByteBuffer;Z)V

    return-void
.end method
