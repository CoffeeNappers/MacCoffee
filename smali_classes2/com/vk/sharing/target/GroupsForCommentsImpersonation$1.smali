.class Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;
.super Ljava/lang/Object;
.source "GroupsForCommentsImpersonation.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->load(Lcom/vkontakte/android/api/Callback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

.field final synthetic val$callback:Lcom/vkontakte/android/api/Callback;


# direct methods
.method constructor <init>(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;Lcom/vkontakte/android/api/Callback;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    .prologue
    .line 46
    iput-object p1, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->this$0:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    iput-object p2, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 59
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->val$callback:Lcom/vkontakte/android/api/Callback;

    invoke-interface {v0, p1}, Lcom/vkontakte/android/api/Callback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 60
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 49
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/Group;>;"
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->this$0:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    invoke-static {v0, p1}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->access$002(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 51
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->this$0:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-static {v0, v1}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->access$102(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;I)I

    .line 53
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->this$0:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-static {v0, v2, v3}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->access$202(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;J)J

    .line 54
    iget-object v0, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->val$callback:Lcom/vkontakte/android/api/Callback;

    iget-object v1, p0, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->this$0:Lcom/vk/sharing/target/GroupsForCommentsImpersonation;

    invoke-static {v1}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation;->access$000(Lcom/vk/sharing/target/GroupsForCommentsImpersonation;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/api/Callback;->success(Ljava/lang/Object;)V

    .line 55
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 46
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vk/sharing/target/GroupsForCommentsImpersonation$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
