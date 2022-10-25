.class final synthetic Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Ljava/util/ArrayList;

.field private final arg$2:Landroid/content/Context;

.field private final arg$3:Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;


# direct methods
.method private constructor <init>(Ljava/util/ArrayList;Landroid/content/Context;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;->arg$1:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;->arg$2:Landroid/content/Context;

    iput-object p3, p0, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;->arg$3:Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;

    return-void
.end method

.method public static lambdaFactory$(Ljava/util/ArrayList;Landroid/content/Context;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;-><init>(Ljava/util/ArrayList;Landroid/content/Context;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;->arg$1:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;->arg$2:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/upload/UploadUtils$$Lambda$1;->arg$3:Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/upload/UploadUtils;->lambda$doCopyFromRestrictedProviderAsync$2(Ljava/util/ArrayList;Landroid/content/Context;Lcom/vkontakte/android/upload/UploadUtils$CopiesListener;)V

    return-void
.end method
