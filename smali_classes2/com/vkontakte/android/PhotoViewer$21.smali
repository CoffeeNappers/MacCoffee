.class Lcom/vkontakte/android/PhotoViewer$21;
.super Ljava/lang/Object;
.source "PhotoViewer.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/PhotoViewer;->like(Z)V
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
.field final synthetic this$0:Lcom/vkontakte/android/PhotoViewer;

.field final synthetic val$curPhoto:Lcom/vkontakte/android/Photo;

.field final synthetic val$liked:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/PhotoViewer;Lcom/vkontakte/android/Photo;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/PhotoViewer;

    .prologue
    .line 982
    iput-object p1, p0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    iput-object p2, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iput-boolean p3, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$liked:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v1, 0x0

    .line 1008
    iget-object v2, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$liked:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput-boolean v0, v2, Lcom/vkontakte/android/Photo;->isLiked:Z

    .line 1009
    iget-boolean v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$liked:Z

    if-eqz v0, :cond_1

    .line 1010
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v0, Lcom/vkontakte/android/Photo;->nLikes:I

    add-int/lit8 v2, v2, -0x1

    iput v2, v0, Lcom/vkontakte/android/Photo;->nLikes:I

    .line 1014
    :goto_1
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->access$2902(Lcom/vkontakte/android/PhotoViewer;Z)Z

    .line 1015
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1200(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/FrameLayout;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$21$3;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/PhotoViewer$21$3;-><init>(Lcom/vkontakte/android/PhotoViewer$21;Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 1021
    return-void

    :cond_0
    move v0, v1

    .line 1008
    goto :goto_0

    .line 1012
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget v2, v0, Lcom/vkontakte/android/Photo;->nLikes:I

    add-int/lit8 v2, v2, 0x1

    iput v2, v0, Lcom/vkontakte/android/Photo;->nLikes:I

    goto :goto_1
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V
    .locals 2
    .param p1, "res"    # Lcom/vkontakte/android/api/wall/WallLike$Result;

    .prologue
    .line 985
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->likes:I

    iput v1, v0, Lcom/vkontakte/android/Photo;->nLikes:I

    .line 987
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget v0, v0, Lcom/vkontakte/android/Photo;->postID:I

    if-eqz v0, :cond_0

    .line 988
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$2800(Lcom/vkontakte/android/PhotoViewer;)V

    .line 990
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->access$2902(Lcom/vkontakte/android/PhotoViewer;Z)Z

    .line 991
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$curPhoto:Lcom/vkontakte/android/Photo;

    iget-boolean v0, v0, Lcom/vkontakte/android/Photo;->isLiked:Z

    iget-boolean v1, p0, Lcom/vkontakte/android/PhotoViewer$21;->val$liked:Z

    if-eq v0, v1, :cond_1

    .line 992
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1200(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/FrameLayout;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$21$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/PhotoViewer$21$1;-><init>(Lcom/vkontakte/android/PhotoViewer$21;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    .line 1004
    :goto_0
    return-void

    .line 998
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/PhotoViewer$21;->this$0:Lcom/vkontakte/android/PhotoViewer;

    invoke-static {v0}, Lcom/vkontakte/android/PhotoViewer;->access$1200(Lcom/vkontakte/android/PhotoViewer;)Landroid/widget/FrameLayout;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/PhotoViewer$21$2;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/PhotoViewer$21$2;-><init>(Lcom/vkontakte/android/PhotoViewer$21;)V

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 982
    check-cast p1, Lcom/vkontakte/android/api/wall/WallLike$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/PhotoViewer$21;->success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V

    return-void
.end method
