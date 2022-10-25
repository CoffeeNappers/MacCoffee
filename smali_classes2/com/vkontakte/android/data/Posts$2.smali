.class final Lcom/vkontakte/android/data/Posts$2;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "Posts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Posts;->saveRepostComment(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Landroid/app/Activity;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Landroid/app/Activity;

.field final synthetic val$e:Lcom/vkontakte/android/NewsEntry;

.field final synthetic val$newComment:Ljava/lang/String;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/app/Activity;Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 496
    iput-object p2, p0, Lcom/vkontakte/android/data/Posts$2;->val$act:Landroid/app/Activity;

    iput-object p3, p0, Lcom/vkontakte/android/data/Posts$2;->val$e:Lcom/vkontakte/android/NewsEntry;

    iput-object p4, p0, Lcom/vkontakte/android/data/Posts$2;->val$newComment:Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 511
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 512
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$2;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$2;->val$newComment:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$2;->val$act:Landroid/app/Activity;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/data/Posts;->editRepostComment(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Landroid/app/Activity;)V

    .line 513
    return-void
.end method

.method public success()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 499
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$2;->val$act:Landroid/app/Activity;

    const v2, 0x7f08050b

    invoke-static {v1, v2, v3}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 500
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$2;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$2;->val$newComment:Ljava/lang/String;

    iput-object v2, v1, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    .line 501
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$2;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$2;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->userID:I

    if-ne v1, v2, :cond_0

    .line 502
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$2;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-static {v1, v3}, Lcom/vkontakte/android/cache/NewsfeedCache;->replaceOne(Lcom/vkontakte/android/NewsEntry;Z)V

    .line 504
    :cond_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.POST_REPLACED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 505
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "entry"

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$2;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 506
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$2;->val$act:Landroid/app/Activity;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/app/Activity;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 507
    return-void
.end method
