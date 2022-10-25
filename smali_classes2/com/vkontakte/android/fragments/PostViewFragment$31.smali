.class Lcom/vkontakte/android/fragments/PostViewFragment$31;
.super Ljava/lang/Object;
.source "PostViewFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->like(Z)V
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

.field final synthetic val$liked:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 1976
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->val$liked:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 4
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v1, 0x0

    .line 2007
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    const/16 v3, 0x8

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->val$liked:Z

    if-nez v0, :cond_1

    const/4 v0, 0x1

    :goto_0
    invoke-virtual {v2, v3, v0}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 2008
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->val$liked:Z

    if-eqz v0, :cond_2

    .line 2009
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 2013
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6402(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    .line 2014
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6900(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 2015
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$7000(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$31$3;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$31$3;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$31;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    .line 2023
    :cond_0
    return-void

    :cond_1
    move v0, v1

    .line 2007
    goto :goto_0

    .line 2011
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    goto :goto_1
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallLike$Result;

    .prologue
    .line 1979
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->likes:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 1980
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->val$liked:Z

    if-eqz v0, :cond_0

    .line 1981
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->retweets:I

    iput v1, v0, Lcom/vkontakte/android/NewsEntry;->numRetweets:I

    .line 1983
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$3100(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 1984
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6402(Lcom/vkontakte/android/fragments/PostViewFragment;Z)Z

    .line 1985
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6500(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    if-nez v0, :cond_1

    .line 2003
    :goto_0
    return-void

    .line 1988
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v0

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->val$liked:Z

    if-eq v0, v1, :cond_2

    .line 1989
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6700(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$31$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$31$1;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$31;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    .line 1996
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/PostViewFragment$31;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$6800(Lcom/vkontakte/android/fragments/PostViewFragment;)Landroid/view/ViewGroup;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/PostViewFragment$31$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/PostViewFragment$31$2;-><init>(Lcom/vkontakte/android/fragments/PostViewFragment$31;)V

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1976
    check-cast p1, Lcom/vkontakte/android/api/wall/WallLike$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$31;->success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V

    return-void
.end method
