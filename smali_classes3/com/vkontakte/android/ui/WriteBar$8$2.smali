.class Lcom/vkontakte/android/ui/WriteBar$8$2;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/WriteBar$8;->onLayoutChange(Landroid/view/View;IIIIIIII)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/WriteBar$8;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/WriteBar$8;)V
    .locals 0
    .param p1, "this$1"    # Lcom/vkontakte/android/ui/WriteBar$8;

    .prologue
    .line 552
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 8

    .prologue
    const/4 v7, 0x0

    .line 555
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$3600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v5

    invoke-virtual {v5, p0}, Landroid/view/ViewTreeObserver;->removeGlobalOnLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 556
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/WriteBar;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f09014f

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v3

    .line 557
    .local v3, "leftMin":I
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/WriteBar;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f09014e

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v2

    .line 558
    .local v2, "leftMax":I
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/WriteBar;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f090150

    invoke-virtual {v5, v6}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v4

    .line 559
    .local v4, "right":I
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$3600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/View;->getWidth()I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v6, v6, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/WriteBar;->getWidth()I

    move-result v6

    if-lt v5, v6, :cond_1

    .line 560
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    invoke-static {v5, v7}, Lcom/vkontakte/android/ui/WriteBar$8;->access$3702(Lcom/vkontakte/android/ui/WriteBar$8;Z)Z

    .line 561
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$3600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v3, v7, v4, v7}, Landroid/view/View;->setPadding(IIII)V

    .line 568
    :cond_0
    :goto_0
    return-void

    .line 562
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar$8;->access$3700(Lcom/vkontakte/android/ui/WriteBar$8;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 563
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    const/4 v6, 0x1

    invoke-static {v5, v6}, Lcom/vkontakte/android/ui/WriteBar$8;->access$3702(Lcom/vkontakte/android/ui/WriteBar$8;Z)Z

    .line 564
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/WriteBar;->getWidth()I

    move-result v5

    iget-object v6, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v6, v6, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v6}, Lcom/vkontakte/android/ui/WriteBar;->access$3600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v6}, Landroid/view/View;->getWidth()I

    move-result v6

    sub-int v0, v5, v6

    .line 565
    .local v0, "diff":I
    if-ge v0, v2, :cond_2

    move v1, v0

    .line 566
    .local v1, "left":I
    :goto_1
    iget-object v5, p0, Lcom/vkontakte/android/ui/WriteBar$8$2;->this$1:Lcom/vkontakte/android/ui/WriteBar$8;

    iget-object v5, v5, Lcom/vkontakte/android/ui/WriteBar$8;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v5}, Lcom/vkontakte/android/ui/WriteBar;->access$3600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v1, v7, v4, v7}, Landroid/view/View;->setPadding(IIII)V

    goto :goto_0

    .end local v1    # "left":I
    :cond_2
    move v1, v2

    .line 565
    goto :goto_1
.end method
