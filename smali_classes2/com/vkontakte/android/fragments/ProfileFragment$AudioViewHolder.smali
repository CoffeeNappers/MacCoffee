.class Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "ProfileFragment.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "AudioViewHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;",
        "Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;"
    }
.end annotation


# instance fields
.field private audioView:Lcom/vkontakte/android/AudioAttachView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 5

    .prologue
    const v4, 0x7f090027

    const/4 v3, 0x0

    .line 3938
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 3939
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(Landroid/view/View;)V

    .line 3940
    new-instance v0, Lcom/vkontakte/android/AudioAttachView;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/AudioAttachView;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    .line 3941
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->itemView:Landroid/view/View;

    check-cast v0, Landroid/view/ViewGroup;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 3942
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    invoke-virtual {v0, v1, v3, v2, v3}, Landroid/view/View;->setPadding(IIII)V

    .line 3943
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;)V
    .locals 9
    .param p1, "item"    # Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    .prologue
    const/4 v8, 0x0

    const/4 v7, 0x0

    .line 3947
    iget-object v6, p1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    .line 3948
    .local v6, "a":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    iget-object v1, v6, Lcom/vkontakte/android/audio/MusicTrack;->artist:Ljava/lang/String;

    iget-object v2, v6, Lcom/vkontakte/android/audio/MusicTrack;->title:Ljava/lang/String;

    iget v3, v6, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget v4, v6, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    iget v5, v6, Lcom/vkontakte/android/audio/MusicTrack;->duration:I

    invoke-virtual/range {v0 .. v5}, Lcom/vkontakte/android/AudioAttachView;->setData(Ljava/lang/String;Ljava/lang/String;III)V

    .line 3949
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/AudioAttachView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 3950
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    invoke-virtual {v0, v8}, Lcom/vkontakte/android/AudioAttachView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 3951
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    invoke-virtual {v0, v7}, Lcom/vkontakte/android/AudioAttachView;->setLongClickable(Z)V

    .line 3952
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    invoke-virtual {v0, v7}, Lcom/vkontakte/android/AudioAttachView;->setClickable(Z)V

    .line 3953
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 3934
    check-cast p1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->onBind(Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;)V

    return-void
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 3957
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    iget v2, v1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-static {v2, v1}, Lcom/vkontakte/android/audio/AudioFacade;->isCurrentTrack(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 3958
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 3959
    .local v0, "context":Landroid/content/Context;
    if-eqz v0, :cond_0

    .line 3960
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleResumePause()V

    .line 3975
    .end local v0    # "context":Landroid/content/Context;
    :cond_0
    :goto_0
    return-void

    .line 3963
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 3966
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    iget v2, v1, Lcom/vkontakte/android/audio/MusicTrack;->oid:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-static {v2, v1}, Lcom/vkontakte/android/audio/AudioFacade;->isCurrentTrack(II)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_0

    .line 3969
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5400(Lcom/vkontakte/android/fragments/ProfileFragment;)Ljava/util/ArrayList;

    move-result-object v1

    if-nez v1, :cond_3

    .line 3970
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-static {v2, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$6600(Lcom/vkontakte/android/fragments/ProfileFragment;I)V

    goto :goto_0

    .line 3972
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->item:Ljava/lang/Object;

    check-cast v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/ProfileFragment$AudioInfoItem;->audio:Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, v1, Lcom/vkontakte/android/audio/MusicTrack;->aid:I

    invoke-static {v2, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$5600(Lcom/vkontakte/android/fragments/ProfileFragment;I)V

    goto :goto_0
.end method

.method public onLongClick()Z
    .locals 2

    .prologue
    .line 3979
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$AudioViewHolder;->audioView:Lcom/vkontakte/android/AudioAttachView;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/AudioAttachView;->onLongClick(Landroid/view/View;)Z

    move-result v0

    return v0
.end method
