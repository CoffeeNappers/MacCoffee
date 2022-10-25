.class Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SubscriptionFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "DescriptionHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/Subscription;",
        ">;"
    }
.end annotation


# instance fields
.field final textView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 193
    const v0, 0x7f030209

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 194
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;->textView:Landroid/widget/TextView;

    .line 195
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/Subscription;)V
    .locals 4
    .param p1, "o"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    const/4 v3, 0x0

    .line 199
    new-instance v0, Landroid/text/SpannableStringBuilder;

    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    const v2, 0x7f0806de

    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 200
    .local v0, "result":Landroid/text/SpannableStringBuilder;
    new-instance v1, Lcom/vkontakte/android/LinkSpan;

    iget-object v2, p1, Lcom/vkontakte/android/data/Subscription;->terms_url:Ljava/lang/String;

    invoke-direct {v1, v2}, Lcom/vkontakte/android/LinkSpan;-><init>(Ljava/lang/String;)V

    .line 201
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v2

    .line 200
    invoke-virtual {v0, v1, v3, v2, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 203
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;->textView:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 189
    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;->onBind(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method
