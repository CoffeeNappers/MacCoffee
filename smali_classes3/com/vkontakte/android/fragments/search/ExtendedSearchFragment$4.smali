.class Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ExtendedSearchFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->addFriend(Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;I)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

.field final synthetic val$position:I

.field final synthetic val$user:Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;Landroid/app/Fragment;Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 320
    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->val$user:Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    iput p4, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->val$position:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Integer;

    .prologue
    .line 323
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "com.vkontakte.android.FRIEND_LIST_CHANGED"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v0, v1, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 324
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchMode:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mSearchSegmenter:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->val$user:Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/util/SearchSegmenter;->remove(Ljava/lang/Object;)V

    .line 325
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->access$100(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)Ljava/util/ArrayList;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->val$user:Lcom/vkontakte/android/api/users/UsersSearch$SearchProfile;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 326
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->access$200(Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;)Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;

    move-result-object v0

    iget v1, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->val$position:I

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$GridAdapter;->notifyItemRemoved(I)V

    .line 327
    return-void

    .line 324
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->this$0:Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;->mRecommendations:Lcom/vkontakte/android/ui/util/SearchSegmenter;

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 320
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment$4;->success(Ljava/lang/Integer;)V

    return-void
.end method
