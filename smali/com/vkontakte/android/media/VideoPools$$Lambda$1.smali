.class final synthetic Lcom/vkontakte/android/media/VideoPools$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/api/VideoFile;

.field private final arg$2:I

.field private final arg$3:Ljava/lang/String;

.field private final arg$4:I

.field private final arg$5:Z

.field private final arg$6:Z

.field private final arg$7:Ljava/lang/String;

.field private final arg$8:Lcom/vkontakte/android/media/VideoPools$PlayerContext;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$1:Lcom/vkontakte/android/api/VideoFile;

    iput p2, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$2:I

    iput-object p3, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$3:Ljava/lang/String;

    iput p4, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$4:I

    iput-boolean p5, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$5:Z

    iput-boolean p6, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$6:Z

    iput-object p7, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$7:Ljava/lang/String;

    iput-object p8, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$8:Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)Ljava/lang/Runnable;
    .locals 9

    new-instance v0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;

    move-object v1, p0

    move v2, p1

    move-object v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;-><init>(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 8
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$1:Lcom/vkontakte/android/api/VideoFile;

    iget v1, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$2:I

    iget-object v2, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$3:Ljava/lang/String;

    iget v3, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$4:I

    iget-boolean v4, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$5:Z

    iget-boolean v5, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$6:Z

    iget-object v6, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$7:Ljava/lang/String;

    iget-object v7, p0, Lcom/vkontakte/android/media/VideoPools$$Lambda$1;->arg$8:Lcom/vkontakte/android/media/VideoPools$PlayerContext;

    invoke-static/range {v0 .. v7}, Lcom/vkontakte/android/media/VideoPools;->lambda$obtainAndAttachPlayer$1(Lcom/vkontakte/android/api/VideoFile;ILjava/lang/String;IZZLjava/lang/String;Lcom/vkontakte/android/media/VideoPools$PlayerContext;)V

    return-void
.end method
