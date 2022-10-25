.class Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$7;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChatMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->onActivityResult(IILandroid/content/Intent;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;Landroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 482
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$7;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 1
    .param p1, "mid"    # Ljava/lang/Integer;

    .prologue
    .line 485
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$7;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$700(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;->clearImage()V

    .line 486
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 482
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$7;->success(Ljava/lang/Integer;)V

    return-void
.end method
