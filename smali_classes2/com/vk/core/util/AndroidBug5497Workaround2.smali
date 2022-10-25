.class public Lcom/vk/core/util/AndroidBug5497Workaround2;
.super Ljava/lang/Object;
.source "AndroidBug5497Workaround2.java"


# instance fields
.field private contentView:Landroid/view/View;

.field private decorView:Landroid/view/View;

.field onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# direct methods
.method public constructor <init>(Landroid/view/Window;Landroid/view/View;)V
    .locals 2
    .param p1, "window"    # Landroid/view/Window;
    .param p2, "contentView"    # Landroid/view/View;

    .prologue
    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 37
    new-instance v0, Lcom/vk/core/util/AndroidBug5497Workaround2$1;

    invoke-direct {v0, p0}, Lcom/vk/core/util/AndroidBug5497Workaround2$1;-><init>(Lcom/vk/core/util/AndroidBug5497Workaround2;)V

    iput-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    .line 14
    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->decorView:Landroid/view/View;

    .line 15
    iput-object p2, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->contentView:Landroid/view/View;

    .line 18
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 19
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->decorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 21
    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/util/AndroidBug5497Workaround2;

    .prologue
    .line 9
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->decorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/core/util/AndroidBug5497Workaround2;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vk/core/util/AndroidBug5497Workaround2;

    .prologue
    .line 9
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->contentView:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method public disable()V
    .locals 2

    .prologue
    .line 31
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 32
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->decorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 34
    :cond_0
    return-void
.end method

.method public enable()V
    .locals 2

    .prologue
    .line 25
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 26
    iget-object v0, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->decorView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/AndroidBug5497Workaround2;->onGlobalLayoutListener:Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 28
    :cond_0
    return-void
.end method
