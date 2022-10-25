.class Lcom/vkontakte/android/fragments/PostViewFragment$1;
.super Landroid/content/BroadcastReceiver;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 305
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 10
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    const/16 v9, 0x8

    const/4 v8, 0x0

    .line 308
    const-string/jumbo v5, "com.vkontakte.android.POST_UPDATED"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 309
    const-string/jumbo v5, "owner_id"

    invoke-virtual {p2, v5, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 310
    .local v1, "oid":I
    const-string/jumbo v5, "post_id"

    invoke-virtual {p2, v5, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    .line 311
    .local v3, "pid":I
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v1, v5, :cond_3

    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    iget v5, v5, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-ne v3, v5, :cond_3

    .line 312
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    const-string/jumbo v6, "likes"

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    iput v6, v5, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 313
    const-string/jumbo v5, "comments"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 314
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    const-string/jumbo v6, "comments"

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    iput v6, v5, Lcom/vkontakte/android/NewsEntry;->numComments:I

    .line 316
    :cond_0
    const-string/jumbo v5, "retweets"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 317
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    const-string/jumbo v6, "retweets"

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v6

    iput v6, v5, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 319
    :cond_1
    const-string/jumbo v5, "retweeted"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    .line 320
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    const/4 v6, 0x4

    const-string/jumbo v7, "retweeted"

    invoke-virtual {p2, v7, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v7

    invoke-virtual {v5, v6, v7}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 322
    :cond_2
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    invoke-virtual {v5, v9}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v4

    .line 323
    .local v4, "wasLiked":Z
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v5

    const-string/jumbo v6, "liked"

    invoke-virtual {p2, v6, v8}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v6

    invoke-virtual {v5, v9, v6}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 324
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$100(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 327
    .end local v1    # "oid":I
    .end local v3    # "pid":I
    .end local v4    # "wasLiked":Z
    :cond_3
    sget-object v5, Lcom/vkontakte/android/data/GroupsAdmin;->ACTION_BAN_ADDED:Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_6

    .line 328
    const-string/jumbo v5, "profile"

    invoke-virtual {p2, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    .line 329
    .local v2, "p":Lcom/vkontakte/android/UserProfile;
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$200(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v5

    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_4
    :goto_0
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsComment;

    .line 330
    .local v0, "c":Lcom/vkontakte/android/NewsComment;
    iget v6, v0, Lcom/vkontakte/android/NewsComment;->uid:I

    iget v7, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v6, v7, :cond_4

    .line 331
    const/4 v6, 0x1

    iput-boolean v6, v0, Lcom/vkontakte/android/NewsComment;->isBanned:Z

    goto :goto_0

    .line 334
    .end local v0    # "c":Lcom/vkontakte/android/NewsComment;
    :cond_5
    iget-object v5, p0, Lcom/vkontakte/android/fragments/PostViewFragment$1;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 336
    .end local v2    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_6
    return-void
.end method
