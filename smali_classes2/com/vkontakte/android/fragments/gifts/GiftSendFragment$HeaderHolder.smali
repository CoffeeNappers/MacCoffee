.class final Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$HeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "GiftSendFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "HeaderHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;Landroid/view/ViewGroup;)V
    .locals 5
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 608
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/gifts/GiftSendFragment;

    .line 609
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 610
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$HeaderHolder;->itemView:Landroid/view/View;

    check-cast v1, Landroid/widget/TextView;

    .line 611
    .local v1, "tv":Landroid/widget/TextView;
    const v2, -0x95908b

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 612
    sget-object v2, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v2, v2, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 613
    const/high16 v2, 0x41800000    # 16.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    .line 614
    .local v0, "padding":I
    const/high16 v2, 0x40a00000    # 5.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v0, v2, v0, v0}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 615
    const v2, 0x7f0805fb

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 616
    const/4 v2, 0x1

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 617
    new-instance v2, Landroid/view/ViewGroup$LayoutParams;

    const/4 v3, -0x1

    const/4 v4, -0x2

    invoke-direct {v2, v3, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 618
    return-void
.end method


# virtual methods
.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 606
    check-cast p1, Ljava/lang/Void;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/GiftSendFragment$HeaderHolder;->onBind(Ljava/lang/Void;)V

    return-void
.end method

.method public onBind(Ljava/lang/Void;)V
    .locals 0
    .param p1, "item"    # Ljava/lang/Void;

    .prologue
    .line 623
    return-void
.end method
