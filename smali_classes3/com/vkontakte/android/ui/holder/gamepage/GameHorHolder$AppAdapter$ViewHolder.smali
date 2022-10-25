.class public Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "GameHorHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/ui/widget/HorizontalRecyclerView$ItemWidthFixable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "ViewHolder"
.end annotation


# instance fields
.field public apiApplications:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/data/ApiApplication;",
            ">;"
        }
    .end annotation
.end field

.field public badge:Landroid/widget/TextView;

.field public imageInstant:Landroid/widget/ImageView;

.field public imageView:Lcom/vk/imageloader/view/VKImageView;

.field public itemWidth:I

.field public lastData:Lcom/vkontakte/android/data/ApiApplication;

.field public textView:Landroid/widget/TextView;

.field public visitSource:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 152
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 154
    const v0, 0x7f1001b5

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->textView:Landroid/widget/TextView;

    .line 155
    const v0, 0x7f1001b2

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setAspectRatio(F)V

    .line 157
    const v0, 0x7f1001b4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->badge:Landroid/widget/TextView;

    .line 158
    const v0, 0x7f1001b3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->imageInstant:Landroid/widget/ImageView;

    .line 159
    iget v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->itemWidth:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->setItemWidth(I)V

    .line 160
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 179
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->visitSource:Ljava/lang/String;

    const-string/jumbo v2, "catalog"

    iget-object v3, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->apiApplications:Ljava/util/ArrayList;

    iget-object v4, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->apiApplications:Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->lastData:Lcom/vkontakte/android/data/ApiApplication;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v4

    invoke-static {v0, v1, v2, v3, v4}, Lcom/vkontakte/android/GameCardActivity;->openApp(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/util/ArrayList;I)V

    .line 180
    return-void
.end method

.method public setItemWidth(I)V
    .locals 1
    .param p1, "itemWidth"    # I

    .prologue
    .line 164
    iget v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->itemWidth:I

    if-ne v0, p1, :cond_1

    .line 173
    :cond_0
    :goto_0
    return-void

    .line 167
    :cond_1
    iput p1, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->itemWidth:I

    .line 168
    if-lez p1, :cond_0

    .line 169
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 170
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->setMinimumWidth(I)V

    .line 171
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/gamepage/GameHorHolder$AppAdapter$ViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->forceLayout()V

    goto :goto_0
.end method
