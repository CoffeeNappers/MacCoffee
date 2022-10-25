.class final synthetic Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/statistics/StatisticBase;

.field private final arg$2:Lcom/vkontakte/android/statistics/StatisticSender;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/statistics/StatisticBase;Lcom/vkontakte/android/statistics/StatisticSender;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;->arg$1:Lcom/vkontakte/android/statistics/StatisticBase;

    iput-object p2, p0, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;->arg$2:Lcom/vkontakte/android/statistics/StatisticSender;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/statistics/StatisticBase;Lcom/vkontakte/android/statistics/StatisticSender;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;-><init>(Lcom/vkontakte/android/statistics/StatisticBase;Lcom/vkontakte/android/statistics/StatisticSender;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;->arg$1:Lcom/vkontakte/android/statistics/StatisticBase;

    iget-object v1, p0, Lcom/vkontakte/android/statistics/StatisticBase$$Lambda$1;->arg$2:Lcom/vkontakte/android/statistics/StatisticSender;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/statistics/StatisticBase;->lambda$sendSync$1(Lcom/vkontakte/android/statistics/StatisticSender;)V

    return-void
.end method
