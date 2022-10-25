.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field private final arg$2:[Z

.field private final arg$3:[Z


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z[Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;->arg$2:[Z

    iput-object p3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;->arg$3:[Z

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z[Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z[Z)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 6
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;->arg$2:[Z

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;->arg$3:[Z

    move-object v3, p1

    move v4, p2

    move v5, p3

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->lambda$showOptions$13([Z[ZLandroid/content/DialogInterface;IZ)V

    return-void
.end method
