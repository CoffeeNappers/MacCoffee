.class Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;
.super Ljava/lang/Object;
.source "ReplyBarController.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/controllers/ReplyBarController;->initReplyBar()V
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
        "Ljava/util/ArrayList",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    .prologue
    .line 139
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 2
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$200(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Z)V

    .line 153
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 139
    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;->success(Ljava/util/ArrayList;)V

    return-void
.end method

.method public success(Ljava/util/ArrayList;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 142
    .local p1, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Group;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 143
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$200(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Z)V

    .line 148
    :goto_0
    return-void

    .line 146
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$5;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    const/4 v1, 0x1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$200(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Z)V

    goto :goto_0
.end method
