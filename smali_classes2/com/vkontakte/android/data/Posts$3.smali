.class final Lcom/vkontakte/android/data/Posts$3;
.super Lcom/vkontakte/android/api/ResultlessCallback;
.source "Posts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Posts;->deletePost(Lcom/vkontakte/android/NewsEntry;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$act:Landroid/content/Context;

.field final synthetic val$e:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method constructor <init>(Landroid/content/Context;Lcom/vkontakte/android/NewsEntry;Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 519
    iput-object p2, p0, Lcom/vkontakte/android/data/Posts$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    iput-object p3, p0, Lcom/vkontakte/android/data/Posts$3;->val$act:Landroid/content/Context;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/ResultlessCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success()V
    .locals 3

    .prologue
    .line 522
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-static {v1, v2}, Lcom/vkontakte/android/cache/NewsfeedCache;->remove(II)V

    .line 523
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "com.vkontakte.android.POST_DELETED"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 524
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "owner_id"

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 525
    const-string/jumbo v1, "post_id"

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 526
    const-string/jumbo v1, "post"

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$3;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 527
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$3;->val$act:Landroid/content/Context;

    const-string/jumbo v2, "com.vkontakte.android.permission.ACCESS_DATA"

    invoke-virtual {v1, v0, v2}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 528
    return-void
.end method
