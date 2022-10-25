.class Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "HtmlGameRequestFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->sendRequest()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 180
    iput-object p1, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Boolean;)V
    .locals 2
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    .line 183
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 185
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;->this$0:Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 187
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 180
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;->success(Ljava/lang/Boolean;)V

    return-void
.end method
