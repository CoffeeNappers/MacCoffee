.class Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;
.super Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;
.source "UsableRecyclerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/grishka/appkit/views/UsableRecyclerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "FooterRecyclerAdapter"
.end annotation


# static fields
.field private static final FOOTER_TYPE_FIRST:I = -0x3e8


# instance fields
.field private footerViews:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lme/grishka/appkit/views/UsableRecyclerView$Adapter",
            "<",
            "Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 502
    .local p1, "wrapped":Lme/grishka/appkit/views/UsableRecyclerView$Adapter;, "Lme/grishka/appkit/views/UsableRecyclerView$Adapter<Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;>;"
    invoke-direct {p0, p1}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;-><init>(Lme/grishka/appkit/views/UsableRecyclerView$Adapter;)V

    .line 499
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->footerViews:Ljava/util/ArrayList;

    .line 503
    return-void
.end method

.method static synthetic access$800(Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;

    .prologue
    .line 497
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->footerViews:Ljava/util/ArrayList;

    return-object v0
.end method


# virtual methods
.method public getItemCount()I
    .locals 2

    .prologue
    .line 507
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->footerViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/2addr v0, v1

    return v0
.end method

.method public getItemId(I)J
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 512
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 513
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemId(I)J

    move-result-wide v0

    .line 514
    :goto_0
    return-wide v0

    :cond_0
    const-wide/16 v0, 0x0

    goto :goto_0
.end method

.method public getItemViewType(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 519
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    .line 520
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemViewType(I)I

    move-result v0

    .line 521
    :goto_0
    return v0

    :cond_0
    add-int/lit16 v0, p1, -0x3e8

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v1

    sub-int/2addr v0, v1

    goto :goto_0
.end method

.method public bridge synthetic onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .prologue
    .line 497
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 526
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->getItemCount()I

    move-result v0

    if-ge p2, v0, :cond_0

    .line 527
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/views/RecyclerViewAdapterWrapper;->onBindViewHolder(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;I)V

    .line 529
    :cond_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 497
    invoke-virtual {p0, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 533
    const/16 v1, -0x3e8

    if-lt p2, v1, :cond_0

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->footerViews:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit16 v1, v1, -0x3e8

    if-ge p2, v1, :cond_0

    .line 534
    add-int/lit16 v0, p2, 0x3e8

    .line 535
    .local v0, "footerIndex":I
    new-instance v2, Lme/grishka/appkit/views/UsableRecyclerView$FooterViewHolder;

    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->footerViews:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-direct {v2, v1}, Lme/grishka/appkit/views/UsableRecyclerView$FooterViewHolder;-><init>(Landroid/view/View;)V

    move-object v1, v2

    .line 537
    .end local v0    # "footerIndex":I
    :goto_0
    return-object v1

    :cond_0
    iget-object v1, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v1, p1, p2}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;

    move-result-object v1

    check-cast v1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    goto :goto_0
.end method

.method public bridge synthetic onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z
    .locals 1

    .prologue
    .line 497
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->onFailedToRecycleView(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)Z

    move-result v0

    return v0
.end method

.method public onFailedToRecycleView(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)Z
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 542
    instance-of v0, p1, Lme/grishka/appkit/views/UsableRecyclerView$FooterViewHolder;

    if-nez v0, :cond_0

    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onFailedToRecycleView(Landroid/support/v7/widget/RecyclerView$ViewHolder;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 497
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->onViewAttachedToWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewAttachedToWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 547
    instance-of v0, p1, Lme/grishka/appkit/views/UsableRecyclerView$FooterViewHolder;

    if-nez v0, :cond_0

    .line 548
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onViewAttachedToWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 549
    :cond_0
    return-void
.end method

.method public bridge synthetic onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 497
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->onViewDetachedFromWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewDetachedFromWindow(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 553
    instance-of v0, p1, Lme/grishka/appkit/views/UsableRecyclerView$FooterViewHolder;

    if-nez v0, :cond_0

    .line 554
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onViewDetachedFromWindow(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 555
    :cond_0
    return-void
.end method

.method public bridge synthetic onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V
    .locals 0

    .prologue
    .line 497
    check-cast p1, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    invoke-virtual {p0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->onViewRecycled(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V

    return-void
.end method

.method public onViewRecycled(Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;)V
    .locals 1
    .param p1, "holder"    # Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;

    .prologue
    .line 559
    instance-of v0, p1, Lme/grishka/appkit/views/UsableRecyclerView$FooterViewHolder;

    if-nez v0, :cond_0

    .line 560
    iget-object v0, p0, Lme/grishka/appkit/views/UsableRecyclerView$FooterRecyclerAdapter;->wrapped:Lme/grishka/appkit/views/UsableRecyclerView$Adapter;

    invoke-virtual {v0, p1}, Lme/grishka/appkit/views/UsableRecyclerView$Adapter;->onViewRecycled(Landroid/support/v7/widget/RecyclerView$ViewHolder;)V

    .line 561
    :cond_0
    return-void
.end method
