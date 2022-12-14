.class public Lcom/vkontakte/android/ViewUtils;
.super Ljava/lang/Object;
.source "ViewUtils.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ViewUtils$ActionModeCallback;
    }
.end annotation


# static fields
.field private static handler:Landroid/os/Handler;

.field private static visibilityAnims:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Landroid/view/View;",
            "Landroid/animation/ObjectAnimator;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 57
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    .line 474
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$000()Ljava/util/HashMap;
    .locals 1

    .prologue
    .line 55
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    return-object v0
.end method

.method public static cancelVisibilityAnimation(Landroid/view/View;)V
    .locals 1
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 687
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 692
    :goto_0
    return-void

    .line 690
    :cond_0
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/animation/ObjectAnimator;

    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 691
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    goto :goto_0
.end method

.method public static colorizeSubmenu(Landroid/view/SubMenu;I)V
    .locals 6
    .param p0, "menu"    # Landroid/view/SubMenu;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "color"    # I
        .annotation build Landroid/support/annotation/ColorInt;
        .end annotation
    .end param

    .prologue
    .line 817
    if-eqz p0, :cond_2

    .line 818
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-interface {p0}, Landroid/view/SubMenu;->size()I

    move-result v4

    if-ge v0, v4, :cond_2

    .line 819
    invoke-interface {p0, v0}, Landroid/view/SubMenu;->getItem(I)Landroid/view/MenuItem;

    move-result-object v2

    .line 820
    .local v2, "item":Landroid/view/MenuItem;
    if-eqz v2, :cond_1

    .line 821
    invoke-interface {v2}, Landroid/view/MenuItem;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 822
    .local v1, "icon":Landroid/graphics/drawable/Drawable;
    invoke-interface {v2}, Landroid/view/MenuItem;->getSubMenu()Landroid/view/SubMenu;

    move-result-object v3

    .line 823
    .local v3, "subMenu":Landroid/view/SubMenu;
    if-eqz v1, :cond_0

    .line 824
    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    sget-object v5, Landroid/graphics/PorterDuff$Mode;->SRC_IN:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {v4, p1, v5}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 826
    :cond_0
    if-eqz v3, :cond_1

    .line 827
    invoke-static {v3, p1}, Lcom/vkontakte/android/ViewUtils;->colorizeSubmenu(Landroid/view/SubMenu;I)V

    .line 818
    .end local v1    # "icon":Landroid/graphics/drawable/Drawable;
    .end local v3    # "subMenu":Landroid/view/SubMenu;
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 832
    .end local v0    # "i":I
    .end local v2    # "item":Landroid/view/MenuItem;
    :cond_2
    return-void
.end method

.method public static dismissDialogSafety(Landroid/app/Dialog;)V
    .locals 3
    .param p0, "dialog"    # Landroid/app/Dialog;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 68
    if-eqz p0, :cond_0

    .line 69
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 71
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 85
    :cond_0
    :goto_0
    return-void

    .line 72
    :catch_0
    move-exception v0

    .line 73
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 76
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    sget-object v1, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils$$Lambda$1;->lambdaFactory$(Landroid/app/Dialog;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static dismissDialogSafety(Landroid/support/v7/widget/PopupMenu;)V
    .locals 3
    .param p0, "dialog"    # Landroid/support/v7/widget/PopupMenu;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 88
    if-eqz p0, :cond_0

    .line 89
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 91
    :try_start_0
    invoke-virtual {p0}, Landroid/support/v7/widget/PopupMenu;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 105
    :cond_0
    :goto_0
    return-void

    .line 92
    :catch_0
    move-exception v0

    .line 93
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 96
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    sget-object v1, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils$$Lambda$2;->lambdaFactory$(Landroid/support/v7/widget/PopupMenu;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method

.method public static dumpViewHierarchy(Landroid/view/View;I)V
    .locals 6
    .param p0, "v"    # Landroid/view/View;
    .param p1, "depth"    # I

    .prologue
    .line 704
    const-string/jumbo v1, ""

    .line 705
    .local v1, "logstr":Ljava/lang/String;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    if-ge v0, p1, :cond_0

    .line 706
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "-"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 705
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 708
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 709
    instance-of v4, p0, Landroid/widget/TextView;

    if-eqz v4, :cond_1

    .line 710
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " [\'"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v4, p0

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "\']"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 712
    :cond_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " ("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "x"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ")"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 713
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v4

    sparse-switch v4, :sswitch_data_0

    .line 724
    :goto_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " BG="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 725
    instance-of v4, p0, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_2

    .line 726
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " FG="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    move-object v4, p0

    check-cast v4, Landroid/widget/FrameLayout;

    invoke-virtual {v4}, Landroid/widget/FrameLayout;->getForeground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 728
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " pad="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 729
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    instance-of v4, v4, Landroid/view/ViewGroup$MarginLayoutParams;

    if-eqz v4, :cond_3

    .line 730
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 731
    .local v2, "pp":Landroid/view/ViewGroup$MarginLayoutParams;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " margins="

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ";"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 733
    .end local v2    # "pp":Landroid/view/ViewGroup$MarginLayoutParams;
    :cond_3
    const-string/jumbo v4, "vk"

    invoke-static {v4, v1}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 734
    instance-of v4, p0, Landroid/view/ViewGroup;

    if-eqz v4, :cond_4

    move-object v3, p0

    .line 735
    check-cast v3, Landroid/view/ViewGroup;

    .line 736
    .local v3, "vg":Landroid/view/ViewGroup;
    const/4 v0, 0x0

    :goto_2
    invoke-virtual {v3}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v4

    if-ge v0, v4, :cond_4

    .line 737
    invoke-virtual {v3, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v4

    add-int/lit8 v5, p1, 0x1

    invoke-static {v4, v5}, Lcom/vkontakte/android/ViewUtils;->dumpViewHierarchy(Landroid/view/View;I)V

    .line 736
    add-int/lit8 v0, v0, 0x1

    goto :goto_2

    .line 715
    .end local v3    # "vg":Landroid/view/ViewGroup;
    :sswitch_0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " VISIBLE"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 716
    goto/16 :goto_1

    .line 718
    :sswitch_1
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " INVISIBLE"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 719
    goto/16 :goto_1

    .line 721
    :sswitch_2
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " GONE"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto/16 :goto_1

    .line 740
    :cond_4
    return-void

    .line 713
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_0
        0x4 -> :sswitch_1
        0x8 -> :sswitch_2
    .end sparse-switch
.end method

.method public static fetchSystemColor(Landroid/content/Context;I)I
    .locals 6
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "colorAttrId"    # I

    .prologue
    const/4 v5, 0x0

    .line 835
    new-instance v2, Landroid/util/TypedValue;

    invoke-direct {v2}, Landroid/util/TypedValue;-><init>()V

    .line 836
    .local v2, "typedValue":Landroid/util/TypedValue;
    iget v3, v2, Landroid/util/TypedValue;->data:I

    const/4 v4, 0x1

    new-array v4, v4, [I

    aput p1, v4, v5

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 837
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v5, v5}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 838
    .local v1, "color":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 839
    return v1
.end method

.method public static findViewByType(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;
    .locals 4
    .param p0, "container"    # Landroid/view/View;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/View;",
            "Ljava/lang/Class",
            "<+",
            "Landroid/view/View;",
            ">;)",
            "Landroid/view/View;"
        }
    .end annotation

    .prologue
    .line 477
    .local p1, "type":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/view/View;>;"
    invoke-virtual {p1, p0}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 489
    .end local p0    # "container":Landroid/view/View;
    :goto_0
    return-object p0

    .line 480
    .restart local p0    # "container":Landroid/view/View;
    :cond_0
    instance-of v3, p0, Landroid/view/ViewGroup;

    if-eqz v3, :cond_2

    move-object v0, p0

    .line 481
    check-cast v0, Landroid/view/ViewGroup;

    .line 482
    .local v0, "g":Landroid/view/ViewGroup;
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v3

    if-ge v1, v3, :cond_2

    .line 483
    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    invoke-static {v3, p1}, Lcom/vkontakte/android/ViewUtils;->findViewByType(Landroid/view/View;Ljava/lang/Class;)Landroid/view/View;

    move-result-object v2

    .line 484
    .local v2, "result":Landroid/view/View;
    if-eqz v2, :cond_1

    move-object p0, v2

    .line 485
    goto :goto_0

    .line 482
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 489
    .end local v0    # "g":Landroid/view/ViewGroup;
    .end local v1    # "i":I
    .end local v2    # "result":Landroid/view/View;
    :cond_2
    const/4 p0, 0x0

    goto :goto_0
.end method

.method public static fixActionModeCallback(Landroid/support/v7/app/AppCompatActivity;Landroid/support/v7/view/ActionMode;)V
    .locals 9
    .param p0, "activity"    # Landroid/support/v7/app/AppCompatActivity;
    .param p1, "mode"    # Landroid/support/v7/view/ActionMode;

    .prologue
    .line 133
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v8, 0x15

    if-ge v7, v8, :cond_1

    .line 285
    :cond_0
    :goto_0
    return-void

    .line 137
    :cond_1
    instance-of v7, p1, Landroid/support/v7/view/StandaloneActionMode;

    if-eqz v7, :cond_0

    .line 142
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string/jumbo v8, "mCallback"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    .line 143
    .local v2, "mCallbackField":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v2, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 144
    invoke-virtual {v2, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    .line 146
    .local v1, "mCallback":Ljava/lang/Object;
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v7

    const-string/jumbo v8, "mWrapped"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 147
    .local v6, "mWrappedField":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v6, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 148
    invoke-virtual {v6, v1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/support/v7/view/ActionMode$Callback;

    .line 150
    .local v5, "mWrapped":Landroid/support/v7/view/ActionMode$Callback;
    const-class v7, Landroid/support/v7/app/AppCompatActivity;

    const-string/jumbo v8, "mDelegate"

    invoke-virtual {v7, v8}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    .line 151
    .local v4, "mDelegateField":Ljava/lang/reflect/Field;
    const/4 v7, 0x1

    invoke-virtual {v4, v7}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 152
    invoke-virtual {v4, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    .line 154
    .local v3, "mDelegate":Ljava/lang/Object;
    new-instance v7, Lcom/vkontakte/android/ViewUtils$1;

    invoke-direct {v7, v5, v3}, Lcom/vkontakte/android/ViewUtils$1;-><init>(Landroid/support/v7/view/ActionMode$Callback;Ljava/lang/Object;)V

    invoke-virtual {v2, p1, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 282
    .end local v1    # "mCallback":Ljava/lang/Object;
    .end local v2    # "mCallbackField":Ljava/lang/reflect/Field;
    .end local v3    # "mDelegate":Ljava/lang/Object;
    .end local v4    # "mDelegateField":Ljava/lang/reflect/Field;
    .end local v5    # "mWrapped":Landroid/support/v7/view/ActionMode$Callback;
    .end local v6    # "mWrappedField":Ljava/lang/reflect/Field;
    :catch_0
    move-exception v0

    .line 283
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method

.method public static getBoolFromTheme(Landroid/content/Context;I)Z
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "attr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 295
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [I

    aput p1, v3, v4

    invoke-virtual {v2, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 296
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v4, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    .line 297
    .local v1, "value":Z
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 298
    return v1
.end method

.method public static getDeviceDefaultOrientation(Landroid/content/Context;)I
    .locals 6
    .param p0, "activity"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x2

    const/4 v4, 0x1

    .line 600
    const-string/jumbo v5, "window"

    invoke-virtual {p0, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/WindowManager;

    .line 601
    .local v2, "windowManager":Landroid/view/WindowManager;
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    .line 602
    .local v0, "config":Landroid/content/res/Configuration;
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Display;->getRotation()I

    move-result v1

    .line 604
    .local v1, "rotation":I
    if-eqz v1, :cond_0

    if-ne v1, v3, :cond_1

    :cond_0
    iget v5, v0, Landroid/content/res/Configuration;->orientation:I

    if-eq v5, v3, :cond_3

    :cond_1
    if-eq v1, v4, :cond_2

    const/4 v5, 0x3

    if-ne v1, v5, :cond_4

    :cond_2
    iget v5, v0, Landroid/content/res/Configuration;->orientation:I

    if-ne v5, v4, :cond_4

    .line 610
    :cond_3
    :goto_0
    return v3

    :cond_4
    move v3, v4

    goto :goto_0
.end method

.method public static getDeviceDegreesInPortraitMode(Landroid/content/Context;)I
    .locals 2
    .param p0, "activity"    # Landroid/content/Context;

    .prologue
    .line 615
    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils;->getDeviceDefaultOrientation(Landroid/content/Context;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    :goto_0
    return v0

    :cond_0
    const/16 v0, 0x5a

    goto :goto_0
.end method

.method public static getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "res"    # I
        .annotation build Landroid/support/annotation/DrawableRes;
        .end annotation
    .end param

    .prologue
    .line 60
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_0

    .line 61
    invoke-virtual {p0, p1}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 63
    :goto_0
    return-object v0

    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    goto :goto_0
.end method

.method public static getMeasurement(IIII)I
    .locals 5
    .param p0, "measureSpec"    # I
    .param p1, "minSize"    # I
    .param p2, "maxSize"    # I
    .param p3, "contentSize"    # I

    .prologue
    .line 846
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 847
    .local v0, "specMode":I
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 848
    .local v1, "specSize":I
    sparse-switch v0, :sswitch_data_0

    .line 868
    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "Unknown specMode: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 852
    :sswitch_0
    if-lt v1, p1, :cond_0

    if-ge v1, p3, :cond_1

    .line 865
    .end local v1    # "specSize":I
    :cond_0
    :goto_0
    :sswitch_1
    return v1

    .line 857
    .restart local v1    # "specSize":I
    :cond_1
    invoke-static {p3, p2}, Ljava/lang/Math;->min(II)I

    move-result v2

    .line 855
    invoke-static {p1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    goto :goto_0

    .line 860
    :sswitch_2
    if-ge p3, p1, :cond_2

    move v1, p1

    .line 861
    goto :goto_0

    .line 862
    :cond_2
    if-le p3, p2, :cond_3

    move v1, p2

    .line 863
    goto :goto_0

    :cond_3
    move v1, p3

    .line 865
    goto :goto_0

    .line 848
    nop

    :sswitch_data_0
    .sparse-switch
        -0x80000000 -> :sswitch_0
        0x0 -> :sswitch_2
        0x40000000 -> :sswitch_1
    .end sparse-switch
.end method

.method public static getNavigationBarHeight(Landroid/content/Context;)I
    .locals 5
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 779
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    .line 780
    .local v1, "resources":Landroid/content/res/Resources;
    const-string/jumbo v2, "navigation_bar_height"

    const-string/jumbo v3, "dimen"

    const-string/jumbo v4, "android"

    invoke-virtual {v1, v2, v3, v4}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 781
    .local v0, "resourceId":I
    if-lez v0, :cond_0

    .line 782
    invoke-virtual {v1, v0}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    .line 784
    :goto_0
    return v2

    :cond_0
    const/4 v2, 0x0

    goto :goto_0
.end method

.method public static getResFromTheme(Landroid/content/Context;I)I
    .locals 5
    .param p0, "ctx"    # Landroid/content/Context;
    .param p1, "attr"    # I
        .annotation build Landroid/support/annotation/AttrRes;
        .end annotation
    .end param

    .prologue
    const/4 v4, 0x0

    .line 288
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v2

    const/4 v3, 0x1

    new-array v3, v3, [I

    aput p1, v3, v4

    invoke-virtual {v2, v3}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object v0

    .line 289
    .local v0, "a":Landroid/content/res/TypedArray;
    invoke-virtual {v0, v4, v4}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v1

    .line 290
    .local v1, "resourceId":I
    invoke-virtual {v0}, Landroid/content/res/TypedArray;->recycle()V

    .line 291
    return v1
.end method

.method public static getScreenOrientation(Landroid/app/Activity;)I
    .locals 8
    .param p0, "act"    # Landroid/app/Activity;

    .prologue
    .line 543
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Display;->getRotation()I

    move-result v3

    .line 544
    .local v3, "rotation":I
    new-instance v0, Landroid/util/DisplayMetrics;

    invoke-direct {v0}, Landroid/util/DisplayMetrics;-><init>()V

    .line 545
    .local v0, "dm":Landroid/util/DisplayMetrics;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object v5

    invoke-virtual {v5, v0}, Landroid/view/Display;->getMetrics(Landroid/util/DisplayMetrics;)V

    .line 546
    iget v4, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 547
    .local v4, "width":I
    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    .line 550
    .local v1, "height":I
    if-eqz v3, :cond_0

    const/4 v5, 0x2

    if-ne v3, v5, :cond_1

    :cond_0
    if-gt v1, v4, :cond_3

    :cond_1
    const/4 v5, 0x1

    if-eq v3, v5, :cond_2

    const/4 v5, 0x3

    if-ne v3, v5, :cond_4

    :cond_2
    if-le v4, v1, :cond_4

    .line 554
    :cond_3
    packed-switch v3, :pswitch_data_0

    .line 568
    const-string/jumbo v5, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Unknown screen orientation "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ". Defaulting to portrait."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 569
    const/4 v2, 0x1

    .line 596
    .local v2, "orientation":I
    :goto_0
    return v2

    .line 556
    .end local v2    # "orientation":I
    :pswitch_0
    const/4 v2, 0x1

    .line 557
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 559
    .end local v2    # "orientation":I
    :pswitch_1
    const/4 v2, 0x0

    .line 560
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 562
    .end local v2    # "orientation":I
    :pswitch_2
    const/16 v2, 0x9

    .line 563
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 565
    .end local v2    # "orientation":I
    :pswitch_3
    const/16 v2, 0x8

    .line 566
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 576
    .end local v2    # "orientation":I
    :cond_4
    packed-switch v3, :pswitch_data_1

    .line 590
    const-string/jumbo v5, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "Unknown screen orientation "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ". Defaulting to landscape."

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 591
    const/4 v2, 0x0

    .restart local v2    # "orientation":I
    goto :goto_0

    .line 578
    .end local v2    # "orientation":I
    :pswitch_4
    const/4 v2, 0x0

    .line 579
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 581
    .end local v2    # "orientation":I
    :pswitch_5
    const/16 v2, 0x9

    .line 582
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 584
    .end local v2    # "orientation":I
    :pswitch_6
    const/16 v2, 0x8

    .line 585
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 587
    .end local v2    # "orientation":I
    :pswitch_7
    const/4 v2, 0x1

    .line 588
    .restart local v2    # "orientation":I
    goto :goto_0

    .line 554
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch

    .line 576
    :pswitch_data_1
    .packed-switch 0x0
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
    .end packed-switch
.end method

.method public static getStatusBarHeight()I
    .locals 6

    .prologue
    .line 695
    const/4 v1, 0x0

    .line 696
    .local v1, "result":I
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const-string/jumbo v3, "status_bar_height"

    const-string/jumbo v4, "dimen"

    const-string/jumbo v5, "android"

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    .line 697
    .local v0, "resourceId":I
    if-lez v0, :cond_0

    .line 698
    sget-object v2, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 700
    :cond_0
    return v1
.end method

.method public static getSuggestedAvailableSizeFromSpec(IIII)I
    .locals 4
    .param p0, "spec"    # I
    .param p1, "minSize"    # I
    .param p2, "maxSize"    # I
    .param p3, "usedSize"    # I

    .prologue
    const/4 v3, 0x0

    .line 876
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    .line 877
    .local v1, "specSize":I
    invoke-static {p0}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    .line 879
    .local v0, "specMode":I
    const/high16 v2, 0x40000000    # 2.0f

    if-eq v0, v2, :cond_0

    const/high16 v2, -0x80000000

    if-ne v0, v2, :cond_3

    .line 881
    :cond_0
    if-ge v1, p1, :cond_1

    .line 882
    sub-int v2, p1, p3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    .line 889
    :goto_0
    return v2

    .line 883
    :cond_1
    if-le v1, p2, :cond_2

    .line 884
    sub-int v2, p2, p3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_0

    .line 886
    :cond_2
    sub-int v2, v1, p3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_0

    .line 889
    :cond_3
    sub-int v2, p2, p3

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    goto :goto_0
.end method

.method public static getTypingText(Landroid/content/Context;ILjava/util/List;Landroid/util/SparseArray;Lcom/vkontakte/android/functions/VoidF0;I)Landroid/text/SpannableString;
    .locals 10
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "peer"    # I
    .param p3    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p4, "f"    # Lcom/vkontakte/android/functions/VoidF0;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p5, "color"    # I
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I",
            "Ljava/util/List",
            "<+",
            "Ljava/lang/Object;",
            ">;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;",
            "Lcom/vkontakte/android/functions/VoidF0;",
            "I)",
            "Landroid/text/SpannableString;"
        }
    .end annotation

    .prologue
    .local p2, "users":Ljava/util/List;, "Ljava/util/List<+Ljava/lang/Object;>;"
    .local p3, "prMap":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const/4 v6, 0x2

    const/4 v9, 0x1

    const/4 v8, 0x0

    .line 307
    if-eqz p0, :cond_0

    if-eqz p2, :cond_0

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_1

    .line 308
    :cond_0
    const/4 v1, 0x0

    .line 329
    :goto_0
    return-object v1

    .line 309
    :cond_1
    const v3, 0x77359400

    if-ge p1, v3, :cond_2

    .line 310
    const v3, 0x7f080718

    invoke-virtual {p0, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 319
    .local v2, "text":Ljava/lang/String;
    :goto_1
    new-instance v1, Landroid/text/SpannableString;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, " ..."

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 320
    .local v1, "ss":Landroid/text/SpannableString;
    new-instance v0, Lcom/vkontakte/android/ViewUtils$2;

    invoke-direct {v0, p5, p4}, Lcom/vkontakte/android/ViewUtils$2;-><init>(ILcom/vkontakte/android/functions/VoidF0;)V

    .line 327
    .local v0, "d":Lcom/vkontakte/android/ui/drawables/TypingDrawable;
    invoke-virtual {v0}, Lcom/vkontakte/android/ui/drawables/TypingDrawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/drawables/TypingDrawable;->getIntrinsicHeight()I

    move-result v4

    invoke-virtual {v0, v8, v8, v3, v4}, Lcom/vkontakte/android/ui/drawables/TypingDrawable;->setBounds(IIII)V

    .line 328
    new-instance v3, Landroid/text/style/ImageSpan;

    invoke-direct {v3, v0, v9}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v5

    add-int/lit8 v5, v5, 0x4

    const/16 v6, 0x11

    invoke-virtual {v1, v3, v4, v5, v6}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    goto :goto_0

    .line 311
    .end local v0    # "d":Lcom/vkontakte/android/ui/drawables/TypingDrawable;
    .end local v1    # "ss":Landroid/text/SpannableString;
    .end local v2    # "text":Ljava/lang/String;
    :cond_2
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v9, :cond_3

    .line 312
    const v3, 0x7f080719

    new-array v4, v9, [Ljava/lang/Object;

    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5, p3}, Lcom/vkontakte/android/ViewUtils;->getTypingUserName(Ljava/lang/Object;Landroid/util/SparseArray;)Ljava/lang/CharSequence;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "text":Ljava/lang/String;
    goto :goto_1

    .line 313
    .end local v2    # "text":Ljava/lang/String;
    :cond_3
    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v3

    if-ne v3, v6, :cond_4

    .line 314
    const v3, 0x7f08071a

    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5, p3}, Lcom/vkontakte/android/ViewUtils;->getTypingUserName(Ljava/lang/Object;Landroid/util/SparseArray;)Ljava/lang/CharSequence;

    move-result-object v5

    aput-object v5, v4, v8

    invoke-interface {p2, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    invoke-static {v5, p3}, Lcom/vkontakte/android/ViewUtils;->getTypingUserName(Ljava/lang/Object;Landroid/util/SparseArray;)Ljava/lang/CharSequence;

    move-result-object v5

    aput-object v5, v4, v9

    invoke-virtual {p0, v3, v4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "text":Ljava/lang/String;
    goto :goto_1

    .line 316
    .end local v2    # "text":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0d005f

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v5

    add-int/lit8 v5, v5, -0x1

    new-array v6, v6, [Ljava/lang/Object;

    .line 317
    invoke-interface {p2, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-static {v7, p3}, Lcom/vkontakte/android/ViewUtils;->getTypingUserName(Ljava/lang/Object;Landroid/util/SparseArray;)Ljava/lang/CharSequence;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result v7

    add-int/lit8 v7, v7, -0x1

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v9

    .line 316
    invoke-virtual {v3, v4, v5, v6}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .restart local v2    # "text":Ljava/lang/String;
    goto/16 :goto_1
.end method

.method private static getTypingUserName(Ljava/lang/Object;Landroid/util/SparseArray;)Ljava/lang/CharSequence;
    .locals 6
    .param p0, "o"    # Ljava/lang/Object;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1    # Landroid/util/SparseArray;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Landroid/util/SparseArray",
            "<",
            "Lcom/vkontakte/android/UserProfile;",
            ">;)",
            "Ljava/lang/CharSequence;"
        }
    .end annotation

    .prologue
    .local p1, "profileMap":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Lcom/vkontakte/android/UserProfile;>;"
    const/16 v3, 0x10

    const/4 v5, 0x0

    .line 334
    instance-of v2, p0, Ljava/lang/Integer;

    if-eqz v2, :cond_1

    if-eqz p1, :cond_1

    move-object v2, p0

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/UserProfile;

    move-object v1, v2

    .line 335
    .local v1, "up":Lcom/vkontakte/android/UserProfile;
    :goto_0
    instance-of v2, p0, Lcom/vkontakte/android/UserProfile;

    if-eqz v2, :cond_0

    check-cast p0, Lcom/vkontakte/android/UserProfile;

    .end local p0    # "o":Ljava/lang/Object;
    move-object v1, p0

    :cond_0
    if-eqz v1, :cond_4

    .line 336
    iget-object v2, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-le v2, v3, :cond_2

    iget-object v2, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v2, v5, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 337
    .local v0, "ret":Ljava/lang/String;
    :goto_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v2, v1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_3

    const-string/jumbo v2, ""

    :goto_2
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 339
    .end local v0    # "ret":Ljava/lang/String;
    :goto_3
    return-object v2

    .line 334
    .end local v1    # "up":Lcom/vkontakte/android/UserProfile;
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    .line 336
    .end local p0    # "o":Ljava/lang/Object;
    .restart local v1    # "up":Lcom/vkontakte/android/UserProfile;
    :cond_2
    iget-object v0, v1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    goto :goto_1

    .line 337
    .restart local v0    # "ret":Ljava/lang/String;
    :cond_3
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v4, v1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->charAt(I)C

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, "."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    .line 339
    .end local v0    # "ret":Ljava/lang/String;
    :cond_4
    const-string/jumbo v2, "?"

    goto :goto_3
.end method

.method public static getViewOffset(Landroid/view/View;Landroid/view/View;)Landroid/graphics/Point;
    .locals 6
    .param p0, "v1"    # Landroid/view/View;
    .param p1, "v2"    # Landroid/view/View;

    .prologue
    const/4 v2, 0x2

    const/4 v5, 0x1

    const/4 v4, 0x0

    .line 493
    new-array v0, v2, [I

    fill-array-data v0, :array_0

    .local v0, "p1":[I
    new-array v1, v2, [I

    fill-array-data v1, :array_1

    .line 494
    .local v1, "p2":[I
    invoke-virtual {p0, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 495
    invoke-virtual {p1, v1}, Landroid/view/View;->getLocationOnScreen([I)V

    .line 497
    new-instance v2, Landroid/graphics/Point;

    aget v3, v0, v4

    aget v4, v1, v4

    sub-int/2addr v3, v4

    aget v4, v0, v5

    aget v5, v1, v5

    sub-int/2addr v4, v5

    invoke-direct {v2, v3, v4}, Landroid/graphics/Point;-><init>(II)V

    return-object v2

    .line 493
    nop

    :array_0
    .array-data 4
        0x0
        0x0
    .end array-data

    :array_1
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public static getViewOnClickListener(Landroid/view/View;)Landroid/view/View$OnClickListener;
    .locals 6
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 502
    :try_start_0
    const-class v3, Landroid/view/View;

    const-string/jumbo v4, "getListenerInfo"

    const/4 v5, 0x0

    new-array v5, v5, [Ljava/lang/Class;

    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 503
    .local v0, "getListenerInfo":Ljava/lang/reflect/Method;
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 504
    const/4 v3, 0x0

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 505
    .local v2, "listenerInfo":Ljava/lang/Object;
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string/jumbo v4, "mOnClickListener"

    invoke-virtual {v3, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 506
    .local v1, "listenerField":Ljava/lang/reflect/Field;
    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 507
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/view/View$OnClickListener;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 510
    .end local v0    # "getListenerInfo":Ljava/lang/reflect/Method;
    .end local v1    # "listenerField":Ljava/lang/reflect/Field;
    .end local v2    # "listenerInfo":Ljava/lang/Object;
    :goto_0
    return-object v3

    .line 508
    :catch_0
    move-exception v3

    .line 510
    const/4 v3, 0x0

    goto :goto_0
.end method

.method public static invalidate(Landroid/view/View;)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 421
    if-eqz p0, :cond_0

    .line 422
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 424
    :cond_0
    return-void
.end method

.method public static invalidateViewCascade(Landroid/view/View;)V
    .locals 2
    .param p0, "view"    # Landroid/view/View;

    .prologue
    .line 344
    instance-of v1, p0, Landroid/view/ViewGroup;

    if-eqz v1, :cond_0

    move-object v1, p0

    .line 345
    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_0

    move-object v1, p0

    .line 346
    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ViewUtils;->invalidateViewCascade(Landroid/view/View;)V

    .line 345
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 349
    .end local v0    # "i":I
    :cond_0
    if-eqz p0, :cond_1

    .line 350
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 352
    :cond_1
    return-void
.end method

.method public static isImmersiveModeOrNoNavigationBar(Landroid/app/Activity;)Z
    .locals 5
    .param p0, "activity"    # Landroid/app/Activity;

    .prologue
    const/4 v2, 0x1

    .line 788
    const v3, 0x1020002

    invoke-virtual {p0, v3}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    .line 789
    .local v1, "rootView":Landroid/view/View;
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v3

    invoke-virtual {v3}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 790
    .local v0, "decorView":Landroid/view/View;
    if-eqz v1, :cond_0

    if-eqz v0, :cond_0

    .line 791
    invoke-virtual {v0}, Landroid/view/View;->getBottom()I

    move-result v3

    invoke-virtual {v1}, Landroid/view/View;->getBottom()I

    move-result v4

    if-ne v3, v4, :cond_1

    .line 793
    :cond_0
    :goto_0
    return v2

    .line 791
    :cond_1
    const/4 v2, 0x0

    goto :goto_0
.end method

.method static synthetic lambda$dismissDialogSafety$0(Landroid/app/Dialog;)V
    .locals 2
    .param p0, "dialog"    # Landroid/app/Dialog;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 78
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 82
    :goto_0
    return-void

    .line 79
    :catch_0
    move-exception v0

    .line 80
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static synthetic lambda$dismissDialogSafety$1(Landroid/support/v7/widget/PopupMenu;)V
    .locals 2
    .param p0, "dialog"    # Landroid/support/v7/widget/PopupMenu;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 98
    :try_start_0
    invoke-virtual {p0}, Landroid/support/v7/widget/PopupMenu;->dismiss()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 102
    :goto_0
    return-void

    .line 99
    :catch_0
    move-exception v0

    .line 100
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method static synthetic lambda$showDialogSafety$2(Landroid/app/Dialog;)V
    .locals 2
    .param p0, "dialog"    # Landroid/app/Dialog;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 118
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 122
    :goto_0
    return-void

    .line 119
    :catch_0
    move-exception v0

    .line 120
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public static post(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 431
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 432
    return-void
.end method

.method public static postDelayed(Ljava/lang/Runnable;J)V
    .locals 1
    .param p0, "r"    # Ljava/lang/Runnable;
    .param p1, "delay"    # J

    .prologue
    .line 427
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0, p1, p2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 428
    return-void
.end method

.method public static removeCallbacks(Ljava/lang/Runnable;)V
    .locals 1
    .param p0, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 435
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 436
    return-void
.end method

.method public static runOnPreDraw(Landroid/view/View;ZLjava/lang/Runnable;)V
    .locals 2
    .param p0, "view"    # Landroid/view/View;
    .param p1, "doDraw"    # Z
    .param p2, "runnable"    # Ljava/lang/Runnable;

    .prologue
    .line 894
    invoke-virtual {p0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ViewUtils$5;

    invoke-direct {v1, p0, p2, p1}, Lcom/vkontakte/android/ViewUtils$5;-><init>(Landroid/view/View;Ljava/lang/Runnable;Z)V

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 902
    return-void
.end method

.method public static runOnUiThread(Landroid/content/Context;Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "ctx"    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "action"    # Ljava/lang/Runnable;

    .prologue
    .line 445
    if-eqz p0, :cond_0

    .line 446
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 447
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 452
    :cond_0
    :goto_0
    return-void

    .line 449
    :cond_1
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public static runOnUiThread(Ljava/lang/Runnable;)V
    .locals 2
    .param p0, "action"    # Ljava/lang/Runnable;

    .prologue
    .line 455
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 456
    sget-object v0, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 460
    :goto_0
    return-void

    .line 458
    :cond_0
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public static scrollBy(Landroid/view/View;II)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "x"    # I
    .param p2, "y"    # I

    .prologue
    .line 373
    if-eqz p0, :cond_0

    .line 374
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->scrollBy(II)V

    .line 376
    :cond_0
    return-void
.end method

.method public static setBackgroundWithViewPadding(Landroid/view/View;Landroid/graphics/drawable/Drawable;)V
    .locals 10
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "background"    # Landroid/graphics/drawable/Drawable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 798
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    .line 799
    .local v2, "oldBackground":Landroid/graphics/drawable/Drawable;
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    .line 800
    .local v1, "left":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    .line 801
    .local v5, "top":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    .line 802
    .local v4, "right":I
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    .line 803
    .local v0, "bottom":I
    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    .line 804
    .local v3, "padding":Landroid/graphics/Rect;
    if-eqz v2, :cond_0

    .line 805
    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 806
    iget v6, v3, Landroid/graphics/Rect;->left:I

    sub-int/2addr v1, v6

    .line 807
    iget v6, v3, Landroid/graphics/Rect;->top:I

    sub-int/2addr v5, v6

    .line 808
    iget v6, v3, Landroid/graphics/Rect;->right:I

    sub-int/2addr v4, v6

    .line 809
    iget v6, v3, Landroid/graphics/Rect;->bottom:I

    sub-int/2addr v0, v6

    .line 811
    :cond_0
    invoke-virtual {p1, v3}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 812
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 813
    iget v6, v3, Landroid/graphics/Rect;->left:I

    add-int/2addr v6, v1

    iget v7, v3, Landroid/graphics/Rect;->top:I

    add-int/2addr v7, v5

    iget v8, v3, Landroid/graphics/Rect;->right:I

    add-int/2addr v8, v4

    iget v9, v3, Landroid/graphics/Rect;->bottom:I

    add-int/2addr v9, v0

    invoke-virtual {p0, v6, v7, v8, v9}, Landroid/view/View;->setPadding(IIII)V

    .line 814
    return-void
.end method

.method public static setBottomPadding(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "p"    # I

    .prologue
    .line 409
    if-eqz p0, :cond_0

    .line 410
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v2

    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/view/View;->setPadding(IIII)V

    .line 412
    :cond_0
    return-void
.end method

.method public static setEnabled(Landroid/view/View;Z)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "enable"    # Z

    .prologue
    .line 463
    if-eqz p0, :cond_0

    .line 464
    invoke-virtual {p0, p1}, Landroid/view/View;->setEnabled(Z)V

    .line 466
    :cond_0
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    move-object v1, p0

    .line 467
    check-cast v1, Landroid/view/ViewGroup;

    .line 468
    .local v1, "viewGroup":Landroid/view/ViewGroup;
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    add-int/lit8 v0, v2, -0x1

    .local v0, "i":I
    :goto_0
    if-ltz v0, :cond_1

    .line 469
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/vkontakte/android/ViewUtils;->setEnabled(Landroid/view/View;Z)V

    .line 468
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 472
    .end local v0    # "i":I
    .end local v1    # "viewGroup":Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method

.method public static setLeftPadding(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "p"    # I

    .prologue
    .line 391
    if-eqz p0, :cond_0

    .line 392
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0, p1, v0, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 394
    :cond_0
    return-void
.end method

.method public static setNavigationBarColor(Landroid/view/Window;I)V
    .locals 5
    .param p0, "window"    # Landroid/view/Window;
    .param p1, "color"    # I

    .prologue
    .line 766
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 774
    :goto_0
    return-void

    .line 770
    :cond_0
    const/high16 v0, -0x80000000

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    .line 771
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string/jumbo v1, "setNavigationBarColor"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Class;

    const/4 v3, 0x0

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v3

    invoke-virtual {v0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 772
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static setNoClipRecursive(Landroid/view/View;)V
    .locals 4
    .param p0, "view"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 514
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    move-object v1, p0

    .line 515
    check-cast v1, Landroid/view/ViewGroup;

    .line 517
    .local v1, "vg":Landroid/view/ViewGroup;
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 518
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 519
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 520
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    .line 521
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ViewUtils;->setNoClipRecursive(Landroid/view/View;)V

    .line 519
    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 525
    .end local v0    # "i":I
    .end local v1    # "vg":Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method

.method public static setNoFitRecursive(Landroid/view/View;)V
    .locals 4
    .param p0, "view"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x0

    .line 528
    instance-of v2, p0, Landroid/view/ViewGroup;

    if-eqz v2, :cond_1

    move-object v1, p0

    .line 529
    check-cast v1, Landroid/view/ViewGroup;

    .line 531
    .local v1, "vg":Landroid/view/ViewGroup;
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setClipChildren(Z)V

    .line 532
    invoke-virtual {v1, v3}, Landroid/view/ViewGroup;->setClipToPadding(Z)V

    .line 533
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 534
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    instance-of v2, v2, Landroid/view/ViewGroup;

    if-eqz v2, :cond_0

    .line 535
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/ViewUtils;->setNoFitRecursive(Landroid/view/View;)V

    .line 537
    :cond_0
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v3}, Landroid/view/View;->setFitsSystemWindows(Z)V

    .line 533
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 540
    .end local v0    # "i":I
    .end local v1    # "vg":Landroid/view/ViewGroup;
    :cond_1
    return-void
.end method

.method public static setPadding(Landroid/view/View;IIII)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "l"    # I
    .param p2, "t"    # I
    .param p3, "b"    # I
    .param p4, "r"    # I

    .prologue
    .line 385
    if-eqz p0, :cond_0

    .line 386
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/view/View;->setPadding(IIII)V

    .line 388
    :cond_0
    return-void
.end method

.method public static setRightPadding(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "p"    # I

    .prologue
    .line 403
    if-eqz p0, :cond_0

    .line 404
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0, v0, v1, p1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 406
    :cond_0
    return-void
.end method

.method public static setStatusBarColor(Landroid/view/Window;I)V
    .locals 2
    .param p0, "window"    # Landroid/view/Window;
    .param p1, "color"    # I

    .prologue
    .line 749
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_0

    .line 757
    :goto_0
    return-void

    .line 753
    :cond_0
    const/high16 v0, -0x80000000

    :try_start_0
    invoke-virtual {p0, v0}, Landroid/view/Window;->addFlags(I)V

    .line 754
    invoke-virtual {p0, p1}, Landroid/view/Window;->setStatusBarColor(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 755
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public static setText(Landroid/widget/TextView;Ljava/lang/Object;)V
    .locals 1
    .param p0, "textView"    # Landroid/widget/TextView;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "text"    # Ljava/lang/Object;

    .prologue
    .line 355
    const/4 v0, 0x0

    invoke-static {p0, p1, v0}, Lcom/vkontakte/android/ViewUtils;->setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V

    .line 356
    return-void
.end method

.method public static setText(Landroid/widget/TextView;Ljava/lang/Object;Z)V
    .locals 1
    .param p0, "textView"    # Landroid/widget/TextView;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "text"    # Ljava/lang/Object;
    .param p2, "useHideIfEmpty"    # Z

    .prologue
    .line 359
    if-nez p0, :cond_1

    .line 370
    .end local p1    # "text":Ljava/lang/Object;
    :cond_0
    :goto_0
    return-void

    .line 362
    .restart local p1    # "text":Ljava/lang/Object;
    :cond_1
    instance-of v0, p1, Ljava/lang/Integer;

    if-eqz v0, :cond_2

    .line 363
    check-cast p1, Ljava/lang/Integer;

    .end local p1    # "text":Ljava/lang/Object;
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(I)V

    .line 367
    :goto_1
    if-eqz p2, :cond_0

    .line 368
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-nez v0, :cond_3

    const/16 v0, 0x8

    :goto_2
    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 365
    .restart local p1    # "text":Ljava/lang/Object;
    :cond_2
    check-cast p1, Ljava/lang/CharSequence;

    .end local p1    # "text":Ljava/lang/Object;
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 368
    :cond_3
    const/4 v0, 0x0

    goto :goto_2
.end method

.method public static setTopPadding(Landroid/view/View;I)V
    .locals 3
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "p"    # I

    .prologue
    .line 397
    if-eqz p0, :cond_0

    .line 398
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v2

    invoke-virtual {p0, v0, p1, v1, v2}, Landroid/view/View;->setPadding(IIII)V

    .line 400
    :cond_0
    return-void
.end method

.method public static setTranslationY(Landroid/view/View;F)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "translationY"    # F

    .prologue
    .line 379
    if-eqz p0, :cond_0

    .line 380
    invoke-virtual {p0, p1}, Landroid/view/View;->setTranslationY(F)V

    .line 382
    :cond_0
    return-void
.end method

.method public static setVisibility(Landroid/view/View;I)V
    .locals 0
    .param p0, "view"    # Landroid/view/View;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "visibility"    # I

    .prologue
    .line 415
    if-eqz p0, :cond_0

    .line 416
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    .line 418
    :cond_0
    return-void
.end method

.method public static setVisibilityAnimated(Landroid/view/View;I)V
    .locals 10
    .param p0, "view"    # Landroid/view/View;
    .param p1, "visibility"    # I

    .prologue
    const v8, 0x7f100085

    const/high16 v9, 0x3f800000    # 1.0f

    const/4 v6, 0x0

    const/4 v5, 0x0

    const/4 v4, 0x1

    .line 619
    if-nez p0, :cond_1

    .line 683
    :cond_0
    :goto_0
    return-void

    .line 622
    :cond_1
    if-nez p1, :cond_3

    move v2, v4

    .line 623
    .local v2, "vis":Z
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-nez v3, :cond_4

    invoke-virtual {p0, v8}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v3

    if-nez v3, :cond_4

    move v1, v4

    .line 624
    .local v1, "viewVis":Z
    :goto_2
    if-eq v2, v1, :cond_0

    .line 627
    sget-object v3, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v3, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 628
    sget-object v3, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v3, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/animation/ObjectAnimator;

    invoke-virtual {v3}, Landroid/animation/ObjectAnimator;->cancel()V

    .line 629
    sget-object v3, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v3, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 631
    :cond_2
    if-eqz v2, :cond_6

    .line 632
    const-string/jumbo v7, "alpha"

    const/4 v3, 0x2

    new-array v8, v3, [F

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v3

    cmpg-float v3, v3, v9

    if-gez v3, :cond_5

    invoke-virtual {p0}, Landroid/view/View;->getAlpha()F

    move-result v3

    :goto_3
    aput v3, v8, v5

    aput v9, v8, v4

    invoke-static {p0, v7, v8}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 633
    .local v0, "anim":Landroid/animation/ObjectAnimator;
    new-instance v3, Lcom/vkontakte/android/ViewUtils$3;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/ViewUtils$3;-><init>(Landroid/view/View;I)V

    invoke-virtual {v0, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 650
    const-wide/16 v4, 0x12c

    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 651
    sget-object v3, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v3, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 652
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto :goto_0

    .end local v0    # "anim":Landroid/animation/ObjectAnimator;
    .end local v1    # "viewVis":Z
    .end local v2    # "vis":Z
    :cond_3
    move v2, v5

    .line 622
    goto :goto_1

    .restart local v2    # "vis":Z
    :cond_4
    move v1, v5

    .line 623
    goto :goto_2

    .restart local v1    # "viewVis":Z
    :cond_5
    move v3, v6

    .line 632
    goto :goto_3

    .line 654
    :cond_6
    const-string/jumbo v3, "alpha"

    new-array v7, v4, [F

    aput v6, v7, v5

    invoke-static {p0, v3, v7}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object v0

    .line 655
    .restart local v0    # "anim":Landroid/animation/ObjectAnimator;
    new-instance v3, Lcom/vkontakte/android/ViewUtils$4;

    invoke-direct {v3, p0, p1}, Lcom/vkontakte/android/ViewUtils$4;-><init>(Landroid/view/View;I)V

    invoke-virtual {v0, v3}, Landroid/animation/ObjectAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 678
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v3

    invoke-virtual {p0, v8, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 679
    const-wide/16 v4, 0x12c

    invoke-virtual {v0, v4, v5}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    .line 680
    sget-object v3, Lcom/vkontakte/android/ViewUtils;->visibilityAnims:Ljava/util/HashMap;

    invoke-virtual {v3, p0, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 681
    invoke-virtual {v0}, Landroid/animation/ObjectAnimator;->start()V

    goto/16 :goto_0
.end method

.method public static showDialogSafety(Landroid/app/Dialog;)V
    .locals 3
    .param p0, "dialog"    # Landroid/app/Dialog;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 108
    if-eqz p0, :cond_0

    .line 109
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v2

    if-ne v1, v2, :cond_1

    .line 111
    :try_start_0
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 125
    :cond_0
    :goto_0
    return-void

    .line 112
    :catch_0
    move-exception v0

    .line 113
    .local v0, "e":Ljava/lang/Exception;
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {v0, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0

    .line 116
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_1
    sget-object v1, Lcom/vkontakte/android/ViewUtils;->handler:Landroid/os/Handler;

    invoke-static {p0}, Lcom/vkontakte/android/ViewUtils$$Lambda$3;->lambdaFactory$(Landroid/app/Dialog;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0
.end method
