.class Lcom/vk/stories/StoriesFilterListFragment$1;
.super Ljava/lang/Object;
.source "StoriesFilterListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/StoriesFilterListFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/StoriesFilterListFragment;


# direct methods
.method constructor <init>(Lcom/vk/stories/StoriesFilterListFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/StoriesFilterListFragment;

    .prologue
    .line 39
    iput-object p1, p0, Lcom/vk/stories/StoriesFilterListFragment$1;->this$0:Lcom/vk/stories/StoriesFilterListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vk/stories/StoriesFilterListFragment$1;->this$0:Lcom/vk/stories/StoriesFilterListFragment;

    invoke-virtual {v0}, Lcom/vk/stories/StoriesFilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 43
    iget-object v0, p0, Lcom/vk/stories/StoriesFilterListFragment$1;->this$0:Lcom/vk/stories/StoriesFilterListFragment;

    invoke-virtual {v0}, Lcom/vk/stories/StoriesFilterListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 45
    :cond_0
    return-void
.end method
