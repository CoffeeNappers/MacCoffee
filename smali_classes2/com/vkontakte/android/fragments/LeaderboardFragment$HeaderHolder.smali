.class public Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "LeaderboardFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/LeaderboardFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "HeaderHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;",
        ">;"
    }
.end annotation


# instance fields
.field private imageViewGame:Lcom/vk/imageloader/view/VKImageView;

.field private textViewSubtitle:Landroid/widget/TextView;

.field private textViewTitle:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 198
    const v0, 0x7f0300d5

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 200
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100327

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->textViewTitle:Landroid/widget/TextView;

    .line 201
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100328

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->textViewSubtitle:Landroid/widget/TextView;

    .line 202
    iget-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100124

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->imageViewGame:Lcom/vk/imageloader/view/VKImageView;

    .line 203
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;)V
    .locals 6
    .param p1, "item"    # Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    .prologue
    const/4 v3, 0x1

    const/4 v5, 0x0

    .line 207
    iget-object v1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->textViewTitle:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v2, v2, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    const-string/jumbo v0, ""

    .line 210
    .local v0, "subtitleText":Ljava/lang/CharSequence;
    iget-object v1, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget v1, v1, Lcom/vkontakte/android/data/ApiApplication;->leaderboardType:I

    packed-switch v1, :pswitch_data_0

    .line 246
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->textViewSubtitle:Landroid/widget/TextView;

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 247
    iget-object v1, p0, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->imageViewGame:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v2, v2, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    const/16 v3, 0x48

    invoke-static {v3}, Lcom/vk/core/util/Screen;->dp(I)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v2

    iget-object v2, v2, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 248
    return-void

    .line 223
    :pswitch_0
    const v1, 0x7f080312

    new-array v2, v3, [Ljava/lang/Object;

    iget v3, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->userLevelOrPointsCurrent:I

    .line 224
    invoke-static {v3}, Lcom/vkontakte/android/Global;->formatNumberWithThousandSeparator(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 223
    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    .line 226
    goto :goto_0

    .line 240
    :pswitch_1
    const v1, 0x7f0d0024

    iget v2, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->userLevelOrPointsCurrent:I

    new-array v3, v3, [Ljava/lang/Object;

    iget v4, p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;->userLevelOrPointsCurrent:I

    .line 242
    invoke-static {v4}, Lcom/vkontakte/android/Global;->formatNumberWithThousandSeparator(I)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v5

    .line 240
    invoke-virtual {p0, v1, v2, v3}, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    goto :goto_0

    .line 210
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 191
    check-cast p1, Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/LeaderboardFragment$HeaderHolder;->onBind(Lcom/vkontakte/android/api/apps/AppsGetGameLeaderboard$LeaderboardData;)V

    return-void
.end method
