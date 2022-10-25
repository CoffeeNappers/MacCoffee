.class Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "PhotosOfMeFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ShowAllButtonViewHolder"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)V
    .locals 4

    .prologue
    .line 187
    iput-object p1, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    .line 188
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300f9

    invoke-static {p1}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->access$900(Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;)Lme/grishka/appkit/views/UsableRecyclerView;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 189
    iget-object v0, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100383

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f08068a

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    .line 190
    return-void
.end method


# virtual methods
.method public onClick()V
    .locals 3

    .prologue
    .line 194
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 195
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "album"

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->album:Lcom/vkontakte/android/api/PhotoAlbum;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 196
    const-string/jumbo v1, "no_album_header"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 197
    const-class v1, Lcom/vkontakte/android/fragments/photos/NewPhotoTagsFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment$ShowAllButtonViewHolder;->this$0:Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/photos/PhotosOfMeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 198
    return-void
.end method
