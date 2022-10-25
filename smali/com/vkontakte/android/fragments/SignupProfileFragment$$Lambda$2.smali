.class final synthetic Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SignupProfileFragment;

.field private final arg$2:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;Landroid/widget/TextView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;->arg$2:Landroid/widget/TextView;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SignupProfileFragment;Landroid/widget/TextView;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;Landroid/widget/TextView;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;->arg$1:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$$Lambda$2;->arg$2:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->lambda$onCreateView$1(Landroid/widget/TextView;)V

    return-void
.end method
