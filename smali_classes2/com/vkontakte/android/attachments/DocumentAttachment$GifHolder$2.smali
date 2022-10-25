.class Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;
.super Lcom/vk/core/widget/LifecycleListener;
.source "DocumentAttachment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    .prologue
    .line 549
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    invoke-direct {p0}, Lcom/vk/core/widget/LifecycleListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onActivityPaused(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 559
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 560
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->stop()V

    .line 562
    :cond_0
    return-void
.end method

.method public onActivityResumed(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 552
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 553
    iget-object v0, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$2;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v0, v0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mAttachment:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/attachments/DocumentAttachment;->access$400(Lcom/vkontakte/android/attachments/DocumentAttachment;)Lcom/vkontakte/android/ui/animation/MovieDrawable;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/animation/MovieDrawable;->start()V

    .line 555
    :cond_0
    return-void
.end method
