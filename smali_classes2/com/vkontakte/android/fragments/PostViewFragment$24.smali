.class Lcom/vkontakte/android/fragments/PostViewFragment$24;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->deleteComment(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

.field final synthetic val$cid:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Landroid/content/Context;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 1420
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput p3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->val$cid:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 4

    .prologue
    .line 1423
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsComment;

    .line 1424
    .local v0, "c":Lcom/vkontakte/android/NewsComment;
    iget v2, v0, Lcom/vkontakte/android/NewsComment;->cid:I

    iget v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->val$cid:I

    if-ne v2, v3, :cond_0

    .line 1425
    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/vkontakte/android/NewsComment;->isDeleted:Z

    .line 1426
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$500(Lcom/vkontakte/android/fragments/PostViewFragment;)Lme/grishka/appkit/utils/MergeRecyclerAdapter;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2000(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v3

    add-int/2addr v2, v3

    invoke-virtual {v1, v2}, Lme/grishka/appkit/utils/MergeRecyclerAdapter;->notifyItemChanged(I)V

    .line 1427
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v1

    iget v2, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v1, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 1432
    .end local v0    # "c":Lcom/vkontakte/android/NewsComment;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$24;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3100(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1433
    return-void
.end method
