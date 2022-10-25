.class Lcom/vkontakte/android/gifs/GifViewer$5;
.super Ljava/lang/Object;
.source "GifViewer.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/gifs/GifViewer;->add()V
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
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/gifs/GifViewer;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/gifs/GifViewer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/gifs/GifViewer;

    .prologue
    .line 551
    iput-object p1, p0, Lcom/vkontakte/android/gifs/GifViewer$5;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 560
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$5;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-virtual {v0}, Lcom/vkontakte/android/gifs/GifViewer;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v1

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    .line 561
    return-void
.end method

.method public success(Ljava/lang/Boolean;)V
    .locals 3
    .param p1, "result"    # Ljava/lang/Boolean;

    .prologue
    const/4 v2, 0x0

    .line 554
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$5;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-virtual {v0}, Lcom/vkontakte/android/gifs/GifViewer;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f080283

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 555
    iget-object v0, p0, Lcom/vkontakte/android/gifs/GifViewer$5;->this$0:Lcom/vkontakte/android/gifs/GifViewer;

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/gifs/GifViewer;->setAddVisibility(Z)V

    .line 556
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 551
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/gifs/GifViewer$5;->success(Ljava/lang/Boolean;)V

    return-void
.end method
