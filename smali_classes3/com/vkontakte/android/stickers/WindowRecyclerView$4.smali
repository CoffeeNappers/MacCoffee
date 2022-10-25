.class Lcom/vkontakte/android/stickers/WindowRecyclerView$4;
.super Ljava/lang/Object;
.source "WindowRecyclerView.java"

# interfaces
.implements Lcom/vk/imageloader/OnLoadCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/WindowRecyclerView;->loadSticker(Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/WindowRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/WindowRecyclerView;

    .prologue
    .line 275
    iput-object p1, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$4;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure()V
    .locals 0

    .prologue
    .line 289
    return-void
.end method

.method public onSuccess(II)V
    .locals 3
    .param p1, "width"    # I
    .param p2, "height"    # I

    .prologue
    const/high16 v2, 0x3f800000    # 1.0f

    .line 278
    iget-object v0, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$4;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$1100(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Landroid/widget/ProgressBar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 280
    iget-object v0, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$4;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$1200(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 281
    iget-object v0, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$4;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$1000(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKImageView;->setScaleX(F)V

    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$4;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$1000(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v0

    invoke-virtual {v0, v2}, Lcom/vk/imageloader/view/VKImageView;->setScaleY(F)V

    .line 283
    iget-object v0, p0, Lcom/vkontakte/android/stickers/WindowRecyclerView$4;->this$0:Lcom/vkontakte/android/stickers/WindowRecyclerView;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/WindowRecyclerView;->access$1200(Lcom/vkontakte/android/stickers/WindowRecyclerView;)Landroid/animation/ObjectAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    .line 284
    return-void
.end method
