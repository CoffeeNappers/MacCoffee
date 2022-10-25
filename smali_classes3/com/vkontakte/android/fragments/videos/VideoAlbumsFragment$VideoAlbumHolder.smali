.class Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "VideoAlbumsFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "VideoAlbumHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/VideoAlbum;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private final mInfo:Landroid/widget/TextView;

.field private final mLock:Landroid/view/View;

.field private final mOptions:Landroid/view/View;

.field private final mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private final mSubtitle:Landroid/widget/TextView;

.field private final mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p1    # Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 239
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    .line 240
    const v0, 0x7f030224

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 241
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mTitle:Landroid/widget/TextView;

    .line 242
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mSubtitle:Landroid/widget/TextView;

    .line 243
    const v0, 0x7f1002b1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mInfo:Landroid/widget/TextView;

    .line 244
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 245
    const v0, 0x7f10057a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mLock:Landroid/view/View;

    .line 246
    const v0, 0x7f10057b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mOptions:Landroid/view/View;

    .line 247
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mOptions:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 248
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 249
    return-void
.end method


# virtual methods
.method synthetic lambda$onClick$0(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 274
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 288
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 276
    :sswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoAlbum;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->editAlbum(Lcom/vkontakte/android/api/VideoAlbum;)V

    goto :goto_0

    .line 280
    :sswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoAlbum;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getAdapterPosition()I

    move-result v2

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->showDeleteDialog(Lcom/vkontakte/android/api/VideoAlbum;I)V

    goto :goto_0

    .line 284
    :sswitch_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/VideoAlbum;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->copyLink(Lcom/vkontakte/android/api/VideoAlbum;)V

    goto :goto_0

    .line 274
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f10000f -> :sswitch_2
        0x7f1005e8 -> :sswitch_1
        0x7f1005f0 -> :sswitch_0
    .end sparse-switch
.end method

.method public onBind(Lcom/vkontakte/android/api/VideoAlbum;)V
    .locals 9
    .param p1, "item"    # Lcom/vkontakte/android/api/VideoAlbum;

    .prologue
    const/16 v2, 0x8

    const/4 v8, 0x1

    const/4 v1, 0x0

    .line 253
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vkontakte/android/api/VideoAlbum;->photoBig:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 254
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mTitle:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/api/VideoAlbum;->title:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 255
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mSubtitle:Landroid/widget/TextView;

    const v3, 0x7f080751

    new-array v4, v8, [Ljava/lang/Object;

    iget v5, p1, Lcom/vkontakte/android/api/VideoAlbum;->lastUpdated:I

    invoke-static {v5}, Lcom/vkontakte/android/TimeUtils;->langDateDay(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    invoke-virtual {p0, v3, v4}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 256
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mInfo:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d0001

    iget v5, p1, Lcom/vkontakte/android/api/VideoAlbum;->count:I

    new-array v6, v8, [Ljava/lang/Object;

    iget v7, p1, Lcom/vkontakte/android/api/VideoAlbum;->count:I

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v1

    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 257
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mOptions:Landroid/view/View;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->mCanEdit:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 258
    iget-object v3, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mLock:Landroid/view/View;

    iget-object v0, p1, Lcom/vkontakte/android/api/VideoAlbum;->privacy:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ne v0, v8, :cond_1

    sget-object v0, Lcom/vkontakte/android/data/PrivacySetting;->ALL:Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/PrivacySetting$PredefinedSet;->apiValue()Ljava/util/List;

    move-result-object v4

    iget-object v0, p1, Lcom/vkontakte/android/api/VideoAlbum;->privacy:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;

    invoke-virtual {v0}, Lcom/vkontakte/android/data/PrivacySetting$PrivacyRule;->apiValue()Ljava/util/List;

    move-result-object v0

    invoke-interface {v4, v0}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_1
    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 259
    return-void

    :cond_0
    move v0, v2

    .line 257
    goto :goto_0

    :cond_1
    move v2, v1

    .line 258
    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 230
    check-cast p1, Lcom/vkontakte/android/api/VideoAlbum;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->onBind(Lcom/vkontakte/android/api/VideoAlbum;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x0

    .line 263
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->itemView:Landroid/view/View;

    if-ne p1, v1, :cond_1

    .line 264
    iget-object v2, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoAlbum;

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->openAlbum(Lcom/vkontakte/android/api/VideoAlbum;)V

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 265
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->mOptions:Landroid/view/View;

    if-ne p1, v1, :cond_0

    .line 266
    new-instance v0, Landroid/support/v7/widget/PopupMenu;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/support/v7/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 267
    .local v0, "pm":Landroid/support/v7/widget/PopupMenu;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/VideoAlbum;->ownerID:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-nez v1, :cond_2

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/VideoAlbum;->ownerID:I

    if-gez v1, :cond_3

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/VideoAlbum;

    iget v1, v1, Lcom/vkontakte/android/api/VideoAlbum;->ownerID:I

    neg-int v1, v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v1

    const/4 v2, 0x2

    if-lt v1, v2, :cond_3

    .line 268
    :cond_2
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f1005f0

    const v3, 0x7f0801c7

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 269
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f1005e8

    const v3, 0x7f08019c

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 271
    :cond_3
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    const v2, 0x7f10000f

    const v3, 0x7f080184

    invoke-interface {v1, v4, v2, v4, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 273
    invoke-static {p0}, Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/videos/VideoAlbumsFragment$VideoAlbumHolder;)Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/support/v7/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 290
    invoke-virtual {v0}, Landroid/support/v7/widget/PopupMenu;->show()V

    goto :goto_0
.end method
