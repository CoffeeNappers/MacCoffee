.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field private final arg$2:I

.field private final arg$3:Landroid/content/Intent;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;ILandroid/content/Intent;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iput p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;->arg$2:I

    iput-object p3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;->arg$3:Landroid/content/Intent;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;ILandroid/content/Intent;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;ILandroid/content/Intent;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;->arg$2:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;->arg$3:Landroid/content/Intent;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->lambda$onActivityResult$4(ILandroid/content/Intent;)V

    return-void
.end method
