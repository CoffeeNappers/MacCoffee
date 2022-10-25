.class Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;
.super Ljava/lang/Object;
.source "NotificationPostDisplayItemGallery.java"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


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
    .line 152
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/ResulterProvider;->registerActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 156
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 160
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/ResulterProvider;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-interface {v0, v1}, Lcom/vkontakte/android/ui/ResulterProvider;->unregisterActivityResult(Lcom/vkontakte/android/ui/ActivityResulter;)V

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    iget v0, v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->style:I

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder$2;->this$0:Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 164
    :cond_0
    return-void
.end method
