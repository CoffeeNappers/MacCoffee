.class Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$1;
.super Ljava/lang/Object;
.source "RequestsFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;->doLoadData(II)V
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
        "Lcom/vkontakte/android/UserProfile;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;->onError(Lme/grishka/appkit/api/ErrorResponse;)V

    .line 59
    return-void
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
    .line 46
    .local p1, "result":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v2, Lcom/vkontakte/android/data/VKList;

    invoke-direct {v2}, Lcom/vkontakte/android/data/VKList;-><init>()V

    .line 47
    .local v2, "r":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/RequestUserProfile;>;"
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->total()I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/data/VKList;->setTotal(I)V

    .line 48
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/UserProfile;

    .line 49
    .local v1, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v0, Lcom/vkontakte/android/RequestUserProfile;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/RequestUserProfile;-><init>(Lcom/vkontakte/android/UserProfile;)V

    .line 50
    .local v0, "f":Lcom/vkontakte/android/RequestUserProfile;
    const-string/jumbo v4, ""

    iput-object v4, v0, Lcom/vkontakte/android/RequestUserProfile;->message:Ljava/lang/String;

    iput-object v4, v0, Lcom/vkontakte/android/RequestUserProfile;->info:Ljava/lang/String;

    .line 51
    invoke-virtual {v2, v0}, Lcom/vkontakte/android/data/VKList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 53
    .end local v0    # "f":Lcom/vkontakte/android/RequestUserProfile;
    .end local v1    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment;->onDataLoaded(Lme/grishka/appkit/api/PaginatedList;)V

    .line 54
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 43
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groupadmin/RequestsFragment$1;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
