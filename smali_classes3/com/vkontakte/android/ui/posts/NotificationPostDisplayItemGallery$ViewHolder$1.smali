.class Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$1;
.super Ljava/lang/Object;
.source "NotificationPostDisplayItemGallery.java"

# interfaces
.implements Lcom/vkontakte/android/utils/PostPublisher$PostPublisherCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;-><init>(Landroid/app/Activity;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    .prologue
    .line 137
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 3
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 140
    if-nez p1, :cond_0

    .line 141
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    const v1, 0x7f0801f6

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 145
    :goto_0
    return-void

    .line 143
    :cond_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->getCode()I

    move-result v1

    iget-object v2, p1, Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;->message:Ljava/lang/String;

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/api/APIUtils;->showErrorToast(Landroid/content/Context;ILjava/lang/String;)V

    goto :goto_0
.end method

.method public onSuccess()V
    .locals 3

    .prologue
    .line 149
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/UserNotification;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$1;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/UserNotification;->hideNotification(Landroid/content/Context;Z)V

    .line 150
    return-void
.end method
