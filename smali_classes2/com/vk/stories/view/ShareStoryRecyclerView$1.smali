.class Lcom/vk/stories/view/ShareStoryRecyclerView$1;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "ShareStoryRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/ShareStoryRecyclerView;->onMeasure(II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/ShareStoryRecyclerView;

.field final synthetic val$spanCount:I


# direct methods
.method constructor <init>(Lcom/vk/stories/view/ShareStoryRecyclerView;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/ShareStoryRecyclerView;

    .prologue
    .line 35
    iput-object p1, p0, Lcom/vk/stories/view/ShareStoryRecyclerView$1;->this$0:Lcom/vk/stories/view/ShareStoryRecyclerView;

    iput p2, p0, Lcom/vk/stories/view/ShareStoryRecyclerView$1;->val$spanCount:I

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 38
    if-nez p1, :cond_0

    .line 39
    iget v0, p0, Lcom/vk/stories/view/ShareStoryRecyclerView$1;->val$spanCount:I

    .line 41
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
