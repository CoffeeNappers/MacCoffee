.class Lcom/vk/stories/view/StoryView$8;
.super Ljava/lang/Object;
.source "StoryView.java"

# interfaces
.implements Lcom/vk/core/view/SimpleVideoView$OnErrorListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/StoryView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoryView;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryView;

    .prologue
    .line 462
    iput-object p1, p0, Lcom/vk/stories/view/StoryView$8;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onErrorListener(I)V
    .locals 3
    .param p1, "what"    # I

    .prologue
    .line 465
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$8;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-static {v1}, Lcom/vk/stories/view/StoryView;->access$1500(Lcom/vk/stories/view/StoryView;)V

    .line 466
    const/4 v1, -0x1

    if-le p1, v1, :cond_0

    .line 467
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$8;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-static {p1}, Lcom/vkontakte/android/media/AbsVideoPlayer;->getErrorString(I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    .line 468
    .local v0, "msg":Ljava/lang/String;
    iget-object v1, p0, Lcom/vk/stories/view/StoryView$8;->this$0:Lcom/vk/stories/view/StoryView;

    invoke-virtual {v1}, Lcom/vk/stories/view/StoryView;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-static {v1, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 470
    .end local v0    # "msg":Ljava/lang/String;
    :cond_0
    return-void
.end method
