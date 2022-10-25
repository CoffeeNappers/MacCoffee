.class Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;
.super Ljava/lang/Object;
.source "NotificationPostDisplayItemGallery.java"

# interfaces
.implements Lcom/vk/core/util/IntentUtils$ResolveCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->onActivityResult(IILandroid/content/Intent;)V
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
    .line 477
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onError()V
    .locals 1

    .prologue
    .line 495
    const v0, 0x7f0804d2

    invoke-static {v0}, Lcom/vk/core/util/ToastUtils;->showToast(I)V

    .line 496
    return-void
.end method

.method public onResolved(Ljava/io/File;)V
    .locals 2
    .param p1, "file"    # Ljava/io/File;

    .prologue
    .line 480
    invoke-static {p1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 481
    .local v0, "uri":Landroid/net/Uri;
    new-instance v1, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6$1;-><init>(Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$6;)V

    invoke-static {v0, v1}, Lcom/vk/attachpicker/mediastore/MediaStoreController;->findPhoto(Landroid/net/Uri;Lcom/vk/attachpicker/mediastore/MediaStoreController$MediaStoreMediaEntryCallback;)V

    .line 491
    return-void
.end method
