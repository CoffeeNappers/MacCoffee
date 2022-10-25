.class final synthetic Lcom/vkontakte/android/cache/NewsfeedCache$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Ljava/util/List;


# direct methods
.method private constructor <init>(Ljava/util/List;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/cache/NewsfeedCache$$Lambda$2;->arg$1:Ljava/util/List;

    return-void
.end method

.method public static lambdaFactory$(Ljava/util/List;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/cache/NewsfeedCache$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/cache/NewsfeedCache$$Lambda$2;-><init>(Ljava/util/List;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/cache/NewsfeedCache$$Lambda$2;->arg$1:Ljava/util/List;

    invoke-static {v0}, Lcom/vkontakte/android/cache/NewsfeedCache;->lambda$setLists$1(Ljava/util/List;)V

    return-void
.end method
