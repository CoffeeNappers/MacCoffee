.class final synthetic Lcom/vkontakte/android/fragments/SignupPasswordFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/SignupPasswordFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/SignupPasswordFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupPasswordFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/SignupPasswordFragment;)Landroid/widget/TextView$OnEditorActionListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/SignupPasswordFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SignupPasswordFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/SignupPasswordFragment;)V

    return-object v0
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPasswordFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/SignupPasswordFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/fragments/SignupPasswordFragment;->lambda$onCreateView$0(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z

    move-result v0

    return v0
.end method
