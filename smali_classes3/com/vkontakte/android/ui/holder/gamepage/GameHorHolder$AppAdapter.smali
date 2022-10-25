.class public Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;
.super Lme/grishka/appkit/views/UsableRecyclerView$Adapter;
.source "GameHorHolder.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/HorizontalRecyclerView$ItemWidthFixable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "AppAdapter"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
        "<",
        "Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;",
        ">;",
        "Lcom/vkontakte/android/ui/widget/HorizontalRecyclerView$ItemWidthFixable;"
    }
.end annotation


# instance fields
.field private apiApplications:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;"
        }
    .end annotation
.end field

.field private final canShowBadge:Z

.field private itemWidth:I

.field private listHolder:Lcom/vkontakte/android/ui/holder/RecyclerHolder;

.field private final visitSource:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1
    .param p1, "visitSource"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "canShowBadge"    # Z

    .prologue
    .line 130
    invoke-direct {p0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;-><init>()V

    .line 122
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->apiApplications:Ljava/util/ArrayList;

    .line 131
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->visitSource:Ljava/lang/String;

    .line 132
    iput-boolean p2, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->canShowBadge:Z

    .line 133
    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;Lcom/vkontakte/android/ui/holder/RecyclerHolder;)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;
    .param p1, "x1"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    .prologue
    .line 120
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->listHolder:Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    return-object p1
.end method


# virtual methods
.method public clearNotificationOnApp(I)V
    .locals 3
    .param p1, "appId"    # I

    .prologue
    .line 184
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    .line 185
    .local v0, "application":Lcom/vkontakte/android/data/ApiApplication;
    iget v2, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    if-ne v2, p1, :cond_0

    .line 186
    const/4 v2, 0x0

    iput v2, v0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    goto :goto_0

    .line 189
    .end local v0    # "application":Lcom/vkontakte/android/data/ApiApplication;
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->notifyDataSetChanged()V

    .line 190
    return-void
.end method

.method public getItemCount()I
    .locals 1

    .prologue
    .line 218
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 120
    check-cast p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;I)V
    .locals 5
    .param p1, "holder"    # Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;
    .param p2, "position"    # I

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 204
    iget v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->itemWidth:I

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->setItemWidth(I)V

    .line 206
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->apiApplications:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    iput-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->lastData:Lcom/vkontakte/android/data/ApiApplication;

    .line 207
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->textView:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->lastData:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v3, v3, Lcom/vkontakte/android/data/ApiApplication;->title:Ljava/lang/String;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 208
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->badge:Landroid/widget/TextView;

    iget-object v3, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->lastData:Lcom/vkontakte/android/data/ApiApplication;

    iget v3, v3, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 209
    iget-object v3, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->badge:Landroid/widget/TextView;

    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->lastData:Lcom/vkontakte/android/data/ApiApplication;

    iget v0, v0, Lcom/vkontakte/android/data/ApiApplication;->notificationCount:I

    if-lez v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->canShowBadge:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 210
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->lastData:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v3, v3, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    const/high16 v4, 0x42e00000    # 112.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v3

    iget-object v3, v3, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 211
    iget-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->imageInstant:Landroid/widget/ImageView;

    iget-object v3, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->lastData:Lcom/vkontakte/android/data/ApiApplication;

    iget-boolean v3, v3, Lcom/vkontakte/android/data/ApiApplication;->isHtml5App:Z

    if-eqz v3, :cond_1

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 212
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->apiApplications:Ljava/util/ArrayList;

    iput-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->apiApplications:Ljava/util/ArrayList;

    .line 213
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->visitSource:Ljava/lang/String;

    iput-object v0, p1, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->visitSource:Ljava/lang/String;

    .line 214
    return-void

    :cond_0
    move v0, v2

    .line 209
    goto :goto_0

    :cond_1
    move v1, v2

    .line 211
    goto :goto_1
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 120
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;
    .locals 4
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 199
    new-instance v0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const v2, 0x7f030030

    const/4 v3, 0x0

    invoke-virtual {v1, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;-><init>(Landroid/view/View;)V

    return-object v0
.end method

.method public setApiApplications(Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 193
    .local p1, "apiApplications":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/data/ApiApplication;>;"
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->apiApplications:Ljava/util/ArrayList;

    .line 194
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->notifyDataSetChanged()V

    .line 195
    return-void
.end method

.method public setItemWidth(I)V
    .locals 0
    .param p1, "itemWidth"    # I

    .prologue
    .line 137
    iput p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;->itemWidth:I

    .line 138
    return-void
.end method
