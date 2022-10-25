.class Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;
.super Ljava/lang/Object;
.source "SignupPhoneFragment.java"

# interfaces
.implements Landroid/widget/TextView$OnEditorActionListener;


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
    .line 307
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onEditorAction(Landroid/widget/TextView;ILandroid/view/KeyEvent;)Z
    .locals 2
    .param p1, "v"    # Landroid/widget/TextView;
    .param p2, "actionId"    # I
    .param p3, "event"    # Landroid/view/KeyEvent;

    .prologue
    .line 310
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$1100(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$1100(Lcom/vkontakte/android/fragments/SignupPhoneFragment;)Lcom/vkontakte/android/functions/VoidF0;

    move-result-object v0

    invoke-interface {v0}, Lcom/vkontakte/android/functions/VoidF0;->f()V

    .line 315
    :goto_0
    const/4 v0, 0x0

    return v0

    .line 313
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SignupPhoneFragment$4;->this$0:Lcom/vkontakte/android/fragments/SignupPhoneFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->getNumber()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/SignupPhoneFragment;->access$1200(Lcom/vkontakte/android/fragments/SignupPhoneFragment;Ljava/lang/String;)V

    goto :goto_0
.end method
