.class abstract Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "PhotoAlbumListFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x402
    name = "AbsPhotoAlbumViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/PhotoAlbum;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private menuBtn:Landroid/widget/ImageView;

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private quantity:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;I)V
    .locals 6
    .param p1    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "layout"    # I

    .prologue
    .line 442
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    .line 443
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {p0, p2, v1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/content/Context;)V

    .line 444
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f10044e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->title:Landroid/widget/TextView;

    .line 445
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f10044f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->quantity:Landroid/widget/TextView;

    .line 447
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f10044c

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    .line 448
    .local v0, "imageView":Landroid/view/View;
    if-eqz v0, :cond_0

    instance-of v1, v0, Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_0

    .line 449
    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    .end local v0    # "imageView":Landroid/view/View;
    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 450
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    const v2, -0xd0d0e

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderColor(I)V

    .line 453
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f100450

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->menuBtn:Landroid/widget/ImageView;

    .line 454
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->itemView:Landroid/view/View;

    new-instance v2, Landroid/support/v7/widget/RecyclerView$LayoutParams;

    const/4 v3, -0x1

    invoke-static {p1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$2300(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)I

    move-result v4

    int-to-float v4, v4

    const/high16 v5, 0x3f400000    # 0.75f

    mul-float/2addr v4, v5

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-direct {v2, v3, v4}, Landroid/support/v7/widget/RecyclerView$LayoutParams;-><init>(II)V

    invoke-virtual {v1, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 455
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->menuBtn:Landroid/widget/ImageView;

    new-instance v2, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;

    invoke-direct {v2, p0, p1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder$1;-><init>(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 485
    return-void
.end method

.method static synthetic access$2400(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    .prologue
    .line 436
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$2500(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    .prologue
    .line 436
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$2700(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    .prologue
    .line 436
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method

.method static synthetic access$2800(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;)Ljava/lang/Object;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;

    .prologue
    .line 436
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    return-object v0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/PhotoAlbum;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/api/PhotoAlbum;

    .prologue
    .line 489
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$2300(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3f400000    # 0.75f

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 490
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 491
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->quantity:Landroid/widget/TextView;

    iget v1, p1, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 492
    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->menuBtn:Landroid/widget/ImageView;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$3000(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p1, Lcom/vkontakte/android/api/PhotoAlbum;->id:I

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->access$3100(Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 493
    iget v0, p1, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    if-lez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 494
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/api/PhotoAlbum;->thumbURL:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 496
    :cond_0
    return-void

    .line 492
    :cond_1
    const/16 v0, 0x8

    goto :goto_0
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 436
    check-cast p1, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->onBind(Lcom/vkontakte/android/api/PhotoAlbum;)V

    return-void
.end method

.method public onClick()V
    .locals 5

    .prologue
    .line 500
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "select_album"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 501
    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    .line 502
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "album"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    check-cast v2, Landroid/os/Parcelable;

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 503
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v1}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 504
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    .line 514
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 507
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 508
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v3, "album"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    check-cast v2, Landroid/os/Parcelable;

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 509
    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "select"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    .line 510
    new-instance v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    check-cast v2, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;-><init>(Lcom/vkontakte/android/api/PhotoAlbum;)V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;->go(Landroid/content/Context;)Z

    goto :goto_0

    .line 512
    :cond_1
    new-instance v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->item:Ljava/lang/Object;

    check-cast v2, Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-direct {v3, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;-><init>(Lcom/vkontakte/android/api/PhotoAlbum;)V

    const/4 v2, 0x1

    invoke-virtual {v3, v2}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;->setSelect(Z)Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment$AbsPhotoAlbumViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoAlbumListFragment;

    const/16 v4, 0x2066

    invoke-virtual {v2, v3, v4}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0
.end method
