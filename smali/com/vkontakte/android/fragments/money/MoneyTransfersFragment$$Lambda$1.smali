.class final synthetic Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final instance:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;->instance:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Landroid/view/View$OnClickListener;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;->instance:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$$Lambda$1;

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    invoke-static {p1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->lambda$onCreateContentView$0(Landroid/view/View;)V

    return-void
.end method
