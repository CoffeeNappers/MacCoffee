.class Lcom/vkontakte/android/fragments/PostViewFragment$23;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->likeComment(Lcom/vkontakte/android/NewsComment;)V
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
        "Lcom/vkontakte/android/api/wall/WallLike$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$comm:Lcom/vkontakte/android/NewsComment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Lcom/vkontakte/android/NewsComment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 1393
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->val$comm:Lcom/vkontakte/android/NewsComment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1403
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1404
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f0801f9

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 1406
    :cond_0
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallLike$Result;

    .prologue
    .line 1396
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->val$comm:Lcom/vkontakte/android/NewsComment;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->val$comm:Lcom/vkontakte/android/NewsComment;

    iget-boolean v0, v0, Lcom/vkontakte/android/NewsComment;->isLiked:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, v1, Lcom/vkontakte/android/NewsComment;->isLiked:Z

    .line 1397
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->val$comm:Lcom/vkontakte/android/NewsComment;

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->likes:I

    iput v1, v0, Lcom/vkontakte/android/NewsComment;->numLikes:I

    .line 1398
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$23;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 1399
    return-void

    .line 1396
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1393
    check-cast p1, Lcom/vkontakte/android/api/wall/WallLike$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$23;->success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V

    return-void
.end method
