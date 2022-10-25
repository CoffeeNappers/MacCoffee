.class Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;
.super Ljava/lang/Object;
.source "CreateTransferFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


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
    .line 356
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 359
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$800(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)I

    move-result v0

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$900(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/TextView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    .line 360
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$300(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$800(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 361
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$300(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/EditText;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$6;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$300(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)Landroid/widget/EditText;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-interface {v1}, Landroid/text/Editable;->length()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setSelection(I)V

    .line 363
    :cond_0
    return-void
.end method
