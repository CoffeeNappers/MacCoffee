.class final synthetic Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Landroid/webkit/WebView;

.field private final arg$2:Landroid/app/ProgressDialog;

.field private final arg$3:Landroid/content/Context;


# direct methods
.method private constructor <init>(Landroid/webkit/WebView;Landroid/app/ProgressDialog;Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;->arg$1:Landroid/webkit/WebView;

    iput-object p2, p0, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;->arg$2:Landroid/app/ProgressDialog;

    iput-object p3, p0, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;->arg$3:Landroid/content/Context;

    return-void
.end method

.method public static lambdaFactory$(Landroid/webkit/WebView;Landroid/app/ProgressDialog;Landroid/content/Context;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;-><init>(Landroid/webkit/WebView;Landroid/app/ProgressDialog;Landroid/content/Context;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;->arg$1:Landroid/webkit/WebView;

    iget-object v1, p0, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;->arg$2:Landroid/app/ProgressDialog;

    iget-object v2, p0, Lcom/vkontakte/android/utils/LinkUtils$$Lambda$1;->arg$3:Landroid/content/Context;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/utils/LinkUtils;->lambda$processInternalHiddenLink$0(Landroid/webkit/WebView;Landroid/app/ProgressDialog;Landroid/content/Context;)V

    return-void
.end method
