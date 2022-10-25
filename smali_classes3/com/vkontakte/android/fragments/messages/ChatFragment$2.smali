.class Lcom/vkontakte/android/fragments/messages/ChatFragment$2;
.super Ljava/lang/Object;
.source "ChatFragment.java"

# interfaces
.implements Landroid/view/ActionMode$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 831
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z
    .locals 4
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v3, 0x0

    .line 846
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 864
    :cond_0
    :goto_0
    invoke-virtual {p1}, Landroid/view/ActionMode;->finish()V

    .line 865
    const/4 v1, 0x1

    return v1

    .line 848
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3400(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/List;)V

    goto :goto_0

    .line 851
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    new-instance v2, Ljava/util/ArrayList;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3500(Lcom/vkontakte/android/fragments/messages/ChatFragment;Ljava/util/ArrayList;)V

    goto :goto_0

    .line 854
    :pswitch_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "clipboard"

    invoke-virtual {v1, v2}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/text/ClipboardManager;

    .line 855
    .local v0, "cm":Landroid/text/ClipboardManager;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Message;

    iget-object v1, v1, Lcom/vkontakte/android/Message;->text:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/text/ClipboardManager;->setText(Ljava/lang/CharSequence;)V

    .line 856
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f080703

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    goto :goto_0

    .line 859
    .end local v0    # "cm":Landroid/text/ClipboardManager;
    :pswitch_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 860
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3600(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/WriteBar;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/WriteBar;->addFwdMessages(Ljava/util/List;)V

    goto :goto_0

    .line 846
    :pswitch_data_0
    .packed-switch 0x7f1005e5
        :pswitch_3
        :pswitch_1
        :pswitch_2
        :pswitch_0
    .end packed-switch
.end method

.method public onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 835
    invoke-virtual {p1}, Landroid/view/ActionMode;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const v1, 0x7f110003

    invoke-virtual {v0, v1, p2}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 836
    const/4 v0, 0x1

    return v0
.end method

.method public onDestroyActionMode(Landroid/view/ActionMode;)V
    .locals 2
    .param p1, "mode"    # Landroid/view/ActionMode;

    .prologue
    .line 870
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/messages/ChatFragment;->actionMode:Landroid/view/ActionMode;

    .line 871
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$3300(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 872
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$2;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$500(Lcom/vkontakte/android/fragments/messages/ChatFragment;)Lcom/vkontakte/android/ui/adapters/MessagesAdapter;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/adapters/MessagesAdapter;->notifyDataSetChanged()V

    .line 873
    return-void
.end method

.method public onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z
    .locals 1
    .param p1, "mode"    # Landroid/view/ActionMode;
    .param p2, "menu"    # Landroid/view/Menu;

    .prologue
    .line 841
    const/4 v0, 0x1

    return v0
.end method
