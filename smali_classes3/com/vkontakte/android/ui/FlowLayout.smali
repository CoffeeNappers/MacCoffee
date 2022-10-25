.class public Lcom/vkontakte/android/ui/FlowLayout;
.super Landroid/view/ViewGroup;
.source "FlowLayout.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    }
.end annotation


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private lineHeights:Ljava/util/Vector;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Vector",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private lparams:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;",
            ">;"
        }
    .end annotation
.end field

.field private measuredHeight:I

.field public pwidth:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 20
    const-class v0, Lcom/vkontakte/android/ui/FlowLayout;

    invoke-virtual {v0}, Ljava/lang/Class;->desiredAssertionStatus()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    sput-boolean v0, Lcom/vkontakte/android/ui/FlowLayout;->$assertionsDisabled:Z

    return-void

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 56
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 23
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    .line 24
    const/high16 v0, 0x40a00000    # 5.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/FlowLayout;->pwidth:I

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/FlowLayout;->measuredHeight:I

    .line 57
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    .line 60
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 23
    new-instance v0, Ljava/util/Vector;

    invoke-direct {v0}, Ljava/util/Vector;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    .line 24
    const/high16 v0, 0x40a00000    # 5.0f

    invoke-static {v0}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/ui/FlowLayout;->pwidth:I

    .line 25
    const/4 v0, 0x0

    iput v0, p0, Lcom/vkontakte/android/ui/FlowLayout;->measuredHeight:I

    .line 61
    return-void
.end method


# virtual methods
.method protected checkLayoutParams(Landroid/view/ViewGroup$LayoutParams;)Z
    .locals 1
    .param p1, "p"    # Landroid/view/ViewGroup$LayoutParams;

    .prologue
    .line 274
    instance-of v0, p1, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    if-eqz v0, :cond_0

    .line 275
    const/4 v0, 0x1

    .line 277
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method protected generateDefaultLayoutParams()Landroid/view/ViewGroup$LayoutParams;
    .locals 3

    .prologue
    const/high16 v2, 0x40000000    # 2.0f

    .line 269
    new-instance v0, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;-><init>(II)V

    return-object v0
.end method

.method public getFullHeight()I
    .locals 4

    .prologue
    .line 171
    const/4 v0, 0x0

    .line 172
    .local v0, "h":I
    iget-object v2, p0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    invoke-virtual {v2}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 173
    .local v1, "i":I
    add-int/2addr v0, v1

    .line 174
    goto :goto_0

    .line 175
    .end local v1    # "i":I
    :cond_0
    return v0
.end method

.method public layoutWithParams(Ljava/util/List;II)Ljava/util/List;
    .locals 24
    .param p2, "w"    # I
    .param p3, "h"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;",
            ">;II)",
            "Ljava/util/List",
            "<",
            "Landroid/graphics/Rect;",
            ">;"
        }
    .end annotation

    .prologue
    .line 65
    .local p1, "params":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;>;"
    move-object/from16 v0, p1

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/ui/FlowLayout;->lparams:Ljava/util/List;

    .line 66
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v17, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/graphics/Rect;>;"
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v8

    .line 68
    .local v8, "count":I
    move/from16 v18, p2

    .line 69
    .local v18, "width":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v19

    .line 70
    .local v19, "xpos":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingTop()I

    move-result v20

    .line 71
    .local v20, "ypos":I
    const/4 v12, 0x0

    .line 74
    .local v12, "line":I
    const/4 v5, 0x0

    .line 75
    .local v5, "breakNext":Z
    const/16 v16, 0x0

    .line 76
    .local v16, "prevFloat":Z
    const/4 v9, 0x0

    .line 78
    .local v9, "floatY":I
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Ljava/util/Vector;->clear()V

    .line 80
    const/4 v10, 0x0

    .line 81
    .local v10, "floatingH":I
    const/4 v13, 0x0

    .line 82
    .local v13, "line_height":I
    const/4 v15, 0x0

    .line 84
    .local v15, "maxw":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_0
    if-ge v11, v8, :cond_5

    .line 85
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    .line 86
    .local v14, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    move/from16 v21, v0

    if-gtz v21, :cond_0

    move/from16 v7, p2

    .line 87
    .local v7, "childw":I
    :goto_1
    iget v6, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 88
    .local v6, "childh":I
    if-gez v6, :cond_1

    .line 89
    new-instance v21, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v22, "Height should be constant"

    invoke-direct/range {v21 .. v22}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 86
    .end local v6    # "childh":I
    .end local v7    # "childw":I
    :cond_0
    iget v7, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    goto :goto_1

    .line 92
    .restart local v6    # "childh":I
    .restart local v7    # "childw":I
    :cond_1
    if-nez v5, :cond_2

    add-int v21, v19, v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->pwidth:I

    move/from16 v22, v0

    add-int v22, v22, v18

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_3

    .line 93
    :cond_2
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v19

    .line 94
    invoke-static {v13, v10}, Ljava/lang/Math;->max(II)I

    move-result v21

    add-int v20, v20, v21

    .line 95
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v21, v0

    invoke-static {v13, v10}, Ljava/lang/Math;->max(II)I

    move-result v22

    invoke-static/range {v22 .. v22}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 96
    const/4 v13, 0x0

    .line 97
    const/4 v10, 0x0

    .line 98
    const/4 v5, 0x0

    .line 100
    :cond_3
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    move/from16 v21, v0

    add-int v21, v21, v6

    move/from16 v0, v21

    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    move-result v13

    .line 103
    iget-boolean v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    move/from16 v21, v0

    if-eqz v21, :cond_4

    .line 104
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    move/from16 v21, v0

    add-int v21, v21, v6

    add-int v20, v20, v21

    .line 105
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    move/from16 v21, v0

    add-int v21, v21, v6

    add-int v10, v10, v21

    .line 106
    add-int v21, v19, v7

    move/from16 v0, v21

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 111
    :goto_2
    iget-boolean v5, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 112
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->horizontal_spacing:I

    move/from16 v21, v0

    sub-int v21, v19, v21

    move/from16 v0, v21

    invoke-static {v15, v0}, Ljava/lang/Math;->max(II)I

    move-result v15

    .line 84
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_0

    .line 108
    :cond_4
    const/4 v10, 0x0

    .line 109
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->horizontal_spacing:I

    move/from16 v21, v0

    add-int v21, v21, v7

    add-int v19, v19, v21

    goto :goto_2

    .line 114
    .end local v6    # "childh":I
    .end local v7    # "childw":I
    .end local v14    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_5
    if-lez v13, :cond_6

    .line 115
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v21, v0

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v22

    invoke-virtual/range {v21 .. v22}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 118
    :cond_6
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v19

    .line 119
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingTop()I

    move-result v20

    .line 120
    const/4 v9, 0x0

    .line 121
    const/16 v16, 0x0

    .line 122
    const/4 v5, 0x0

    .line 123
    const/4 v12, 0x0

    .line 125
    const/4 v11, 0x0

    :goto_3
    if-ge v11, v8, :cond_f

    .line 128
    move-object/from16 v0, p1

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    .line 129
    .restart local v14    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    move/from16 v21, v0

    if-gtz v21, :cond_7

    move/from16 v7, v18

    .line 130
    .restart local v7    # "childw":I
    :goto_4
    iget v6, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    .line 131
    .restart local v6    # "childh":I
    if-gez v6, :cond_8

    .line 132
    new-instance v21, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v22, "Height should be constant"

    invoke-direct/range {v21 .. v22}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v21

    .line 129
    .end local v6    # "childh":I
    .end local v7    # "childw":I
    :cond_7
    iget v7, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    goto :goto_4

    .line 135
    .restart local v6    # "childh":I
    .restart local v7    # "childw":I
    :cond_8
    iget-boolean v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    move/from16 v21, v0

    if-nez v21, :cond_9

    if-eqz v16, :cond_9

    .line 136
    move/from16 v20, v9

    .line 138
    :cond_9
    if-nez v5, :cond_a

    add-int v21, v19, v7

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->pwidth:I

    move/from16 v22, v0

    add-int v22, v22, v18

    move/from16 v0, v21

    move/from16 v1, v22

    if-le v0, v1, :cond_b

    .line 139
    :cond_a
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v19

    .line 140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    invoke-virtual {v0, v12}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/Integer;

    invoke-virtual/range {v21 .. v21}, Ljava/lang/Integer;->intValue()I

    move-result v21

    add-int v20, v20, v21

    .line 141
    add-int/lit8 v12, v12, 0x1

    .line 142
    const/4 v5, 0x0

    .line 145
    :cond_b
    iget-boolean v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->center:Z

    move/from16 v21, v0

    if-eqz v21, :cond_c

    .line 146
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getWidth()I

    move-result v21

    div-int/lit8 v21, v21, 0x2

    div-int/lit8 v22, v7, 0x2

    sub-int v19, v21, v22

    .line 149
    :cond_c
    const-string/jumbo v21, "vk"

    new-instance v22, Ljava/lang/StringBuilder;

    invoke-direct/range {v22 .. v22}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, v22

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ";"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ";"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    const-string/jumbo v23, ";"

    invoke-virtual/range {v22 .. v23}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v22

    move-object/from16 v0, v22

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v22

    invoke-virtual/range {v22 .. v22}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v22

    invoke-static/range {v21 .. v22}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    new-instance v21, Landroid/graphics/Rect;

    add-int v22, v19, v7

    add-int v23, v20, v6

    move-object/from16 v0, v21

    move/from16 v1, v19

    move/from16 v2, v20

    move/from16 v3, v22

    move/from16 v4, v23

    invoke-direct {v0, v1, v2, v3, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    move-object/from16 v0, v17

    move-object/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 152
    iget-boolean v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    move/from16 v21, v0

    if-eqz v21, :cond_e

    .line 153
    if-nez v16, :cond_d

    .line 154
    move/from16 v9, v20

    .line 155
    const/16 v16, 0x1

    .line 157
    :cond_d
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    move/from16 v21, v0

    add-int v21, v21, v6

    add-int v20, v20, v21

    .line 162
    :goto_5
    iget-boolean v5, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 125
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_3

    .line 159
    :cond_e
    const/16 v16, 0x0

    .line 160
    iget v0, v14, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->horizontal_spacing:I

    move/from16 v21, v0

    add-int v21, v21, v7

    add-int v19, v19, v21

    goto :goto_5

    .line 166
    .end local v6    # "childh":I
    .end local v7    # "childw":I
    .end local v14    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_f
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getFullHeight()I

    move-result v21

    move/from16 v0, v21

    move-object/from16 v1, p0

    iput v0, v1, Lcom/vkontakte/android/ui/FlowLayout;->measuredHeight:I

    .line 167
    return-object v17
.end method

.method protected onLayout(ZIIII)V
    .locals 15
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 282
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/FlowLayout;->getChildCount()I

    move-result v4

    .line 283
    .local v4, "count":I
    sub-int v10, p4, p2

    .line 284
    .local v10, "width":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v11

    .line 285
    .local v11, "xpos":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingTop()I

    move-result v12

    .line 286
    .local v12, "ypos":I
    const/4 v7, 0x0

    .line 289
    .local v7, "line":I
    const/4 v0, 0x0

    .line 290
    .local v0, "breakNext":Z
    const/4 v9, 0x0

    .line 291
    .local v9, "prevFloat":Z
    const/4 v5, 0x0

    .line 293
    .local v5, "floatY":I
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_0
    if-ge v6, v4, :cond_9

    .line 294
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/ui/FlowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 295
    .local v1, "child":Landroid/view/View;
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v13

    const/16 v14, 0x8

    if-eq v13, v14, :cond_5

    .line 296
    invoke-virtual {v1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    .line 297
    .local v8, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    iget v13, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    if-gtz v13, :cond_6

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    .line 298
    .local v3, "childw":I
    :goto_1
    iget v13, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    if-gtz v13, :cond_7

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    .line 300
    .local v2, "childh":I
    :goto_2
    iget-boolean v13, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    if-nez v13, :cond_0

    if-eqz v9, :cond_0

    .line 301
    move v12, v5

    .line 303
    :cond_0
    if-nez v0, :cond_1

    add-int v13, v11, v3

    iget v14, p0, Lcom/vkontakte/android/ui/FlowLayout;->pwidth:I

    add-int/2addr v14, v10

    if-le v13, v14, :cond_2

    .line 304
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v11

    .line 305
    iget-object v13, p0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    invoke-virtual {v13, v7}, Ljava/util/Vector;->elementAt(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/Integer;

    invoke-virtual {v13}, Ljava/lang/Integer;->intValue()I

    move-result v13

    add-int/2addr v12, v13

    .line 306
    add-int/lit8 v7, v7, 0x1

    .line 307
    const/4 v0, 0x0

    .line 310
    :cond_2
    iget-boolean v13, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->center:Z

    if-eqz v13, :cond_3

    .line 311
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/FlowLayout;->getWidth()I

    move-result v13

    div-int/lit8 v13, v13, 0x2

    div-int/lit8 v14, v3, 0x2

    sub-int v11, v13, v14

    .line 315
    :cond_3
    add-int v13, v11, v3

    add-int v14, v12, v2

    invoke-virtual {v1, v11, v12, v13, v14}, Landroid/view/View;->layout(IIII)V

    .line 316
    iget-boolean v13, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    if-eqz v13, :cond_8

    .line 317
    if-nez v9, :cond_4

    .line 318
    move v5, v12

    .line 319
    const/4 v9, 0x1

    .line 321
    :cond_4
    iget v13, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    add-int/2addr v13, v2

    add-int/2addr v12, v13

    .line 326
    :goto_3
    iget-boolean v0, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 293
    .end local v2    # "childh":I
    .end local v3    # "childw":I
    .end local v8    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_5
    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 297
    .restart local v8    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_6
    iget v3, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    goto :goto_1

    .line 298
    .restart local v3    # "childw":I
    :cond_7
    iget v2, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    goto :goto_2

    .line 323
    .restart local v2    # "childh":I
    :cond_8
    const/4 v9, 0x0

    .line 324
    iget v13, v8, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->horizontal_spacing:I

    add-int/2addr v13, v3

    add-int/2addr v11, v13

    goto :goto_3

    .line 330
    .end local v1    # "child":Landroid/view/View;
    .end local v2    # "childh":I
    .end local v3    # "childw":I
    .end local v8    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_9
    return-void
.end method

.method protected onMeasure(II)V
    .locals 20
    .param p1, "widthMeasureSpec"    # I
    .param p2, "heightMeasureSpec"    # I

    .prologue
    .line 184
    sget-boolean v18, Lcom/vkontakte/android/ui/FlowLayout;->$assertionsDisabled:Z

    if-nez v18, :cond_0

    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    if-nez v18, :cond_0

    new-instance v18, Ljava/lang/AssertionError;

    invoke-direct/range {v18 .. v18}, Ljava/lang/AssertionError;-><init>()V

    throw v18

    .line 186
    :cond_0
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v19

    sub-int v18, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingRight()I

    move-result v19

    sub-int v15, v18, v19

    .line 187
    .local v15, "width":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v18

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingTop()I

    move-result v19

    sub-int v18, v18, v19

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingBottom()I

    move-result v19

    sub-int v10, v18, v19

    .line 188
    .local v10, "height":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getChildCount()I

    move-result v7

    .line 189
    .local v7, "count":I
    const/4 v12, 0x0

    .line 191
    .local v12, "line_height":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v16

    .line 192
    .local v16, "xpos":I
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingTop()I

    move-result v17

    .line 193
    .local v17, "ypos":I
    const/4 v14, 0x0

    .line 196
    .local v14, "maxw":I
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    const/high16 v19, -0x80000000

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_7

    .line 197
    const/high16 v18, -0x80000000

    move/from16 v0, v18

    invoke-static {v10, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .line 202
    .local v4, "childHeightMeasureSpec":I
    :goto_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->clear()V

    .line 204
    const/4 v2, 0x0

    .line 205
    .local v2, "breakNext":Z
    const/4 v8, 0x0

    .line 207
    .local v8, "floatingH":I
    const/4 v11, 0x0

    .local v11, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lparams:Ljava/util/List;

    move-object/from16 v18, v0

    if-eqz v18, :cond_8

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lparams:Ljava/util/List;

    move-object/from16 v18, v0

    invoke-interface/range {v18 .. v18}, Ljava/util/List;->size()I

    move-result v18

    :goto_2
    move/from16 v0, v18

    invoke-static {v7, v0}, Ljava/lang/Math;->max(II)I

    move-result v18

    move/from16 v0, v18

    if-ge v11, v0, :cond_11

    .line 208
    move-object/from16 v0, p0

    invoke-virtual {v0, v11}, Lcom/vkontakte/android/ui/FlowLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 209
    .local v3, "child":Landroid/view/View;
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v18

    const/16 v19, 0x8

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_2

    :cond_1
    if-nez v3, :cond_6

    .line 210
    :cond_2
    if-eqz v3, :cond_9

    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    move-object/from16 v13, v18

    .line 211
    .local v13, "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :goto_3
    if-eqz v3, :cond_a

    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    move/from16 v18, v0

    const/16 v19, -0x1

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_a

    .line 212
    const/high16 v18, 0x40000000    # 2.0f

    move/from16 v0, v18

    invoke-static {v15, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v18

    move/from16 v0, v18

    invoke-virtual {v3, v0, v4}, Landroid/view/View;->measure(II)V

    .line 216
    :cond_3
    :goto_4
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    move/from16 v18, v0

    if-gtz v18, :cond_d

    if-eqz v3, :cond_c

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    .line 217
    .local v6, "childw":I
    :goto_5
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    move/from16 v18, v0

    if-gtz v18, :cond_f

    if-eqz v3, :cond_e

    invoke-virtual {v3}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    .line 219
    .local v5, "childh":I
    :goto_6
    if-nez v2, :cond_4

    add-int v18, v16, v6

    move-object/from16 v0, p0

    iget v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->pwidth:I

    move/from16 v19, v0

    add-int v19, v19, v15

    move/from16 v0, v18

    move/from16 v1, v19

    if-le v0, v1, :cond_5

    .line 220
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/ui/FlowLayout;->getPaddingLeft()I

    move-result v16

    .line 221
    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    move-result v18

    add-int v17, v17, v18

    .line 222
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v18, v0

    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    move-result v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    invoke-virtual/range {v18 .. v19}, Ljava/util/Vector;->add(Ljava/lang/Object;)Z

    .line 223
    const/4 v12, 0x0

    .line 224
    const/4 v8, 0x0

    .line 225
    const/4 v2, 0x0

    .line 227
    :cond_5
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    move/from16 v18, v0

    add-int v18, v18, v5

    move/from16 v0, v18

    invoke-static {v12, v0}, Ljava/lang/Math;->max(II)I

    move-result v12

    .line 230
    iget-boolean v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->floating:Z

    move/from16 v18, v0

    if-eqz v18, :cond_10

    .line 231
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    move/from16 v18, v0

    add-int v18, v18, v5

    add-int v17, v17, v18

    .line 232
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->vertical_spacing:I

    move/from16 v18, v0

    add-int v18, v18, v5

    add-int v8, v8, v18

    .line 233
    add-int v18, v16, v6

    move/from16 v0, v18

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 238
    :goto_7
    iget-boolean v2, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->breakAfter:Z

    .line 239
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->horizontal_spacing:I

    move/from16 v18, v0

    sub-int v18, v16, v18

    move/from16 v0, v18

    invoke-static {v14, v0}, Ljava/lang/Math;->max(II)I

    move-result v14

    .line 207
    .end local v5    # "childh":I
    .end local v6    # "childw":I
    .end local v13    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_6
    add-int/lit8 v11, v11, 0x1

    goto/16 :goto_1

    .line 199
    .end local v2    # "breakNext":Z
    .end local v3    # "child":Landroid/view/View;
    .end local v4    # "childHeightMeasureSpec":I
    .end local v8    # "floatingH":I
    .end local v11    # "i":I
    :cond_7
    const/16 v18, 0x0

    const/16 v19, 0x0

    invoke-static/range {v18 .. v19}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v4

    .restart local v4    # "childHeightMeasureSpec":I
    goto/16 :goto_0

    .line 207
    .restart local v2    # "breakNext":Z
    .restart local v8    # "floatingH":I
    .restart local v11    # "i":I
    :cond_8
    const/16 v18, 0x0

    goto/16 :goto_2

    .line 210
    .restart local v3    # "child":Landroid/view/View;
    :cond_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lparams:Ljava/util/List;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    invoke-interface {v0, v11}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;

    move-object/from16 v13, v18

    goto/16 :goto_3

    .line 213
    .restart local v13    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_a
    if-eqz v3, :cond_3

    .line 214
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    move/from16 v18, v0

    if-gtz v18, :cond_b

    const/high16 v18, -0x80000000

    move/from16 v0, v18

    invoke-static {v15, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v18

    :goto_8
    move/from16 v0, v18

    invoke-virtual {v3, v0, v4}, Landroid/view/View;->measure(II)V

    goto/16 :goto_4

    :cond_b
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    move/from16 v18, v0

    const/high16 v19, 0x40000000    # 2.0f

    invoke-static/range {v18 .. v19}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v18

    goto :goto_8

    :cond_c
    move v6, v15

    .line 216
    goto/16 :goto_5

    :cond_d
    iget v6, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->width:I

    goto/16 :goto_5

    .line 217
    .restart local v6    # "childw":I
    :cond_e
    const/4 v5, 0x0

    goto/16 :goto_6

    :cond_f
    iget v5, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->height:I

    goto/16 :goto_6

    .line 235
    .restart local v5    # "childh":I
    :cond_10
    const/4 v8, 0x0

    .line 236
    iget v0, v13, Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;->horizontal_spacing:I

    move/from16 v18, v0

    add-int v18, v18, v6

    add-int v16, v16, v18

    goto :goto_7

    .line 245
    .end local v3    # "child":Landroid/view/View;
    .end local v5    # "childh":I
    .end local v6    # "childw":I
    .end local v13    # "lp":Lcom/vkontakte/android/ui/FlowLayout$LayoutParams;
    :cond_11
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    if-nez v18, :cond_12

    .line 246
    invoke-static {v12, v8}, Ljava/lang/Math;->max(II)I

    move-result v10

    .line 247
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_9
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_13

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Integer;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 248
    .local v9, "h":I
    add-int/2addr v10, v9

    .line 249
    goto :goto_9

    .line 251
    .end local v9    # "h":I
    :cond_12
    invoke-static/range {p2 .. p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    const/high16 v19, -0x80000000

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_13

    .line 252
    add-int v18, v17, v12

    move/from16 v0, v18

    if-ge v0, v10, :cond_13

    .line 253
    move v10, v12

    .line 254
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/ui/FlowLayout;->lineHeights:Ljava/util/Vector;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Ljava/util/Vector;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :goto_a
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_13

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v18

    check-cast v18, Ljava/lang/Integer;

    invoke-virtual/range {v18 .. v18}, Ljava/lang/Integer;->intValue()I

    move-result v9

    .line 255
    .restart local v9    # "h":I
    add-int/2addr v10, v9

    .line 256
    goto :goto_a

    .line 260
    .end local v9    # "h":I
    :cond_13
    invoke-static/range {p1 .. p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v18

    const/high16 v19, 0x40000000    # 2.0f

    move/from16 v0, v18

    move/from16 v1, v19

    if-ne v0, v1, :cond_14

    .line 261
    move-object/from16 v0, p0

    invoke-virtual {v0, v15, v10}, Lcom/vkontakte/android/ui/FlowLayout;->setMeasuredDimension(II)V

    .line 265
    :goto_b
    return-void

    .line 263
    :cond_14
    move-object/from16 v0, p0

    invoke-virtual {v0, v14, v10}, Lcom/vkontakte/android/ui/FlowLayout;->setMeasuredDimension(II)V

    goto :goto_b
.end method

.method public resetParams()V
    .locals 1

    .prologue
    .line 179
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ui/FlowLayout;->lparams:Ljava/util/List;

    .line 180
    return-void
.end method
