.class Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "MoneyTransfersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderHolder"
.end annotation


# instance fields
.field private mTextViewEmpty:Landroid/widget/TextView;

.field private mTextViewReadMore:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)V
    .locals 2

    .prologue
    .line 364
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->this$0:Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;

    .line 365
    invoke-static {p1}, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;->access$1000(Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment;)Landroid/widget/LinearLayout;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 367
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100343

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->mTextViewEmpty:Landroid/widget/TextView;

    .line 368
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1003b4

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->mTextViewReadMore:Landroid/widget/TextView;

    .line 369
    return-void
.end method


# virtual methods
.method public setEmpty(Z)V
    .locals 4
    .param p1, "isEmpty"    # Z

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 372
    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->mTextViewEmpty:Landroid/widget/TextView;

    if-eqz p1, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 373
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/MoneyTransfersFragment$HeaderHolder;->mTextViewReadMore:Landroid/widget/TextView;

    if-eqz p1, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 374
    return-void

    :cond_0
    move v0, v2

    .line 372
    goto :goto_0

    :cond_1
    move v1, v2

    .line 373
    goto :goto_1
.end method
