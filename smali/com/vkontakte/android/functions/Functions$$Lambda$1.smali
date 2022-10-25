.class final synthetic Lcom/vkontakte/android/functions/Functions$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/Predicate;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/functions/Predicate;

.field private final arg$2:Lcom/vkontakte/android/functions/Predicate;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/functions/Predicate;Lcom/vkontakte/android/functions/Predicate;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/functions/Functions$$Lambda$1;->arg$1:Lcom/vkontakte/android/functions/Predicate;

    iput-object p2, p0, Lcom/vkontakte/android/functions/Functions$$Lambda$1;->arg$2:Lcom/vkontakte/android/functions/Predicate;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/functions/Predicate;Lcom/vkontakte/android/functions/Predicate;)Lcom/vkontakte/android/functions/Predicate;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/functions/Functions$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/functions/Functions$$Lambda$1;-><init>(Lcom/vkontakte/android/functions/Predicate;Lcom/vkontakte/android/functions/Predicate;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Z
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/functions/Functions$$Lambda$1;->arg$1:Lcom/vkontakte/android/functions/Predicate;

    iget-object v1, p0, Lcom/vkontakte/android/functions/Functions$$Lambda$1;->arg$2:Lcom/vkontakte/android/functions/Predicate;

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/functions/Functions;->lambda$combineAnd$0(Lcom/vkontakte/android/functions/Predicate;Lcom/vkontakte/android/functions/Predicate;Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method
