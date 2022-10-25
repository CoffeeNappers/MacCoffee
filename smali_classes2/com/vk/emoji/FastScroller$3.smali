.class Lcom/vk/emoji/FastScroller$3;
.super Landroid/support/v7/widget/RecyclerView$OnScrollListener;
.source "FastScroller.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/FastScroller;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/emoji/FastScroller;


# direct methods
.method constructor <init>(Lcom/vk/emoji/FastScroller;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/emoji/FastScroller;

    .prologue
    .line 68
    iput-object p1, p0, Lcom/vk/emoji/FastScroller$3;->this$0:Lcom/vk/emoji/FastScroller;

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
    .line 71
    iget-object v0, p0, Lcom/vk/emoji/FastScroller$3;->this$0:Lcom/vk/emoji/FastScroller;

    invoke-static {v0, p1, p2, p3}, Lcom/vk/emoji/FastScroller;->access$000(Lcom/vk/emoji/FastScroller;Landroid/support/v7/widget/RecyclerView;II)V

    .line 72
    return-void
.end method
