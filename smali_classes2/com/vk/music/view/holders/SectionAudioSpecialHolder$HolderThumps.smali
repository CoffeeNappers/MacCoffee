.class Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;
.super Ljava/lang/Object;
.source "SectionAudioSpecialHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/holders/SectionAudioSpecialHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "HolderThumps"
.end annotation


# instance fields
.field final imageViews:[Lcom/vk/imageloader/view/VKImageView;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field final itemView:Landroid/view/ViewGroup;


# direct methods
.method constructor <init>(ILandroid/view/ViewGroup;)V
    .locals 4
    .param p1, "layout"    # I
        .annotation build Landroid/support/annotation/LayoutRes;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 216
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 217
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, p1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    iput-object v1, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->itemView:Landroid/view/ViewGroup;

    .line 218
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->itemView:Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    new-array v1, v1, [Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    .line 219
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    array-length v1, v1

    if-ge v0, v1, :cond_0

    .line 220
    iget-object v2, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->imageViews:[Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderThumps;->itemView:Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const v3, 0x1020006

    invoke-virtual {v1, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    aput-object v1, v2, v0

    .line 219
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 222
    :cond_0
    return-void
.end method
