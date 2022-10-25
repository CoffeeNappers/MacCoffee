.class final Lcom/vkontakte/android/data/Posts$4;
.super Ljava/lang/Object;
.source "Posts.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Posts;->like(Lcom/vkontakte/android/NewsEntry;ZLandroid/app/Activity;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
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
.field final synthetic val$act:Landroid/app/Activity;

.field final synthetic val$e:Lcom/vkontakte/android/NewsEntry;

.field final synthetic val$id:J

.field final synthetic val$lOid:I

.field final synthetic val$lPid:I

.field final synthetic val$liked:Z

.field final synthetic val$referer:Ljava/lang/String;


# direct methods
.method constructor <init>(JLcom/vkontakte/android/NewsEntry;ZLandroid/app/Activity;Ljava/lang/String;II)V
    .locals 1

    .prologue
    .line 555
    iput-wide p1, p0, Lcom/vkontakte/android/data/Posts$4;->val$id:J

    iput-object p3, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iput-boolean p4, p0, Lcom/vkontakte/android/data/Posts$4;->val$liked:Z

    iput-object p5, p0, Lcom/vkontakte/android/data/Posts$4;->val$act:Landroid/app/Activity;

    iput-object p6, p0, Lcom/vkontakte/android/data/Posts$4;->val$referer:Ljava/lang/String;

    iput p7, p0, Lcom/vkontakte/android/data/Posts$4;->val$lOid:I

    iput p8, p0, Lcom/vkontakte/android/data/Posts$4;->val$lPid:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$fail$0(Landroid/app/Activity;)V
    .locals 2
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 586
    const v0, 0x7f0801f9

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 576
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$lOid:I

    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v0, v1, :cond_0

    iget v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$lPid:I

    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-eq v0, v1, :cond_1

    .line 588
    :cond_0
    :goto_0
    return-void

    .line 579
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$liked:Z

    if-eqz v0, :cond_2

    .line 580
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 584
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x8

    iget-boolean v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$liked:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-virtual {v1, v2, v0}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 585
    invoke-static {}, Lcom/vkontakte/android/data/Posts;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/data/Posts$4;->val$id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 586
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$act:Landroid/app/Activity;

    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$4;->val$act:Landroid/app/Activity;

    invoke-static {v1}, Lcom/vkontakte/android/data/Posts$4$$Lambda$1;->lambdaFactory$(Landroid/app/Activity;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 587
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-static {v0}, Lcom/vkontakte/android/data/Posts;->access$100(Lcom/vkontakte/android/NewsEntry;)V

    goto :goto_0

    .line 582
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v1, v1, 0x1

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    goto :goto_1

    .line 584
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V
    .locals 5
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallLike$Result;

    .prologue
    const/16 v4, 0x8

    .line 558
    invoke-static {}, Lcom/vkontakte/android/data/Posts;->access$000()Ljava/util/ArrayList;

    move-result-object v0

    iget-wide v2, p0, Lcom/vkontakte/android/data/Posts$4;->val$id:J

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 559
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->likes:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 560
    iget-boolean v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$liked:Z

    if-eqz v0, :cond_0

    .line 561
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->retweets:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 564
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    iget-boolean v1, p0, Lcom/vkontakte/android/data/Posts$4;->val$liked:Z

    if-eq v0, v1, :cond_2

    .line 565
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/data/Posts$4;->val$act:Landroid/app/Activity;

    iget-object v3, p0, Lcom/vkontakte/android/data/Posts$4;->val$referer:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/data/Posts;->like(Lcom/vkontakte/android/NewsEntry;ZLandroid/app/Activity;Ljava/lang/String;)V

    .line 572
    :cond_1
    :goto_0
    return-void

    .line 567
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    invoke-static {v0}, Lcom/vkontakte/android/data/Posts;->access$100(Lcom/vkontakte/android/NewsEntry;)V

    .line 568
    iget-boolean v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$liked:Z

    if-eqz v0, :cond_1

    .line 569
    iget-object v0, p0, Lcom/vkontakte/android/data/Posts$4;->val$e:Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v1, "like_post"

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Analytics;->sendPromoPostActionByType(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 555
    check-cast p1, Lcom/vkontakte/android/api/wall/WallLike$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/data/Posts$4;->success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V

    return-void
.end method
