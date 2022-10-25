.class public Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "MaterialListButtonBlueHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/Object;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private final textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 17
    const v0, 0x7f030105

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 18
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;->textView:Landroid/widget/TextView;

    .line 19
    return-void
.end method


# virtual methods
.method public onBind(Ljava/lang/Object;)V
    .locals 1
    .param p1, "item"    # Ljava/lang/Object;

    .prologue
    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/MaterialListButtonBlueHolder;->textView:Landroid/widget/TextView;

    invoke-static {v0, p1}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;)V

    .line 24
    return-void
.end method

.method public onClick()V
    .locals 0

    .prologue
    .line 28
    return-void
.end method
