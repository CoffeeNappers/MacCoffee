.class public Lcom/vkontakte/android/ui/holder/messages/DialogHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "DialogHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/DialogEntry;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;"
    }
.end annotation


# instance fields
.field private dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

.field private userPhoto:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/fragments/messages/DialogsFragment;Ljava/lang/String;)V
    .locals 1
    .param p1, "ctx"    # Landroid/content/Context;
    .param p2, "dialogsFragment"    # Lcom/vkontakte/android/fragments/messages/DialogsFragment;
    .param p3, "userPhoto"    # Ljava/lang/String;

    .prologue
    .line 21
    new-instance v0, Lcom/vkontakte/android/ui/DialogEntryView;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/DialogEntryView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 22
    iput-object p3, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->userPhoto:Ljava/lang/String;

    .line 23
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .line 24
    return-void
.end method


# virtual methods
.method synthetic lambda$onLongClick$0(ZZLcom/vkontakte/android/DialogEntry;Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "isGroup"    # Z
    .param p2, "isDenyMessages"    # Z
    .param p3, "lastEntry"    # Lcom/vkontakte/android/DialogEntry;
    .param p4, "dialog"    # Landroid/content/DialogInterface;
    .param p5, "which"    # I

    .prologue
    .line 69
    if-eqz p1, :cond_1

    .line 70
    packed-switch p5, :pswitch_data_0

    .line 99
    :goto_0
    return-void

    .line 72
    :pswitch_0
    if-eqz p2, :cond_0

    .line 73
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->allowMessages(Lcom/vkontakte/android/DialogEntry;)V

    goto :goto_0

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->denyMessages(Lcom/vkontakte/android/DialogEntry;)V

    goto :goto_0

    .line 79
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->confirmAndClearHistory(Lcom/vkontakte/android/DialogEntry;)V

    goto :goto_0

    .line 82
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->createShortcut(Lcom/vkontakte/android/DialogEntry;)V

    goto :goto_0

    .line 88
    :cond_1
    packed-switch p5, :pswitch_data_1

    goto :goto_0

    .line 90
    :pswitch_3
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->confirmAndClearHistory(Lcom/vkontakte/android/DialogEntry;)V

    goto :goto_0

    .line 93
    :pswitch_4
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    invoke-virtual {v0, p3}, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->createShortcut(Lcom/vkontakte/android/DialogEntry;)V

    goto :goto_0

    .line 70
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch

    .line 88
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method

.method public onBind(Lcom/vkontakte/android/DialogEntry;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/DialogEntry;

    .prologue
    .line 28
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->itemView:Landroid/view/View;

    check-cast v0, Lcom/vkontakte/android/ui/DialogEntryView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->userPhoto:Ljava/lang/String;

    invoke-virtual {v0, p1, v1}, Lcom/vkontakte/android/ui/DialogEntryView;->setData(Lcom/vkontakte/android/DialogEntry;Ljava/lang/String;)V

    .line 29
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 15
    check-cast p1, Lcom/vkontakte/android/DialogEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->onBind(Lcom/vkontakte/android/DialogEntry;)V

    return-void
.end method

.method public onClick()V
    .locals 5

    .prologue
    .line 33
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/DialogEntry;

    .line 34
    .local v1, "lastEntry":Lcom/vkontakte/android/DialogEntry;
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    if-eqz v2, :cond_0

    .line 35
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    invoke-interface {v2, v1}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;->onItemSelected(Lcom/vkontakte/android/DialogEntry;)V

    .line 44
    :goto_0
    return-void

    .line 38
    :cond_0
    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget-object v3, v1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v3, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v4, v1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v3, v1, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 39
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v0

    .line 40
    .local v0, "builder":Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, v1, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    if-eqz v2, :cond_1

    .line 41
    iget-object v2, v1, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    iget v2, v2, Lcom/vkontakte/android/Message;->id:I

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setMessageId(I)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    .line 43
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0
.end method

.method public onLongClick()Z
    .locals 11

    .prologue
    const v10, 0x7f080147

    const v9, 0x7f080128

    const/4 v8, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    .line 48
    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->selListener:Lcom/vkontakte/android/fragments/messages/DialogsFragment$SelectionListener;

    if-nez v5, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->dialogsFragment:Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/messages/DialogsFragment;->searchQuery:Ljava/lang/String;

    if-eqz v5, :cond_1

    :cond_0
    move v5, v7

    .line 101
    :goto_0
    return v5

    .line 51
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getItem()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 52
    .local v4, "lastEntry":Lcom/vkontakte/android/DialogEntry;
    iget-object v5, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v0, v5, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 53
    .local v0, "extra":Landroid/os/Bundle;
    iget-object v5, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    if-gez v5, :cond_2

    move v2, v6

    .line 54
    .local v2, "isGroup":Z
    :goto_1
    if-eqz v0, :cond_3

    const-string/jumbo v5, "is_messages_blocked"

    invoke-virtual {v0, v5, v7}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_3

    move v1, v6

    .line 55
    .local v1, "isDenyMessages":Z
    :goto_2
    if-eqz v2, :cond_5

    const/4 v5, 0x3

    new-array v3, v5, [Ljava/lang/String;

    if-eqz v1, :cond_4

    const v5, 0x7f0800cd

    .line 58
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    .line 59
    :goto_3
    aput-object v5, v3, v7

    .line 60
    invoke-virtual {p0, v10}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v6

    .line 61
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v8

    .line 67
    .local v3, "items":[Ljava/lang/String;
    :goto_4
    new-instance v5, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-direct {v5, v7}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {p0, v2, v1, v4}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/messages/DialogHolder;ZZLcom/vkontakte/android/DialogEntry;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v7

    .line 68
    invoke-virtual {v5, v3, v7}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 100
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move v5, v6

    .line 101
    goto :goto_0

    .end local v1    # "isDenyMessages":Z
    .end local v2    # "isGroup":Z
    .end local v3    # "items":[Ljava/lang/String;
    :cond_2
    move v2, v7

    .line 53
    goto :goto_1

    .restart local v2    # "isGroup":Z
    :cond_3
    move v1, v7

    .line 54
    goto :goto_2

    .line 58
    .restart local v1    # "isDenyMessages":Z
    :cond_4
    const v5, 0x7f0801b4

    .line 59
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    .line 61
    :cond_5
    new-array v3, v8, [Ljava/lang/String;

    .line 64
    invoke-virtual {p0, v10}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v7

    .line 65
    invoke-virtual {p0, v9}, Lcom/vkontakte/android/ui/holder/messages/DialogHolder;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v6

    goto :goto_4
.end method
