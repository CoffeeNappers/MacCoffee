.class final Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileGiftsFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Landroid/view/View$OnClickListener;
.implements Landroid/widget/PopupMenu$OnMenuItemClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "Holder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/api/models/GiftItem;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Landroid/view/View$OnClickListener;",
        "Landroid/widget/PopupMenu$OnMenuItemClickListener;"
    }
.end annotation


# instance fields
.field private mDate:Landroid/widget/TextView;

.field private mFrom:Landroid/widget/TextView;

.field private mGift:Lcom/vk/imageloader/view/VKImageView;

.field private mOptions:Landroid/view/View;

.field private mPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private mSubtitle:Landroid/widget/TextView;

.field private mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 267
    iput-object p1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    .line 268
    const v0, 0x7f0300f2

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 269
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 270
    const v0, 0x7f10037d

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mOptions:Landroid/view/View;

    .line 271
    const v0, 0x7f10037f

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mGift:Lcom/vk/imageloader/view/VKImageView;

    .line 272
    const v0, 0x7f10037e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mDate:Landroid/widget/TextView;

    .line 273
    const v0, 0x7f10037c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mFrom:Landroid/widget/TextView;

    .line 274
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mTitle:Landroid/widget/TextView;

    .line 275
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mSubtitle:Landroid/widget/TextView;

    .line 276
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mOptions:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 277
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/api/models/GiftItem;)V
    .locals 4
    .param p1, "data"    # Lcom/vkontakte/android/api/models/GiftItem;

    .prologue
    const/4 v1, 0x0

    const/16 v2, 0x8

    .line 281
    iget-object v0, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    if-eqz v0, :cond_4

    iget-object v0, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->photo:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4

    .line 282
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-object v3, v3, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 286
    :goto_0
    iget-object v0, p1, Lcom/vkontakte/android/api/models/GiftItem;->gift:Lcom/vkontakte/android/api/models/Gift;

    if-eqz v0, :cond_0

    .line 287
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mGift:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/GiftItem;->gift:Lcom/vkontakte/android/api/models/Gift;

    iget-object v3, v3, Lcom/vkontakte/android/api/models/Gift;->thumb_256:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 289
    :cond_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mFrom:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    if-eqz v0, :cond_5

    iget-object v0, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->fullName:Ljava/lang/String;

    :goto_1
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 290
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mDate:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/GiftItem;->dateStr:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 291
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mTitle:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/GiftItem;->message:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 292
    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mSubtitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/api/models/GiftItem;->isPrivate()Z

    move-result v0

    if-eqz v0, :cond_6

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget v0, v0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mUserId:I

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v0

    if-eqz v0, :cond_6

    move v0, v1

    :goto_2
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 293
    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mTitle:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/api/models/GiftItem;->message:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mSubtitle:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getVisibility()I

    move-result v0

    if-ne v0, v2, :cond_7

    move v0, v2

    :goto_3
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 294
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mOptions:Landroid/view/View;

    iget-object v3, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    if-eqz v3, :cond_1

    iget-object v3, p1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-boolean v3, v3, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->can_see_gifts:Z

    if-nez v3, :cond_2

    :cond_1
    iget-object v3, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget v3, v3, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mUserId:I

    invoke-static {v3}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v3

    if-eqz v3, :cond_3

    :cond_2
    move v2, v1

    :cond_3
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    .line 296
    return-void

    .line 284
    :cond_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mPhoto:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v0}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    goto :goto_0

    .line 289
    :cond_5
    const v0, 0x7f08028e

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_6
    move v0, v2

    .line 292
    goto :goto_2

    :cond_7
    move v0, v1

    .line 293
    goto :goto_3
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 258
    check-cast p1, Lcom/vkontakte/android/api/models/GiftItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->onBind(Lcom/vkontakte/android/api/models/GiftItem;)V

    return-void
.end method

.method public onClick()V
    .locals 1

    .prologue
    .line 334
    iget-object v0, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->itemView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->onClick(Landroid/view/View;)V

    .line 335
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 7
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v6, 0x7f080292

    const v5, 0x7f08019c

    const/4 v4, 0x0

    .line 300
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_3

    .line 301
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->itemView:Landroid/view/View;

    if-ne p1, v1, :cond_0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/GiftItem;

    iget v1, v1, Lcom/vkontakte/android/api/models/GiftItem;->from_id:I

    if-eqz v1, :cond_0

    .line 302
    iget-object v2, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/GiftItem;

    iget v1, v1, Lcom/vkontakte/android/api/models/GiftItem;->from_id:I

    invoke-virtual {v2, v1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->openProfile(I)V

    .line 304
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->mOptions:Landroid/view/View;

    if-ne p1, v1, :cond_3

    .line 305
    new-instance v0, Landroid/widget/PopupMenu;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 306
    .local v0, "menu":Landroid/widget/PopupMenu;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/GiftItem;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/GiftItem;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-boolean v1, v1, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->can_see_gifts:Z

    if-eqz v1, :cond_1

    .line 307
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v2

    const/4 v1, 0x1

    new-array v3, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/api/models/GiftItem;

    iget-object v1, v1, Lcom/vkontakte/android/api/models/GiftItem;->from:Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;

    iget-object v1, v1, Lcom/vkontakte/android/api/gifts/GiftsGet$UserProfile;->first_name_gen:Ljava/lang/String;

    aput-object v1, v3, v4

    invoke-virtual {p0, v6, v3}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v4, v6, v4, v1}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 309
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->mUserId:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 310
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v1

    invoke-interface {v1, v4, v5, v4, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 312
    :cond_2
    invoke-virtual {v0, p0}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 313
    invoke-virtual {v0}, Landroid/widget/PopupMenu;->show()V

    .line 317
    .end local v0    # "menu":Landroid/widget/PopupMenu;
    :cond_3
    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 321
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 329
    :goto_0
    const/4 v0, 0x1

    return v0

    .line 323
    :sswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftItem;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->showUsersGifts(Lcom/vkontakte/android/api/models/GiftItem;)V

    goto :goto_0

    .line 326
    :sswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->this$0:Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment$Holder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/api/models/GiftItem;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/gifts/ProfileGiftsFragment;->showGiftDeleteDialog(Lcom/vkontakte/android/api/models/GiftItem;)V

    goto :goto_0

    .line 321
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f08019c -> :sswitch_1
        0x7f080292 -> :sswitch_0
    .end sparse-switch
.end method
