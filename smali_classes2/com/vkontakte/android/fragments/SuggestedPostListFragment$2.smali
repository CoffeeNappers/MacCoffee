.class Lcom/vkontakte/android/fragments/SuggestedPostListFragment$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SuggestedPostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->doLoadData(II)V
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
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SuggestedPostListFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/SuggestedPostListFragment;Landroid/app/Fragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/SuggestedPostListFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 82
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$2;->this$0:Lcom/vkontakte/android/fragments/SuggestedPostListFragment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V
    .locals 3
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallGet$Result;

    .prologue
    .line 85
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$2;->this$0:Lcom/vkontakte/android/fragments/SuggestedPostListFragment;

    iget-object v2, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    iget-object v0, p1, Lcom/vkontakte/android/api/wall/WallGet$Result;->news:Lcom/vkontakte/android/data/VKList;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 86
    return-void

    .line 85
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 82
    check-cast p1, Lcom/vkontakte/android/api/wall/WallGet$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SuggestedPostListFragment$2;->success(Lcom/vkontakte/android/api/wall/WallGet$Result;)V

    return-void
.end method
