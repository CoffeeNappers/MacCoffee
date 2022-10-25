.class Lcom/vkontakte/android/fragments/PostListFragment$4;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PostListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostListFragment;->hideNotInteresting(Lcom/vkontakte/android/NewsEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostListFragment;

.field final synthetic val$de:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostListFragment;Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostListFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 762
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostListFragment$4;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/PostListFragment$4;->val$de:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 765
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$4;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostListFragment$4;->val$de:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostListFragment$4;->val$de:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/PostListFragment;->remove(II)V

    .line 766
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostListFragment$4;->this$0:Lcom/vkontakte/android/fragments/PostListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/PostListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f08030a

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 767
    return-void
.end method
