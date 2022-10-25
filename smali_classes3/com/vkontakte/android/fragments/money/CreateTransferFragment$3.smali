.class Lcom/vkontakte/android/fragments/money/CreateTransferFragment$3;
.super Ljava/lang/Object;
.source "CreateTransferFragment.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 301
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$400(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$300(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/EditText;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 316
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$3;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$500(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V

    .line 317
    return-void

    .line 314
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 305
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 310
    return-void
.end method
