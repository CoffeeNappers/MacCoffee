.class Lcom/vk/stories/view/StoryViewContainer$1;
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
    .line 65
    iput-object p1, p0, Lcom/vk/stories/view/StoryViewContainer$1;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .prologue
    .line 68
    iget-object v0, p0, Lcom/vk/stories/view/StoryViewContainer$1;->this$0:Lcom/vk/stories/view/StoryViewContainer;

    invoke-static {v0}, Lcom/vk/stories/view/StoryViewContainer;->access$000(Lcom/vk/stories/view/StoryViewContainer;)Lcom/vk/core/widget/ViewShower;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/core/widget/ViewShower;->show()V

    .line 69
    return-void
.end method
