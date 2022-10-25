.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/content/DialogInterface$OnMultiChoiceClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field private final arg$2:Ljava/util/ArrayList;

.field private final arg$3:[Z

.field private final arg$4:[Z


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Ljava/util/ArrayList;[Z[Z)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$2:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$3:[Z

    iput-object p4, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$4:[Z

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Ljava/util/ArrayList;[Z[Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Ljava/util/ArrayList;[Z[Z)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/content/DialogInterface;IZ)V
    .locals 7
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$2:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$3:[Z

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->arg$4:[Z

    move-object v4, p1

    move v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->lambda$showOptions$10(Ljava/util/ArrayList;[Z[ZLandroid/content/DialogInterface;IZ)V

    return-void
.end method
