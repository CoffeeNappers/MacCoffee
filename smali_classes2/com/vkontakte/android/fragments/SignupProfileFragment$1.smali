.class Lcom/vkontakte/android/fragments/SignupProfileFragment$1;
.super Lcom/vkontakte/android/fragments/SignupProfileFragment$TextWatcherAdapter;
.source "SignupProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SignupProfileFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SignupProfileFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SignupProfileFragment;

    .prologue
    .line 118
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/SignupProfileFragment$TextWatcherAdapter;-><init>(Lcom/vkontakte/android/fragments/SignupProfileFragment$1;)V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 121
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupProfileFragment$1;->this$0:Lcom/vkontakte/android/fragments/SignupProfileFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/SignupProfileFragment;->access$102(Lcom/vkontakte/android/fragments/SignupProfileFragment;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 122
    return-void
.end method
