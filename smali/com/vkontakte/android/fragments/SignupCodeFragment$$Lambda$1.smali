.class final synthetic Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SignupCodeFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SignupCodeFragment;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->lambda$onCreateView$0(Landroid/view/View;)V

    return-void
.end method
