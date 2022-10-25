.class Lcom/vkontakte/android/ValidationActivity$1$2;
.super Ljava/lang/Object;
.source "ValidationActivity.java"

# interfaces
.implements Lio/reactivex/functions/Consumer;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ValidationActivity$1;->shouldOverrideUrlLoading(Landroid/webkit/WebView;Ljava/lang/String;)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lio/reactivex/functions/Consumer",
        "<",
        "Ljava/lang/Throwable;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ValidationActivity$1;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ValidationActivity$1;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ValidationActivity$1;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/vkontakte/android/ValidationActivity$1$2;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic accept(Ljava/lang/Object;)V
    .locals 0
    .param p1    # Ljava/lang/Object;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 97
    check-cast p1, Ljava/lang/Throwable;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ValidationActivity$1$2;->accept(Ljava/lang/Throwable;)V

    return-void
.end method

.method public accept(Ljava/lang/Throwable;)V
    .locals 2
    .param p1, "throwable"    # Ljava/lang/Throwable;
        .annotation build Lio/reactivex/annotations/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .prologue
    .line 100
    instance-of v0, p1, Lcom/vkontakte/android/api/APIException;

    if-eqz v0, :cond_0

    .line 101
    check-cast p1, Lcom/vkontakte/android/api/APIException;

    .end local p1    # "throwable":Ljava/lang/Throwable;
    iget-object v0, p1, Lcom/vkontakte/android/api/APIException;->errorResponse:Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    iget-object v1, p0, Lcom/vkontakte/android/ValidationActivity$1$2;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v1, v1, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->showToast(Landroid/content/Context;)V

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity$1$2;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v0, v0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ValidationActivity;->setResult(I)V

    .line 104
    const/4 v0, 0x1

    sput v0, Lcom/vkontakte/android/ValidationActivity;->result:I

    .line 105
    iget-object v0, p0, Lcom/vkontakte/android/ValidationActivity$1$2;->this$1:Lcom/vkontakte/android/ValidationActivity$1;

    iget-object v0, v0, Lcom/vkontakte/android/ValidationActivity$1;->this$0:Lcom/vkontakte/android/ValidationActivity;

    invoke-virtual {v0}, Lcom/vkontakte/android/ValidationActivity;->finish()V

    .line 106
    return-void
.end method
