.class Lcom/vk/emoji/EmojiRecyclerView$1;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "EmojiRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/emoji/EmojiRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/emoji/EmojiRecyclerView;


# direct methods
.method constructor <init>(Lcom/vk/emoji/EmojiRecyclerView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/emoji/EmojiRecyclerView;

    .prologue
    .line 11
    iput-object p1, p0, Lcom/vk/emoji/EmojiRecyclerView$1;->this$0:Lcom/vk/emoji/EmojiRecyclerView;

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 14
    iget-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView$1;->this$0:Lcom/vk/emoji/EmojiRecyclerView;

    invoke-static {v0}, Lcom/vk/emoji/EmojiRecyclerView;->access$000(Lcom/vk/emoji/EmojiRecyclerView;)Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;

    move-result-object v0

    invoke-interface {v0, p1}, Lcom/vk/emoji/EmojiRecyclerView$HeaderInfoProvider;->isHeader(I)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 15
    iget-object v0, p0, Lcom/vk/emoji/EmojiRecyclerView$1;->this$0:Lcom/vk/emoji/EmojiRecyclerView;

    invoke-static {v0}, Lcom/vk/emoji/EmojiRecyclerView;->access$100(Lcom/vk/emoji/EmojiRecyclerView;)I

    move-result v0

    .line 17
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
