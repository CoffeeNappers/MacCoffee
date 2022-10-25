.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field private final arg$2:[Z


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;->arg$2:[Z

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z)Landroid/content/DialogInterface$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;I)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;->arg$2:[Z

    invoke-virtual {v0, v1, p1, p2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->lambda$showOptions$14([ZLandroid/content/DialogInterface;I)V

    return-void
.end method
