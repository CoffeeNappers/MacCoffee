.class Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;
.super Ljava/lang/Object;
.source "BoardCommentsLoader.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadDown(Landroid/content/Context;)V
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
        "Lcom/vkontakte/android/api/board/BoardGetComments$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

.field final synthetic val$ctx:Landroid/content/Context;

.field final synthetic val$session:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/board/BoardCommentsLoader;ILandroid/content/Context;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    .prologue
    .line 293
    iput-object p1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    iput p2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->val$session:I

    iput-object p3, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->val$ctx:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    const/4 v2, 0x0

    .line 317
    iget v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->val$session:I

    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    iget-object v1, v1, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->session:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    if-ne v0, v1, :cond_0

    .line 318
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v0, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$802(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z

    .line 319
    iget-object v0, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v0}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$500(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$400(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v1

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onFinishLoading(IZ)V

    .line 321
    :cond_0
    return-void
.end method

.method public success(Lcom/vkontakte/android/api/board/BoardGetComments$Result;)V
    .locals 4
    .param p1, "result"    # Lcom/vkontakte/android/api/board/BoardGetComments$Result;

    .prologue
    const/4 v3, 0x0

    .line 296
    iget v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->val$session:I

    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    iget-object v2, v2, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->session:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-ne v1, v2, :cond_1

    .line 297
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$400(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Ljava/util/LinkedList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/LinkedList;->size()I

    move-result v0

    .line 298
    .local v0, "size":I
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1, p1, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$000(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Lcom/vkontakte/android/api/board/BoardGetComments$Result;Z)I

    .line 299
    iget-object v1, p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;->comments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$600(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 300
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$702(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z

    .line 301
    if-nez v0, :cond_0

    .line 302
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->val$ctx:Landroid/content/Context;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->loadTop(Landroid/content/Context;)V

    .line 305
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$802(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z

    .line 306
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$500(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$400(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    invoke-interface {v1, v2, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->onFinishLoading(IZ)V

    .line 308
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$900(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 309
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$902(Lcom/vkontakte/android/api/board/BoardCommentsLoader;Z)Z

    .line 310
    iget-object v1, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$500(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->this$0:Lcom/vkontakte/android/api/board/BoardCommentsLoader;

    invoke-static {v2}, Lcom/vkontakte/android/api/board/BoardCommentsLoader;->access$400(Lcom/vkontakte/android/api/board/BoardCommentsLoader;)Ljava/util/LinkedList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/LinkedList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v1, v2, v3}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$BoardCommentsLoaderListener;->scrollToPosition(IZ)V

    .line 313
    .end local v0    # "size":I
    :cond_1
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 293
    check-cast p1, Lcom/vkontakte/android/api/board/BoardGetComments$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/board/BoardCommentsLoader$2;->success(Lcom/vkontakte/android/api/board/BoardGetComments$Result;)V

    return-void
.end method
