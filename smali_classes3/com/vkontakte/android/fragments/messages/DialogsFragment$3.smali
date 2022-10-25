.class Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;
.super Ljava/lang/Object;
.source "DialogsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$SearchListener;


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
    .line 472
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onQueryChanged(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 489
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->updateQuery(Ljava/lang/String;)V

    .line 490
    return-void
.end method

.method public onQueryConfirmed(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 476
    return-void
.end method

.method public onQuerySubmitted(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;

    .prologue
    .line 480
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$500(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 485
    :goto_0
    return-void

    .line 483
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$600(Lcom/vkontakte/android/fragments/messages/DialogsFragment;)Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;

    move-result-object v0

    const-string/jumbo v1, ""

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/MessagesSearchSuggestionsPopup;->updateQuery(Ljava/lang/String;)V

    .line 484
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$3;->this$0:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->access$700(Lcom/vkontakte/android/fragments/messages/DialogsFragment;Ljava/lang/String;)V

    goto :goto_0
.end method
