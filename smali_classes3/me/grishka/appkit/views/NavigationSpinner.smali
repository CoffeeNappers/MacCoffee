.class public Lme/grishka/appkit/views/NavigationSpinner;
.super Landroid/widget/Spinner;
.source "NavigationSpinner.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;
    }
.end annotation


# static fields
.field private static final MAX_ITEMS_MEASURED:I = 0xf

.field public static final POPUP_SIZE_ALGORITHM_MAX:I = 0x1

.field public static final POPUP_SIZE_ALGORITHM_MIN:I


# instance fields
.field private dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

.field protected popupSizeAlgorithm:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 37
    invoke-direct {p0, p1}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;)V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "mode"    # I

    .prologue
    .line 58
    invoke-direct {p0, p1, p2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;I)V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .line 59
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 41
    invoke-direct {p0, p1, p2}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I

    .prologue
    .line 45
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .line 46
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "mode"    # I

    .prologue
    .line 54
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .line 55
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;III)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
    .param p3, "defStyleAttr"    # I
    .param p4, "defStyleRes"    # I
    .param p5, "mode"    # I
    .annotation build Landroid/annotation/TargetApi;
        value = 0x15
    .end annotation

    .prologue
    .line 50
    invoke-direct/range {p0 .. p5}, Landroid/widget/Spinner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;III)V

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    .line 34
    const/4 v0, 0x0

    iput-object v0, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .line 51
    return-void
.end method

.method public static len(Ljava/lang/Object;)I
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 107
    instance-of v0, p0, Ljava/lang/CharSequence;

    if-eqz v0, :cond_0

    .line 108
    check-cast p0, Ljava/lang/CharSequence;

    .end local p0    # "o":Ljava/lang/Object;
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    .line 110
    :goto_0
    return v0

    .restart local p0    # "o":Ljava/lang/Object;
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected considerWidth(Landroid/widget/SpinnerAdapter;IIIII)I
    .locals 6
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;
    .param p2, "start"    # I
    .param p3, "end"    # I
    .param p4, "widthMeasureSpec"    # I
    .param p5, "heightMeasureSpec"    # I
    .param p6, "width"    # I

    .prologue
    const/4 v5, -0x2

    .line 116
    const/4 v2, 0x0

    .line 117
    .local v2, "itemView":Landroid/view/View;
    const/4 v1, 0x0

    .line 118
    .local v1, "itemType":I
    move v0, p2

    .local v0, "i":I
    :goto_0
    if-ge v0, p3, :cond_2

    .line 119
    invoke-interface {p1, v0}, Landroid/widget/SpinnerAdapter;->getItemViewType(I)I

    move-result v3

    .line 120
    .local v3, "positionType":I
    if-eq v3, v1, :cond_0

    .line 121
    move v1, v3

    .line 122
    const/4 v2, 0x0

    .line 124
    :cond_0
    invoke-interface {p1, v0, v2, p0}, Landroid/widget/SpinnerAdapter;->getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v2

    .line 125
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    if-nez v4, :cond_1

    .line 126
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 130
    :cond_1
    invoke-virtual {v2, p4, p5}, Landroid/view/View;->measure(II)V

    .line 131
    invoke-virtual {v2}, Landroid/view/View;->getMeasuredWidth()I

    move-result v4

    invoke-static {p6, v4}, Ljava/lang/Math;->max(II)I

    move-result p6

    .line 118
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 133
    .end local v3    # "positionType":I
    :cond_2
    return p6
.end method

.method public measureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I
    .locals 21
    .param p1, "adapter"    # Landroid/widget/SpinnerAdapter;
    .param p2, "background"    # Landroid/graphics/drawable/Drawable;

    .prologue
    .line 66
    if-nez p1, :cond_1

    .line 67
    const/4 v8, 0x0

    .line 103
    :cond_0
    :goto_0
    return v8

    .line 70
    :cond_1
    const/4 v8, 0x0

    .line 71
    .local v8, "width":I
    new-instance v20, Landroid/graphics/Rect;

    invoke-direct/range {v20 .. v20}, Landroid/graphics/Rect;-><init>()V

    .line 72
    .local v20, "tempRect":Landroid/graphics/Rect;
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v6

    .line 73
    .local v6, "widthMeasureSpec":I
    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v7

    .line 77
    .local v7, "heightMeasureSpec":I
    const/4 v2, 0x0

    invoke-virtual/range {p0 .. p0}, Lme/grishka/appkit/views/NavigationSpinner;->getSelectedItemPosition()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    .line 78
    .local v4, "start":I
    invoke-interface/range {p1 .. p1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v2

    add-int/lit8 v3, v4, 0xf

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v5

    .line 79
    .local v5, "end":I
    sub-int v16, v5, v4

    .line 80
    .local v16, "count":I
    const/4 v2, 0x0

    rsub-int/lit8 v3, v16, 0xf

    sub-int v3, v4, v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v4

    move-object/from16 v2, p0

    move-object/from16 v3, p1

    .line 82
    invoke-virtual/range {v2 .. v8}, Lme/grishka/appkit/views/NavigationSpinner;->considerWidth(Landroid/widget/SpinnerAdapter;IIIII)I

    move-result v8

    .line 84
    const/4 v11, 0x0

    .line 85
    .local v11, "maxLenIndex":I
    invoke-interface/range {p1 .. p1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v2

    const/16 v3, 0xf

    if-le v2, v3, :cond_4

    .line 86
    const/16 v18, 0x0

    .line 87
    .local v18, "len":I
    const/16 v17, 0x0

    .local v17, "i":I
    :goto_1
    invoke-interface/range {p1 .. p1}, Landroid/widget/SpinnerAdapter;->getCount()I

    move-result v2

    move/from16 v0, v17

    if-ge v0, v2, :cond_3

    .line 88
    move-object/from16 v0, p1

    move/from16 v1, v17

    invoke-interface {v0, v1}, Landroid/widget/SpinnerAdapter;->getItem(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {v2}, Lme/grishka/appkit/views/NavigationSpinner;->len(Ljava/lang/Object;)I

    move-result v19

    .line 89
    .local v19, "localLen":I
    move/from16 v0, v19

    move/from16 v1, v18

    if-le v0, v1, :cond_2

    .line 90
    move/from16 v11, v17

    .line 91
    move/from16 v18, v19

    .line 87
    :cond_2
    add-int/lit8 v17, v17, 0x1

    goto :goto_1

    .line 94
    .end local v19    # "localLen":I
    :cond_3
    add-int/lit8 v12, v11, 0x1

    move-object/from16 v9, p0

    move-object/from16 v10, p1

    move v13, v6

    move v14, v7

    move v15, v8

    invoke-virtual/range {v9 .. v15}, Lme/grishka/appkit/views/NavigationSpinner;->considerWidth(Landroid/widget/SpinnerAdapter;IIIII)I

    move-result v8

    .line 98
    .end local v17    # "i":I
    .end local v18    # "len":I
    :cond_4
    if-eqz p2, :cond_0

    .line 99
    move-object/from16 v0, p2

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    .line 100
    move-object/from16 v0, v20

    iget v2, v0, Landroid/graphics/Rect;->left:I

    move-object/from16 v0, v20

    iget v3, v0, Landroid/graphics/Rect;->right:I

    add-int/2addr v2, v3

    add-int/2addr v8, v2

    goto/16 :goto_0
.end method

.method protected onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 5
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    .line 138
    iget-object v1, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    if-eqz v1, :cond_0

    .line 139
    iget-object v1, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {p0, v2, v3}, Lme/grishka/appkit/views/NavigationSpinner;->measureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v2

    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getWidth()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    move-result v2

    iget v3, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    int-to-float v3, v3

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getLeft()I

    move-result v4

    invoke-interface {v1, p0, v2, v3, v4}, Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;->getDropDownWidth(Lme/grishka/appkit/views/NavigationSpinner;III)I

    move-result v0

    .line 140
    .local v0, "w":I
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_0

    .line 141
    invoke-virtual {p0, v0}, Lme/grishka/appkit/views/NavigationSpinner;->setDropDownWidth(I)V

    .line 143
    .end local v0    # "w":I
    :cond_0
    invoke-super {p0, p1}, Landroid/widget/Spinner;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 144
    return-void
.end method

.method public performClick()Z
    .locals 4

    .prologue
    const/4 v2, 0x0

    .line 149
    iget v1, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    if-nez v1, :cond_2

    .line 150
    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v1

    invoke-virtual {p0, v1, v2}, Lme/grishka/appkit/views/NavigationSpinner;->measureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v1

    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getWidth()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v0

    .line 154
    .local v0, "w":I
    :goto_0
    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    instance-of v1, v1, Landroid/view/View;

    if-eqz v1, :cond_0

    .line 155
    iget-object v1, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    if-nez v1, :cond_3

    .line 157
    :cond_0
    :goto_1
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x10

    if-lt v1, v2, :cond_1

    .line 158
    invoke-virtual {p0, v0}, Lme/grishka/appkit/views/NavigationSpinner;->setDropDownWidth(I)V

    .line 159
    :cond_1
    invoke-super {p0}, Landroid/widget/Spinner;->performClick()Z

    move-result v1

    return v1

    .line 152
    .end local v0    # "w":I
    :cond_2
    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getAdapter()Landroid/widget/SpinnerAdapter;

    move-result-object v1

    invoke-virtual {p0, v1, v2}, Lme/grishka/appkit/views/NavigationSpinner;->measureContentWidth(Landroid/widget/SpinnerAdapter;Landroid/graphics/drawable/Drawable;)I

    move-result v1

    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getWidth()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v0

    .restart local v0    # "w":I
    goto :goto_0

    .line 155
    :cond_3
    iget-object v2, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getParent()Landroid/view/ViewParent;

    move-result-object v1

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Lme/grishka/appkit/views/NavigationSpinner;->getLeft()I

    move-result v3

    invoke-interface {v2, p0, v0, v1, v3}, Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;->getDropDownWidth(Lme/grishka/appkit/views/NavigationSpinner;III)I

    move-result v0

    goto :goto_1
.end method

.method public setDropDownWidthHelper(Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;)V
    .locals 0
    .param p1, "dropDownWidthHelper"    # Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .prologue
    .line 62
    iput-object p1, p0, Lme/grishka/appkit/views/NavigationSpinner;->dropDownWidthHelper:Lme/grishka/appkit/views/NavigationSpinner$DropDownWidthHelper;

    .line 63
    return-void
.end method

.method public setPopupSizeAlgorithm(I)V
    .locals 0
    .param p1, "popupSizeAlgorithm"    # I

    .prologue
    .line 163
    iput p1, p0, Lme/grishka/appkit/views/NavigationSpinner;->popupSizeAlgorithm:I

    .line 164
    return-void
.end method
