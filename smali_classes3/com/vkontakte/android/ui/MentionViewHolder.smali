.class public Lcom/vkontakte/android/ui/MentionViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "MentionViewHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
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
.field private imageViewPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

.field private textViewShortName:Lcom/vkontakte/android/ui/TextView;

.field private textViewUsername:Lcom/vkontakte/android/ui/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/ui/MentionsManager;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "mentionsManager"    # Lcom/vkontakte/android/ui/MentionsManager;

    .prologue
    .line 22
    const v0, 0x7f030107

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 23
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 24
    iput-object p2, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    .line 26
    const v0, 0x7f1001e8

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/MentionViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->imageViewPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 27
    const v0, 0x7f100393

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/MentionViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->textViewUsername:Lcom/vkontakte/android/ui/TextView;

    .line 28
    const v0, 0x7f100394

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/MentionViewHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->textViewShortName:Lcom/vkontakte/android/ui/TextView;

    .line 29
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->imageViewPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 40
    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->textViewUsername:Lcom/vkontakte/android/ui/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    if-nez v0, :cond_1

    const-string/jumbo v0, ""

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 41
    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->textViewShortName:Lcom/vkontakte/android/ui/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p1}, Lcom/vkontakte/android/UserProfile;->getHasRealDomain()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    const-string/jumbo v0, ""

    :goto_1
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 42
    return-void

    .line 40
    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    goto :goto_0

    .line 41
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "@"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 12
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/MentionViewHolder;->onBind(Lcom/vkontakte/android/UserProfile;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 33
    iget-object v1, p0, Lcom/vkontakte/android/ui/MentionViewHolder;->mentionsManager:Lcom/vkontakte/android/ui/MentionsManager;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/MentionViewHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/MentionsManager;->mentionSelected(Lcom/vkontakte/android/UserProfile;)V

    .line 34
    return-void
.end method
