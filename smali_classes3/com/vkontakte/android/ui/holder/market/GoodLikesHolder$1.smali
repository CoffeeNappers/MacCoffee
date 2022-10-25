.class Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;
.super Ljava/lang/Object;
.source "GoodLikesHolder.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->onClick(Landroid/view/View;)V
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
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;

.field final synthetic val$isAdd:Z

.field final synthetic val$lastGood:Lcom/vkontakte/android/data/Good;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;Lcom/vkontakte/android/data/Good;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;

    .prologue
    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;

    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$lastGood:Lcom/vkontakte/android/data/Good;

    iput-boolean p3, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$isAdd:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 83
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$lastGood:Lcom/vkontakte/android/data/Good;

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$isAdd:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    iput v0, v1, Lcom/vkontakte/android/data/Good;->user_likes:I

    .line 84
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$lastGood:Lcom/vkontakte/android/data/Good;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->bind(Ljava/lang/Object;)V

    .line 85
    return-void

    .line 83
    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method

.method public success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V
    .locals 2
    .param p1, "result"    # Lcom/vkontakte/android/api/wall/WallLike$Result;

    .prologue
    .line 76
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$lastGood:Lcom/vkontakte/android/data/Good;

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$isAdd:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    iput v0, v1, Lcom/vkontakte/android/data/Good;->user_likes:I

    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$lastGood:Lcom/vkontakte/android/data/Good;

    iget v1, p1, Lcom/vkontakte/android/api/wall/WallLike$Result;->likes:I

    iput v1, v0, Lcom/vkontakte/android/data/Good;->likes_count:I

    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->this$0:Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->val$lastGood:Lcom/vkontakte/android/data/Good;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder;->bind(Ljava/lang/Object;)V

    .line 79
    return-void

    .line 76
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 73
    check-cast p1, Lcom/vkontakte/android/api/wall/WallLike$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/market/GoodLikesHolder$1;->success(Lcom/vkontakte/android/api/wall/WallLike$Result;)V

    return-void
.end method
