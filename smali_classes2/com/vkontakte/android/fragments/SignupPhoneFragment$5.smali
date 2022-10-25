.class Lcom/vkontakte/android/fragments/SignupPhoneFragment$5;
.super Ljava/lang/Object;
.source "SignupPhoneFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SignupPhoneFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    .prologue
    .line 318
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const v3, 0x7f100538

    .line 320
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$500(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    .line 321
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 322
    .local v0, "imm":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$5;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$500(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->showSoftInput(Landroid/view/View;I)Z

    .line 323
    return-void
.end method
