.class final synthetic Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lme/grishka/appkit/views/DividerItemDecoration$Provider;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment;)Lme/grishka/appkit/views/DividerItemDecoration$Provider;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-object v0
.end method


# virtual methods
.method public needDrawDividerAfter(I)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->lambda$onViewCreated$1(I)Z

    move-result v0

    return v0
.end method
