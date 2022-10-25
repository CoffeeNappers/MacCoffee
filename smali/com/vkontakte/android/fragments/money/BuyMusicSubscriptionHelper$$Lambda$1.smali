.class final synthetic Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

.field private final arg$2:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;->arg$2:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    return-object v0
.end method


# virtual methods
.method public onSuccess(Ljava/lang/Object;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper$$Lambda$1;->arg$2:Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;

    check-cast p1, Lcom/vkontakte/android/data/PurchasesManager$Product;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->lambda$purchase$0(Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;Lcom/vkontakte/android/data/PurchasesManager$Product;)V

    return-void
.end method
