.class Lcom/vkontakte/android/fragments/messages/DialogsFragment$2;
.super Ljava/lang/Object;
.source "DialogsFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/DialogsFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .prologue
    .line 432
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrollStarted()V
    .locals 4

    .prologue
    .line 440
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 441
    .local v0, "act":Landroid/app/Activity;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 442
    const-string/jumbo v2, "input_method"

    invoke-virtual {v0, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/inputmethod/InputMethodManager;

    .line 443
    .local v1, "imm":Landroid/view/inputmethod/InputMethodManager;
    invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 444
    invoke-virtual {v0}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2}, Landroid/view/View;->clearFocus()V

    .line 446
    .end local v1    # "imm":Landroid/view/inputmethod/InputMethodManager;
    :cond_0
    return-void
.end method

.method public onScrolledToLastItem()V
    .locals 2

    .prologue
    .line 435
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->loadData(Z)V

    .line 436
    return-void
.end method
