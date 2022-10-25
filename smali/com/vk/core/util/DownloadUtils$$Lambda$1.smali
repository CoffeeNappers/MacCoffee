.class final synthetic Lcom/vk/core/util/DownloadUtils$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/VoidF1;


# instance fields
.field private final arg$1:Landroid/content/Context;

.field private final arg$2:Ljava/io/File;


# direct methods
.method private constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$1;->arg$1:Landroid/content/Context;

    iput-object p2, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$1;->arg$2:Ljava/io/File;

    return-void
.end method

.method public static lambdaFactory$(Landroid/content/Context;Ljava/io/File;)Lcom/vkontakte/android/functions/VoidF1;
    .locals 1

    new-instance v0, Lcom/vk/core/util/DownloadUtils$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vk/core/util/DownloadUtils$$Lambda$1;-><init>(Landroid/content/Context;Ljava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$1;->arg$1:Landroid/content/Context;

    iget-object v1, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$1;->arg$2:Ljava/io/File;

    check-cast p1, Ljava/lang/Boolean;

    invoke-static {v0, v1, p1}, Lcom/vk/core/util/DownloadUtils;->lambda$downloadFile$1(Landroid/content/Context;Ljava/io/File;Ljava/lang/Boolean;)V

    return-void
.end method
