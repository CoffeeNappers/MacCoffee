.class Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "ThumbsBlockPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->openPhotoList(ILandroid/view/View;Ljava/util/ArrayList;Lcom/vkontakte/android/NewsEntry;Landroid/view/ViewGroup;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/Photo;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

.field final synthetic val$_photos:Ljava/util/ArrayList;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 238
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->val$_photos:Ljava/util/ArrayList;

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "err"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 257
    invoke-super {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;->fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V

    .line 258
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->access$100(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 259
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->access$100(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/PhotoViewer;->dismiss()V

    .line 261
    :cond_0
    return-void
.end method

.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 241
    .local p1, "photos":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/Photo;>;"
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->access$100(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v2

    if-nez v2, :cond_0

    .line 253
    :goto_0
    return-void

    .line 244
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->val$_photos:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/Photo;

    .line 245
    .local v0, "op":Lcom/vkontakte/android/Photo;
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Photo;

    .line 246
    .local v1, "p":Lcom/vkontakte/android/Photo;
    iget v4, v1, Lcom/vkontakte/android/Photo;->id:I

    iget v5, v0, Lcom/vkontakte/android/Photo;->id:I

    if-ne v4, v5, :cond_2

    iget v4, v1, Lcom/vkontakte/android/Photo;->ownerID:I

    iget v5, v0, Lcom/vkontakte/android/Photo;->ownerID:I

    if-ne v4, v5, :cond_2

    .line 247
    invoke-virtual {p1, v1}, Lcom/vkontakte/android/data/VKList;->remove(Ljava/lang/Object;)Z

    goto :goto_1

    .line 252
    .end local v0    # "op":Lcom/vkontakte/android/Photo;
    .end local v1    # "p":Lcom/vkontakte/android/Photo;
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;->access$100(Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem;)Lcom/vkontakte/android/PhotoViewer;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/vkontakte/android/PhotoViewer;->appendPhotos(Ljava/util/List;)V

    goto :goto_0
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 238
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/posts/ThumbsBlockPostDisplayItem$2;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
