.class final synthetic Lcom/vk/core/util/DownloadUtils$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/content/Context;

.field private final arg$2:Ljava/io/File;


# direct methods
.method private constructor <init>(Landroid/content/Context;Ljava/io/File;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$2;->arg$1:Landroid/content/Context;

    iput-object p2, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$2;->arg$2:Ljava/io/File;

    return-void
.end method

.method public static lambdaFactory$(Landroid/content/Context;Ljava/io/File;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vk/core/util/DownloadUtils$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vk/core/util/DownloadUtils$$Lambda$2;-><init>(Landroid/content/Context;Ljava/io/File;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$2;->arg$1:Landroid/content/Context;

    iget-object v1, p0, Lcom/vk/core/util/DownloadUtils$$Lambda$2;->arg$2:Ljava/io/File;

    invoke-static {v0, v1}, Lcom/vk/core/util/DownloadUtils;->lambda$null$0(Landroid/content/Context;Ljava/io/File;)V

    return-void
.end method
