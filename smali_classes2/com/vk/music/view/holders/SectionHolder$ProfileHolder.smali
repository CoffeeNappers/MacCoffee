.class Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "SectionHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/holders/SectionHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ProfileHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field final imageView:Lcom/vk/imageloader/view/VKImageView;

.field final textView:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 376
    const v0, 0x7f030151

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 377
    const v0, 0x1020006

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 378
    const v0, 0x1020016

    invoke-virtual {p0, v0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->textView:Landroid/widget/TextView;

    .line 380
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 381
    return-void
.end method

.method private getImage()Ljava/lang/String;
    .locals 2

    .prologue
    .line 398
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    const-string/jumbo v1, "/community_50.png"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    const-string/jumbo v1, "/community_100.png"

    .line 399
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    const-string/jumbo v1, "/community_200.png"

    .line 400
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 401
    :cond_0
    const/4 v0, 0x0

    .line 403
    :goto_0
    return-object v0

    :cond_1
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->item:Ljava/lang/Object;

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    goto :goto_0
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 385
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->textView:Landroid/widget/TextView;

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 386
    iget-object v2, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget v1, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v1, :cond_0

    const v1, 0x7f02039c

    :goto_0
    invoke-virtual {v2, v1}, Lcom/vk/imageloader/view/VKImageView;->setPlaceholderImage(I)V

    .line 389
    invoke-direct {p0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->getImage()Ljava/lang/String;

    move-result-object v0

    .line 390
    .local v0, "image":Ljava/lang/String;
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 391
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v1}, Lcom/vk/imageloader/view/VKImageView;->clear()V

    .line 395
    :goto_1
    return-void

    .line 386
    .end local v0    # "image":Ljava/lang/String;
    :cond_0
    const v1, 0x7f020387

    goto :goto_0

    .line 393
    .restart local v0    # "image":Ljava/lang/String;
    :cond_1
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 369
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 409
    new-instance v1, Lcom/vk/music/fragment/MusicFragment$Builder;

    invoke-direct {v1}, Lcom/vk/music/fragment/MusicFragment$Builder;-><init>()V

    .line 410
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget v0, v0, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/MusicFragment$Builder;->ownerId(I)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v0

    .line 411
    invoke-direct {p0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->getImage()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/MusicFragment$Builder;->setOwnerImage(Ljava/lang/String;)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v1

    .line 412
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    const/16 v2, 0xb

    invoke-virtual {v0, v2}, Lcom/vkontakte/android/UserProfile;->getNameInCase(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/MusicFragment$Builder;->setOwnerNameGen(Ljava/lang/String;)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v1

    .line 413
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lcom/vk/music/fragment/MusicFragment$Builder;->setOwnerNameFull(Ljava/lang/String;)Lcom/vk/music/fragment/MusicFragment$Builder;

    move-result-object v0

    .line 414
    invoke-virtual {p0}, Lcom/vk/music/view/holders/SectionHolder$ProfileHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/music/fragment/MusicFragment$Builder;->go(Landroid/content/Context;)Z

    .line 415
    return-void
.end method
