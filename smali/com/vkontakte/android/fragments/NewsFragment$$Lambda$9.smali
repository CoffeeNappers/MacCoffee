.class final synthetic Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/NewsFragment;

.field private final arg$2:Ljava/util/ArrayList;

.field private final arg$3:Z

.field private final arg$4:Ljava/util/ArrayList;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/ArrayList;ZLjava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$1:Lcom/vkontakte/android/fragments/NewsFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$2:Ljava/util/ArrayList;

    iput-boolean p3, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$3:Z

    iput-object p4, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$4:Ljava/util/ArrayList;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/ArrayList;ZLjava/util/ArrayList;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;-><init>(Lcom/vkontakte/android/fragments/NewsFragment;Ljava/util/ArrayList;ZLjava/util/ArrayList;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 4
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$1:Lcom/vkontakte/android/fragments/NewsFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$2:Ljava/util/ArrayList;

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$3:Z

    iget-object v3, p0, Lcom/vkontakte/android/fragments/NewsFragment$$Lambda$9;->arg$4:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/fragments/NewsFragment;->lambda$null$7(Ljava/util/ArrayList;ZLjava/util/ArrayList;)V

    return-void
.end method
