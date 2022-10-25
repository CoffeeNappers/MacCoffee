.class public Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SegmenterFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/base/SegmenterFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "FooterHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/ui/util/Segmenter$Footer;",
        ">;"
    }
.end annotation


# instance fields
.field private mError:Landroid/view/ViewGroup;

.field private mErrorRetry:Landroid/view/View;

.field private mErrorText:Landroid/widget/TextView;

.field private mProgress:Landroid/widget/ProgressBar;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 318
    const v0, 0x7f030027

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 319
    const v0, 0x7f1001a3

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ProgressBar;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mProgress:Landroid/widget/ProgressBar;

    .line 320
    const v0, 0x7f1001a4

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mError:Landroid/view/ViewGroup;

    .line 321
    const v0, 0x7f1001a1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorText:Landroid/widget/TextView;

    .line 322
    const v0, 0x7f1001a2

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorRetry:Landroid/view/View;

    .line 323
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->showProgress()V

    .line 324
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/ui/util/Segmenter$Footer;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 335
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/util/Segmenter$Footer;->getState()Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 336
    sget-object v0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$1;->$SwitchMap$com$vkontakte$android$ui$util$Segmenter$Footer$State:[I

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/util/Segmenter$Footer;->getState()Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/util/Segmenter$Footer$State;->ordinal()I

    move-result v1

    aget v0, v0, v1

    packed-switch v0, :pswitch_data_0

    .line 359
    :cond_0
    :goto_0
    return-void

    .line 338
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->showProgress()V

    goto :goto_0

    .line 342
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 343
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mError:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 344
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 345
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorRetry:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 346
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/util/Segmenter$Footer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 350
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mProgress:Landroid/widget/ProgressBar;

    invoke-virtual {v0, v3}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 351
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mError:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 352
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 353
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorRetry:Landroid/view/View;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    .line 354
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/util/Segmenter$Footer;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 336
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 310
    check-cast p1, Lcom/vkontakte/android/ui/util/Segmenter$Footer;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->onBind(Lcom/vkontakte/android/ui/util/Segmenter$Footer;)V

    return-void
.end method

.method showProgress()V
    .locals 3

    .prologue
    const/16 v2, 0x8

    .line 327
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mProgress:Landroid/widget/ProgressBar;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 328
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mError:Landroid/view/ViewGroup;

    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 329
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorText:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 330
    iget-object v0, p0, Lcom/vkontakte/android/fragments/base/SegmenterFragment$FooterHolder;->mErrorRetry:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 331
    return-void
.end method
