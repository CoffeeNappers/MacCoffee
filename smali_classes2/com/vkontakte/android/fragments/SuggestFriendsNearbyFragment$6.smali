.class Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;
.super Ljava/lang/Object;
.source "SuggestFriendsNearbyFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;->poll()V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;

    .prologue
    .line 253
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;->this$0:Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 269
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6$2;-><init>(Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;)V

    const-wide/16 v2, 0x1388

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 275
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 4
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
    .line 256
    .local p1, "_users":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/UserProfile;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;->this$0:Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 257
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;->this$0:Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;->users:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 258
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;->this$0:Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment;->updateList()V

    .line 259
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v1, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6$1;-><init>(Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;)V

    const-wide/16 v2, 0x7d0

    invoke-virtual {v0, v1, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 265
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 253
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SuggestFriendsNearbyFragment$6;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
