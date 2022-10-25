.class Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;
.super Ljava/lang/Object;
.source "ReplyBarController.java"

# interfaces
.implements Lcom/vkontakte/android/data/Groups$GetGroupsCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/controllers/ReplyBarController;->initReplyBar()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    .prologue
    .line 110
    iput-object p1, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 2

    .prologue
    .line 133
    iget-object v0, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$200(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Z)V

    .line 134
    return-void
.end method

.method public onResult(Ljava/util/List;)V
    .locals 5
    .param p1    # Ljava/util/List;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/api/Group;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 115
    .local p1, "groups":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/Group;>;"
    const/4 v0, 0x0

    .line 117
    .local v0, "currentGroup":Lcom/vkontakte/android/api/Group;
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_0
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/Group;

    .line 118
    .local v1, "g":Lcom/vkontakte/android/api/Group;
    iget v3, v1, Lcom/vkontakte/android/api/Group;->id:I

    iget-object v4, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    invoke-static {v4}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$100(Lcom/vkontakte/android/ui/controllers/ReplyBarController;)I

    move-result v4

    neg-int v4, v4

    if-ne v3, v4, :cond_0

    .line 119
    move-object v0, v1

    goto :goto_0

    .line 123
    .end local v1    # "g":Lcom/vkontakte/android/api/Group;
    :cond_1
    if-nez v0, :cond_2

    .line 124
    iget-object v2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    const/4 v3, 0x0

    invoke-static {v2, v3}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$200(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Z)V

    .line 129
    :goto_1
    return-void

    .line 126
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/ui/controllers/ReplyBarController$4;->this$0:Lcom/vkontakte/android/ui/controllers/ReplyBarController;

    const/4 v3, 0x1

    invoke-static {v2, v3}, Lcom/vkontakte/android/ui/controllers/ReplyBarController;->access$200(Lcom/vkontakte/android/ui/controllers/ReplyBarController;Z)V

    goto :goto_1
.end method
