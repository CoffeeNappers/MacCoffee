.class final synthetic Lcom/vkontakte/android/VideoUploadDialog$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnDismissListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/VideoUploadDialog;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/VideoUploadDialog;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/VideoUploadDialog$$Lambda$1;->arg$1:Lcom/vkontakte/android/VideoUploadDialog;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/VideoUploadDialog;)Landroid/content/DialogInterface$OnDismissListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/VideoUploadDialog$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/VideoUploadDialog$$Lambda$1;-><init>(Lcom/vkontakte/android/VideoUploadDialog;)V

    return-object v0
.end method


# virtual methods
.method public onDismiss(Landroid/content/DialogInterface;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/VideoUploadDialog$$Lambda$1;->arg$1:Lcom/vkontakte/android/VideoUploadDialog;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/VideoUploadDialog;->lambda$onCreate$0(Landroid/content/DialogInterface;)V

    return-void
.end method
