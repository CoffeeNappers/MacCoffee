.class Lcom/vkontakte/android/fragments/ProfileFragment$8;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/View$OnLayoutChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;->applyLayout()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field prevW:I

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 703
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$8;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 704
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$8;->prevW:I

    return-void
.end method


# virtual methods
.method public onLayoutChange(Landroid/view/View;IIIIIIII)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;
    .param p2, "left"    # I
    .param p3, "top"    # I
    .param p4, "right"    # I
    .param p5, "bottom"    # I
    .param p6, "oldLeft"    # I
    .param p7, "oldTop"    # I
    .param p8, "oldRight"    # I
    .param p9, "oldBottom"    # I

    .prologue
    .line 709
    sub-int v4, p4, p2

    .line 710
    .local v4, "w":I
    iget v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$8;->prevW:I

    if-ne v4, v5, :cond_0

    .line 720
    :goto_0
    return-void

    .line 713
    :cond_0
    const v5, 0x7f1004f7

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 714
    .local v0, "btn2":Landroid/widget/Button;
    const v5, 0x7f1004f8

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 715
    .local v1, "btn3":Landroid/widget/Button;
    const v5, 0x7f1004f5

    invoke-virtual {p1, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 716
    .local v3, "btnWrap":Landroid/view/View;
    invoke-virtual {v3}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    mul-int/lit8 v5, v5, 0x2

    sub-int v5, v4, v5

    div-int/lit8 v2, v5, 0x2

    .line 717
    .local v2, "btnMinW":I
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setMinWidth(I)V

    .line 718
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setMinWidth(I)V

    .line 719
    iput v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$8;->prevW:I

    goto :goto_0
.end method
