.class final synthetic Lcom/vkontakte/android/utils/Utils$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Ljava/io/File;

.field private final arg$2:Ljava/io/InputStream;

.field private final arg$3:Lcom/vkontakte/android/functions/VoidF1;


# direct methods
.method private constructor <init>(Ljava/io/File;Ljava/io/InputStream;Lcom/vkontakte/android/functions/VoidF1;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/utils/Utils$$Lambda$1;->arg$1:Ljava/io/File;

    iput-object p2, p0, Lcom/vkontakte/android/utils/Utils$$Lambda$1;->arg$2:Ljava/io/InputStream;

    iput-object p3, p0, Lcom/vkontakte/android/utils/Utils$$Lambda$1;->arg$3:Lcom/vkontakte/android/functions/VoidF1;

    return-void
.end method

.method public static lambdaFactory$(Ljava/io/File;Ljava/io/InputStream;Lcom/vkontakte/android/functions/VoidF1;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/utils/Utils$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/utils/Utils$$Lambda$1;-><init>(Ljava/io/File;Ljava/io/InputStream;Lcom/vkontakte/android/functions/VoidF1;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/utils/Utils$$Lambda$1;->arg$1:Ljava/io/File;

    iget-object v1, p0, Lcom/vkontakte/android/utils/Utils$$Lambda$1;->arg$2:Ljava/io/InputStream;

    iget-object v2, p0, Lcom/vkontakte/android/utils/Utils$$Lambda$1;->arg$3:Lcom/vkontakte/android/functions/VoidF1;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/utils/Utils;->lambda$copyInputStreamToFile$0(Ljava/io/File;Ljava/io/InputStream;Lcom/vkontakte/android/functions/VoidF1;)V

    return-void
.end method
