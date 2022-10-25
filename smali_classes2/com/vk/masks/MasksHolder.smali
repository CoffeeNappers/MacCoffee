.class public Lcom/vk/masks/MasksHolder;
.super Landroid/support/v7/widget/RecyclerView$ViewHolder;
.source "MasksHolder.java"


# static fields
.field private static final lock:Lcom/vk/core/util/TimeoutLock;

.field private static final masksController:Lcom/vk/masks/MasksController;


# instance fields
.field private final downloadView:Landroid/view/View;

.field private final image:Lcom/vk/imageloader/view/VKImageView;

.field private mask:Lcom/vk/masks/model/Mask;

.field private final maskDisabled:Landroid/view/View;

.field private final selectionView:Landroid/view/View;

.field private final unsupportedView:Landroid/view/View;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 15
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0xc8

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    sput-object v0, Lcom/vk/masks/MasksHolder;->lock:Lcom/vk/core/util/TimeoutLock;

    .line 16
    invoke-static {}, Lcom/vk/masks/MasksController;->getInstance()Lcom/vk/masks/MasksController;

    move-result-object v0

    sput-object v0, Lcom/vk/masks/MasksHolder;->masksController:Lcom/vk/masks/MasksController;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/vk/masks/MasksAdapter;)V
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "adapter"    # Lcom/vk/masks/MasksAdapter;

    .prologue
    .line 27
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0300dd

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/support/v7/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 28
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/vk/masks/MasksHolder$1;

    invoke-direct {v1, p0, p2}, Lcom/vk/masks/MasksHolder$1;-><init>(Lcom/vk/masks/MasksHolder;Lcom/vk/masks/MasksAdapter;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 36
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100339

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vk/masks/MasksHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    .line 37
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->setHasOverlappingRendering(Z)V

    .line 39
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10033a

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksHolder;->downloadView:Landroid/view/View;

    .line 40
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10033b

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksHolder;->unsupportedView:Landroid/view/View;

    .line 41
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100338

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksHolder;->selectionView:Landroid/view/View;

    .line 42
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10033c

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/masks/MasksHolder;->maskDisabled:Landroid/view/View;

    .line 43
    return-void
.end method

.method static synthetic access$000()Lcom/vk/core/util/TimeoutLock;
    .locals 1

    .prologue
    .line 13
    sget-object v0, Lcom/vk/masks/MasksHolder;->lock:Lcom/vk/core/util/TimeoutLock;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vk/masks/MasksHolder;)Lcom/vk/masks/model/Mask;
    .locals 1
    .param p0, "x0"    # Lcom/vk/masks/MasksHolder;

    .prologue
    .line 13
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->mask:Lcom/vk/masks/model/Mask;

    return-object v0
.end method


# virtual methods
.method public update(Lcom/vk/masks/model/Mask;Z)V
    .locals 7
    .param p1, "mask"    # Lcom/vk/masks/model/Mask;
    .param p2, "selected"    # Z

    .prologue
    const/4 v6, 0x1

    const v5, 0x3e99999a    # 0.3f

    const/4 v0, 0x0

    const/4 v1, 0x4

    .line 46
    iput-object p1, p0, Lcom/vk/masks/MasksHolder;->mask:Lcom/vk/masks/model/Mask;

    .line 48
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    iget-object v3, p1, Lcom/vk/masks/model/Mask;->preview:Ljava/lang/String;

    sget-object v4, Lcom/vk/imageloader/ImageSize;->VERY_SMALL:Lcom/vk/imageloader/ImageSize;

    invoke-virtual {v2, v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;Lcom/vk/imageloader/ImageSize;)V

    .line 49
    if-eqz p2, :cond_0

    .line 50
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->selectionView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 51
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->downloadView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 52
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->unsupportedView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->maskDisabled:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 76
    :goto_0
    return-void

    .line 55
    :cond_0
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->selectionView:Landroid/view/View;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    .line 56
    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->isSupported()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->isDisabled()Z

    move-result v2

    if-nez v2, :cond_2

    .line 57
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-virtual {v2, v3}, Lcom/vk/imageloader/view/VKImageView;->setAlpha(F)V

    .line 58
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 59
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->downloadView:Landroid/view/View;

    sget-object v3, Lcom/vk/masks/MasksHolder;->masksController:Lcom/vk/masks/MasksController;

    invoke-virtual {v3, p1}, Lcom/vk/masks/MasksController;->needDownload(Lcom/vk/masks/model/Mask;)Z

    move-result v3

    if-eqz v3, :cond_1

    :goto_1
    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 60
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->unsupportedView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 61
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->maskDisabled:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    :cond_1
    move v0, v1

    .line 59
    goto :goto_1

    .line 62
    :cond_2
    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->isSupported()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-virtual {p1}, Lcom/vk/masks/model/Mask;->isDisabled()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 63
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, v5}, Lcom/vk/imageloader/view/VKImageView;->setAlpha(F)V

    .line 64
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, v6}, Landroid/view/View;->setEnabled(Z)V

    .line 65
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->unsupportedView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 66
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->downloadView:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setVisibility(I)V

    .line 67
    iget-object v1, p0, Lcom/vk/masks/MasksHolder;->maskDisabled:Landroid/view/View;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0

    .line 69
    :cond_3
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->image:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2, v5}, Lcom/vk/imageloader/view/VKImageView;->setAlpha(F)V

    .line 70
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setEnabled(Z)V

    .line 71
    iget-object v2, p0, Lcom/vk/masks/MasksHolder;->unsupportedView:Landroid/view/View;

    invoke-virtual {v2, v0}, Landroid/view/View;->setVisibility(I)V

    .line 72
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->downloadView:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 73
    iget-object v0, p0, Lcom/vk/masks/MasksHolder;->maskDisabled:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
