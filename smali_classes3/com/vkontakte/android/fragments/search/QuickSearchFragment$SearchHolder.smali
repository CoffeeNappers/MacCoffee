.class Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;
.super Lcom/vkontakte/android/ui/holder/UserHolder;
.source "QuickSearchFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/search/QuickSearchFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SearchHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/UserHolder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private mIsUser:Z

.field final synthetic this$0:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;Landroid/view/ViewGroup;)V
    .locals 6
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    const/4 v4, 0x0

    .line 303
    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;

    .line 304
    const v2, 0x7f0301e7

    const/4 v3, 0x1

    move-object v0, p0

    move-object v1, p2

    move v5, v4

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/ui/holder/UserHolder;-><init>(Landroid/view/ViewGroup;IZZZ)V

    .line 305
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p1, "item"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const/4 v1, 0x0

    .line 309
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/holder/UserHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    .line 310
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    if-eqz v0, :cond_2

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment;->access$1000(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 311
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mSubtitle:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "vk.com/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 315
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p1, Lcom/vkontakte/android/UserProfile;->isFriend:Z

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    if-eqz v0, :cond_3

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment;->access$1000(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_3

    :cond_1
    move v0, v1

    :goto_1
    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 316
    iget v0, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    sparse-switch v0, :sswitch_data_0

    .line 328
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mIsUser:Z

    .line 332
    :goto_2
    return-void

    .line 313
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mSubtitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 315
    :cond_3
    const/16 v0, 0x8

    goto :goto_1

    .line 318
    :sswitch_0
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mIsUser:Z

    .line 319
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f01000e

    invoke-static {v1, v2}, Lcom/vkontakte/android/ViewUtils;->getResFromTheme(Landroid/content/Context;I)I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setImageResource(I)V

    goto :goto_2

    .line 323
    :sswitch_1
    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mIsUser:Z

    .line 324
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->mImage:Lcom/vk/imageloader/view/VKImageView;

    const v1, 0x7f020277

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setImageResource(I)V

    goto :goto_2

    .line 316
    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x7fffffff -> :sswitch_1
    .end sparse-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 299
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 336
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment;->access$1100(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 337
    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->this$0:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment;->access$1100(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$SearchHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/vkontakte/android/functions/VoidF1;->f(Ljava/lang/Object;)V

    .line 339
    :cond_0
    return-void
.end method
