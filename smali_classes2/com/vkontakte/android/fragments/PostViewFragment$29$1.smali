.class Lcom/vkontakte/android/fragments/PostViewFragment$29$1;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment$29;->success(Ljava/lang/Integer;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment$29;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/PostViewFragment$29;

    .prologue
    .line 1610
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .prologue
    .line 1613
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "input_method"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/inputmethod/InputMethodManager;

    .line 1614
    .local v0, "inputManager":Landroid/view/inputmethod/InputMethodManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->getWindowToken()Landroid/os/IBinder;

    move-result-object v1

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/view/inputmethod/InputMethodManager;->hideSoftInputFromWindow(Landroid/os/IBinder;I)Z

    .line 1618
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getCurrentFocus()Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/View;->clearFocus()V

    .line 1619
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->hideEmojiPopup()V

    .line 1621
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3200(Lcom/vkontakte/android/fragments/PostViewFragment;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1622
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$29$1;->this$1:Lcom/vkontakte/android/fragments/PostViewFragment$29;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/PostViewFragment$29;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3600(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/fragments/PostViewFragment$29$1$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$29$1$1;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$29$1;)V

    const-wide/16 v4, 0xc8

    invoke-virtual {v1, v2, v4, v5}, Lme/grishka/appkit/views/UsableRecyclerView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1631
    :cond_0
    return-void
.end method
