.class Lcom/vkontakte/android/ChangePasswordActivity$1;
.super Ljava/lang/Object;
.source "ChangePasswordActivity.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ChangePasswordActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ChangePasswordActivity;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ChangePasswordActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ChangePasswordActivity;

    .prologue
    .line 26
    iput-object p1, p0, Lcom/vkontakte/android/ChangePasswordActivity$1;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 5
    .param p1, "arg0"    # Landroid/text/Editable;

    .prologue
    .line 30
    iget-object v3, p0, Lcom/vkontakte/android/ChangePasswordActivity$1;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-static {v3}, Lcom/vkontakte/android/ChangePasswordActivity;->access$000(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f100259

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    .line 31
    .local v2, "old":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/ChangePasswordActivity$1;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-static {v3}, Lcom/vkontakte/android/ChangePasswordActivity;->access$000(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f10025a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    .line 32
    .local v0, "new1":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/ChangePasswordActivity$1;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-static {v3}, Lcom/vkontakte/android/ChangePasswordActivity;->access$000(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/view/View;

    move-result-object v3

    const v4, 0x7f10025b

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v3

    invoke-interface {v3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 33
    .local v1, "new2":Ljava/lang/String;
    iget-object v3, p0, Lcom/vkontakte/android/ChangePasswordActivity$1;->this$0:Lcom/vkontakte/android/ChangePasswordActivity;

    invoke-static {v3}, Lcom/vkontakte/android/ChangePasswordActivity;->access$100(Lcom/vkontakte/android/ChangePasswordActivity;)Landroid/app/AlertDialog;

    move-result-object v3

    const/4 v4, -0x1

    invoke-virtual {v3, v4}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v4

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    if-lez v3, :cond_0

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v4, v3}, Landroid/widget/Button;->setEnabled(Z)V

    .line 34
    return-void

    .line 33
    :cond_0
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 39
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    .line 44
    return-void
.end method
