.class Lcom/vkontakte/android/fragments/FilterListFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "FilterListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/FilterListFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/FilterListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/FilterListFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/FilterListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 74
    iput-object p1, p0, Lcom/vkontakte/android/fragments/FilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;)V
    .locals 2
    .param p1, "r"    # Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;

    .prologue
    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;->users:Ljava/util/ArrayList;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/FilterListFragment;->access$002(Lcom/vkontakte/android/fragments/FilterListFragment;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    iget-object v1, p1, Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;->groups:Ljava/util/ArrayList;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/FilterListFragment;->access$102(Lcom/vkontakte/android/fragments/FilterListFragment;Ljava/util/ArrayList;)Ljava/util/ArrayList;

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/FilterListFragment;->rebuildSegmenter()V

    .line 81
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/FilterListFragment;->updateList()V

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/FilterListFragment;->dataLoaded()V

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/fragments/FilterListFragment$1;->this$0:Lcom/vkontakte/android/fragments/FilterListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/FilterListFragment;->refreshDone()V

    .line 84
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 74
    check-cast p1, Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/FilterListFragment$1;->success(Lcom/vkontakte/android/api/common/GetUsersGroupRequest$Result;)V

    return-void
.end method
