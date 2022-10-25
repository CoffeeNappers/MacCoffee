.class Lcom/vk/music/fragment/MusicPromoFragment$Item;
.super Ljava/lang/Object;
.source "MusicPromoFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/fragment/MusicPromoFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Item"
.end annotation


# instance fields
.field final button:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field final image:I
    .annotation build Landroid/support/annotation/DrawableRes;
    .end annotation
.end field

.field final text:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field

.field final title:I
    .annotation build Landroid/support/annotation/StringRes;
    .end annotation
.end field


# direct methods
.method public constructor <init>(IIII)V
    .locals 0
    .param p1, "title"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p2, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p3, "button"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param
    .param p4, "image"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput p1, p0, Lcom/vk/music/fragment/MusicPromoFragment$Item;->title:I

    .line 51
    iput p2, p0, Lcom/vk/music/fragment/MusicPromoFragment$Item;->text:I

    .line 52
    iput p3, p0, Lcom/vk/music/fragment/MusicPromoFragment$Item;->button:I

    .line 53
    iput p4, p0, Lcom/vk/music/fragment/MusicPromoFragment$Item;->image:I

    .line 54
    return-void
.end method
