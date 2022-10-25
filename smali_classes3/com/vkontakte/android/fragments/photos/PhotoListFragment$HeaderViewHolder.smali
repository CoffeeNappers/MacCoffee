.class Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "PhotoListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderViewHolder"
.end annotation


# instance fields
.field private description:Landroid/widget/TextView;

.field private subtitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotoListFragment;)V
    .locals 3

    .prologue
    .line 762
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    .line 763
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const v1, 0x7f030189

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 764
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100128

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->title:Landroid/widget/TextView;

    .line 765
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10019c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->subtitle:Landroid/widget/TextView;

    .line 766
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f1001cc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->description:Landroid/widget/TextView;

    .line 767
    return-void
.end method


# virtual methods
.method public update()V
    .locals 7

    .prologue
    const/4 v6, 0x0

    .line 770
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->title:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v1, v1, Lcom/vkontakte/android/api/PhotoAlbum;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 771
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->subtitle:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0d0044

    iget-object v3, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v3, v3, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget v5, v5, Lcom/vkontakte/android/api/PhotoAlbum;->numPhotos:I

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 772
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v0, v0, Lcom/vkontakte/android/api/PhotoAlbum;->descr:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 773
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->description:Landroid/widget/TextView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 778
    :goto_0
    return-void

    .line 775
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->description:Landroid/widget/TextView;

    invoke-virtual {v0, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 776
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->description:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/photos/PhotoListFragment$HeaderViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotoListFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/photos/PhotoListFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    iget-object v1, v1, Lcom/vkontakte/android/api/PhotoAlbum;->descr:Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0
.end method
