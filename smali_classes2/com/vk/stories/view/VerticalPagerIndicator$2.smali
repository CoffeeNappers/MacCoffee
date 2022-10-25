.class Lcom/vk/stories/view/VerticalPagerIndicator$2;
.super Ljava/lang/Object;
.source "VerticalPagerIndicator.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/view/VerticalPagerIndicator;->setCurrentPosition(IZ)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

.field final synthetic val$animated:Z

.field final synthetic val$position:I


# direct methods
.method constructor <init>(Lcom/vk/stories/view/VerticalPagerIndicator;IZ)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/view/VerticalPagerIndicator;

    .prologue
    .line 138
    iput-object p1, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    iput p2, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    iput-boolean p3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$animated:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .prologue
    .line 141
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    iget v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    invoke-static {v3, v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$000(Lcom/vk/stories/view/VerticalPagerIndicator;I)I

    move-result v2

    .line 142
    .local v2, "rawY":I
    int-to-float v3, v2

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$100(Lcom/vk/stories/view/VerticalPagerIndicator;)F

    move-result v4

    add-float/2addr v3, v4

    float-to-int v0, v3

    .line 144
    .local v0, "currentY":I
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$200(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v3

    if-le v0, v3, :cond_0

    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-virtual {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->getMeasuredHeight()I

    move-result v3

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$200(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    sub-int/2addr v3, v4

    if-ge v0, v3, :cond_0

    .line 145
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    iget v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    invoke-static {v3, v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$302(Lcom/vk/stories/view/VerticalPagerIndicator;I)I

    .line 146
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-virtual {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->invalidate()V

    .line 166
    :goto_0
    return-void

    .line 148
    :cond_0
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$100(Lcom/vk/stories/view/VerticalPagerIndicator;)F

    move-result v1

    .line 149
    .local v1, "newOffset":F
    iget v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$300(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    if-ge v3, v4, :cond_2

    iget v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    if-nez v3, :cond_2

    .line 150
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$200(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v3

    sub-int/2addr v3, v2

    int-to-float v1, v3

    .line 159
    :cond_1
    :goto_1
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    iget v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    invoke-static {v3, v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$302(Lcom/vk/stories/view/VerticalPagerIndicator;I)I

    .line 160
    iget-boolean v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$animated:Z

    if-eqz v3, :cond_5

    .line 161
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v3, v1}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$500(Lcom/vk/stories/view/VerticalPagerIndicator;F)V

    goto :goto_0

    .line 151
    :cond_2
    iget v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$300(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    if-le v3, v4, :cond_3

    iget v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$400(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    add-int/lit8 v4, v4, -0x1

    if-ne v3, v4, :cond_3

    .line 152
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-virtual {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->getMeasuredHeight()I

    move-result v3

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$200(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    sub-int/2addr v3, v4

    sub-int/2addr v3, v2

    int-to-float v1, v3

    goto :goto_1

    .line 153
    :cond_3
    iget v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$300(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    if-ge v3, v4, :cond_4

    .line 154
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$200(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v3

    mul-int/lit8 v3, v3, 0x2

    sub-int/2addr v3, v2

    int-to-float v1, v3

    goto :goto_1

    .line 155
    :cond_4
    iget v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->val$position:I

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$300(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    if-le v3, v4, :cond_1

    .line 156
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-virtual {v3}, Lcom/vk/stories/view/VerticalPagerIndicator;->getMeasuredHeight()I

    move-result v3

    iget-object v4, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-static {v4}, Lcom/vk/stories/view/VerticalPagerIndicator;->access$200(Lcom/vk/stories/view/VerticalPagerIndicator;)I

    move-result v4

    mul-int/lit8 v4, v4, 0x2

    sub-int/2addr v3, v4

    sub-int/2addr v3, v2

    int-to-float v1, v3

    goto :goto_1

    .line 163
    :cond_5
    iget-object v3, p0, Lcom/vk/stories/view/VerticalPagerIndicator$2;->this$0:Lcom/vk/stories/view/VerticalPagerIndicator;

    invoke-virtual {v3, v1}, Lcom/vk/stories/view/VerticalPagerIndicator;->setCurrentScrollOffset(F)V

    goto/16 :goto_0
.end method
