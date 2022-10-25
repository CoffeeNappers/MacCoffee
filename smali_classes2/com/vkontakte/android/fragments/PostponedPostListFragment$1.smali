.class Lcom/vkontakte/android/fragments/PostponedPostListFragment$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PostponedPostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostponedPostListFragment;->doLoadData(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/wall/WallGet$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostponedPostListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostponedPostListFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostponedPostListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 50
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostponedPostListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostponedPostListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V
    .locals 3
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallGet$Result;

    .prologue
    .line 53
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostponedPostListFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostponedPostListFragment;

    iget-object v2, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    iget-object v0, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/fragments/PostponedPostListFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 54
    return-void

    .line 53
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 50
    check-cast p1, Lcom/vkontakte/android/api/wall/WallGet$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostponedPostListFragment$1;->success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V

    return-void
.end method
