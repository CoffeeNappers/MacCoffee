.class final synthetic Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/functions/F2;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;)Lcom/vkontakte/android/functions/F2;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$2;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;)V

    return-object v0
.end method


# virtual methods
.method public f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;

    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    check-cast p2, Ljava/lang/String;

    invoke-virtual {v0, p1, p2}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;->lambda$success$1(Lcom/vkontakte/android/data/Subscription;Ljava/lang/String;)Ljava/lang/Void;

    move-result-object v0

    return-object v0
.end method
