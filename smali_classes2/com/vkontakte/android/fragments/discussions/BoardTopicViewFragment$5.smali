.class Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$5;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "BoardTopicViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->deleteComment(Lcom/vkontakte/android/api/board/BoardComment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

.field final synthetic val$comment:Lcom/vkontakte/android/api/board/BoardComment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;Landroid/app/Fragment;Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;
    .param p2, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 637
    iput-object p1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$5;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$5;->val$comment:Lcom/vkontakte/android/api/board/BoardComment;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/app/Fragment;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 2

    .prologue
    .line 640
    iget-object v0, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$5;->this$0:Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment;->commentsLoader:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/discussions/BoardTopicViewFragment$5;->val$comment:Lcom/vkontakte/android/api/board/BoardComment;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->removeComment(Lcom/vkontakte/android/api/board/BoardComment;)V

    .line 641
    return-void
.end method
