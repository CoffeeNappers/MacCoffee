.class final synthetic Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

.field private final arg$2:Landroid/view/View;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;->arg$1:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;->arg$2:Landroid/view/View;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Landroid/view/View;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;-><init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;->arg$1:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$$Lambda$5;->arg$2:Landroid/view/View;

    invoke-virtual {v0, v1, p1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->lambda$onCreateContentView$4(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
