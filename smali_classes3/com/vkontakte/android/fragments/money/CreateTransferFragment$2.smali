.class Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "CreateTransferFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->proceedToPayment()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/String;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    .prologue
    .line 210
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 229
    const-string/jumbo v0, "CreateTransferFragment"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "fail "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 231
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 232
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v1

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 234
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$202(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Z)Z

    .line 235
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 210
    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->success(Ljava/lang/String;)V

    return-void
.end method

.method public success(Ljava/lang/String;)V
    .locals 6
    .param p1, "result"    # Ljava/lang/String;

    .prologue
    const/4 v5, 0x0

    .line 213
    const-string/jumbo v2, "CreateTransferFragment"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "success "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 217
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 218
    const-string/jumbo v2, "input_method"

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 219
    .local v1, "inputManager":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    invoke-virtual {v1, v2, v5}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 221
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    const/4 v3, 0x1

    invoke-static {v2, p1, v5, v3}, Lcom/vkontakte/android/fragments/money/MoneyWebViewFragment;->start(Landroid/app/Fragment;Ljava/lang/String;II)V

    .line 224
    .end local v1    # "inputManager":Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/CreateTransferFragment$2;->this$0:Lcom/vkontakte/android/fragments/money/CreateTransferFragment;

    invoke-static {v2, v5}, Lcom/vkontakte/android/fragments/money/CreateTransferFragment;->access$202(Lcom/vkontakte/android/fragments/money/CreateTransferFragment;Z)Z

    .line 225
    return-void
.end method
