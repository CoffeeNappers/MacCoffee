.class final synthetic Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SignupCodeFragment;

.field private final arg$2:Landroid/widget/EditText;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;Landroid/widget/EditText;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;->arg$2:Landroid/widget/EditText;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment;Landroid/widget/EditText;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;-><init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;Landroid/widget/EditText;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 2
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;->arg$1:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$3;->arg$2:Landroid/widget/EditText;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->lambda$onCreateView$3(Landroid/widget/EditText;)V

    return-void
.end method
