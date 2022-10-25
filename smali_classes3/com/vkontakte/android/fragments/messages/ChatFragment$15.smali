.class Lcom/vkontakte/android/fragments/messages/ChatFragment$15;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChatFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatFragment;->loadGroupInfo(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatFragment;

    .prologue
    .line 1942
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1953
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 1954
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1955
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/Group;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 1945
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5502(Lcom/vkontakte/android/fragments/messages/ChatFragment;Lcom/vkontakte/android/api/Group;)Lcom/vkontakte/android/api/Group;

    .line 1946
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    iget-boolean v1, p1, Lcom/vkontakte/android/api/Group;->canMessage:Z

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5600(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)V

    .line 1947
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->access$5702(Lcom/vkontakte/android/fragments/messages/ChatFragment;Z)Z

    .line 1948
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;->this$0:Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->invalidateOptionsMenu()V

    .line 1949
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1942
    check-cast p1, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment$15;->success(Lcom/vkontakte/android/api/Group;)V

    return-void
.end method
