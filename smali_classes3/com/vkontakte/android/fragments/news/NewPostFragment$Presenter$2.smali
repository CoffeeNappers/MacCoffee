.class Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;
.super Ljava/lang/Object;
.source "NewPostFragment.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->saveComment(I)V
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
        "Lorg/json/JSONObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

.field final synthetic val$comment:Lcom/vkontakte/android/api/board/BoardComment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Lcom/vkontakte/android/api/board/BoardComment;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    .prologue
    .line 1298
    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;->val$comment:Lcom/vkontakte/android/api/board/BoardComment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 0
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 1312
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 1298
    check-cast p1, Lorg/json/JSONObject;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;->success(Lorg/json/JSONObject;)V

    return-void
.end method

.method public success(Lorg/json/JSONObject;)V
    .locals 4
    .param p1, "result"    # Lorg/json/JSONObject;

    .prologue
    .line 1301
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;->this$1:Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 1302
    .local v0, "act":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 1303
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 1304
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "comment"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;->val$comment:Lcom/vkontakte/android/api/board/BoardComment;

    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 1305
    const/4 v2, -0x1

    invoke-virtual {v0, v2, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 1306
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 1308
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_0
    return-void
.end method
