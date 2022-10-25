.class Lcom/vk/stories/view/StoryViewContainer$2;
.super Ljava/lang/Object;
.source "StoryViewContainer.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/stories/view/StoryViewContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/StoryViewContainer;


# direct methods
.method constructor <init>(Lcom/vk/stories/view/StoryViewContainer;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/StoryViewContainer;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$2;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$2;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$000(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/widget/ViewShower;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/core/widget/ViewShower;->hide(Z)V

    .line 75
    return-void
.end method
