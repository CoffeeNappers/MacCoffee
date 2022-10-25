.class Lcom/vkontakte/android/fragments/SignupCodeFragment$2;
.super Ljava/lang/Object;
.source "SignupCodeFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SignupCodeFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SignupCodeFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SignupCodeFragment;

    .prologue
    .line 161
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$2;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 1
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SignupCodeFragment$2;->this$0:Lcom/vkontakte/android/fragments/SignupCodeFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/SignupCodeFragment;->access$302(Lcom/vkontakte/android/fragments/SignupCodeFragment;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 173
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 164
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 168
    return-void
.end method
