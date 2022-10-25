.class public Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;
.super Landroid/support/v4/view/PagerAdapter;
.source "SquareGalleryHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Adapter"
.end annotation


# instance fields
.field private photos:[Lcom/vkontakte/android/Photo;

.field recyclerHolder:Lcom/vkontakte/android/ui/holder/RecyclerHolder;

.field viewPager:Landroid/support/v4/view/ViewPager;


# direct methods
.method public constructor <init>(Landroid/support/v4/view/ViewPager;Lcom/vkontakte/android/ui/holder/RecyclerHolder;)V
    .locals 1
    .param p1, "viewPager"    # Landroid/support/v4/view/ViewPager;
    .param p2, "recyclerHolder"    # Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    .prologue
    .line 74
    invoke-direct {p0}, Landroid/support/v4/view/PagerAdapter;-><init>()V

    .line 70
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    .line 75
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->viewPager:Landroid/support/v4/view/ViewPager;

    .line 76
    iput-object p2, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->recyclerHolder:Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    .line 77
    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I
    .param p3, "view"    # Ljava/lang/Object;

    .prologue
    .line 143
    check-cast p3, Landroid/view/View;

    .end local p3    # "view":Ljava/lang/Object;
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 144
    return-void
.end method

.method public getCount()I
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    array-length v0, v0

    goto :goto_0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 10
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "position"    # I

    .prologue
    .line 98
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-static {v7}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v7

    const v8, 0x7f0300bd

    const/4 v9, 0x0

    invoke-virtual {v7, v8, p1, v9}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    .line 99
    .local v5, "view":Landroid/view/View;
    const v7, 0x7f100124

    invoke-virtual {v5, v7}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/widget/StateListenersImageView;

    .line 100
    .local v2, "imageView":Lcom/vkontakte/android/ui/widget/StateListenersImageView;
    iget-object v7, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    aget-object v3, v7, p2

    .line 101
    .local v3, "photo":Lcom/vkontakte/android/Photo;
    const/16 v7, 0x1e0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v6

    .line 102
    .local v6, "width":I
    invoke-virtual {v3, v6}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v1

    .line 103
    .local v1, "image":Lcom/vkontakte/android/Photo$Image;
    invoke-virtual {p1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 104
    invoke-virtual {p1}, Landroid/view/ViewGroup;->requestLayout()V

    .line 105
    iget-object v7, v1, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v2, v7}, Lcom/vkontakte/android/ui/widget/StateListenersImageView;->load(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v2}, Lcom/vkontakte/android/ui/widget/StateListenersImageView;->getOnAttachStateChangeListeners()Ljava/util/List;

    move-result-object v0

    .line 107
    .local v0, "changeListeners":Ljava/util/List;, "Ljava/util/List<Landroid/view/View$OnAttachStateChangeListener;>;"
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_0

    .line 108
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-interface {v0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/view/View$OnAttachStateChangeListener;

    invoke-virtual {v2, v7}, Lcom/vkontakte/android/ui/widget/StateListenersImageView;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    .line 110
    :cond_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 111
    .local v4, "photoList":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/Photo;>;"
    iget-object v7, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    invoke-static {v4, v7}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 112
    invoke-static {p0, p1, v4, p2, v1}, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;Landroid/view/ViewGroup;Ljava/util/List;ILcom/vkontakte/android/Photo$Image;)Landroid/view/View$OnClickListener;

    move-result-object v7

    invoke-virtual {v5, v7}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    return-object v5
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 1
    .param p1, "view"    # Landroid/view/View;
    .param p2, "object"    # Ljava/lang/Object;

    .prologue
    .line 93
    if-ne p1, p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$instantiateItem$0(Landroid/view/ViewGroup;Ljava/util/List;ILcom/vkontakte/android/Photo$Image;Landroid/view/View;)V
    .locals 3
    .param p1, "container"    # Landroid/view/ViewGroup;
    .param p2, "photoList"    # Ljava/util/List;
    .param p3, "position"    # I
    .param p4, "image"    # Lcom/vkontakte/android/Photo$Image;
    .param p5, "v"    # Landroid/view/View;

    .prologue
    .line 113
    new-instance v0, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    new-instance v2, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter$1;

    invoke-direct {v2, p0, p5, p4}, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter$1;-><init>(Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;Landroid/view/View;Lcom/vkontakte/android/Photo$Image;)V

    invoke-direct {v0, v1, p2, p3, v2}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/util/List;ILcom/vkontakte/android/PhotoViewer$PhotoViewerCallback;)V

    .line 135
    .local v0, "photoViewer":Lcom/vkontakte/android/PhotoViewer;
    iget-object v1, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    array-length v1, v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/PhotoViewer;->setDisplayTotal(I)V

    .line 136
    invoke-virtual {v0}, Lcom/vkontakte/android/PhotoViewer;->show()V

    .line 137
    return-void
.end method

.method public setPhotos([Lcom/vkontakte/android/Photo;)V
    .locals 1
    .param p1, "photos"    # [Lcom/vkontakte/android/Photo;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    invoke-static {p1, v0}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 81
    iput-object p1, p0, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->photos:[Lcom/vkontakte/android/Photo;

    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/market/SquareGalleryHolder$Adapter;->notifyDataSetChanged()V

    .line 84
    :cond_0
    return-void
.end method
