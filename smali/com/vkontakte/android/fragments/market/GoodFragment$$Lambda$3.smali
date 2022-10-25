.class final synthetic Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/market/GoodFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/market/GoodFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/market/GoodFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/market/GoodFragment;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$3;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$3;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/market/GoodFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/market/GoodFragment;->lambda$onCreateContentView$2(Landroid/view/View;)V

    return-void
.end method
