.class final synthetic Lcom/vkontakte/android/data/Groups$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/Predicate;


# instance fields
.field private final arg$1:I


# direct methods
.method private constructor <init>(I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lcom/vkontakte/android/data/Groups$$Lambda$3;->arg$1:I

    return-void
.end method

.method public static lambdaFactory$(I)Lcom/vkontakte/android/functions/Predicate;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/data/Groups$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/data/Groups$$Lambda$3;-><init>(I)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget v0, p0, Lcom/vkontakte/android/data/Groups$$Lambda$3;->arg$1:I

    check-cast p1, Lcom/vkontakte/android/api/Group;

    invoke-static {v0, p1}, Lcom/vkontakte/android/data/Groups;->lambda$null$1(ILcom/vkontakte/android/api/Group;)Z

    move-result v0

    return v0
.end method
