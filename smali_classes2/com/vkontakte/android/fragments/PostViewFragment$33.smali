.class Lcom/vkontakte/android/fragments/PostViewFragment$33;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->banUser(Lcom/vkontakte/android/NewsComment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$comment:Lcom/vkontakte/android/NewsComment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsComment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 2056
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->val$comment:Lcom/vkontakte/android/NewsComment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 2079
    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCodeValue()I

    move-result v1

    const/16 v2, 0x68

    if-ne v1, v2, :cond_0

    .line 2080
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 2081
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->val$comment:Lcom/vkontakte/android/NewsComment;

    iget v1, v1, Lcom/vkontakte/android/NewsComment;->uid:I

    iput v1, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 2082
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->val$comment:Lcom/vkontakte/android/NewsComment;

    iget-object v1, v1, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 2083
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->val$comment:Lcom/vkontakte/android/NewsComment;

    iget-object v1, v1, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    iput-object v1, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 2084
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    iput-object v1, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 2085
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$7100(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 2089
    .end local v0    # "p":Lcom/vkontakte/android/UserProfile;
    :goto_0
    return-void

    .line 2087
    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    goto :goto_0
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "users":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v4, 0x0

    .line 2059
    new-instance v0, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v0}, Lcom/vkontakte/android/UserProfile;-><init>()V

    .line 2060
    .local v0, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->val$comment:Lcom/vkontakte/android/NewsComment;

    iget v2, v2, Lcom/vkontakte/android/NewsComment;->uid:I

    iput v2, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 2061
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->val$comment:Lcom/vkontakte/android/NewsComment;

    iget-object v2, v2, Lcom/vkontakte/android/NewsComment;->userName:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 2062
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->val$comment:Lcom/vkontakte/android/NewsComment;

    iget-object v2, v2, Lcom/vkontakte/android/NewsComment;->userPhoto:Ljava/lang/String;

    iput-object v2, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 2063
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    iput-object v2, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 2064
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 2065
    invoke-virtual {p1, v4}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 2066
    .local v1, "r":Lcom/vkontakte/android/UserProfile;
    iget v2, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-nez v2, :cond_0

    .line 2067
    iget-object v2, v1, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    iput-object v2, v0, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 2068
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$7100(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/UserProfile;)V

    .line 2075
    .end local v1    # "r":Lcom/vkontakte/android/UserProfile;
    :goto_0
    return-void

    .line 2070
    .restart local v1    # "r":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {p1, v4}, Lcom/vkontakte/android/data/VKList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    invoke-static {v3, v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$7100(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/UserProfile;)V

    goto :goto_0

    .line 2073
    .end local v1    # "r":Lcom/vkontakte/android/UserProfile;
    :cond_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$33;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2, v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$7100(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/UserProfile;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 2056
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$33;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
