.class final synthetic Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnCancelListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/upload/UploadTask;

.field private final arg$2:Lcom/vkontakte/android/upload/UploadListener;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;->arg$1:Lcom/vkontakte/android/upload/UploadTask;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;->arg$2:Lcom/vkontakte/android/upload/UploadListener;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;)Landroid/content/DialogInterface$OnCancelListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;-><init>(Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;)V

    return-object v0
.end method


# virtual methods
.method public onCancel(Landroid/content/DialogInterface;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;->arg$1:Lcom/vkontakte/android/upload/UploadTask;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$$Lambda$6;->arg$2:Lcom/vkontakte/android/upload/UploadListener;

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->lambda$sendPendingAttachmentComment$6(Lcom/vkontakte/android/upload/UploadTask;Lcom/vkontakte/android/upload/UploadListener;Landroid/content/DialogInterface;)V

    return-void
.end method
