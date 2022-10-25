.class Lcom/vk/stories/ShareStoryActivity$2;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "ShareStoryActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/ShareStoryActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/ShareStoryActivity;


# direct methods
.method constructor <init>(Lcom/vk/stories/ShareStoryActivity;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/ShareStoryActivity;

    .prologue
    .line 106
    iput-object p1, p0, Lcom/vk/stories/ShareStoryActivity$2;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$OnScrollListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onScrolled(Landroid/support/v7/widget/RecyclerView;II)V
    .locals 1
    .param p1, "recyclerView"    # Landroid/support/v7/widget/RecyclerView;
    .param p2, "dx"    # I
    .param p3, "dy"    # I

    .prologue
    .line 109
    const/4 v0, 0x2

    if-le p3, v0, :cond_0

    .line 110
    iget-object v0, p0, Lcom/vk/stories/ShareStoryActivity$2;->this$0:Lcom/vk/stories/ShareStoryActivity;

    invoke-static {v0}, Lcom/vk/core/util/KeyboardUtils;->hideKeyboard(Landroid/content/Context;)V

    .line 112
    :cond_0
    return-void
.end method
