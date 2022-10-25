.class public Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "GameInfoHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "AppAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;

.field private urls:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;)V
    .locals 1
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;

    .prologue
    .line 156
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->this$0:Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder;

    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 157
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->urls:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .prologue
    .line 191
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->urls:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 156
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;I)V
    .locals 4
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 180
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->urls:Ljava/util/ArrayList;

    invoke-virtual {v1, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vkontakte/android/Photo;

    const/16 v2, 0x68

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/Photo;->getImage(C)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 181
    .local v0, "image":Lcom/vkontakte/android/Photo$Image;
    if-eqz v0, :cond_0

    .line 182
    iget v1, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    if-eqz v1, :cond_0

    .line 183
    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget v2, v0, Lcom/vkontakte/android/Photo$Image;->width:I

    int-to-float v2, v2

    iget v3, v0, Lcom/vkontakte/android/Photo$Image;->height:I

    int-to-float v3, v3

    invoke-virtual {v1, v2, v3}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(FF)V

    .line 184
    iget-object v1, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 187
    :cond_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 156
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 175
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f03003e

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter$ViewHolder;-><init>(Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;Landroid/view/View;)V

    return-object v0
.end method

.method public setUrls(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/Photo;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 169
    .local p1, "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    if-nez p1, :cond_0

    new-instance p1, Ljava/util/ArrayList;

    .end local p1    # "urls":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/Photo;>;"
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    :cond_0
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->urls:Ljava/util/ArrayList;

    .line 170
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameInfoHolder$AppAdapter;->notifyDataSetChanged()V

    .line 171
    return-void
.end method
