.class final synthetic Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$14;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/market/GoodFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/market/GoodFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$14;->arg$1:Lcom/vkontakte/android/fragments/market/GoodFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/market/GoodFragment;)Landroid/widget/PopupMenu$OnMenuItemClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$14;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$14;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment;)V

    return-object v0
.end method


# virtual methods
.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/market/GoodFragment$$Lambda$14;->arg$1:Lcom/vkontakte/android/fragments/market/GoodFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/market/GoodFragment;->lambda$null$3(Landroid/view/MenuItem;)Z

    move-result v0

    return v0
.end method
