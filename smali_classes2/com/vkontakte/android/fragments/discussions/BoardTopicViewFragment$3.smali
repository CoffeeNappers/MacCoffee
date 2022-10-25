.class Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;
.super Ljava/lang/Object;
.source "BoardTopicViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->likeComment(Lcom/vkontakte/android/api/board/BoardComment;)V
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
        "Lcom/vkontakte/android/api/board/BoardCommentLike$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

.field final synthetic val$comm:Lcom/vkontakte/android/api/board/BoardComment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    .prologue
    .line 456
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->val$comm:Lcom/vkontakte/android/api/board/BoardComment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 468
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 469
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 470
    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0801f9

    const/4 v3, 0x1

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 472
    :cond_0
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/board/BoardCommentLike$Result;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/api/board/BoardCommentLike$Result;

    .prologue
    .line 459
    if-eqz p1, :cond_0

    .line 460
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->val$comm:Lcom/vkontakte/android/api/board/BoardComment;

    iget-boolean v1, p1, Lcom/vkontakte/android/api/board/BoardCommentLike$Result;->isLiked:Z

    iput-boolean v1, v0, Lcom/vkontakte/android/api/board/BoardComment;->isLiked:Z

    .line 461
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->val$comm:Lcom/vkontakte/android/api/board/BoardComment;

    iget v1, p1, Lcom/vkontakte/android/api/board/BoardCommentLike$Result;->likeCount:I

    iput v1, v0, Lcom/vkontakte/android/api/board/BoardComment;->likesCount:I

    .line 462
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsAdapter:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$CommentsAdapter;->notifyDataSetChanged()V

    .line 464
    :cond_0
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 456
    check-cast p1, Lcom/vkontakte/android/api/board/BoardCommentLike$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$3;->success(Lcom/vkontakte/android/api/board/BoardCommentLike$Result;)V

    return-void
.end method
