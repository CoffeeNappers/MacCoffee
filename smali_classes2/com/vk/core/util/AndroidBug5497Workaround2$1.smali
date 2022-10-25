.class Lcom/vk/core/util/AndroidBug5497Workaround2$1;
.super Ljava/lang/Object;
.source "AndroidBug5497Workaround2.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/AndroidBug5497Workaround2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;


# direct methods
.method constructor <init>(Lcom/vk/core/util/AndroidBug5497Workaround2;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/core/util/AndroidBug5497Workaround2;

    .prologue
    .line 37
    iput-object p1, p0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;->this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 40
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 42
    .local v2, "r":Landroid/graphics/Rect;
    iget-object v3, p0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;->this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-static {v3}, Lcom/vk/core/util/AndroidBug5497Workaround2;->access$000(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    .line 45
    iget-object v3, p0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;->this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-static {v3}, Lcom/vk/core/util/AndroidBug5497Workaround2;->access$000(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v1, v3, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 46
    .local v1, "height":I
    iget v3, v2, Landroid/graphics/Rect;->bottom:I

    sub-int v0, v1, v3

    .line 49
    .local v0, "diff":I
    if-eqz v0, :cond_1

    .line 52
    iget-object v3, p0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;->this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-static {v3}, Lcom/vk/core/util/AndroidBug5497Workaround2;->access$100(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    if-eq v3, v0, :cond_0

    .line 54
    iget-object v3, p0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;->this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-static {v3}, Lcom/vk/core/util/AndroidBug5497Workaround2;->access$100(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v4, v4, v4, v0}, Landroid/view/View;->setPadding(IIII)V

    .line 63
    :cond_0
    :goto_0
    return-void

    .line 58
    :cond_1
    iget-object v3, p0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;->this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-static {v3}, Lcom/vk/core/util/AndroidBug5497Workaround2;->access$100(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/View;->getPaddingBottom()I

    move-result v3

    if-eqz v3, :cond_0

    .line 60
    iget-object v3, p0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;->this$0:Lcom/vk/core/util/AndroidBug5497Workaround2;

    invoke-static {v3}, Lcom/vk/core/util/AndroidBug5497Workaround2;->access$100(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v4, v4, v4, v4}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_0
.end method
