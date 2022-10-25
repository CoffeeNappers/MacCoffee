.class public Lcom/vkontakte/android/ui/widget/WidgetTableView;
.super Lcom/vkontakte/android/ui/widget/WidgetTitleView;
.source "WidgetTableView.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/widget/WidgetTableView$VKImageRoundedView;
    }
.end annotation


# static fields
.field private static final iconSize:I

.field private static final tableParams:Landroid/widget/TableLayout$LayoutParams;


# instance fields
.field private final headItems:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/widget/TextView;",
            ">;"
        }
    .end annotation
.end field

.field private final rowItems:Landroid/util/SparseArray;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/SparseArray",
            "<",
            "Ljava/util/List",
            "<",
            "Landroid/view/View;",
            ">;>;"
        }
    .end annotation
.end field

.field private final rowSettings:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Float;",
            ">;>;"
        }
    .end annotation
.end field

.field private final table:Landroid/widget/TableLayout;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    .line 33
    new-instance v0, Landroid/widget/TableLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/TableLayout$LayoutParams;-><init>(II)V

    sput-object v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->tableParams:Landroid/widget/TableLayout$LayoutParams;

    .line 34
    const/high16 v0, 0x41c00000    # 24.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    sput v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->iconSize:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 42
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ui/widget/WidgetTableView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 43
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 46
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vkontakte/android/ui/widget/WidgetTableView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 47
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "defStyleAttr"    # I

    .prologue
    const/high16 v4, 0x41200000    # 10.0f

    .line 50
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowSettings:Ljava/util/List;

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->headItems:Ljava/util/List;

    .line 39
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowItems:Landroid/util/SparseArray;

    .line 51
    new-instance v0, Landroid/widget/TableLayout;

    invoke-direct {v0, p1}, Landroid/widget/TableLayout;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    new-instance v1, Landroid/support/v7/widget/LinearLayoutCompat$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/support/v7/widget/LinearLayoutCompat$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/TableLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 53
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f020122

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TableLayout;->setDividerDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 54
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    const/high16 v4, 0x41000000    # 8.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/widget/TableLayout;->setPadding(IIII)V

    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/widget/TableLayout;->setShowDividers(I)V

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v1}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TableLayout;->setDividerPadding(I)V

    .line 57
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/TableLayout;->setShrinkAllColumns(Z)V

    .line 58
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->addView(Landroid/view/View;)V

    .line 59
    return-void
.end method

.method private bind(Lcom/vkontakte/android/api/widget/WidgetTable;)V
    .locals 25
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/WidgetTable;

    .prologue
    .line 68
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->headItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->getHead()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-ne v3, v5, :cond_0

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowItems:Landroid/util/SparseArray;

    .line 69
    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->getBody()Ljava/util/List;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v5

    if-eq v3, v5, :cond_8

    .line 70
    :cond_0
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    invoke-virtual {v3}, Landroid/widget/TableLayout;->removeAllViews()V

    .line 71
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->headItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 72
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowItems:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->clear()V

    .line 73
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowSettings:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->clear()V

    .line 75
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->getContext()Landroid/content/Context;

    move-result-object v13

    .line 76
    .local v13, "context":Landroid/content/Context;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->hasWeights()Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v3, 0x1

    :goto_0
    invoke-virtual {v5, v7, v3}, Landroid/widget/TableLayout;->setColumnStretchable(IZ)V

    .line 77
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->hasHeader()Z

    move-result v3

    if-eqz v3, :cond_4

    .line 78
    new-instance v20, Landroid/widget/TableRow;

    move-object/from16 v0, v20

    invoke-direct {v0, v13}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    .line 79
    .local v20, "row":Landroid/widget/TableRow;
    sget-object v3, Lcom/vkontakte/android/ui/widget/WidgetTableView;->tableParams:Landroid/widget/TableLayout$LayoutParams;

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Landroid/widget/TableRow;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 80
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->getHead()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_1
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;

    .line 81
    .local v15, "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getWeight()F

    move-result v3

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createRowLayoutParams(F)Landroid/widget/TableRow$LayoutParams;

    move-result-object v3

    .line 82
    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getAlign()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x1

    const/4 v9, 0x1

    .line 81
    invoke-static {v13, v3, v5, v7, v9}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createTextView(Landroid/content/Context;Landroid/widget/TableRow$LayoutParams;Ljava/lang/String;ZZ)Landroid/widget/TextView;

    move-result-object v2

    .line 83
    .local v2, "textView":Landroid/widget/TextView;
    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Landroid/widget/TableRow;->addView(Landroid/view/View;)V

    .line 84
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->headItems:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 85
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowSettings:Ljava/util/List;

    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getAlign()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getWeight()F

    move-result v7

    invoke-static {v7}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v7

    invoke-static {v5, v7}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v5

    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 86
    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getText()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->bindTextView(Landroid/view/View;Ljava/lang/String;Lcom/vk/core/common/ImageSize;Ljava/lang/String;ZZ)V

    goto :goto_1

    .line 76
    .end local v2    # "textView":Landroid/widget/TextView;
    .end local v15    # "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    .end local v20    # "row":Landroid/widget/TableRow;
    :cond_1
    const/4 v3, 0x0

    goto :goto_0

    .line 88
    .restart local v20    # "row":Landroid/widget/TableRow;
    :cond_2
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/widget/TableLayout;->addView(Landroid/view/View;)V

    .line 95
    .end local v20    # "row":Landroid/widget/TableRow;
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->getBody()Ljava/util/List;

    move-result-object v23

    .line 96
    .local v23, "rows":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$Row;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->hasIcons()Z

    move-result v6

    .line 97
    .local v6, "hasIcons":Z
    const/4 v14, 0x0

    .local v14, "i":I
    :goto_2
    invoke-interface/range {v23 .. v23}, Ljava/util/List;->size()I

    move-result v3

    if-ge v14, v3, :cond_d

    .line 98
    move-object/from16 v0, v23

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/vkontakte/android/api/widget/WidgetTable$Row;

    .line 99
    .local v21, "rowItem":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    new-instance v20, Landroid/widget/TableRow;

    move-object/from16 v0, v20

    invoke-direct {v0, v13}, Landroid/widget/TableRow;-><init>(Landroid/content/Context;)V

    .line 100
    .restart local v20    # "row":Landroid/widget/TableRow;
    sget-object v3, Lcom/vkontakte/android/ui/widget/WidgetTableView;->tableParams:Landroid/widget/TableLayout$LayoutParams;

    move-object/from16 v0, v20

    invoke-virtual {v0, v3}, Landroid/widget/TableRow;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 101
    new-instance v24, Ljava/util/ArrayList;

    invoke-direct/range {v24 .. v24}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .local v24, "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->getItems()Ljava/util/List;

    move-result-object v17

    .line 103
    .local v17, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;>;"
    const/16 v18, 0x0

    .local v18, "j":I
    :goto_3
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_7

    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowSettings:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_7

    .line 104
    invoke-interface/range {v17 .. v18}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;

    .line 105
    .local v15, "item":Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowSettings:Ljava/util/List;

    move/from16 v0, v18

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/util/Pair;

    .line 106
    .local v19, "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;"
    if-nez v18, :cond_5

    move-object/from16 v0, v19

    iget-object v3, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    .line 107
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createRowLayoutParams(F)Landroid/widget/TableRow$LayoutParams;

    move-result-object v5

    move-object/from16 v0, v19

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    invoke-static {v13, v5, v3}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createTextViewWithImage(Landroid/content/Context;Landroid/widget/TableRow$LayoutParams;Ljava/lang/String;)Landroid/view/View;

    move-result-object v2

    .line 109
    .local v2, "textView":Landroid/view/View;
    :goto_4
    move-object/from16 v0, v20

    invoke-virtual {v0, v2}, Landroid/widget/TableRow;->addView(Landroid/view/View;)V

    .line 110
    move-object/from16 v0, v24

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 111
    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->hasIcon()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->getIcon()Lcom/vk/core/common/Image;

    move-result-object v3

    sget v5, Lcom/vkontakte/android/ui/widget/WidgetTableView;->iconSize:I

    invoke-virtual {v3, v5}, Lcom/vk/core/common/Image;->getImageByWidth(I)Lcom/vk/core/common/ImageSize;

    move-result-object v4

    .line 112
    .local v4, "image":Lcom/vk/core/common/ImageSize;
    :goto_5
    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->getUrl()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->bindTextView(Landroid/view/View;Ljava/lang/String;Lcom/vk/core/common/ImageSize;Ljava/lang/String;ZZ)V

    .line 103
    add-int/lit8 v18, v18, 0x1

    goto :goto_3

    .line 90
    .end local v2    # "textView":Landroid/view/View;
    .end local v4    # "image":Lcom/vk/core/common/ImageSize;
    .end local v6    # "hasIcons":Z
    .end local v14    # "i":I
    .end local v15    # "item":Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;
    .end local v17    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;>;"
    .end local v18    # "j":I
    .end local v19    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;"
    .end local v20    # "row":Landroid/widget/TableRow;
    .end local v21    # "rowItem":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    .end local v23    # "rows":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$Row;>;"
    .end local v24    # "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->getHead()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_6
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;

    .line 91
    .local v15, "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowSettings:Ljava/util/List;

    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getAlign()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getWeight()F

    move-result v8

    invoke-static {v8}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v8

    invoke-static {v7, v8}, Landroid/util/Pair;->create(Ljava/lang/Object;Ljava/lang/Object;)Landroid/util/Pair;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 107
    .restart local v6    # "hasIcons":Z
    .restart local v14    # "i":I
    .local v15, "item":Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;
    .restart local v17    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;>;"
    .restart local v18    # "j":I
    .restart local v19    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;"
    .restart local v20    # "row":Landroid/widget/TableRow;
    .restart local v21    # "rowItem":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    .restart local v23    # "rows":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$Row;>;"
    .restart local v24    # "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    :cond_5
    move-object/from16 v0, v19

    iget-object v3, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v3, Ljava/lang/Float;

    .line 108
    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createRowLayoutParams(F)Landroid/widget/TableRow$LayoutParams;

    move-result-object v5

    move-object/from16 v0, v19

    iget-object v3, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v3, Ljava/lang/String;

    const/4 v7, 0x0

    const/4 v8, 0x1

    invoke-static {v13, v5, v3, v7, v8}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createTextView(Landroid/content/Context;Landroid/widget/TableRow$LayoutParams;Ljava/lang/String;ZZ)Landroid/widget/TextView;

    move-result-object v2

    goto :goto_4

    .line 111
    .restart local v2    # "textView":Landroid/view/View;
    :cond_6
    const/4 v4, 0x0

    goto :goto_5

    .line 114
    .end local v2    # "textView":Landroid/view/View;
    .end local v15    # "item":Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;
    .end local v19    # "pair":Landroid/util/Pair;, "Landroid/util/Pair<Ljava/lang/String;Ljava/lang/Float;>;"
    :cond_7
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowItems:Landroid/util/SparseArray;

    move-object/from16 v0, v24

    invoke-virtual {v3, v14, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 115
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    move-object/from16 v0, v20

    invoke-virtual {v3, v0}, Landroid/widget/TableLayout;->addView(Landroid/view/View;)V

    .line 97
    add-int/lit8 v14, v14, 0x1

    goto/16 :goto_2

    .line 118
    .end local v6    # "hasIcons":Z
    .end local v13    # "context":Landroid/content/Context;
    .end local v14    # "i":I
    .end local v17    # "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;>;"
    .end local v18    # "j":I
    .end local v20    # "row":Landroid/widget/TableRow;
    .end local v21    # "rowItem":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    .end local v23    # "rows":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$Row;>;"
    .end local v24    # "views":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    :cond_8
    move-object/from16 v0, p0

    iget-object v5, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->table:Landroid/widget/TableLayout;

    const/4 v7, 0x0

    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->hasWeights()Z

    move-result v3

    if-nez v3, :cond_9

    const/4 v3, 0x1

    :goto_7
    invoke-virtual {v5, v7, v3}, Landroid/widget/TableLayout;->setColumnStretchable(IZ)V

    .line 119
    const/4 v14, 0x0

    .restart local v14    # "i":I
    :goto_8
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->headItems:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-ge v14, v3, :cond_a

    .line 120
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->headItems:Ljava/util/List;

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    .line 121
    .local v2, "textView":Landroid/widget/TextView;
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->getHead()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;

    .line 122
    .local v15, "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;->getText()Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x1

    move-object v7, v2

    invoke-static/range {v7 .. v12}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->bindTextView(Landroid/view/View;Ljava/lang/String;Lcom/vk/core/common/ImageSize;Ljava/lang/String;ZZ)V

    .line 119
    add-int/lit8 v14, v14, 0x1

    goto :goto_8

    .line 118
    .end local v2    # "textView":Landroid/widget/TextView;
    .end local v14    # "i":I
    .end local v15    # "item":Lcom/vkontakte/android/api/widget/WidgetTable$HeadRowItem;
    :cond_9
    const/4 v3, 0x0

    goto :goto_7

    .line 125
    .restart local v14    # "i":I
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->getBody()Ljava/util/List;

    move-result-object v23

    .line 126
    .restart local v23    # "rows":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$Row;>;"
    invoke-virtual/range {p1 .. p1}, Lcom/vkontakte/android/api/widget/WidgetTable;->hasIcons()Z

    move-result v6

    .line 127
    .restart local v6    # "hasIcons":Z
    const/4 v14, 0x0

    :goto_9
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowItems:Landroid/util/SparseArray;

    invoke-virtual {v3}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v14, v3, :cond_d

    .line 128
    move-object/from16 v0, v23

    invoke-interface {v0, v14}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/api/widget/WidgetTable$Row;

    .line 129
    .local v15, "item":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    move-object/from16 v0, p0

    iget-object v3, v0, Lcom/vkontakte/android/ui/widget/WidgetTableView;->rowItems:Landroid/util/SparseArray;

    invoke-virtual {v3, v14}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Ljava/util/List;

    .line 130
    .local v16, "items":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    invoke-virtual {v15}, Lcom/vkontakte/android/api/widget/WidgetTable$Row;->getItems()Ljava/util/List;

    move-result-object v22

    .line 131
    .local v22, "rowItems":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;>;"
    const/16 v18, 0x0

    .restart local v18    # "j":I
    :goto_a
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->size()I

    move-result v3

    move/from16 v0, v18

    if-ge v0, v3, :cond_c

    .line 132
    move-object/from16 v0, v16

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/view/View;

    .line 133
    .local v2, "textView":Landroid/view/View;
    move-object/from16 v0, v22

    move/from16 v1, v18

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;

    .line 134
    .local v21, "rowItem":Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;
    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->hasIcon()Z

    move-result v3

    if-eqz v3, :cond_b

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->getIcon()Lcom/vk/core/common/Image;

    move-result-object v3

    sget v5, Lcom/vkontakte/android/ui/widget/WidgetTableView;->iconSize:I

    invoke-virtual {v3, v5}, Lcom/vk/core/common/Image;->getImageByWidth(I)Lcom/vk/core/common/ImageSize;

    move-result-object v4

    .line 135
    .restart local v4    # "image":Lcom/vk/core/common/ImageSize;
    :goto_b
    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->getText()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v21 .. v21}, Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;->getUrl()Ljava/lang/String;

    move-result-object v5

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->bindTextView(Landroid/view/View;Ljava/lang/String;Lcom/vk/core/common/ImageSize;Ljava/lang/String;ZZ)V

    .line 131
    add-int/lit8 v18, v18, 0x1

    goto :goto_a

    .line 134
    .end local v4    # "image":Lcom/vk/core/common/ImageSize;
    :cond_b
    const/4 v4, 0x0

    goto :goto_b

    .line 127
    .end local v2    # "textView":Landroid/view/View;
    .end local v21    # "rowItem":Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;
    :cond_c
    add-int/lit8 v14, v14, 0x1

    goto :goto_9

    .line 139
    .end local v15    # "item":Lcom/vkontakte/android/api/widget/WidgetTable$Row;
    .end local v16    # "items":Ljava/util/List;, "Ljava/util/List<Landroid/view/View;>;"
    .end local v18    # "j":I
    .end local v22    # "rowItems":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/api/widget/WidgetTable$RowItem;>;"
    :cond_d
    return-void
.end method

.method private static bindTextView(Landroid/view/View;Ljava/lang/String;Lcom/vk/core/common/ImageSize;Ljava/lang/String;ZZ)V
    .locals 6
    .param p0, "view"    # Landroid/view/View;
    .param p1, "text"    # Ljava/lang/String;
    .param p2, "icon"    # Lcom/vk/core/common/ImageSize;
    .param p3, "url"    # Ljava/lang/String;
    .param p4, "showIcon"    # Z
    .param p5, "isHeader"    # Z

    .prologue
    const/4 v4, 0x0

    .line 199
    instance-of v1, p0, Landroid/widget/TextView;

    .line 200
    .local v1, "isTextView":Z
    if-eqz v1, :cond_1

    move-object v0, v4

    .line 201
    .local v0, "imageView":Lcom/vk/imageloader/view/VKImageView;
    :goto_0
    if-eqz v1, :cond_2

    move-object v3, p0

    check-cast v3, Landroid/widget/TextView;

    move-object v2, v3

    .line 202
    .local v2, "textView":Landroid/widget/TextView;
    :goto_1
    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 203
    if-eqz p5, :cond_3

    .line 204
    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f0f003d

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    .line 203
    :goto_2
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 209
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 210
    invoke-virtual {p0, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 211
    invoke-virtual {p0, v4}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 217
    :goto_3
    if-eqz v0, :cond_0

    .line 218
    if-nez p2, :cond_7

    if-eqz p4, :cond_6

    const/4 v3, 0x4

    :goto_4
    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->setVisibility(I)V

    .line 219
    if-nez p2, :cond_8

    .line 220
    invoke-virtual {v0, v4}, Lcom/vk/imageloader/view/VKImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    .line 225
    :cond_0
    :goto_5
    return-void

    .line 200
    .end local v0    # "imageView":Lcom/vk/imageloader/view/VKImageView;
    .end local v2    # "textView":Landroid/widget/TextView;
    :cond_1
    const v3, 0x7f1001c9

    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/vk/imageloader/view/VKImageView;

    move-object v0, v3

    goto :goto_0

    .line 201
    .restart local v0    # "imageView":Lcom/vk/imageloader/view/VKImageView;
    :cond_2
    const v3, 0x7f1000d8

    invoke-virtual {p0, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    move-object v2, v3

    goto :goto_1

    .line 205
    .restart local v2    # "textView":Landroid/widget/TextView;
    :cond_3
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 206
    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f0f0042

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    goto :goto_2

    .line 207
    :cond_4
    invoke-virtual {v2}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v5, 0x7f0f0018

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    goto :goto_2

    .line 213
    :cond_5
    invoke-static {p3}, Lcom/vkontakte/android/ui/widget/WidgetTableView$$Lambda$1;->lambdaFactory$(Ljava/lang/String;)Landroid/view/View$OnClickListener;

    move-result-object v3

    invoke-virtual {p0, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 214
    const v3, 0x7f020146

    invoke-virtual {p0, v3}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_3

    .line 218
    :cond_6
    const/16 v3, 0x8

    goto :goto_4

    :cond_7
    const/4 v3, 0x0

    goto :goto_4

    .line 222
    :cond_8
    invoke-virtual {p2}, Lcom/vk/core/common/ImageSize;->getUrl()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    goto :goto_5
.end method

.method private static createRowLayoutParams(F)Landroid/widget/TableRow$LayoutParams;
    .locals 3
    .param p0, "weight"    # F

    .prologue
    .line 143
    const/4 v1, 0x0

    cmpl-float v1, p0, v1

    if-nez v1, :cond_0

    const/4 v0, -0x2

    .line 144
    .local v0, "width":I
    :goto_0
    new-instance v1, Landroid/widget/TableRow$LayoutParams;

    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-direct {v1, v0, v2, p0}, Landroid/widget/TableRow$LayoutParams;-><init>(IIF)V

    return-object v1

    .line 143
    .end local v0    # "width":I
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static createTextView(Landroid/content/Context;Landroid/widget/TableRow$LayoutParams;Ljava/lang/String;ZZ)Landroid/widget/TextView;
    .locals 3
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "layoutParams"    # Landroid/widget/TableRow$LayoutParams;
    .param p2, "align"    # Ljava/lang/String;
    .param p3, "header"    # Z
    .param p4, "withPadding"    # Z

    .prologue
    .line 168
    invoke-static {p0, p3, p4}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createTextView(Landroid/content/Context;ZZ)Landroid/widget/TextView;

    move-result-object v0

    .line 169
    .local v0, "view":Landroid/widget/TextView;
    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 170
    const/4 v1, -0x1

    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    move-result v2

    sparse-switch v2, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v1, :pswitch_data_0

    .line 179
    const/16 v1, 0x13

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 182
    :goto_1
    return-object v0

    .line 170
    :sswitch_0
    const-string/jumbo v2, "center"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v2, "right"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v2, "left"

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v1, 0x2

    goto :goto_0

    .line 172
    :pswitch_0
    const/16 v1, 0x11

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    goto :goto_1

    .line 175
    :pswitch_1
    const/16 v1, 0x15

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    goto :goto_1

    .line 170
    nop

    :sswitch_data_0
    .sparse-switch
        -0x514d33ab -> :sswitch_0
        0x32a007 -> :sswitch_2
        0x677c21c -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method private static createTextView(Landroid/content/Context;ZZ)Landroid/widget/TextView;
    .locals 5
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "header"    # Z
    .param p2, "withPadding"    # Z

    .prologue
    const/4 v4, 0x0

    const/high16 v3, 0x40c00000    # 6.0f

    .line 186
    if-eqz p1, :cond_1

    new-instance v0, Lcom/vk/attachpicker/widget/RobotoMediumTextView;

    invoke-direct {v0, p0}, Lcom/vk/attachpicker/widget/RobotoMediumTextView;-><init>(Landroid/content/Context;)V

    .line 187
    .local v0, "view":Landroid/widget/TextView;
    :goto_0
    invoke-virtual {v0}, Landroid/widget/TextView;->setSingleLine()V

    .line 188
    const/high16 v1, 0x41500000    # 13.0f

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextSize(F)V

    .line 189
    sget-object v1, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 190
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0f003d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getColor(I)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 191
    if-eqz p2, :cond_0

    .line 192
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v1

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v0, v1, v4, v2, v4}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 194
    :cond_0
    return-object v0

    .line 186
    .end local v0    # "view":Landroid/widget/TextView;
    :cond_1
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    goto :goto_0
.end method

.method private static createTextViewWithImage(Landroid/content/Context;Landroid/widget/TableRow$LayoutParams;Ljava/lang/String;)Landroid/view/View;
    .locals 7
    .param p0, "context"    # Landroid/content/Context;
    .param p1, "layoutParams"    # Landroid/widget/TableRow$LayoutParams;
    .param p2, "align"    # Ljava/lang/String;

    .prologue
    const/4 v6, 0x0

    .line 148
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    sget v4, Lcom/vkontakte/android/ui/widget/WidgetTableView;->iconSize:I

    sget v5, Lcom/vkontakte/android/ui/widget/WidgetTableView;->iconSize:I

    invoke-direct {v0, v4, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 149
    .local v0, "imageParams":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v4, 0x41400000    # 12.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v0, v6, v6, v4, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 150
    new-instance v1, Lcom/vkontakte/android/ui/widget/WidgetTableView$VKImageRoundedView;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/ui/widget/WidgetTableView$VKImageRoundedView;-><init>(Landroid/content/Context;)V

    .line 151
    .local v1, "imageView":Lcom/vk/imageloader/view/VKImageView;
    invoke-virtual {v1, v0}, Lcom/vk/imageloader/view/VKImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 152
    const v4, 0x7f1001c9

    invoke-virtual {v1, v4}, Lcom/vk/imageloader/view/VKImageView;->setId(I)V

    .line 153
    invoke-static {p0, p1, p2, v6, v6}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->createTextView(Landroid/content/Context;Landroid/widget/TableRow$LayoutParams;Ljava/lang/String;ZZ)Landroid/widget/TextView;

    move-result-object v3

    .line 154
    .local v3, "textView":Landroid/widget/TextView;
    const v4, 0x7f1000d8

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setId(I)V

    .line 156
    new-instance v2, Landroid/widget/LinearLayout;

    invoke-direct {v2, p0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 157
    .local v2, "layout":Landroid/widget/LinearLayout;
    const/high16 v4, 0x40c00000    # 6.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v2, v4, v6, v6, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 158
    const/16 v4, 0x10

    invoke-virtual {v2, v4}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 159
    invoke-virtual {v2, p1}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    invoke-virtual {v2, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 161
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 162
    invoke-virtual {v2, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 163
    return-object v2
.end method

.method static synthetic lambda$bindTextView$0(Ljava/lang/String;Landroid/view/View;)V
    .locals 1
    .param p0, "url"    # Ljava/lang/String;
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 213
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->openLink(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public bind(Lcom/vkontakte/android/api/widget/Widget;)V
    .locals 0
    .param p1, "widget"    # Lcom/vkontakte/android/api/widget/Widget;

    .prologue
    .line 63
    invoke-super {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTitleView;->bind(Lcom/vkontakte/android/api/widget/Widget;)V

    .line 64
    check-cast p1, Lcom/vkontakte/android/api/widget/WidgetTable;

    .end local p1    # "widget":Lcom/vkontakte/android/api/widget/Widget;
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/widget/WidgetTableView;->bind(Lcom/vkontakte/android/api/widget/WidgetTable;)V

    .line 65
    return-void
.end method
