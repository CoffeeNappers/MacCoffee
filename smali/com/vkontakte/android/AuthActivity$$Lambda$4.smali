.class final synthetic Lcom/vkontakte/android/AuthActivity$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;


# instance fields
.field private final arg$1:Landroid/view/View;

.field private final arg$2:Landroid/view/View;


# direct methods
.method private constructor <init>(Landroid/view/View;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/AuthActivity$$Lambda$4;->arg$1:Landroid/view/View;

    iput-object p2, p0, Lcom/vkontakte/android/AuthActivity$$Lambda$4;->arg$2:Landroid/view/View;

    return-void
.end method

.method public static lambdaFactory$(Landroid/view/View;Landroid/view/View;)Lcom/vkontakte/android/ui/XFrameLayout$OnKeyboardStateChangeListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/AuthActivity$$Lambda$4;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/AuthActivity$$Lambda$4;-><init>(Landroid/view/View;Landroid/view/View;)V

    return-object v0
.end method


# virtual methods
.method public onKeyboardStateChanged(Z)V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/AuthActivity$$Lambda$4;->arg$1:Landroid/view/View;

    iget-object v1, p0, Lcom/vkontakte/android/AuthActivity$$Lambda$4;->arg$2:Landroid/view/View;

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/AuthActivity;->lambda$onCreate$3(Landroid/view/View;Landroid/view/View;Z)V

    return-void
.end method
