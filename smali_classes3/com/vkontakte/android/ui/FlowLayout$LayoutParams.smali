.class public Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
.super Landroid/view/ViewGroup$LayoutParams;
.source "FlowLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/FlowLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "LayoutParams"
.end annotation


# instance fields
.field public breakAfter:Z

.field public center:Z

.field public floating:Z

.field public height:I

.field public horizontal_spacing:I

.field public vertical_spacing:I

.field public width:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 51
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 52
    return-void
.end method

.method public constructor <init>(II)V
    .locals 1
    .param p1, "horizontal_spacing"    # I
    .param p2, "vertical_spacing"    # I

    .prologue
    const/4 v0, 0x0

    .line 40
    invoke-direct {p0, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    .line 41
    iput p1, p0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->horizontal_spacing:I

    .line 42
    iput p2, p0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    .line 43
    return-void
.end method

.method public static CreateLayoutParamsForZhukovsLayout()Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    .locals 3

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 47
    new-instance v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method
