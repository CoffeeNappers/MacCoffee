.class Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;
.super Ljava/lang/Object;
.source "FooterPostDisplayItem.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->like(ZLandroid/view/View;)V
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
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

.field final synthetic val$lOid:I

.field final synthetic val$lPid:I

.field final synthetic val$liked:Z

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;Landroid/view/View;IIZ)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    .prologue
    .line 166
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    iput p3, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$lOid:I

    iput p4, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$lPid:I

    iput-boolean p5, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$liked:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v1, 0x0

    .line 188
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$lOid:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v2, v2, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v0, v2, :cond_0

    iget v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$lPid:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v2, v2, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-eq v0, v2, :cond_1

    .line 202
    :cond_0
    :goto_0
    return-void

    .line 191
    :cond_1
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$liked:Z

    if-eqz v0, :cond_2

    .line 192
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 196
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v2, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v3, 0x8

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$liked:Z

    if-nez v0, :cond_3

    const/4 v0, 0x1

    :goto_2
    invoke-virtual {v2, v3, v0}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 197
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->access$102(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;Z)Z

    .line 198
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    invoke-static {p0, v1}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 194
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    goto :goto_1

    :cond_3
    move v0, v1

    .line 196
    goto :goto_2
.end method

.method synthetic lambda$fail$2(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 199
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0801f9

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 200
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->bindView(Landroid/view/View;)V

    .line 201
    return-void
.end method

.method synthetic lambda$success$0(Landroid/view/View;)V
    .locals 3
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 180
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    invoke-static {v0, v1, p1}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->access$200(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;ZLandroid/view/View;)V

    return-void
.end method

.method synthetic lambda$success$1(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 182
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->bindView(Landroid/view/View;)V

    return-void
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V
    .locals 3
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallLike$Result;

    .prologue
    .line 169
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->access$102(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;Z)Z

    .line 170
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    const v2, 0x7f10008e

    invoke-virtual {v1, v2}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/NewsEntry;

    .line 171
    .local v0, "_e":Lcom/vkontakte/android/NewsEntry;
    if-eqz v0, :cond_0

    iget v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$lOid:I

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    if-ne v1, v2, :cond_0

    iget v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$lPid:I

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->postID:I

    if-eq v1, v2, :cond_1

    .line 184
    :cond_0
    :goto_0
    return-void

    .line 174
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->likes:I

    iput v2, v1, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 175
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$liked:Z

    if-eqz v1, :cond_2

    .line 176
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    iget v2, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->retweets:I

    iput v2, v1, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 179
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;

    iget-object v1, v1, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem;->e:Lcom/vkontakte/android/NewsEntry;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v1

    iget-boolean v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$liked:Z

    if-eq v1, v2, :cond_3

    .line 180
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    invoke-static {p0, v2}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 182
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->val$view:Landroid/view/View;

    invoke-static {p0, v2}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;Landroid/view/View;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 166
    check-cast p1, Lcom/vkontakte/android/api/wall/WallLike$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/FooterPostDisplayItem$1;->success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V

    return-void
.end method
