.class Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$CenterLayoutManager$CenterSmoothScroller;
.super Landroid/support/v7/widget/LinearSmoothScroller;
.source "MaterialPreferenceFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$CenterLayoutManager;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "CenterSmoothScroller"
.end annotation


# direct methods
.method constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 230
    invoke-direct {p0, p1}, Landroid/support/v7/widget/LinearSmoothScroller;-><init>(Landroid/content/Context;)V

    .line 231
    return-void
.end method


# virtual methods
.method public calculateDtToFit(IIIII)I
    .locals 2
    .param p1, "viewStart"    # I
    .param p2, "viewEnd"    # I
    .param p3, "boxStart"    # I
    .param p4, "boxEnd"    # I
    .param p5, "snapPreference"    # I

    .prologue
    .line 235
    sub-int v0, p4, p3

    div-int/lit8 v0, v0, 0x2

    add-int/2addr v0, p3

    sub-int v1, p2, p1

    div-int/lit8 v1, v1, 0x2

    add-int/2addr v1, p1

    sub-int/2addr v0, v1

    return v0
.end method
