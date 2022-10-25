.class Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lcom/vkontakte/android/ui/widget/HorizontalRecyclerView$ItemWidthFixable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "GoodViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/data/Good;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lcom/vkontakte/android/ui/widget/HorizontalRecyclerView$ItemWidthFixable;"
    }
.end annotation


# instance fields
.field final imageView:Lcom/vk/imageloader/view/VKImageView;

.field itemWidth:I

.field lastItem:Lcom/vkontakte/android/data/Good;

.field final text1:Landroid/widget/TextView;

.field final text2:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/ViewGroup;)V
    .locals 3
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 4212
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 4213
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300be

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 4214
    const v0, 0x7f100124

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 4215
    const v0, 0x1020014

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->text1:Landroid/widget/TextView;

    .line 4216
    const v0, 0x1020015

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->text2:Landroid/widget/TextView;

    .line 4217
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->itemWidth:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->setItemWidth(I)V

    .line 4218
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/data/Good;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/data/Good;

    .prologue
    .line 4235
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->lastItem:Lcom/vkontakte/android/data/Good;

    .line 4236
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->text1:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/data/Good;->title:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4237
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->text2:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/data/Good;->price_text:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 4239
    iget-object v1, p1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    if-eqz v1, :cond_1

    iget-object v1, p1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    array-length v1, v1

    if-lez v1, :cond_1

    .line 4240
    iget-object v1, p1, Lcom/vkontakte/android/data/Good;->photos:[Lcom/vkontakte/android/Photo;

    const/4 v2, 0x0

    aget-object v1, v1, v2

    const/high16 v2, 0x43080000    # 136.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 4241
    .local v0, "image1":Lcom/vkontakte/android/Photo$Image;
    if-eqz v0, :cond_0

    .line 4242
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 4249
    .end local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :goto_0
    return-void

    .line 4244
    .restart local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_0

    .line 4247
    .end local v0    # "image1":Lcom/vkontakte/android/Photo$Image;
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 4203
    check-cast p1, Lcom/vkontakte/android/data/Good;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->onBind(Lcom/vkontakte/android/data/Good;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 4253
    new-instance v0, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;

    sget-object v1, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;->group_module:Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->lastItem:Lcom/vkontakte/android/data/Good;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;-><init>(Lcom/vkontakte/android/fragments/market/GoodFragment$Builder$Source;Lcom/vkontakte/android/data/Good;)V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/market/GoodFragment$Builder;->go(Landroid/content/Context;)Z

    .line 4254
    return-void
.end method

.method public setItemWidth(I)V
    .locals 1
    .param p1, "itemWidth"    # I

    .prologue
    .line 4222
    iget v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->itemWidth:I

    if-ne v0, p1, :cond_1

    .line 4231
    :cond_0
    :goto_0
    return-void

    .line 4225
    :cond_1
    iput p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->itemWidth:I

    .line 4226
    if-lez p1, :cond_0

    .line 4227
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 4228
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    .line 4229
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$GoodViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->forceLayout()V

    goto :goto_0
.end method
