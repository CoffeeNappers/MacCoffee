.class Lcom/vk/stories/StoryViewersFragment$1;
.super Ljava/lang/Object;
.source "StoryViewersFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoryViewersFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoryViewersFragment;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoryViewersFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoryViewersFragment;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vk/stories/StoryViewersFragment$1;->this$0:Lcom/vk/stories/StoryViewersFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 74
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$1;->this$0:Lcom/vk/stories/StoryViewersFragment;

    invoke-virtual {v0}, Lcom/vk/stories/StoryViewersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 75
    iget-object v0, p0, Lcom/vk/stories/StoryViewersFragment$1;->this$0:Lcom/vk/stories/StoryViewersFragment;

    invoke-virtual {v0}, Lcom/vk/stories/StoryViewersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 77
    :cond_0
    return-void
.end method
