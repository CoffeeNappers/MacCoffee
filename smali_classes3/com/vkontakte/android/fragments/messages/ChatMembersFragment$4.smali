.class Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ChatMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->createChat()V
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

.field final synthetic val$originTitle:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;Landroid/app/Fragment;Ljava/lang/String;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 312
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->val$originTitle:Ljava/lang/String;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 330
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 331
    return-void
.end method

.method public success(Ljava/lang/Integer;)V
    .locals 5
    .param p1, "chatID"    # Ljava/lang/Integer;

    .prologue
    .line 315
    new-instance v1, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v1}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 316
    .local v1, "profile":Lcom/vkontakte/android/UserProfile;
    const v2, 0x77359400

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v3

    add-int/2addr v2, v3

    iput v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 317
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->val$originTitle:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 318
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v2

    iput v2, v1, Lcom/vkontakte/android/UserProfile;->online:I

    .line 319
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$600(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatUsers:Ljava/util/ArrayList;

    invoke-static {v2}, Lcom/vkontakte/android/data/Messages;->createChatPhoto(Ljava/util/ArrayList;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 320
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 321
    .local v0, "al":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 322
    const/4 v2, 0x0

    invoke-static {v0, v2}, Lcom/vkontakte/android/cache/Cache;->updatePeers(Ljava/util/List;Z)V

    .line 323
    new-instance v2, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget v3, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v4, v1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    .line 324
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/app/Activity;->setResult(I)V

    .line 325
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 326
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 312
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$4;->success(Ljava/lang/Integer;)V

    return-void
.end method
