.class public Lcom/vkontakte/android/ui/holder/commons/DescriptionHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "DescriptionHolder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/CharSequence;",
        ">;"
    }
.end annotation


# instance fields
.field final textView:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 14
    const v0, 0x7f03007f

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 15
    const v0, 0x7f10027b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/commons/DescriptionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/DescriptionHolder;->textView:Landroid/widget/TextView;

    .line 16
    return-void
.end method


# virtual methods
.method public onBind(Ljava/lang/CharSequence;)V
    .locals 1
    .param p1, "charSequence"    # Ljava/lang/CharSequence;

    .prologue
    .line 20
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/commons/DescriptionHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 21
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 9
    check-cast p1, Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/commons/DescriptionHolder;->onBind(Ljava/lang/CharSequence;)V

    return-void
.end method
