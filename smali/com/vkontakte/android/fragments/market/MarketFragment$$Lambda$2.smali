.class final synthetic Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lme/grishka/appkit/views/DividerItemDecoration$Provider;


# static fields
.field private static final instance:Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;->instance:Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lme/grishka/appkit/views/DividerItemDecoration$Provider;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;->instance:Lcom/vkontakte/android/fragments/market/MarketFragment$$Lambda$2;

    return-object v0
.end method


# virtual methods
.method public needDrawDividerAfter(I)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1}, Lcom/vkontakte/android/fragments/market/MarketFragment;->lambda$onCreateView$1(I)Z

    move-result v0

    return v0
.end method
