.class final synthetic Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/Friends$GetUsersCallback;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)V

    return-object v0
.end method


# virtual methods
.method public onUsersLoaded(Ljava/util/ArrayList;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->lambda$setupInitialData$2(Ljava/util/ArrayList;)V

    return-void
.end method
